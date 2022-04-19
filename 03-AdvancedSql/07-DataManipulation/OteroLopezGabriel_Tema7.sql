1	INSERT INTO depart (iddepart,nombre,loc)VALUES('42','Desarrollo','Vigo');
2	UPDATE depart SET nombre='Enseñanza' WHERE nombre='Desarrollo';
3	UPDATE empleados set salario=(salario*0.10+salario) WHERE iddepart=10;
4	UPDATE empleados set salario=(salario-salario*0.05);
5	UPDATE empleados set salario=(salario+50) WHERE salario>1500;
6	INSERT INTO depart (Iddepart,nombre,loc)VALUES(50,'Calidad','Noia');
7	INSERT INTO empleados VALUES(DEFAULT,'Iglesias','Presidente',null,DATE(NOW()),6000,0,30);
8	UPDATE empleados SET iddepart=(SELECT iddepart FROM depart WHERE nombre='calidad')  WHERE iddepart=20;
9	UPDATE empleados SET iddepart=20 WHERE iddepart=50 && oficio!='Presidente';
10	DELETE FROM empleados WHERE codemp=15;
11	DELETE FROM empleados WHERE iddepart=20 && salario>20000;
12	--Truncate lo hace de manera más rápida y eficiente, ya que mientras que delete hace un borrado de la tabla fila a fila mientras que truncate borra la tabla y la vuelve a crear vacia, lo que es mucho más eficiente.
	DELETE FROM empleados;
	TRUNCATE TABLE empleados;
13	CREATE TABLE empleados2 LIKE empleados; INSERT INTO empleados2 SELECT * from empleados;
14	UPDATE empleados2 SET codemp=codemp+1000;
15	INSERT INTO empleados2 SELECT * FROM empleados WHERE empleados.CODEMP>8;
16	INSERT INTO depart (iddepart,nombre,loc)values(60,'Publicidad','Ourense'),(70,'Costes','Lugo');
17	REPLACE depart (iddepart,nombre,loc)VALUES(70,'Estudios de mercado','Pontevedra');-- Se pierde información en el nombre de departamento ya que el nuevo es demasiado largo porque nombre es un varchar de 13 caracteres como máximo y el nuevo nombre tiene más de 13 caracteres;
18	DELETE from empleados2 WHERE salario between 2000 and 3000;
19	UPDATE empleados2 SET jefe=5;
20	DELETE from empleados2 WHERE comision>0 AND comision IS NOT NULL;
21	
	INSERT INTO depart VALUES(DEFAULT,'Robotica','Ferrol');
	DELETE FROM empleados where oficio='Presidente';
	INSERT INTO empleados VALUES(DEFAULT,'Calvin','Presidente',null,DATE(NOW()),4100,NULL,(SELECT iddepart FROM depart WHERE nombre='Robotica'));
