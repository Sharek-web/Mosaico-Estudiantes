from src.make_database import create_database
import streamlit as st
import pandas as pd
import numpy as np
import sqlite3 
import os

db_name = 'information_system'
db_path = 'db/information_system.db'
schema_path = 'sql/db_schema.sql'

if not os.path.exists(db_path):
    create_database(db_path, schema_path)

# Conecta a la base de datos usando sqlite3
conn = sqlite3.connect(db_path)

# Ejecuta la consulta
cursor = conn.cursor()
cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
tables_df = cursor.fetchall()

# Muestra los resultados
st.write(pd.DataFrame(np.array(tables_df).flatten(), columns=['Tablas']))

# Cierra la conexión
conn.close()