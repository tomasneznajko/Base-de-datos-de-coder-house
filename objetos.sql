DROP DATABASE IF EXISTS estadisticas_neznajko;

-- Creo Base de datos 
CREATE SCHEMA IF NOT EXISTS estadisticas_neznajko;
USE estadisticas_neznajko;

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
    FOREIGN KEY(id_nombre) REFERENCES nombre(id_nombre) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(id_estado) REFERENCES estados(id_estado) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(id_estad_jug) REFERENCES estad_jugador(id_estad_jug) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS tiempo(
	id_tiempo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    horario TIME NOT NULL,
    fecha DATE NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS entrenamiento(
	id_entrenamiento INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_tiempo INT NOT NULL,
    FOREIGN KEY(id_tiempo) REFERENCES tiempo(id_tiempo) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS partido(
	id_partido INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_tiempo INT NOT NULL,
    contrincante VARCHAR(30) NOT NULL,
    porteria_invicta BIT NOT NULL,
    id_competencia INT NOT NULL,
	FOREIGN KEY(id_tiempo) REFERENCES tiempo(id_tiempo) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(id_competencia) REFERENCES competencia(id_competencia) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS logros_partido(
	id_logros_partido INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    goles INT NOT NULL,
    asistencias INT NOT NULL,
    figura BIT NOT NULL
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
    titular BIT NOT NULL,
	calificacion DECIMAL(3,2) NOT NULL,
    id_fin_partido INT NOT NULL,
    id_logros_partido INT,
    FOREIGN KEY(id_partido) REFERENCES partido(id_partido) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(id_jugador) REFERENCES jugador(id_jugador) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(id_fin_partido) REFERENCES fin_partido(id_fin_partido) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(id_logros_partido) REFERENCES logros_partido(id_logros_partido) ON DELETE CASCADE ON UPDATE CASCADE
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
    FOREIGN KEY(id_entrenamiento) REFERENCES entrenamiento(id_entrenamiento) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(id_logros_entrenamiento) REFERENCES logros_entrenamiento(id_logros_entrenamiento) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(id_jugador) REFERENCES jugador(id_jugador) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS puesto(
	id_puesto INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    puesto VARCHAR(30) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS empleado(
	id_empleado INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_nombre INT NOT NULL,
    id_puesto INT NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    FOREIGN KEY(id_nombre) REFERENCES nombre(id_nombre) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(id_puesto) REFERENCES puesto(id_puesto) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS email_empleado(
	id_privado INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_empleado INT NOT NULL,
    email VARCHAR(60) NOT NULL,
    FOREIGN KEY(id_empleado) REFERENCES empleado(id_empleado) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS telefono_empleado(
	id_privado INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_empleado INT NOT NULL,
    telefono INT UNSIGNED NOT NULL,
    FOREIGN KEY(id_empleado) REFERENCES empleado(id_empleado) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS empleado_jugador(
	id_privado INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_empleado INT NOT NULL,
    id_jugador INT NOT NULL,
    tipo_servicio VARCHAR(40) NOT NULL,
    tiempo TIME NOT NULL,
    FOREIGN KEY(id_empleado) REFERENCES empleado(id_empleado) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(id_jugador) REFERENCES jugador(id_jugador) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- FUNCIONES

DELIMITER $$

-- Unir el nombre separado por espacio
 
CREATE FUNCTION `nombre_completo` (nombre VARCHAR(40), apellido VARCHAR(40)) 
RETURNS VARCHAR(80)
DETERMINISTIC
BEGIN
	DECLARE nombre_completo VARCHAR(80);
    SET nombre_completo = CONCAT_WS(' ', nombre ,apellido);
    RETURN nombre_completo;
END$$

-- Nombre completo de un jugador, según su id

CREATE FUNCTION `nombre_completo_jugador` (id INT)
RETURNS VARCHAR(80)
READS SQL DATA
BEGIN
    DECLARE nombre VARCHAR(40);
    DECLARE apellido VARCHAR(40);
    DECLARE nombre_completo VARCHAR(80);
    
    SET nombre = (SELECT n.nombre 
		FROM nombre AS n
        JOIN jugador AS j ON n.id_nombre = j.id_nombre
        WHERE j.id_jugador = id LIMIT 1);
    SET apellido = (SELECT n.apellido 
		FROM nombre AS n
        JOIN jugador AS j ON n.id_nombre = j.id_nombre
        WHERE j.id_jugador = id LIMIT 1);
    SET nombre_completo = nombre_completo(nombre,apellido);
    RETURN nombre_completo;

END$$

-- Mismo algoritmo que el anterio, pero usando al empleado

CREATE FUNCTION `nombre_completo_empleado` (id INT)
RETURNS VARCHAR(80)
READS SQL DATA
BEGIN
    DECLARE nombre VARCHAR(40);
    DECLARE apellido VARCHAR(40);
    DECLARE nombre_completo VARCHAR(80);
    
    SET nombre = (SELECT n.nombre 
		FROM nombre AS n
        JOIN empleado AS e ON n.id_nombre = e.id_nombre
        WHERE e.id_empleado = id LIMIT 1);
    SET apellido = (SELECT n.apellido 
		FROM nombre AS n
        JOIN empleado AS e ON n.id_nombre = e.id_nombre
        WHERE e.id_empleado = id LIMIT 1);
    SET nombre_completo = nombre_completo(nombre,apellido);
    RETURN nombre_completo;

END$$


-- Promedio de goles totales (entre partido y entrenamiento) de un jugador particular
CREATE FUNCTION `promedio_goles_jugador` (id INT)
RETURNS DECIMAL (3,2)
READS SQL DATA
BEGIN
    DECLARE goles_partidos INT;
    DECLARE goles_entrenamiento INT;
    DECLARE partidos_jugados INT;
    DECLARE entrenamientos_jugados INT;
    DECLARE promedio DECIMAL(3,2);
    
    SET goles_partidos = (SELECT SUM(l.goles) 
		FROM jugador AS j
        JOIN partido_jugador AS p_j ON j.id_jugador = p_j.id_jugador
        JOIN logros_partido AS l ON l.id_logros_partido = p_j.id_logros_partido
        WHERE j.id_jugador = id LIMIT 1
		);
	SET goles_entrenamiento = (SELECT SUM(l.goles) 
		FROM jugador AS j
        JOIN entrenamiento_jugador AS e_j ON j.id_jugador = e_j.id_jugador
        JOIN logros_entrenamiento AS l ON l.id_logros_entrenamiento = e_j.id_logros_entrenamiento
        WHERE j.id_jugador = id LIMIT 1
		);
	SET partidos_jugados = (SELECT COUNT(id_privado) 
		FROM partido_jugador 
        WHERE id_jugador = id LIMIT 1);
	SET entrenamientos_jugados = (SELECT COUNT(id_privado) 
		FROM entrenamiento_jugador 
        WHERE id_jugador = id LIMIT 1);
        
	SET promedio = (goles_partidos + goles_entrenamiento) / (partidos_jugados + entrenamientos_jugados);
    RETURN promedio;
END$$

-- Obtener fecha del partido mediante su id

CREATE FUNCTION `fecha_partido` (id INT)
RETURNS DATE
READS SQL DATA
BEGIN
    DECLARE fecha_partido DATE;
    
    SET fecha_partido = (SELECT t.fecha 
		FROM tiempo AS t
        JOIN partido AS p ON p.id_tiempo = t.id_tiempo
        WHERE p.id_partido = id);
    RETURN fecha_partido;

END$$


DELIMITER ;


-- TRIGGERS

CREATE TABLE nuevos_partido_jugador(
	id_privado INT PRIMARY KEY AUTO_INCREMENT,
    id_nuevo INT,
    nombre_jugador VARCHAR(80),
    fecha_partido DATE,
    fecha_actual DATE,
    hora_actual TIME
    
);

-- Registra el jugador agregado en la inserción de registros de la tabla partido_jugador con la fecha y hora de su realización

CREATE TRIGGER `tr_nuevo_partido_jugador`
BEFORE INSERT ON `partido_jugador`
FOR EACH ROW
INSERT INTO `nuevos_partido_jugador`
VALUES (NULL, NEW.id_privado, nombre_completo_jugador(NEW.id_jugador),
fecha_partido(NEW.id_partido), CURRENT_DATE(),CURRENT_TIME());


CREATE TABLE `partido_jugador_descartados`(
	id_privado INT PRIMARY KEY AUTO_INCREMENT,
    nombre_usuario VARCHAR(80),
    hora_actual TIME,
    fecha_actual DATE,
    partido_anterior INT,
    jugador_anterior VARCHAR(80)
);

-- Obtener el nombre del usuario y la fecha actual de los registros eliminados de la tabla partido_jugador para encontrarlo por fecha y hora actual
CREATE TRIGGER `tr_descarte_partido_jugador`
AFTER DELETE ON `partido_jugador`
FOR EACH ROW
INSERT INTO `partido_jugador_descartados` VALUES
	(OLD.id_privado, SYSTEM_USER(), CURRENT_TIME(), CURRENT_DATE(), OLD.id_partido, nombre_completo_jugador(OLD.id_jugador));

CREATE TABLE nuevos_empleados_jugador(
	id_privado INT PRIMARY KEY AUTO_INCREMENT,
    nombre_jugador VARCHAR(80) ,
    nombre_empleado VARCHAR(80),
    nombre_usuario VARCHAR(40),
    fecha_actual DATE,
    hora_actual TIME
);

DROP TRIGGER IF EXISTS `tr_nuevo_empleado_jugador`;
-- Registra los datos que fueron agregados en empleado_jugador en fecha y hora de su realizacion
CREATE TRIGGER `tr_nuevo_empleado_jugador`
BEFORE INSERT ON `empleado_jugador`
FOR EACH ROW
INSERT INTO `nuevos_empleados_jugador` VALUES
(NEW.id_privado, nombre_completo_empleado(NEW.id_empleado), nombre_completo_jugador(NEW.id_jugador), CURRENT_USER(), CURRENT_DATE, CURRENT_TIME());


CREATE TABLE cambios_empleado_jugador(
	id_privado INT PRIMARY KEY AUTO_INCREMENT,
    nombre_usuario VARCHAR(60),
    fecha_hora_actual TIMESTAMP,
    tipo_servicio_anterior VARCHAR(40),
    tiempo_anterior TIME,
    empleado_anterior VARCHAR(80),
    jugador_anterior VARCHAR(80)
);

-- Registra el momento y el auto del cambio en los registros de la tabla empleado_jugador

CREATE TRIGGER `tr_cambio_empleado_jugador`
AFTER UPDATE ON `empleado_jugador`
FOR EACH ROW
INSERT INTO `cambios_empleado_jugador` VALUES
(OLD.id_privado, CURRENT_USER(),CURRENT_TIMESTAMP(), OLD.tipo_servicio, OLD.tiempo, nombre_completo_empleado(OLD.id_empleado), nombre_completo_jugador(OLD.id_jugador));


-- STORED PROCEDURE

DELIMITER $$

CREATE PROCEDURE `sp_ordenar_x_enteros` (IN campo VARCHAR(40), IN tipo_orden VARCHAR(5))
BEGIN
	IF LENGTH(campo) > 0 THEN
		-- Creamos parametro de ordenamiento a agregar en la consulta
		SET @orden_x_entero = CONCAT_WS(' ', 'ORDER BY', campo, tipo_orden);
	ELSE
		SET @orden_x_entero = '';
	END IF;
    
	-- Armar clausula con el @orden_x_entero obtenido. En este caso, es el nombre completo de la tabla nombre.
    SET @clausula = CONCAT_WS(' ', 'SELECT nombre_completo(n.nombre, n.apellido) AS nombre_completo FROM nombre AS n', @orden_x_entero);
    
    -- Preparar y ejecutar la query armada
    PREPARE ejecutar FROM @clausula;
    EXECUTE ejecutar;
    DEALLOCATE PREPARE ejecutar;
    
END$$

CREATE PROCEDURE `sp_eliminar_o_agregar_email` (IN id_emp INT, IN mail VARCHAR(60))  -- Elimina email encontrado, pero, si no existe actualmente con esos datos, agrega el mismo mencionad0, si es válida
BEGIN
	DECLARE email_nulo VARCHAR(60);
	SET email_nulo = (SELECT email FROM email_empleado WHERE id_empleado = id_emp AND email = mail); 
	IF email_nulo != '' THEN
        DELETE FROM email_empleado WHERE id_empleado = id_emp AND email = mail;
	ELSE
		IF mail LIKE '%@%' THEN  -- Será valido, siempre y cuando, tenga arroba en alguna parte intermedia
			INSERT INTO email_empleado VALUES(
				NULL, id_emp, mail);
		END IF;
    END IF;
    
    SELECT * FROM email_empleado;
    
    -- Ejecutamos clausula para corroborar resultados
END$$

DELIMITER $$

CREATE PROCEDURE `sp_actualizar_clasificacion_x_jugador` (IN id_jug INT)  -- Actualiza la clasificacion del jugador indicado por parametro. Se toma en consideracion su calificacion promedio en partidos y entrenamientos
BEGIN
	DECLARE calificacion_anterior DECIMAL(3,2);
    DECLARE calificacion_partido DECIMAL(3,2);
    DECLARE calificacion_entrenamiento DECIMAL(3,2);
    DECLARE calificacion_actual DECIMAL(3,2);
    DECLARE id_estad INT; 
    
	SET calificacion_anterior = (SELECT e.calificacion FROM jugador AS j
		JOIN estad_jugador AS e ON j.id_estad_jug = e.id_estad_jug WHERE j.id_jugador = id_jug); 
    SET calificacion_partido = (SELECT AVG(calificacion) FROM partido_jugador WHERE id_jugador = id_jug LIMIT 1);
    SET calificacion_entrenamiento = (SELECT AVG(calificacion) FROM entrenamiento_jugador WHERE id_jugador = id_jug LIMIT 1);
    SET calificacion_actual = (calificacion_partido + calificacion_entrenamiento)/2;
    SET id_estad = (SELECT id_estad_jug FROM jugador WHERE id_jugador = id_jug LIMIT 1);
    
	IF calificacion_anterior != calificacion_actual AND LENGTH(calificacion_actual) > 0 THEN
		UPDATE estad_jugador
			SET calificacion = calificacion_actual
			WHERE id_estad_jug = id_estad; 
    END IF;
END$$

DELIMITER ;

-- VISTAS

-- Top 5 de los jugadores mejor calificados de equipo
CREATE OR REPLACE VIEW jugadores_mas_calificados AS
    SELECT nombre_completo_jugador(j.id_jugador) AS nombre_jugador, e.calificacion AS calificacion
    FROM jugador AS j 
    JOIN estad_jugador AS e ON j.id_estad_jug = e.id_estad_jug
	ORDER BY calificacion DESC
    LIMIT 5;
;

-- Cantidad de goles y asistencias promedio por jugador por partido
CREATE OR REPLACE VIEW resultados_x_partido AS
	SELECT nombre_completo_jugador(j.id_jugador) AS nombre_jugador, e.posicion AS posicion, TRUNCATE((AVG(l.goles)),2) AS goles, TRUNCATE((AVG(l.asistencias)),2) AS asistencias
	FROM jugador AS j
    JOIN estados AS e ON j.id_estado = e.id_estado
    JOIN partido_jugador AS p ON j.id_jugador = p.id_jugador
    JOIN logros_partido AS l ON p.id_logros_partido = l.id_logros_partido
    GROUP BY j.id_jugador
    ORDER BY nombre_jugador
;


-- Cantidad de ejercicios realizados y victorias en un tiempo promedio por cada entrenamiento por jugador
CREATE OR REPLACE VIEW ejercicios_x_entrenamiento AS
	SELECT nombre_completo_jugador(j.id_jugador) AS nombre_jugador, TRUNCATE((AVG(l.victorias)),2) AS victorias, TRUNCATE((AVG(l.realizados)),2) AS ejercicios, SEC_TO_TIME(AVG(TIME_TO_SEC(e.realizado))) AS tiempo_promedio
    FROM jugador AS j
    JOIN entrenamiento_jugador AS e ON j.id_jugador = e.id_jugador
    JOIN logros_entrenamiento AS l ON e.id_logros_entrenamiento = l.id_logros_entrenamiento
    GROUP BY j.id_jugador
    ORDER BY nombre_jugador
;

-- cantidad de servicios y tiempo dados por cada empleado en orden alfabético
CREATE OR REPLACE VIEW servicios_x_empleado AS
	SELECT nombre_completo_empleado(e.id_empleado) AS nombre_completo, COUNT(e_j.id_jugador) AS jugadores, SEC_TO_TIME(SUM(TIME_TO_SEC(e_j.tiempo))) AS tiempo
    FROM empleado AS e
    JOIN empleado_jugador AS e_j ON e.id_empleado = e_j.id_empleado
    GROUP BY e.id_empleado
    ORDER BY nombre_completo ASC
;

-- Tiempo por cada jugador en cada COPA jugada
CREATE OR REPLACE VIEW tiempo_x_copa AS
	SELECT nombre_completo_jugador(j.id_jugador) AS nombre_completo, c.evento AS copa, SEC_TO_TIME(SUM(TIME_TO_SEC(f.jugado))) AS tiempo
    FROM jugador AS j
    JOIN partido_jugador AS p_j ON j.id_jugador = p_j.id_jugador
    JOIN fin_partido AS f ON p_j.id_fin_partido = f.id_fin_partido
    JOIN partido AS p ON p_j.id_partido = p.id_partido 
    JOIN competencia AS c ON p.id_competencia = c.id_competencia
    WHERE c.evento LIKE '%copa%'
    GROUP BY j.id_jugador
;






