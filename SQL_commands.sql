-- Creación de Tablas
CREATE TABLE estudiantes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    grupo TEXT NOT NULL,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE equipos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    descripcion TEXT
);

CREATE TABLE proyectos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    descripcion TEXT,
    fecha_inicio DATE,
    fecha_fin DATE,
    estado TEXT DEFAULT 'En curso',
    equipo_id INTEGER UNIQUE, -- Relación 1 a 1 con Equipos
    FOREIGN KEY (equipo_id) REFERENCES Equipos(id) ON DELETE CASCADE
);

CREATE TABLE tareas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    descripcion TEXT,
    estado TEXT DEFAULT 'Pendiente',
    proyecto_id INTEGER,
    fecha_vencimiento DATE,
    fecha_completada DATE,
    FOREIGN KEY (proyecto_id) REFERENCES Proyectos(id) ON DELETE CASCADE
);

CREATE TABLE estudiantes_equipos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    equipo_id INTEGER,
    estudiante_id INTEGER,
    FOREIGN KEY (equipo_id) REFERENCES Equipos(id) ON DELETE CASCADE,
    FOREIGN KEY (estudiante_id) REFERENCES Estudiantes(id) ON DELETE CASCADE
);

CREATE TABLE progreso_tareas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    tarea_id INTEGER,
    equipo_id INTEGER,
    porcentaje_completado INTEGER DEFAULT 0,
    comentarios TEXT,
    fecha_avance DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (tarea_id) REFERENCES Tareas(id) ON DELETE CASCADE,
    FOREIGN KEY (equipo_id) REFERENCES Equipos(id) ON DELETE CASCADE
);