22	UPDATE depart  SET nombre=LOWER(nombre), loc=LOWER(loc) WHERE iddepart=40;
23	UPDATE depart  SET nombre=LOWER(nombre), loc=LOWER(loc) LIMIT 2;
24	UPDATE empleados2 SET comision = ifnull(comision, 0) +100 WHERE fecha_alt=(SELECT MIN(fecha_alt) FROM empleados2);
25	UPDATE empleados2 SET comision=IFNULL(comision,0)+40 WHERE fecha_alt <= (SELECT fecha_alt FROM empleados2 ORDER BY fecha_alt asc LIMIT 1,1);
26	DELETE FROM empleados2 WHERE fecha_alt >= (SELECT fecha_alt FROM empleados2 ORDER BY fecha_alt DESC LIMIT 1,1);
27	UPDATE empleados2 SET comision=IFNULL(comision,0);
28	UPDATE empleados2 SET oficio='oficinista' WHERE oficio='Empleado';
29	UPDATE empleados2 SET jefe=8 WHERE iddepart=(SELECT iddepart FROM depart WHERE loc='Sevilla') || iddepart=(SELECT iddepart FROM depart WHERE loc='Madrid');
30	UPDATE empleados2 SET salario=2000 WHERE iddepart=(SELECT iddepart FROM depart WHERE nombre='Ventas') AND salario<2000;
31	UPDATE empleados2 SET fecha_alt=DATE(NOW()), iddepart=(SELECT iddepart FROM depart WHERE nombre='Ventas') WHERE salario<2000;
32	UPDATE empleados SET oficio=LOWER(oficio) WHERE salario<(SELECT SUM(salario)/COUNT(*) FROM empleados);
33	ALTER TABLE empleados2 ADD tipo SET('A','B','C');
34	UPDATE empleados2 SET tipo=('A,C');
35	SELECT * FROM depart WHERE iddepart NOT IN (SELECT iddepart FROM empleados);
36	UPDATE empleados2 SET apellido = CONCAT(SUBSTRING(apellido, 1, LENGTH(apellido)-2), LOWER(RIGHT(apellido, 2)));
37	DELETE FROM empleados2 WHERE SUBSTRING(empleados2.jefe, LENGTH(empleados2.jefe))=9;
38	UPDATE empleados2 SET IDDEPART = 0 WHERE IDDEPART = (SELECT MAX(IDDEPART) FROM empleados2);
39	UPDATE empleados2 SET comision=IFNULL(comision,0)+(CASE WHEN oficio='empleado' THEN 50 WHEN oficio='vendedor' THEN 60 WHEN oficio='presidente' THEN 130 ELSE 70 END);
40	LOAD DATA LOCAL INFILE "C:/Ficheros/jugadores1.txt"
	INTO TABLE jugadores1
	LINES TERMINATED BY '\n'
	IGNORE 2 LINES
	(Nombre,Partidos,Minutos,Puntos,Rebotes,Tapones,Asistencias,Valoracion);
41	LOAD DATA LOCAL INFILE "C:/Ficheros/jugadores2.txt"
	INTO TABLE jugadores2
	FIELDS TERMINATED BY '#'
	ENCLOSED BY '\"'
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES
	(Nombre,Partidos,Minutos,Puntos,Rebotes,Tapones,Asistencias,Valoracion);
42	LOAD DATA LOCAL INFILE "C:/Ficheros/jugadores3.txt"
	INTO TABLE jugadores3
	LINES TERMINATED BY '\r\n'
	IGNORE 3 LINES
	(Partidos,Minutos,Puntos,Rebotes,Tapones,Asistencias,Valoracion,Nombre);
43	LOAD DATA LOCAL INFILE "C:/Ficheros/jugadores4.txt"
	INTO TABLE jugadores4
	FIELDS TERMINATED BY '|'
	LINES STARTING BY 'JUG	'
	TERMINATED BY '\n'
	IGNORE 1 LINES
	(Nombre,Partidos,Minutos,Puntos,Rebotes,Tapones,Asistencias,Valoracion);
44	SELECT * INTO OUTFILE "C:/Ficheros/jugadores1EXP.txt"
	LINES TERMINATED BY '\n'
	FROM jugadores1;
45	SELECT * INTO OUTFILE "C:/Ficheros/jugadores2EXP.txt"
	FIELDS TERMINATED BY '#'
	ENCLOSED BY '|'
	LINES TERMINATED BY '\n'
	FROM jugadores2;
46	SELECT * INTO OUTFILE "C:/Ficheros/jugadores3EXP.txt"
	FIELDS TERMINATED BY '|'
	LINES STARTING BY 'JUG	'
	TERMINATED BY '\n'
	FROM jugadores3;
47	SELECT Valoracion,Partidos,Minutos,Puntos,Rebotes,Tapones,Asistencias,NOMBRE INTO OUTFILE "C:/Ficheros/jugadores4EXP.txt"
	FIELDS TERMINATED BY '	'
	ENCLOSED BY '|'
	LINES TERMINATED BY '\n'
	FROM jugadores4;