from flask import Flask, jsonify, request
from flask_cors import CORS
import psycopg2
from psycopg2 import pool
from config.db import DB_NAME, DB_USER, DB_PASSWORD, DB_HOST, DB_PORT, db_connection
from routes.auth import auth_bp  # Import the authentication routes

app = Flask(__name__)
CORS(app)  # Enable CORS for all domains

# Set up the PostgreSQL connection pool using credentials from db.py
DB_POOL = psycopg2.pool.SimpleConnectionPool(
    1, 20, user=DB_USER, password=DB_PASSWORD, host=DB_HOST, port=DB_PORT, database=DB_NAME
)

# Middleware to check if connection pool is available
def get_db_connection():
    if DB_POOL:
        return DB_POOL.getconn()
    return None

# Attempt to connect to the database and print success message
conn = db_connection()
if conn:
    print("Successfully connected to the database from app.py!")
    conn.close()  # Don't forget to close the connection after checking

# Example route to fetch data from the database
@app.route('/api/data', methods=['GET'])
def get_data():
    conn = get_db_connection()
    if conn:
        cursor = conn.cursor()
        cursor.execute('SELECT * FROM your_table_name')  # Replace with actual table name
        result = cursor.fetchall()
        cursor.close()
        return jsonify(result), 200
    return jsonify({"error": "Database connection failed"}), 500

# Add a route for the homepage to avoid 404 errors
@app.route('/')
def home():
    return "Welcome to the Traffic Violation Reporting System"

# Use the authentication routes
app.register_blueprint(auth_bp, url_prefix='/api')

if __name__ == '__main__':
    app.run(port=3000)
