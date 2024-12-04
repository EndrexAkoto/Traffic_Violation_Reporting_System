from flask import Blueprint, request, jsonify
from werkzeug.security import generate_password_hash, check_password_hash
import jwt
import datetime
from functools import wraps
from config.db import db_connection

auth_bp = Blueprint('auth', __name__)  # Define the Blueprint as auth_bp

JWT_SECRET = 'your_jwt_secret'  # Replace with your JWT secret key


# Middleware to verify JWT
def token_required(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        token = request.headers.get('auth-token')
        if not token:
            return jsonify({'message': 'Access Denied'}), 401
        try:
            data = jwt.decode(token, JWT_SECRET, algorithms=["HS256"])
            request.user_id = data['id']  # Attach user ID to the request
        except Exception as e:
            return jsonify({'message': 'Invalid Token'}), 400
        return f(*args, **kwargs)
    return decorated


# 1. User Registration Route
@auth_bp.route('/register', methods=['POST'])  # Use auth_bp here
def register():
    data = request.json
    username = data['username']
    email = data['email']
    password = data['password']

    hashed_password = generate_password_hash(password, method='sha256')

    try:
        conn = db_connection()
        cur = conn.cursor()
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
        print(e)
        return jsonify({'message': 'Server error'}), 500


# 2. User Login Route
@auth_bp.route('/login', methods=['POST'])  # Use auth_bp here
def login():
    data = request.json
    email = data['email']
    password = data['password']

    try:
        conn = db_connection()
        cur = conn.cursor()
        cur.execute('SELECT * FROM users WHERE email = %s', (email,))
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
            JWT_SECRET,
            algorithm="HS256"
        )

        return jsonify({'message': 'Logged in successfully!', 'token': token})
    except Exception as e:
        print(e)
        return jsonify({'message': 'Server error'}), 500


# 3. Protected Route Example
@auth_bp.route('/dashboard', methods=['GET'])  # Use auth_bp here
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
        print(e)
        return jsonify({'message': 'Server error'}), 500
