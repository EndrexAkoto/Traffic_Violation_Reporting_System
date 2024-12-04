from flask import Blueprint, request, jsonify
from flask_jwt_extended import jwt_required, get_jwt_identity
from psycopg2 import sql
from config.db import get_db_connection  # Adjust as per your DB connection setup
import logging

# Configure logging
logging.basicConfig(level=logging.ERROR)
logger = logging.getLogger(__name__)

profile_bp = Blueprint('profile', __name__)

# Get user profile
@profile_bp.route('/', methods=['GET'])
@jwt_required()
def get_profile():
    user_id = get_jwt_identity()
    conn = get_db_connection()
    cursor = conn.cursor()

    try:
        query = sql.SQL("SELECT id, username, email, profile_pic FROM users WHERE id = %s")
        cursor.execute(query, (user_id,))
        user = cursor.fetchone()

        if user:
            user_profile = {
                "id": user[0],
                "username": user[1],
                "email": user[2],
                "profile_pic": user[3]
            }
            return jsonify(user_profile)
        else:
            return jsonify({"message": "User not found"}), 404
    except Exception as e:
        logger.error(f"Error retrieving profile: {e}")
        return jsonify({"message": "Server error"}), 500
    finally:
        cursor.close()
        conn.close()

# Update user profile
@profile_bp.route('/', methods=['PUT'])
@jwt_required()
def update_profile():
    user_id = get_jwt_identity()
    data = request.get_json()
    username = data.get('username')
    email = data.get('email')
    profile_pic = data.get('profile_pic')

    if not username and not email and not profile_pic:
        return jsonify({"message": "At least one field is required"}), 400

    conn = get_db_connection()
    cursor = conn.cursor()

    try:
        query = sql.SQL("""
            UPDATE users
            SET username = COALESCE(%s, username),
                email = COALESCE(%s, email),
                profile_pic = COALESCE(%s, profile_pic)
            WHERE id = %s
            RETURNING id, username, email, profile_pic
        """)
        cursor.execute(query, (username, email, profile_pic, user_id))
        conn.commit()
        updated_user = cursor.fetchone()

        if updated_user:
            updated_profile = {
                "id": updated_user[0],
                "username": updated_user[1],
                "email": updated_user[2],
                "profile_pic": updated_user[3]
            }
            return jsonify(updated_profile)
        else:
            return jsonify({"message": "User not found"}), 404
    except Exception as e:
        logger.error(f"Error updating profile: {e}")
        return jsonify({"message": "Server error"}), 500
    finally:
        cursor.close()
        conn.close()
