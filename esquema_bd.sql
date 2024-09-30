PRAGMA foreign_keys = ON;

-- Tabla Tipo_Discapacidad
CREATE TABLE Tipo_Discapacidad (
    id_tipo_discapacidad INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL
);

-- Tabla Tipo_Vivienda
CREATE TABLE Tipo_Vivienda (
    id_tipo_vivienda INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL
);

-- Tabla Situacion_Laboral
CREATE TABLE Situacion_Laboral (
    id_situacion_laboral INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL
);

-- Tabla Nivel_Educativo
CREATE TABLE Nivel_Educativo (
    id_nivel_educativo INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL
);

-- Tabla Forma_Pago
CREATE TABLE Forma_Pago (
    id_forma_pago INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL
);

-- Tabla Deporte
CREATE TABLE Deporte (
    id_deporte INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL
);

-- Tabla Actividad_Cultural
CREATE TABLE Actividad_Cultural (
    id_actividad_cultural INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL
);

-- Tabla Estado_Civil
CREATE TABLE Estado_Civil (
    id_estado_civil INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL
);

-- Tabla Tipo_Documento
CREATE TABLE Tipo_Documento (
    id_tipo_documento INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL
);

-- Tabla Pais
CREATE TABLE Pais (
    id_pais INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL
);

-- Tabla Departamento
CREATE TABLE Departamento (
    id_departamento INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    id_pais INTEGER NOT NULL,
    FOREIGN KEY (id_pais) REFERENCES Pais(id_pais)
);

-- Tabla Municipio
CREATE TABLE Municipio (
    id_municipio INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    id_departamento INTEGER NOT NULL,
    FOREIGN KEY (id_departamento) REFERENCES Departamento(id_departamento)
);


-- Tabla Genero
CREATE TABLE Genero (
    id_genero INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL
);

-- Tabla Estudiante
CREATE TABLE Estudiante (
    id_estudiante INTEGER PRIMARY KEY AUTOINCREMENT,
    autorizacion_datos INTEGER NOT NULL,
    fecha_actualizacion DATE NOT NULL,
    nombre_completo TEXT NOT NULL,
    id_tipo_documento INTEGER NOT NULL,
    numero_documento INTEGER UNIQUE NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    id_genero INTEGER NOT NULL,
    email_institucional TEXT NOT NULL,
    email_personal TEXT,
    telefono_contacto TEXT,
    direccion_residencia TEXT,
    discapacidad INTEGER NOT NULL,
    id_tipo_discapacidad INTEGER,
    comentario_discapacidad TEXT,
    eps TEXT,
    id_colegio INTEGER,
    id_tipo_vivienda INTEGER,
    estrato_vivienda INTEGER,
    num_personas_hogar INTEGER,
    situacion_laboral_madre INTEGER,
    situacion_laboral_padre INTEGER,
    nivel_educativo_madre INTEGER,
    nivel_educativo_padre INTEGER,
    num_libros_ultimo_anio INTEGER,
    mudanza_bogota INTEGER,
    tiempo_llegada_universidad INTEGER,
    num_servicios_transporte INTEGER,
    forma_pago_carrera INT,
    otra_beca INTEGER,
    inconvenientes_pago INTEGER,
    puntaje_saber_11 INTEGER,
    ano_finalizacion_grado_11 INTEGER,
    areas_refuerzo TEXT,
    deporte_interes INTEGER,
    actividad_cultural_interes INTEGER,
    direccion_correspondencia TEXT,
    ciudad_nacimiento INTEGER,
    id_estado_civil INTEGER,
    
    FOREIGN KEY (id_tipo_documento) REFERENCES Tipo_Documento(id_tipo_documento),
    FOREIGN KEY (id_genero) REFERENCES Genero(id_genero),
    FOREIGN KEY (id_tipo_discapacidad) REFERENCES Tipo_Discapacidad(id_tipo_discapacidad),
    FOREIGN KEY (id_tipo_vivienda) REFERENCES Tipo_Vivienda(id_tipo_vivienda),
    FOREIGN KEY (situacion_laboral_madre) REFERENCES Situacion_Laboral(id_situacion_laboral),
    FOREIGN KEY (situacion_laboral_padre) REFERENCES Situacion_Laboral(id_situacion_laboral),
    FOREIGN KEY (nivel_educativo_madre) REFERENCES Nivel_Educativo(id_nivel_educativo),
    FOREIGN KEY (nivel_educativo_padre) REFERENCES Nivel_Educativo(id_nivel_educativo),
    FOREIGN KEY (forma_pago_carrera) REFERENCES Forma_Pago(id_forma_pago),
    FOREIGN KEY (deporte_interes) REFERENCES Deporte(id_deporte),
    FOREIGN KEY (actividad_cultural_interes) REFERENCES Actividad_Cultural(id_actividad_cultural),
    FOREIGN KEY (ciudad_nacimiento) REFERENCES Municipio(id_municipio),
    FOREIGN KEY (id_estado_civil) REFERENCES Estado_Civil(id_estado_civil)
);

