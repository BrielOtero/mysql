31	CREATE OR REPLACE VIEW ed AS SELECT * FROM empleados NATURAL JOIN depart;
32	SELECT apellido, oficio, nombre FROM ed;
33	CREATE OR REPLACE VIEW ed AS SELECT apellido AS 'nombre',oficio, nombre AS 'departamento' FROM empleados NATURAL JOIN depart;
34	CREATE OR REPLACE VIEW ed2 AS SELECT nombre, departamento FROM ed;
35	DROP VIEW ed;
36	SELECT * FROM ed2;-- Sucede que ed2 ya no funciona porque la tabla a la que esta vista hacía referencia ya no existe (ed) y por lo tando ed2 no puede funcionar.
42	SHOW CREATE VIEW notas_asig_alu;
43	CREATE OR REPLACE VIEW notasalu AS SELECT nombre,asignatura AS 'materia', nota AS'calificación' FROM notas_asig_alu WHERE nota>=5;
45	ALTER VIEW notasalu AS SELECT nombre,asignatura AS 'materia', nota AS'calificación',apellidos FROM notas_asig_alu WHERE nota>=5;
47	CREATE OR REPLACE VIEW salarios AS SELECT apellido,loc,salario,comision FROM empleados NATURAL JOIN depart WHERE salario>1200 AND (comision<=100 OR comision IS null);
49	CREATE OR REPLACE VIEW empleados AS	SELECT depart.* FROM empleados NATURAL JOIN depart; -- No se puede hacer porque empleados no es una vista. Es una tabla.
53	CREATE OR REPLACE VIEW led AS	SELECT * FROM empleados NATURAL RIGHT JOIN depart;
55	-- Que ahora aparece el departamento insertado en el ejercicio anterior. Es decir, aparece el departamento de desarrollo.
