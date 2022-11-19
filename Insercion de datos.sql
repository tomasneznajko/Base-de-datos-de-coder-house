USE estadisticas_neznajko;

INSERT INTO competencia VALUES
(NULL,'Champions League',32,'Grupos'),
(NULL,'Copa Pistón',128,'Grupos'),
(NULL,'Copa libertadores',4,'Semifinal'),
(NULL,'Liga',20,'Grupos'),
(NULL,'Copa de la liga',16,'Cuartos de final'),
(NULL,'Copa volta',2,'Final'),
(NULL,'Copa EA',64,'Treintadosavos'),
(NULL,'Copa bola misteriosa',8,'Cuartos de final'),
(NULL,'Copa As de la cancha',16,'Octavos de final'),
(NULL,'Copa Fondo bikini',32,'Dieciseisavos'),
(NULL,'Copa Binario',8,'Cuartos de final'),
(NULL,'Copa épica',2,'Final');

INSERT INTO estados VALUES
(NULL,'Delantero','Titular'),
(NULL,'Portero','Titular'),
(NULL,'Defensor','Suplente'),
(NULL,'Defensor','Titular'),
(NULL,'Mediocampista','Titular'),
(NULL,'Mediocampista','Suspendido'),
(NULL,'Mediocampista','Lesionado'),
(NULL,'Mediocampista','Titular'),
(NULL,'Delantero','Suplente'),
(NULL,'Mediocampista','Titular'),
(NULL,'Defensor','Titular'),
(NULL,'Defensor','Suplente');

INSERT INTO fin_partido VALUES
(NULL,'Sin tarjeta','1:30:00'),
(NULL,'Sin tarjeta','1:00:00'),
(NULL,'Sin tarjeta','0:45:00'),
(NULL,'Amonestado','0:45:00'),
(NULL,'Amonestado','1:00:00'),
(NULL,'Sin tarjeta','1:30:00'),
(NULL,'Sin tarjeta','1:30:00'),
(NULL,'Amonestado','0:38:02'),
(NULL,'Expulsado','0:37:44'),
(NULL,'Sin tarjeta','1:30:00'),
(NULL,'Sin tarjeta','1:30:00'),
(NULL,'Sin tarjeta','1:30:00');

INSERT INTO logros_entrenamiento VALUES
(NULL,12,0,12,12),
(NULL,0,0,10,19),
(NULL,14,3,8,15),
(NULL,4,7,7,16),
(NULL,2,4,5,8),
(NULL,5,0,6,7),
(NULL,0,0,13,13),
(NULL,0,0,7,12),
(NULL,4,3,9,15),
(NULL,5,9,4,10),
(NULL,0,2,7,14),
(NULL,1,0,5,13);

INSERT INTO logros_partido VALUES
(NULL,2,0,1),
(NULL,0,0,0),
(NULL,0,1,0),
(NULL,0,0,0),
(NULL,0,0,0),
(NULL,0,0,0),
(NULL,0,0,0),
(NULL,0,0,0),
(NULL,0,0,0),
(NULL,0,0,0),
(NULL,1,2,0),
(NULL,0,0,0);

INSERT INTO nombre VALUES
(NULL,'Susana','Gimenez'),
(NULL,'Liones','Messi'),
(NULL,'Susana','Gimenez'),
(NULL,'Rayo','Mcqueen'),
(NULL,'Tomas','Neznajko'),
(NULL,'Cristiano','Ronaldo'),
(NULL,'Kakaroto','Vegetta'),
(NULL,'Fabricio','Polimeno'),
(NULL,'Diego Armando','Maradona'),
(NULL,'Adolf','Hitler'),
(NULL,'Mirtha','Legrand'),
(NULL,'Marcelo','Tinelli'),
(NULL,'Bob','Esponja'),
(NULL,'Sergio','Ramos'),
(NULL,'Bianca','Duarte'),
(NULL,'Geronimo','Espindola'),
(NULL,'Juan Ignacio','Sanchez'),
(NULL,'Cesar','Aracena'),
(NULL,'Ricardo','Fort');

INSERT INTO tiempo VALUES
(NULL,'14:30:00','2022-04-06'),
(NULL,'20:30:00','2022-04-27'),
(NULL,'18:30:00','2022-05-04'),
(NULL,'17:00:00','2022-05-10'),
(NULL,'15:00:00','2022-05-15'),
(NULL,'14:30:00','2022-05-22'),
(NULL,'18:30:00','2022-06-01'),
(NULL,'19:00:00','2022-04-12'),
(NULL,'16:30:00','2022-04-18'),
(NULL,'16:00:00','2022-03-16'),
(NULL,'17:30:00','2022-03-22'),
(NULL,'17:00:00','2022-03-08');

