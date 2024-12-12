from flask import Flask, jsonify, request
from flask_cors import CORS
import psycopg2
from psycopg2 import pool
from config.db import DB_NAME, DB_USER, DB_PASSWORD, DB_HOST, DB_PORT
from routes.auth import auth_bp  # Import the authentication routes

app = Flask(__name__)
CORS(app, resources={r"/*": {"origins": "*"}})  # Enable CORS for all origins; adjust if needed

# Set up the PostgreSQL connection pool using credentials from db.py
DB_POOL = psycopg2.pool.SimpleConnectionPool(
    1, 20, user=DB_USER, password=DB_PASSWORD, host=DB_HOST, port=DB_PORT, database=DB_NAME
)

# Middleware to check if connection pool is available
def get_db_connection():
    if DB_POOL:
        return DB_POOL.getconn()
    return None

# Example route to fetch data from the database
@app.route('/api/data', methods=['GET'])
def get_data():
    conn = get_db_connection()
    if conn:
        try:
            cursor = conn.cursor()
            cursor.execute('SELECT * FROM traffic_violations')  # Replace with actual table name
            result = cursor.fetchall()
            cursor.close()
            return jsonify(result), 200
        except Exception as e:
            print(f"Error fetching data: {e}")
            return jsonify({"error": "Error fetching data from the database"}), 500
        finally:
            conn.close()  # Return the connection to the pool
    return jsonify({"error": "Database connection failed"}), 500

# Add a route for the homepage to avoid 404 errors
@app.route('/')
def home():
    return "Welcome to the Traffic Violation Reporting System"

# Use the authentication routes
app.register_blueprint(auth_bp, url_prefix='/api')

if __name__ == '__main__':
    # Bind to all interfaces and run on port 3000
    app.run(host='0.0.0.0', port=3000)
