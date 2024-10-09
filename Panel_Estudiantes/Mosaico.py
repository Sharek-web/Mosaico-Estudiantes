import os
import streamlit as st

# Función para cargar fotos de estudiantes
def load_photos(data_path):
    student_data = {}
    for cohort in os.listdir(data_path):
        cohort_path = os.path.join(data_path, cohort)
        if os.path.isdir(cohort_path):
            student_data[cohort] = []
            for student_photo in os.listdir(cohort_path):
                if student_photo.endswith(('.jpg', '.jpeg', '.png')):
                    student_name = os.path.splitext(student_photo)[0]
                    photo_path = os.path.join(cohort_path, student_photo)
                    student_data[cohort].append((student_name, photo_path))
    return student_data

# Cargar las fotos
data_path = 'dataset'  # Cambia esta ruta a la carpeta que contiene tus datos
students_info = load_photos(data_path)

# Título de la aplicación
st.title("Mosaico de Estudiantes - Ciencia de Datos")

# Mostrar fotos organizadas por cohortes
for cohort, students in students_info.items():
    st.subheader(cohort)
    cols = st.columns(4)  # Puedes ajustar el número de columnas según necesites

    for i, (name, photo_path) in enumerate(students):
        # Mostrar cada foto en su columna
        with cols[i % 4]:  # Ajustar a las columnas
            if st.button(name, key=name):  # Usar el nombre como clave única para el botón
                # Aquí debes poner el enlace al perfil del estudiante
                # Suponiendo que el nombre del estudiante es la parte del URL
                profile_url = f"https://tuapp.com/perfiles/{name.replace(' ', '_')}"
                st.write(f"Abriendo perfil de {name}...")
                st.markdown(f'<a href="{profile_url}" target="_blank">Abrir perfil</a>', unsafe_allow_html=True)
            st.image(photo_path, caption=name, use_column_width=True)