-- Tabla Tipo de Contratacion
CREATE TABLE Tipo_De_Contratacion (
    id_tipo_contratacion INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL
);

-- Tabla Docente
CREATE TABLE Docente (
    id_docente INTEGER PRIMARY KEY AUTOINCREMENT,
    autorizacion_datos INTEGER NOT NULL,
    fecha_actualizacion DATE NOT NULL,
    nombre_completo TEXT NOT NULL,
    id_tipo_documento INTEGER NOT NULL,
    numero_documento INTEGER UNIQUE NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    genero INTEGER NOT NULL,
    email_institucional TEXT NOT NULL,
    email_personal TEXT,
    telefono_contacto TEXT,
    direccion_residencia TEXT,
    formacion TEXT,
    fecha_vinculacion DATE,
    id_tipo_contratacion INTEGER,
    lineas_investigacion_preferidas TEXT,
    hoja_de_vida_completa INTEGER,
    
    FOREIGN KEY (id_tipo_documento) REFERENCES Tipo_Documento(id_tipo_documento),
    FOREIGN KEY (genero) REFERENCES Genero(id_genero),
    FOREIGN KEY (id_tipo_contratacion) REFERENCES Tipo_De_Contratacion(id_tipo_contratacion)
);

-- Tabla Asignatura_CD
CREATE TABLE Asignatura_CD (
    id_asignatura INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre_asignatura TEXT NOT NULL,
    creditos INTEGER NOT NULL,
    semestre INTEGER NOT NULL,
    link_microcurriculo TEXT,
    fecha_actualizacion DATE
);

-- Tabla Prerrequisito
CREATE TABLE Prerrequisito (
    id_prerrequisito INTEGER PRIMARY KEY AUTOINCREMENT,
    id_asignatura INTEGER NOT NULL,
    id_asignatura_prerrequerida INTEGER NOT NULL,

    FOREIGN key (id_asignatura) REFERENCES Asignatura_CD(id_asignatura),
    FOREIGN key (id_asignatura_prerrequerida) REFERENCES Asignatura_CD(id_asignatura)
);

-- Tabla Asignatura Preferida
CREATE TABLE Asignatura_Preferida (
    id_asignatura_preferida INTEGER PRIMARY KEY AUTOINCREMENT,
    id_docente INTEGER NOT NULL,
    id_asignatura INTEGER NOT NULL,

    FOREIGN KEY (id_docente) REFERENCES Docente(id_docente),
    FOREIGN key (id_asignatura) REFERENCES Asignatura_CD(id_asignatura)
);

-- Tabla Dia Semana
CREATE TABLE Dia_Semana (
    id_dia INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL
);

-- Resultado Solicitud consejo

CREATE TABLE Resultado_Solicitud_Consejo (
    id_Resultado_Solicitud INTEGER PRIMARY KEY AUTOINCREMENT,
    Resultado TEXT NOT NULL
);

-- Solicitud consejo

CREATE TABLE Solicitud_consejo (
    id_Solicitud INTEGER PRIMARY KEY AUTOINCREMENT,
    fecha_solicitud DATE NOT NULL,
    solicitud_consejo TEXT NOT NULL,
    id_resultado INTEGER NOT NULL,
    fecha_procesamiento DATE NOT NULL,
    acta INTEGER NOT NULL,

    FOREIGN KEY (id_resultado) REFERENCES Resultado_Solicitud_Consejo(id_Resultado_Solicitud)   
);

