from flask import Blueprint, request, jsonify
from werkzeug.security import generate_password_hash, check_password_hash
import jwt
import datetime
from functools import wraps
from config.db import db_connection, JWT_SECRET  # Import JWT_SECRET from db.py

# Define the Blueprint for authentication
auth_bp = Blueprint('auth', __name__)

# Middleware to verify JWT token
def token_required(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        token = request.headers.get('auth-token')
        if not token:
            return jsonify({'message': 'Access Denied'}), 401
        try:
            data = jwt.decode(token, JWT_SECRET, algorithms=["HS256"])
            request.user_id = data['id']  # Attach user ID to the request
        except jwt.ExpiredSignatureError:
            return jsonify({'message': 'Token has expired'}), 401
        except jwt.InvalidTokenError:
            return jsonify({'message': 'Invalid Token'}), 400
        return f(*args, **kwargs)
    return decorated

# User Registration Route
@auth_bp.route('/register', methods=['POST'])
def register():
    data = request.json
    username = data.get('username')
    email = data.get('email')
    password = data.get('password')

    if not username or not email or not password:
        return jsonify({'message': 'Missing data'}), 400

    try:
        conn = db_connection()
        cur = conn.cursor()

        # Check if username or email already exists
        cur.execute('SELECT id FROM users WHERE username = %s OR email = %s', (username, email))
        existing_user = cur.fetchone()
        if existing_user:
            return jsonify({'message': 'Username or email already exists'}), 400

        hashed_password = generate_password_hash(password, method='pbkdf2:sha256')

        # Insert the new user
        cur.execute(
            'INSERT INTO users (username, email, password_hash) VALUES (%s, %s, %s) RETURNING id, username, email',
            (username, email, hashed_password)
        )
        user = cur.fetchone()
        conn.commit()
        cur.close()
        conn.close()

        return jsonify({'message': 'User registered successfully!', 'user': user}), 201
    except Exception as e:
        print(f"Error during registration: {e}")
        return jsonify({'message': 'Server error'}), 500

# Alias for the /register route
@auth_bp.route('/signup', methods=['POST'])
def signup():
    print("Signup route triggered")
    return register() # Reuse the register function

# User Login Route
@auth_bp.route('/login', methods=['POST'])
def login():
    data = request.json
    email = data.get('email')
    password = data.get('password')

    if not email or not password:
        return jsonify({'message': 'Missing data'}), 400

    try:
        conn = db_connection()
        cur = conn.cursor()
        cur.execute('SELECT id, username, email, password_hash FROM users WHERE email = %s', (email,))
        user = cur.fetchone()
        cur.close()
        conn.close()

        if not user:
            return jsonify({'message': 'User not found'}), 400

        user_id, username, user_email, password_hash = user

        if not check_password_hash(password_hash, password):
            return jsonify({'message': 'Invalid password'}), 400

        token = jwt.encode(
            {'id': user_id, 'exp': datetime.datetime.utcnow() + datetime.timedelta(hours=1)},
            JWT_SECRET,  # Using the imported JWT_SECRET
            algorithm="HS256"
        )

        return jsonify({'message': 'Logged in successfully!', 'token': token})
    except Exception as e:
        print(f"Error during login: {e}")
        return jsonify({'message': 'Server error'}), 500

# Protected Route Example (Dashboard)
@auth_bp.route('/dashboard', methods=['GET'])
@token_required
def dashboard():
    try:
        conn = db_connection()
        cur = conn.cursor()
        cur.execute('SELECT * FROM violations WHERE user_id = %s', (request.user_id,))
        violations = cur.fetchall()
        cur.close()
        conn.close()

        return jsonify({'message': 'Welcome to your dashboard!', 'violations': violations})
    except Exception as e:
        print(f"Error fetching dashboard data: {e}")
        return jsonify({'message': 'Server error'}), 500