INSERT INTO partido VALUES
(NULL,2,'Los vikingos',1,5),
(NULL,4,'River plate',1,3),
(NULL,1,'Real Madrid',0,1),
(NULL,3,'Chelsea',0,1),
(NULL,5,'Pastores FC',0,11),
(NULL,9,'Barcelona',1,12),
(NULL,10,'Alemania',0,6),
(NULL,7,'Argentina',0,4),
(NULL,11,'Patronato',0,2),
(NULL,12,'Tiro Federal',0,2),
(NULL,6,'Defensa y Justicia',1,2),
(NULL,8,'Manchester United',0,7);

INSERT INTO puesto VALUES
(NULL,'Medico'),
(NULL,'Director tecnico'),
(NULL,'Psicologo'),
(NULL,'Auxiliar'),
(NULL,'Preparador fisico'),
(NULL,'Kinesiologo'),
(NULL,'Masajista'),
(NULL,'Utilero'),
(NULL,'Nutricionista'),
(NULL,'Entrenador de arqueros');

INSERT INTO empleado VALUES
(NULL,11,1,'0-01-01'),
(NULL,2,4,'2002-04-23'),
(NULL,1,2,'2000-02-25'),
(NULL,19,5,'1998-06-08'),
(NULL,13,7,'2000-08-30'),
(NULL,11,3,'2001-05-14'),
(NULL,12,4,'2000-11-29'),
(NULL,8,8,'2000-07-04'),
(NULL,5,10,'2001-05-22'),
(NULL,18,9,'2002-05-13'),
(NULL,15,6,'1994-09-03'),
(NULL,7,4,'2000-03-18');

INSERT INTO entrenamiento VALUES
(NULL,1),
(NULL,2),
(NULL,3),
(NULL,4),
(NULL,5),
(NULL,10),
(NULL,7),
(NULL,8),
(NULL,9),
(NULL,12);

INSERT INTO estad_jugador VALUES
(NULL,105,38,27,8.4,2),
(NULL,4,8,44,8.1,4),
(NULL,1,0,35,7.8,0),
(NULL,7,4,29,6.9,0),
(NULL,0,0,27,7.4,0),
(NULL,0,0,27,5.9,2),
(NULL,0,2,27,8.7,2),
(NULL,1,0,27,7.44,0),
(NULL,0,0,18,7.2,3),
(NULL,4,7,12,6.2,4),
(NULL,15,32,25,7.7,5),
(NULL,74,22,6,7.4,0);

INSERT INTO jugador VALUES
(NULL,13,8,4,'1994-04-2'),
(NULL,5,2,1,'2001-01-28'),
(NULL,9,5,3,'1995-06-6'),
(NULL,1,1,7,'1999-10-16'),
(NULL,15,6,5,'1980-03-25'),
(NULL,10,7,2,'1994-05-6'),
(NULL,8,2,6,'1990-07-4'),
(NULL,11,6,6,'2002-05-30'),
(NULL,17,3,11,'2000-05-2');

INSERT INTO email_empleado VALUES
(NULL,11,'humbertoVelez@gmail.com'),
(NULL,5,'jesucritoPasion@gmail.com'),
(NULL,3,'montyburns@gmail.com'),
(NULL,6,'tomasNeznajko@gmail.com'),
(NULL,4,'bachata27@gmail.com'),
(NULL,4,'batata_cosmica@gmail.com'),
(NULL,1,'danielscioli@gmail.com'),
(NULL,2,'mauricioMacri@gmail.com'),
(NULL,9,'marceloTinelli@gmail.com');

INSERT INTO telefono_empleado VALUES
(NULL,11,25533708),
(NULL,4,46620532),
(NULL,4,46304555),
(NULL,2,29304532),
(NULL,1,28307732),
(NULL,5,1159993737),
(NULL,9,53052043),
(NULL,6,45314333),
(NULL,8,26364562);

INSERT INTO empleado_jugador VALUES
(NULL,1,3,'Operacion de rodilla','2:04:37'),
(NULL,4,5,'Practica de jugador','01:25:32'),
(NULL,2,8,'Practica de arquero','00:40:12'),
(NULL,5,2,'Ejercicio fisicos','00:27:45');

INSERT INTO entrenamiento_jugador VALUES
(NULL,1,3,6.2,'1:03:55',2),
(NULL,4,7,9.99,'00:25:31',1),
(NULL,2,2,2.87,'0:38:42',4),
(NULL,5,1,7.5,'2:20:04',7),
(NULL,4,7,4.8,'00:22:07',6),
(NULL,2,2,8.30,'00:43:12',8),
(NULL,5,1,9.5,'00:31:32',9);

INSERT INTO partido_jugador VALUES
(NULL,2,3,1,11,5),
(NULL,1,5,0,2,5),
(NULL,4,2,1,5,6),
(NULL,3,7,1,7,3),
(NULL,3,6,1,6,11),
(NULL,2,1,1,4,9),
(NULL,1,9,0,7,10),
(NULL,5,7,1,3,3),
(NULL,7,6,1,1,1),
(NULL,8,2,1,2,2);