-- Doc_Solicitud_Consejo

CREATE TABLE Doc_Solicitud_Consejo (
    id_doc_solicitud INTEGER PRIMARY KEY AUTOINCREMENT,
    id_docente INTEGER NOT NULL,
    id_solicitud INTEGER NOT NULL,

    FOREIGN KEY (id_docente) REFERENCES Docente(id_docente),
    FOREIGN KEY (id_solicitud) REFERENCES Solicitud_consejo(id_Solicitud),    
);

-- Est_Solicitud_Consejo

CREATE TABLE Est_Solicitud_Consejo (
    id_doc_solicitud INTEGER PRIMARY KEY AUTOINCREMENT,
    id_estudiante INTEGER NOT NULL,
    id_solicitud INTEGER NOT NULL,

    FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id_estudiante),
    FOREIGN KEY (id_solicitud) REFERENCES Solicitud_consejo(id_Solicitud),    
);


-- Modalidad

CREATE TABLE Modalidad (
    id_Modalidad INTEGER PRIMARY KEY AUTOINCREMENT,
    Modalidad TEXT NOT NULL  
);

-- Periodo Academico

CREATE TABLE Periodo_Academico (
    id_periodo INTEGER PRIMARY KEY AUTOINCREMENT,
    Nombre TEXT NOT NULL  
);

-- Monitor

CREATE TABLE Monitor (
    id_est_Monitoria INTEGER PRIMARY KEY AUTOINCREMENT,
    id_asignatura INTEGER NOT NULL,
    id_estudiante INTEGER NOT NULL,
    Tema TEXT,
    id_modalidad INTEGER,
    id_periodo_academico INTEGER,
    id_docente INTEGER,
    evaluacion TEXT,
    
    FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id_estudiante),
    FOREIGN KEY (id_docente) REFERENCES Docente(id_docente),
    FOREIGN KEY (id_modalidad) REFERENCES Modalidad(id_Modalidad),
    

);

-- Horario Monitoria

CREATE TABLE Horario_Monitoria (
    id_Horario_Monitoria INTEGER PRIMARY KEY AUTOINCREMENT,
    id_est_Monitoria INTEGER NOT NULL,
    id_Dia INTEGER NOT NULL,
    Hora TIME,

    
    FOREIGN KEY (id_dia) REFERENCES Dia_Semana(id_dia)
);

-- Tabla Linea de Investigacion
CREATE TABLE Linea_de_Investigacion (
    id_linea_de_investigacion INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL
);

-- Tabla Semillero_de_Investigacion
CREATE TABLE Semillero_de_Investigacion (
    id_semillero INTEGER PRIMARY KEY AUTOINCREMENT,
    id_docente INTEGER NOT NULL,
    nombre_semillero TEXT NOT NULL,
    id_linea_investigacion INTEGER NOT NULL,
    objetivos TEXT,
    actividades VARCHAR(511),
    fecha_creacion DATE,
    resultados_obtenidos TEXT,
    fecha_resultados DATE,
    
    FOREIGN KEY (id_docente) REFERENCES Docente(id_docente),
    FOREIGN KEY (id_linea_investigacion) REFERENCES Linea_de_Investigacion(id_linea_de_investigacion)
);

-- Tabla Est_Pitagoras
CREATE TABLE Est_Pitagoras (
    id_est_pitagoras INTEGER PRIMARY KEY AUTOINCREMENT,
    id_estudiante INTEGER NOT NULL,
    id_asignatura INTEGER NOT NULL,
    tema TEXT,
    id_docente INT NOT NULL,

    FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id_estudiante),
    FOREIGN KEY (id_asignatura) REFERENCES Asignatura_CD(id_asignatura),
    FOREIGN KEY (id_docente) REFERENCES Docente(id_docente)
);

-- Tabla Horario_Pitagoras
CREATE TABLE Horario_Pitagoras (
    id_horario_pitagoras INTEGER PRIMARY KEY AUTOINCREMENT,
    id_est_pitagoras INTEGER NOT NULL,
    id_dia INTEGER NOT NULL,
    hora TIME NOT NULL,

    FOREIGN KEY (id_est_pitagoras) REFERENCES Est_Pitagoras(id_est_pitagoras),
    FOREIGN KEY (id_dia) REFERENCES Dia_Semana(id_dia)
);

