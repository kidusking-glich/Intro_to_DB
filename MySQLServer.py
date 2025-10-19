import mysql.connector
from mysql.connector import errorcode

# Configuration for database connection
# NOTE: Replace these placeholder credentials with your actual MySQL credentials.
config = {
    'user': 'your_mysql_user',     # e.g., 'root'
    'password': 'your_mysql_password', # e.g., 'MyStrongPassword!'
    'host': '127.0.0.1'           # Use 'localhost' or '127.0.0.1'
}

DATABASE_NAME = 'alx_book_store'
cnx = None  # Initialize connection handle
cursor = None # Initialize cursor handle

try:
    # 1. Attempt to connect to MySQL server
    print("Attempting to connect to the MySQL server...")
    cnx = mysql.connector.connect(**config)
    
    # Check if connection was successful
    if cnx.is_connected():
        print("Successfully connected to the MySQL server.")
        
        # 2. Create a cursor to execute SQL commands
        cursor = cnx.cursor()
        
        # 3. SQL command to create the database if it doesn't exist.
        # This now uses the literal database name as requested.
        create_db_query = "CREATE DATABASE IF NOT EXISTS alx_book_store"
        
        # 4. Execute the command
        cursor.execute(create_db_query)
        
        # 5. Print success message as required
        print(f"Database '{DATABASE_NAME}' created successfully!")
    
except mysql.connector.Error as err:
    # 6. Handle specific connection errors (failing to connect to the DB)
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print("\nError: Failed to connect to DB. Access denied (check username or password).")
    elif err.errno == errorcode.CR_CONN_HOST_ERROR:
        print("\nError: Failed to connect to DB. Host is unreachable or MySQL server is not running.")
    else:
        # Catch other connection-related errors
        print(f"\nError: Failed to connect to DB. An unexpected error occurred: {err}")

finally:
    # 7. Handle open and close of the DB connection and cursor
    if cursor is not None:
        cursor.close()
    if cnx is not None and cnx.is_connected():
        cnx.close()
        print("Database connection closed.")
