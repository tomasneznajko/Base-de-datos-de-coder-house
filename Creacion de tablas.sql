CREATE SCHEMA IF NOT EXISTS estadisticas;
USE estadisticas;

CREATE TABLE IF NOT EXISTS competencia(
	id_competencia INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    evento VARCHAR(30) NOT NULL,
    cantidad_equipo INT NOT NULL,
    fase_actual VARCHAR(30) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS nombre(
	id_nombre INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(40) NOT NULL,
    apellido VARCHAR(40) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS estad_jugador(
	id_estad_jug INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    goles INT NOT NULL,
    asistencias INT NOT NULL,
    porterias_invicta INT NOT NULL,
    calificacion DECIMAL(3,2) NOT NULL,
    amarillas_acum INT NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS estados(
	id_estado INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    posicion VARCHAR(15) NOT NULL,
    competencia VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS jugador(
	id_jugador INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_nombre INT NOT NULL,
    id_estado INT NOT NULL,
    id_estad_jug INT,
    fecha_nacimiento DATE NOT NULL,
    FOREIGN KEY(id_nombre) REFERENCES nombre(id_nombre),
    FOREIGN KEY(id_estado) REFERENCES estados(id_estado),
    FOREIGN KEY(id_estad_jug) REFERENCES estad_jugador(id_estad_jug)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS tiempo(
	id_tiempo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    horario TIME NOT NULL,
    fecha DATE NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS entrenamiento(
	id_entrenamiento INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_tiempo INT NOT NULL,
    FOREIGN KEY(id_tiempo) REFERENCES tiempo(id_tiempo)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS partido(
	id_partido INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_tiempo INT NOT NULL,
    contrincante VARCHAR(30) NOT NULL,
    porteria_invicta BOOLEAN NOT NULL,
    id_competencia INT NOT NULL,
	FOREIGN KEY(id_tiempo) REFERENCES tiempo(id_tiempo),
	FOREIGN KEY(id_competencia) REFERENCES competencia(id_competencia)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS logros_partido(
	id_logros_partido INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    goles INT NOT NULL,
    asistencias INT NOT NULL,
    figura BOOLEAN NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS fin_partido(
	id_fin_partido INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    estado_partido VARCHAR(20),
	jugado TIME NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS partido_jugador(
	id_privado INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_partido INT NOT NULL,
    id_jugador INT NOT NULL,
    titular BOOLEAN NOT NULL,
    id_fin_partido INT NOT NULL,
    id_logros_partido INT,
    FOREIGN KEY(id_partido) REFERENCES partido(id_partido),
    FOREIGN KEY(id_jugador) REFERENCES jugador(id_jugador),
    FOREIGN KEY(id_fin_partido) REFERENCES fin_partido(id_fin_partido),
    FOREIGN KEY(id_logros_partido) REFERENCES logros_partido(id_logros_partido)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS logros_entrenamiento(
	id_logros_entrenamiento INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    goles INT NOT NULL,
    asistencias INT NOT NULL,
    victorias INT NOT NULL,
    realizados INT NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS entrenamiento_jugador(
	id_privado INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_entrenamiento INT NOT NULL,
    id_jugador INT NOT NULL,
    calificacion DECIMAL(3,2) NOT NULL,
    realizado TIME NOT NULL,
    id_logros_entrenamiento INT,
    FOREIGN KEY(id_entrenamiento) REFERENCES entrenamiento(id_entrenamiento),
    FOREIGN KEY(id_logros_entrenamiento) REFERENCES logros_entrenamiento(id_logros_entrenamiento),
    FOREIGN KEY(id_jugador) REFERENCES jugador(id_jugador)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS telefonos(
	id_telefono INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    telefono1 INT NOT NULL,
    telefono2 INT
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS empleado(
	id_empleado INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_nombre INT NOT NULL,
    id_telefono INT,
    puesto VARCHAR(30) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    FOREIGN KEY(id_nombre) REFERENCES nombre(id_nombre),
    FOREIGN KEY(id_telefono) REFERENCES telefonos(id_telefono)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS empleado_jugador(
	id_privado INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_empleado INT NOT NULL,
    id_jugador INT NOT NULL,
    tipo_servicio VARCHAR(40) NOT NULL,
    tiempo TIME NOT NULL,
    FOREIGN KEY(id_empleado) REFERENCES empleado(id_empleado),
    FOREIGN KEY(id_jugador) REFERENCES jugador(id_jugador)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;