CREATE TABLE Docente_Externo (
    id_docente_externo INTEGER PRIMARY KEY AUTOINCREMENT,
    autorizacion_datos INTEGER NOT NULL,
    fecha_actualizacion Date,
    nombre_completo TEXT NOT NULL,
    id_tipo_documento INTEGER NOT NULL,
    numero_documento INTEGER UNIQUE NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    id_genero INTEGER NOT NULL,
    email_personal TEXT,
    telefono_contacto TEXT,
    nacionalidad TEXT,
    maxima_formacion TEXT,
    tiempo_vinculacion TEXT,

    FOREIGN KEY (id_tipo_documento) REFERENCES Tipo_Documento(id_tipo_documento),
    FOREIGN KEY (id_genero) REFERENCES Genero(id_genero)
);

-- Tabla Estado Pasantia
CREATE TABLE Estado_Pasantia (
    id_estado INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL
);

-- Tabla Pasantia
CREATE TABLE Pasantia (
    id_pasantia INTEGER PRIMARY KEY AUTOINCREMENT,
    organizacion TEXT NOT NULL,
    nombre_responsable_externo TEXT NOT NULL,
    numero_contacto_responsable_externo INTEGER NOT NULL,
    descripcion TEXT,
    requisitos TEXT,
    duracion TEXT,
    id_docente INTEGER NOT NULL,
    id_estado INTEGER NOT NULL,
    fecha_estado DATE,

    FOREIGN KEY (id_docente) REFERENCES Docente(id_docente),
    FOREIGN KEY (id_estado) REFERENCES Estado_Pasantia(id_estado)
);

-- Tabla Desarrollo Pasantia
CREATE TABLE Desarrollo_Pasantia (
    id_desarrollo_pasantia INTEGER PRIMARY KEY AUTOINCREMENT,
    id_pasantia INTEGER NOT NULL,
    id_estudiante INTEGER NOT NULL,
    id_docente INTEGER NOT NULL,
    horas_doc_semanales_dedicacion INTEGER,
    horas_est_semanales_dedicacion INTEGER,
    descripcion TEXT,
    fecha_inicio DATE,
    objetivos TEXT,
    avances TEXT,
    fecha_avance DATE,
    observaciones_est TEXT,
    observaciones_doc TEXT,
    evaluacion_est_organizacion TEXT,
    evaluacion_est_docente TEXT,

    FOREIGN KEY (id_pasantia) REFERENCES Pasantia(id_pasantia)
    FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id_estudiante),
    FOREIGN KEY (id_docente) REFERENCES Docente(id_docente)
);


-- Tabla Facultad
CREATE TABLE Facultad (
    id_facultad INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL
);

-- Tabla Programa
CREATE TABLE Programa (
    id_programa INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    id_facultad INTEGER NOT NULL,

    FOREIGN KEY (id_facultad) REFERENCES Facultad(id_facultad)
);

-- Tabla Universidad
CREATE TABLE Universidad (
    id_universidad INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL
);

-- Tabla Estado Inscripcion
CREATE TABLE Estado_Inscripcion (
    id_estado INTEGER PRIMARY KEY AUTOINCREMENT,
    estado TEXT NOT NULL
);

-- Tabla Est Matriculado
CREATE TABLE Est_Matriculado (
    id_matricula INTEGER PRIMARY KEY AUTOINCREMENT,
    id_periodo_matricula INTEGER NOT NULL,
    id_estudiante INTEGER NOT NULL,
    id_programa INTEGER NOT NULL,
    cod_plan TEXT,
    clase_oyente TEXT,
    id_obj_estudiante INTEGER,
    id_status_inscripcion INTEGER NOT NULL,
    fecha_inscripcion DATE,
    fecha_admision DATE,
    id_univ_estudios_pregr INTEGER NOT NULL,
    titulo_pregrado TEXT,
    id_periodo_ingreso INTEGER NOT NULL,
    semestre_ubi INTEGER NOT NULL,
    fecha_terminacion DATE,
    motivo_excedencia TEXT,
    pago TEXT,

    FOREIGN KEY (id_periodo_matricula) REFERENCES Periodo_Academico(id_periodo),
    FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id_estudiante),
    FOREIGN KEY (id_programa) REFERENCES Programa(id_programa),
    FOREIGN KEY (id_status_inscripcion) REFERENCES Estado_Inscripcion(id_estado),
    FOREIGN KEY (id_univ_estudios_pregr) REFERENCES Universidad(id_universidad),
    FOREIGN KEY (id_periodo_ingreso) REFERENCES Periodo_Academico(id_periodo)
);

