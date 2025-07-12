import mysql.connector
from mysql.connector import Error

try:
    conn = mysql.connector.connect(
        host="localhost",
        user="root",           # Use root (you're already connected as root)
        password="ab660908",           # Try empty password first
        database="world"
    )
    
    if conn.is_connected():
        print("✅ Connected to MySQL!")
        
        cursor = conn.cursor()
        sql = "SELECT * FROM city LIMIT 5"  # Added LIMIT to avoid too much output
        cursor.execute(sql)
        
        rows = cursor.fetchall()
        for row in rows:
            print(row)
            
        cursor.close()
        
except Error as e:
    print(f"❌ Error: {e}")
    
finally:
    if 'conn' in locals() and conn.is_connected():
        conn.close()
        print("Connection closed.")
