import sqlite3

def create_database(db_path, schema_path):
    """Crea una base de datos SQLite a partir de un script SQL.

    Args:
        db_path (str): Ruta al archivo de la base de datos.
        schema_path (str): Ruta al archivo SQL con el esquema de la base de datos.
    """

    try:
        # Conectar a la base de datos (o crearla si no existe)
        conn = sqlite3.connect(db_path)
        cursor = conn.cursor()

        # Leer el script SQL desde el archivo
        with open(schema_path, 'r') as sql_file:
            sql_script = sql_file.read()

        # Ejecutar el script SQL para crear las tablas
        cursor.executescript(sql_script)

        # Confirmar los cambios y cerrar la conexión
        conn.commit()
        conn.close()

        print(f"Base de datos '{db_path}' creada con éxito a partir de '{schema_path}'")

    except sqlite3.Error as e:
        print(f"Error al crear la base de datos: {e}")