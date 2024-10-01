import src.database as db
import streamlit as st
import os

# --- Configuración de la base de datos ---
if not os.path.exists(db.DB_PATH):
    db.create_database()

# --- Configuración de la navegación ---
main_page = st.Page(
    'src/pages/index.py', 
    title='Página principal', 
    url_path='', 
    default=True, 
    icon=':material/home:'
)
students_page = st.Page(
    'src/pages/students.py', 
    title='Estudiantes', 
    url_path='panel/estudiantes', 
    icon=':material/school:'
)
professors_page = st.Page(
    'src/pages/professors.py', 
    title='Profesores', 
    url_path='panel/profesores', 
    icon=':material/real_estate_agent:'
)

streamlit_page = st.navigation([main_page, students_page, professors_page])

# --- Configuración del logo ---
st.logo('static\ExternadoColombia.png', icon_image='static\ExternadoColombia.png')

# --- Configuración de la página ---
st.set_page_config(page_icon="static/favicon.png")

# --- Estilos CSS ---
st.markdown(
    """
    <style>
    div[data-testid="stSidebarCollapsedControl"] > img, 
    div[data-testid="stSidebarHeader"] > img, 
    div[data-testid="collapsedControl"] > img {
        height: 4rem;
        width: auto;
        margin-top: 0;
    }

    div[data-testid="stSidebarHeader"], 
    div[data-testid="stSidebarHeader"] > *,
    div[data-testid="collapsedControl"], 
    div[data-testid="collapsedControl"] > *,
    div[data-testid="stSidebarCollapsedControl"] {
        display: flex;
        align-items: center;
        flex-direction: row-reverse;
        justify-content: flex-end;
    }

    div.appview-container::before{
        content: "Sistema de Información";
        position: absolute;
        top: 20px;
        left: 336px;
        height: 4rem;
        font-family: "Source Sans Pro", sans-serif;
        font-weight: 600;
        font-size: calc(1.35rem + 1.2vw);
        display: flex;
        align-items: center;
        padding-left: 16px;
    }

    header {
        opacity: 0;
        transition: opacity 2s;
    }

    header:hover {
        opacity: 1;
    }

    button[data-testid="stBaseButton-headerNoPadding"] {
        height: 4rem;
        margin-right: 10px;
    }
    </style>
    """,
    unsafe_allow_html=True,
)

# --- Ejecutar la aplicación ---
streamlit_page.run()