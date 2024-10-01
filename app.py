import streamlit as st
from src.make_database import create_database
import os

db_path = 'db/information_system.db'
schema_path = 'sql/db_schema.sql'

if not os.path.exists(db_path):
    create_database(db_path, schema_path)
    
