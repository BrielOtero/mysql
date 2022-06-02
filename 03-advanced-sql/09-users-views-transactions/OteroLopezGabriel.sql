1
2	CREATE USER	user1@localhost IDENTIFIED BY 'pass';
3	-- Solo me puedo conectar a information_schema. Solo veo esa porque el usuario no tiene los permisos para ver las otras.
4	GRANT SELECT ON tema6.empleados TO user1@localhost;
	-- Da error porque no puedes otorgarte privilegios a ti mismo. Es decir, desde el usuario user1 no puedes dar privilegios a user1;
	-- Para solucionarlo lo que hay que hacer es ejecutar la consulta desde un usuario con permisos de root;
5	-- Podemos ver la tabla emple.
6	-- No se puede acceder a depart porque el user1 no tiene acceso a la tabla depart, solo a emple;
7	SET PASSWORD FOR user1@localhost = PASSWORD('password');
8	GRANT SELECT(nombre,loc) ON tema6.depart TO user1@localhost WITH GRANT OPTION;
9	-- No puedes hacer el Select * porque no tienes acceso a todas las columnas. A los que tengo acceso si los puedo ver.
10	CREATE USER IF NOT EXISTS user2@localhost IDENTIFIED BY 'pass2',user3@192.168.1.144 IDENTIFIED BY 'pass3';
11	GRANT ALL ON tema6.* TO user2@localhost;
	GRANT SELECT,INSERT ON tema6.depart TO user3@192.168.1.144;
12	SHOW GRANTS	FOR CURRENT_USER;
	SHOW GRANTS FOR usuario2@localhost;
	SHOW GRANTS	FOR usuario3@192.168.1.144;
13	-- No se puede porque no tenémos permisos de inserción;
14	-- No se puede porque no tenémos permisos de inserción;
15	-- Sucede que en la tabla depart si podemos insertar datos ya que tenemos permisos de consulta e inserción pero en emple no podemos porque no tenémos permisos de inserción para insertarla.
16	-- Son iguales
17	CREATE OR REPLACE VIEW vista AS SELECT * FROM empleados NATURAL JOIN depart;
	GRANT SELECT ON vista TO usuario3@192.168.1.144;
	-- Si se pueden consultar.
18	RENAME USER user2@localhost TO usuario2@localhost, user3@192.168.1.144 TO usuario3@192.168.1.144; 
19	REVOKE SELECT ON vista FROM usuario3@192.168.1.144;
20	DROP USER IF EXISTS usuario3@192.168.1.144;
	SELECT user, host FROM mysql.user;
21	RENAME USER usuario2@localhost TO usuario2@'%';
22	GRANT DELETE, CREATE ON tema6.* TO usuario2@'%';
23	GRANT UPDATE(jefe), INSERT(comision) ON tema6.empleados TO usuario2;
24	INSERT INTO tema6.empleados(comision) VALUES (666666);
25	UPDATE tema6.empleados SET jefe=2 WHERE jefe=1;
26	CREATE USER invitado@'example.com';
-- Preguntarle a Javi
27	GRANT USAGE ON *.* TO user1@localhost WITH MAX_USER_CONNECTIONS 2;
28	GRANT USAGE ON *.* TO user1@localhost WITH MAX_QUERIES_PER_HOUR 10;
29	DROP USER user1@localhost, usuario2@'%';
30	FLUSH PRIVILEGES; 
31	CREATE OR REPLACE VIEW ed AS SELECT * FROM empleados NATURAL JOIN depart;
32	SELECT apellido, oficio, nombre FROM ed;
33	CREATE OR REPLACE VIEW ed AS SELECT apellido AS 'nombre',oficio, nombre AS 'departamento' FROM empleados NATURAL JOIN depart;
34	CREATE OR REPLACE VIEW ed2 AS SELECT nombre, departamento FROM ed;
35	DROP VIEW ed;
36	-- Sucede que ed2 ya no funciona porque la tabla a la que esta vista hacía referencia ya no existe (ed) y por lo tando ed2 no puede funcionar.
37
38
39	CREATE OR REPLACE VIEW notas_asig_alu AS SELECT notas.*,alumnos.*,asignaturas.NOMBRE AS nome FROM notas JOIN alumnos ON codigo=alumno JOIN asignaturas ON cod=asignatura;
40
41
42	SHOW CREATE VIEW notas_asig_alu;
43	CREATE OR REPLACE VIEW notasalu AS SELECT nombre,asignatura AS 'materia', nota AS'calificación' FROM notas_asig_alu WHERE nota>=5;
44
45	ALTER VIEW notasalu AS SELECT nombre,asignatura AS 'materia', nota AS'calificación',apellidos FROM notas_asig_alu WHERE nota>=5;
46
47	CREATE OR REPLACE VIEW salarios AS SELECT apellido,loc,salario,comision FROM empleados NATURAL JOIN depart WHERE salario>1200 AND (comision<=100 OR comision IS null);
48
49	CREATE OR REPLACE VIEW empleados AS	SELECT depart.* FROM empleados NATURAL JOIN depart; -- No se puede hacer porque empleados no es una vista. Es una tabla.
50
51
52
53	CREATE OR REPLACE VIEW led AS SELECT * FROM empleados NATURAL RIGHT JOIN depart;
54	INSERT INTO depart VALUES(99,'desarrollo','Lugo');
55	-- Que ahora aparece el departamento insertado en el ejercicio anterior. Es decir, aparece el departamento de desarrollo.
