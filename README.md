# Sistema De Información Para El Departamento De Matemáticas
Esta es la parte del prototipo sistema de información del departamento de matemáticas en la cual se mostrara información sobre docentes y estudiantes, y debera constar de las siguientes partes:
1. __Panel de estudiantes:__ Como información básica, foto del estudiante, historico de notas, asignaturas que esta cursando, etc.
1. __Panel de los docentes:__ Como información básica, foto del docente, asignaturas, proyectos, etc.
2. __Información específica agregada:__ Segmentar información de estudiantes por tipo de matricula, evolucion de la matricula, caracteristicas socioeconomicas, etc.

El protótipo se realizara en Streamlit y utilizando SQLite como gestor de base de datos.

## Instrucciones Para Los Colaboradores

### Como Realizar Cambios en el Repositorio

Para realizar cualquier cambio o aporte al repositorio, cree una rama nueva desde GitHub (ej. creando una rama llamada `my_branch`). Luego clone el repositorio localmente:

    git clone https://github.com/JhonBedoyaUE/sistemaInformacionDepMat.git

Recuerde cambiar de directorio al creado cuando se clona el repositorio:

    cd sistemaInformacionDepMat

También tenga en cuenta sincronizar su repositorio local despues de clonarlo y frecuentemente ante cambios de terceros:

    git pull

Para empezar a realizar cambios cambie de rama localmente con el nombre de la rama que ha creado, ejemplo:

    git checkout my_branch

Por último puede utilizar Visual Studio Code para facilitar la colaboración con GitHub, para más información puede visitar [este enlace](https://code.visualstudio.com/docs/sourcecontrol/github).

### Configuración del Entorno de Trabajo

Recuerde instalar los paquetes especificados en `requirements.txt` con:

    pip install -r .\requirements.txt

Para evitar conflictos de versiones de paquetes o de Python, puede crear un entorno virtual de Python con:

    virtualenv venv

Si crea un entorno virtual de Python, evite cargarlo al repositorio. El `.gitignore` esta configurado para que Git ignore la carpeta 
`/venv/` junto con su contenido, por lo que es recomendable crear entornos virtuales de Python con ese nombre.

También el `.gitignore` esta configurado para ignorar la base de datos `information_system.db` que se crea en el directorio `/db/` al ejecutar la aplicación, así como cualquier archivo **CSV** o **XLSX** que se guarde en el directorio `/data/`.

## Distribución de los Directorios

El repositorio local debería tener la siguiente forma:

    sistemaInformacionDepMat
    ├── .streamlit
    │   └── config.toml
    ├── assets
    │   └── diagrams
    │       └── Modelo Relacional BD.drawio
    ├── data
    ├── db
    │   └── information_system.db
    ├── sql
    │   └── db_schema.sql
    ├── src
    │   ├── pages
    │   │   ├── index.py
    │   │   ├── professors.py
    │   │   └── students.py
    │   └── database.py
    ├── static
    │   └── ExternadoColombia.png
    ├── venv
    ├── .gitignore
    ├── app.py
    ├── README.md
    └── requirements.txt

Donde los directorios y archivos son:

* **`.streamlit/`:** Carpeta que contiene archivos de configuración de Streamlit.
    * **`config.toml`:** Archivo de configuración para la conexión a la base de datos.
* **`assets/`:**  Almacena recursos del proyecto, como diagramas o imágenes.
    * **`diagrams/`:**  Contiene diagramas que explican la estructura del proyecto, como el diagrama relacional de la base de datos.
* **`data/`:**  Directorio para almacenar datos adicionales, como archivos CSV o XLSX.
* **`db/`:**  Almacena la base de datos SQLite.
    * **`information_system.db`:** Archivo de la base de datos.
* **`sql/`:**  Contiene scripts SQL.
    * **`db_schema.sql`:**  Script que define el esquema de la base de datos.
* **`src/`:**  Contiene el código fuente principal de la aplicación.
    * **`__pycache__/`:**  Carpeta con archivos de caché de Python (generados automáticamente).
    * **`pages/`:**  Contiene los archivos Python para las diferentes páginas de la aplicación.
        * **`index.py`:**  Código para la página principal.
        * **`professors.py`:**  Código para la página de profesores.
        * **`students.py`:**  Código para la página de estudiantes.
    * **`database.py`:**  Módulo con funciones para interactuar con la base de datos.
* **`static/`:**  Contiene recursos estáticos, como los logos o iconos.
    * **`ExternadoColombia.png`:**  Imagen del logo.
* **`venv/`:**  Carpeta que contiene el entorno virtual de Python.
* **`.gitignore`:**  Archivo que especifica qué archivos y carpetas deben ser ignorados por Git.
* **`app.py`:**  Archivo principal de la aplicación Streamlit, punto de entrada.
* **`README.md`:**  Archivo con la documentación del proyecto (este archivo).
* **`requirements.txt`:**  Lista de las dependencias del proyecto.