-- Tabla Estudiante Doble Programa
CREATE TABLE Estudiante_Doble_Programa (
    id_estudiante_dp INTEGER PRIMARY KEY AUTOINCREMENT,
    id_programa_precedencia INTEGER NOT NULL,
    id_programa_receptor INTEGER NOT NULL,
    fecha_inicio_doble_programa DATE,
    id_estudiante INTEGER NOT NULL,

    FOREIGN KEY (id_programa_precedencia) REFERENCES Programa(id_programa),
    FOREIGN KEY (id_programa_receptor) REFERENCES Programa(id_programa),
    FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id_estudiante)
);

-- Tabla Asignatura Mate
CREATE TABLE Asignatura_Mate (
    id_asignatura_mate INTEGER PRIMARY KEY AUTOINCREMENT,
    id_docente INTEGER NOT NULL,
    id_periodo_academico INTEGER NOT NULL,
    nombre_asignatura TEXT NOT NULL,
    grupo TEXT,
    facultad INTEGER NOT NULL,
    link_microcurriculo TEXT,
    fecha_actualizacion_micro DATE,

    FOREIGN KEY (id_docente) REFERENCES Docente(id_docente),
    FOREIGN KEY (id_periodo_academico) REFERENCES Periodo_Academico(id_periodo),
    FOREIGN KEY (facultad) REFERENCES Facultad(id_facultad)
);

-- Tabla Horario Asignatura Mate
CREATE TABLE Horario_Asignatura_Mate (
    id_horario_asignatura_mate INTEGER PRIMARY KEY AUTOINCREMENT,
    id_asignatura_mate INTEGER NOT NULL,
    id_dia INTEGER NOT NULL,
    hora TIME NOT NULL,

    FOREIGN KEY (id_asignatura_mate) REFERENCES Asignatura_Mate(id_asignatura_mate),
    FOREIGN KEY (id_dia) REFERENCES Dia_Semana(id_dia)
);

-- Tabla Tipo Opcion Grado
CREATE TABLE Tipo_Opcion_Grado (
    id_tipo_opcion_grado INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL
);

-- Tabla Estado Opcion Grado
CREATE TABLE Estado_Opcion_Grado (
    id_estado_opcion_grado INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL
);

-- Tabla Opcion Grado
CREATE TABLE Opcion_Grado (
    id_opcion_grado INTEGER PRIMARY KEY AUTOINCREMENT,
    id_tipo INTEGER NOT NULL,
    descripcion TEXT NOT NULL,
    id_docente INTEGER NOT NULL,
    id_estado INTEGER NOT NULL,

    FOREIGN KEY (id_tipo) REFERENCES Tipo_Opcion_Grado(id_tipo_opcion_grado),
    FOREIGN KEY (id_docente) REFERENCES Docente(id_docente),
    FOREIGN KEY (id_estado) REFERENCES Estado_Opcion_Grado(id_estado_opcion_grado)
);

-- tabla Desarrollo Opcion Grado
CREATE TABLE Desarrollo_Opcion_Grado (
  	id_desarrollo_opcion INTEGER PRIMARY KEY,
  	id_opcion_grado INTEGER,
  	id_estudiante INTEGER,
  	id_docente INTEGER,
  	horas_doc_semanales_dedicacion INTEGER,
  	horas_est_semanales_dedicacion INTEGER,
  	descripcion TEXT,
  	fecha_inicio DATE,
  	objetivos TEXT,
  	avances TEXT,
  	fecha_avance DATE,
  	evaluacion TEXT,
  	link_opcion TEXT,
  	FOREIGN KEY (id_opcion_grado) REFERENCES Opcion_Grado(id_opcion_grado),
  	FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id_estudiante),
  	FOREIGN KEY (id_docente) REFERENCES Docente(id_docente)
);

