DEFINICION COLUMNAS
1	CREATE DATABASE IF NOT EXISTS BD2 CHARACTER SET latin1;
2	CREATE DATABASE IF NOT EXISTS BD3 CHARACTER SET UTF8;
4	CREATE TABLE bd3.juegosNuevos like bd2.juegos;
5	RENAME TABLE juegosNuevos TO NovosXogos;
6	RENAME TABLE bd3.novosxogos TO bd2.novosxogos;
7	DROP DATABASE bd3;
17	SHOW INDEX FROM socios;
18	SHOW COLUMNS FROM socios;
19	SHOW CREATE TABLE socios;
20	ALTER TABLE ventas ADD nueva INT;
21	ALTER TABLE ventas ADD (nueva2 INT, nueva3 INT);
22	ALTER TABLE ventas CHANGE nueva2 nova2 VARCHAR(10), CHANGE nueva3 nova3 VARCHAR(10);
23	ALTER TABLE ventas MODIFY nova2 INT;
24	ALTER TABLE ventas DROP nova3;
25	ALTER TABLE socios DROP INDEX DNI;
26	ALTER TABLE socios DROP INDEX Apellidos;
27	ALTER TABLE socios MODIFY Númerosocio INT; -- No pasa nada porque como ya era un int no hay problema.
28	ALTER TABLE alquileres DROP PRIMARY KEY; -- No se puede porque es una clave autoincrementada y se solucionaria redefiniendo las columnas con un modify o un change.
29	ALTER TABLE alquileres ADD PRIMARY KEY (IDalquiler);
30	CREATE INDEX DNI ON socios (DNI);
31	CREATE INDEX indiceSocio ON socios (nombre);
32	ALTER TABLE socios DROP INDEX indiceSocio;
33	ALTER TABLE socios ADD INDEX nombrecompleto(Nombre,Apellidos);
34	ALTER TABLE socios DROP INDEX nombrecompleto;
35	ALTER TABLE ventas DROP FOREIGN KEY ventas_ibfk_1, DROP FOREIGN KEY ventas_ibfk_2;
36	ALTER TABLE ventas ADD FOREIGN KEY ventas_ibfk_1(NumSocio) REFERENCES socios(Númerosocio) ON UPDATE CASCADE ON DELETE CASCADE, ADD FOREIGN KEY ventas_ibfk_2(Juego) REFERENCES juegos(IDJuego) ON UPDATE CASCADE ON DELETE NO ACTION;
37	ALTER TABLE ventas ENGINE=MYISAM;

