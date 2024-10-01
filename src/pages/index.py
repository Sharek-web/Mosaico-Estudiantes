import src.database as db
import streamlit as st
import pandas as pd
import numpy as np
import sqlite3 

# Esto es solo una prueba de que esta funcionando la base de datos
# Se debe reemplazar este contenido por el correspondiente para la pagina principal

# Conecta a la base de datos usando sqlite3
conn = sqlite3.connect(db.DB_PATH)

# Ejecuta la consulta
cursor = conn.cursor()
cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
tables_df = cursor.fetchall()

# Muestra los resultados
st.write(pd.DataFrame(np.array(tables_df).flatten(), columns=['Tablas']))

# Cierra la conexión
conn.close()