-- Tabla Horas Bienestar
CREATE TABLE Horas_Bienestar (
    id_horas_bienestar INTEGER PRIMARY KEY,
    id_estudiante INTEGER,
    numero_horas INTEGER,
    periodo_horas INTEGER,
    link_evidencia TEXT,
    FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id_estudiante)
);

-- Tabla Mentor
CREATE TABLE Mentor (
    id_mentor INTEGER PRIMARY KEY,
    id_docente INTEGER,
    id_periodo_academico INTEGER,
    id_estudiante INTEGER,
    FOREIGN KEY (id_docente) REFERENCES Docente(id_docente),
    FOREIGN KEY (id_periodo_academico) REFERENCES Periodo_Academico(id_periodo_academico),
    FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id_estudiante)
);

-- Tabla Reconocimiento
CREATE TABLE Reconocimiento (
    id_reconocimiento INTEGER PRIMARY KEY,
    id_estudiante INTEGER,
    fecha_reconocimiento DATE,
    tipo_reconocimiento TEXT,
    evidencias TEXT,
    FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id_estudiante)
);

-- Tabla Est Status
CREATE TABLE Est_Status (
    id_status INTEGER PRIMARY KEY,
    id_estudiante INTEGER,
    cons_total TEXT,
    id_programa_1 INTEGER,
    id_programa_2 INTEGER,
    ano_academico INTEGER,
    id_periodo_academico INTEGER,
    num_materias INTEGER,
    id_asignatura INTEGER,
    nota REAL,
    escala REAL,
    desc_status TEXT,
    nombre_adicional TEXT,
    sem_ubicacion INTEGER,
    prom_periodo REAL,
    prom_acumulado REAL,
    texto_observacion REAL,
    FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id_estudiante),
    FOREIGN KEY (id_programa_1) REFERENCES Programa(id_programa),
    FOREIGN KEY (id_programa_2) REFERENCES Programa(id_programa),
    FOREIGN KEY (id_periodo_academico) REFERENCES Periodo_Academico(id_periodo_academico),
    FOREIGN KEY (id_asignatura) REFERENCES Asignatura(id_asignatura)
);

-- Tabla cancelacion Asignatura
CREATE TABLE Cancelacion_Asignatura (
    id_cancelacion INTEGER PRIMARY KEY,
    id_estudiante INTEGER,
    fecha_solicitud DATE,
    asignatura INTEGER,
    resultado INTEGER, -- Usando INTEGER para representar INTEGERo (0 = false, 1 = true)
    fecha_procesamiento DATE,
    FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id_estudiante),
    FOREIGN KEY (asignatura) REFERENCES Asignatura(id_asignatura)
);

-- Tipo colegio
CREATE TABLE tipo_colegio (
    id_Tipo_Colegio INTEGER PRIMARY KEY,
    Nombre TEXT
);

-- Colegio
CREATE TABLE Colegio (
    id_colegio INTEGER PRIMARY KEY,
    Nombre TEXT,
    id_tipo INTEGER,
    id_municipio INTEGER
    direccion TEXT

    FOREIGN KEY (id_tipo) REFERENCES tipo_colegio(id_Tipo_Colegio)
    FOREIGN KEY (id_municipio) REFERENCES Municipio(id_municipio)
);

-- Tabla Est Foto
CREATE TABLE Est_Foto (
    id_est_foto INTEGER PRIMARY KEY,
    id_estudiantes INTEGER,
    dir_fot TEXT,
    FOREIGN KEY (id_estudiantes) REFERENCES Estudiante(id_estudiante)
);

-- Tabla Aulto Responsable
CREATE TABLE Adulto_Responsable (
    id_adulto_responsable INTEGER PRIMARY KEY,
    nombre TEXT
);

-- tabla Responsable Estudiante
CREATE TABLE Responsables_Estudiante (
    id_responsabilidad INTEGER PRIMARY KEY,
    id_estudiante INTEGER,
    id_tipo_discapacidad INTEGER,
    nombre TEXT,
    id_adulto_responsable INTEGER,
    FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id_estudiante),
    FOREIGN KEY (id_tipo_discapacidad) REFERENCES Tipo_Discapacidad(id_tipo_discapacidad),
    FOREIGN KEY (id_adulto_responsable) REFERENCES Adulto_Responsable(id_adulto_responsable)
);
