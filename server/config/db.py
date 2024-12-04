import psycopg2

# Database credentials
DB_NAME = 'traffic_violations'
DB_USER = 'postgres'  # Replace with your actual PostgreSQL username
DB_PASSWORD = 'Akoto@2015'  # Replace with your actual password
DB_HOST = 'localhost'
DB_PORT = '5432'

def db_connection():
    try:
        # Attempt to establish the connection
        conn = psycopg2.connect(
            dbname=DB_NAME,
            user=DB_USER,
            password=DB_PASSWORD,
            host=DB_HOST,
            port=DB_PORT
        )
        print("Connected to the database successfully!")  # Success message
        return conn
    except psycopg2.Error as e:
        # Error handling in case the connection fails
        print("Error connecting to the database:", e)
        return None
