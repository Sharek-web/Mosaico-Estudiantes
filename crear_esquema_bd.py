import sqlite3

# Conectar a la base de datos
conn = sqlite3.connect('sistema_informacion_cd.db')
cursor = conn.cursor()

# Leer y ejecutar el archivo .sql
with open('esquema_bd.sql', 'r') as sql_file:
    sql_script = sql_file.read()

cursor.executescript(sql_script)

conn.commit()
conn.close()
