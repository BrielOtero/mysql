1	SELECT oficio, COUNT(oficio) AS 'num' FROM empleados GROUP BY oficio ORDER BY num DESC;
2	SELECT asignatura, COUNT(alumno) AS 'nº Total' FROM notas GROUP BY asignatura;
3	SELECT alumno, AVG(nota) AS 'media' FROM notas GROUP BY alumno;
4	SELECT oficio FROM empleados GROUP BY oficio HAVING COUNT(*)>2;
5	SELECT iddepart FROM empleados GROUP BY iddepart HAVING COUNT(*)>3;
6	SELECT alumno, AVG(nota) AS 'media' FROM notas GROUP BY alumno HAVING media>5.7 ORDER BY media;
7	SELECT oficio, SUM(salario) AS 'suma' FROM empleados GROUP BY oficio;
8	SELECT oficio,SUM(salario) AS suma FROM empleados GROUP BY oficio HAVING suma=(SELECT SUM(salario) AS suma FROM empleados GROUP BY oficio ORDER BY suma DESC LIMIT 1);
9	SELECT oficio,AVG(salario) AS media FROM empleados GROUP BY oficio HAVING media>2000;
10	SELECT iddepart, SUM(salario) AS suma, MAX(salario) AS maximo, MIN(salario) AS minimo FROM empleados GROUP BY iddepart;
11	SELECT iddepart, COUNT(oficio) AS numero FROM empleados WHERE oficio='empleado' GROUP BY iddepart;
12	SELECT oficio, iddepart, COUNT(codemp) AS numero, SUM(salario) AS suma FROM empleados GROUP BY oficio, iddepart;
13	SELECT iddepart, oficio, COUNT(codemp) AS numero FROM empleados GROUP BY oficio, iddepart HAVING numero>2;
14	SELECT iddepart, COUNT(DISTINCT oficio) AS numero FROM empleados GROUP BY iddepart;
15	SELECT codemp,salario from empleados WHERE iddepart=(select iddepart from depart where nombre='ventas');
16	SELECT codemp,apellido,salario from empleados WHERE salario>(select salario FROM empleados where codemp=6);
17	SELECT apellido,oficio from empleados WHERE oficio=(select oficio FROM empleados where apellido='Jimenez') AND apellido!='Jimenez';
18	SELECT apellido,salario from empleados WHERE oficio=(select oficio FROM empleados where apellido='Gil') AND salario=(select salario FROM empleados where apellido='Gil') AND apellido!='Gil';
19	SELECT apellido,oficio,salario,fecha_alt from empleados WHERE oficio=(SELECT oficio FROM empleados WHERE apellido='Jimenez') OR salario>= (SELECT salario FROM empleados WHERE apellido='Fernandez');
20	SELECT iddepart, COUNT(apellido) from empleados WHERE oficio='empleado' GROUP BY iddepart;
21	SELECT * FROM empleados WHERE salario>(SELECT AVG(salario) FROM empleados);
22	SELECT apellido,oficio,salario FROM empleados WHERE iddepart=(SELECT iddepart FROM empleados WHERE apellido='Fernandez') AND salario =(SELECT salario FROM empleados WHERE apellido='Fernandez') AND apellido!='Fernandez';
23	SELECT iddepart,AVG(salario) AS media FROM empleados GROUP BY iddepart HAVING media>=(SELECT AVG(salario) FROM	empleados); 
24	SELECT iddepart,COUNT(apellido) AS numero FROM empleados WHERE iddepart=(SELECT iddepart FROM depart WHERE nombre='ventas') AND oficio='vendedor';
25	SELECT apellido,comision FROM empleados WHERE comision>(SELECT comision FROM empleados WHERE codemp=3);
26	SELECT COUNT(apellido) FROM empleados WHERE oficio='director'AND iddepart=(SELECT iddepart FROM depart WHERE nombre='ventas');
27	SELECT iddepart,MIN(salario) AS salario FROM empleados GROUP BY iddepart HAVING iddepart!=(SELECT iddepart FROM depart WHERE loc='Madrid');
28	SELECT apellido,iddepart FROM empleados where iddepart=(SELECT iddepart FROM depart WHERE loc='Madrid') OR iddepart=(SELECT iddepart FROM depart WHERE loc='Barcelona') ORDER BY iddepart;
29	SELECT iddepart,nombre FROM depart WHERE iddepart NOT IN (SELECT iddepart FROM empleados);
30	SELECT apellido,oficio,comision FROM empleados WHERE iddepart NOT IN (SELECT iddepart FROM depart WHERE loc='Sevilla' OR loc='Madrid') AND comision IS null;
31	SELECT apellido,oficio FROM empleados WHERE iddepart=20 AND oficio IN (SELECT oficio FROM empleados WHERE iddepart=(SELECT iddepart FROM depart WHERE nombre='ventas'));
32	SELECT nombre FROM asignaturas WHERE cod IN (SELECT asignatura FROM notas WHERE nota>4);
33	SELECT oficio,MAX(salario) FROM empleados WHERE iddepart IN (SELECT IDDEPART FROM depart WHERE loc='Madrid' OR loc='Sevilla') GROUP BY oficio HAVING AVG(salario)<4000;
34	SELECT iddepart, nombre FROM depart WHERE iddepart IN (SELECT iddepart FROM empleados GROUP BY iddepart HAVING COUNT(*)>(SELECT COUNT(*) FROM empleados WHERE iddepart=20));
35	SELECT apellido,salario,iddepart FROM empleados WHERE (salario,iddepart) IN (SELECT MAX(salario),iddepart FROM empleados GROUP BY iddepart);
36	SELECT nombre, apellidos FROM alumnos WHERE codigo IN (SELECT alumno FROM notas WHERE nota=(SELECT nota FROM notas WHERE alumno=(SELECT codigo FROM alumnos WHERE nombre='frederik' AND apellidos='pohl') AND asignatura=(SELECT cod FROM asignaturas WHERE nombre='fol')));
37	SELECT * FROM empleados WHERE salario>ALL(SELECT salario FROM empleados WHERE iddepart=20);
38	SELECT * FROM empleados WHERE salario<ALL(SELECT salario FROM empleados WHERE iddepart=(SELECT iddepart FROM depart WHERE nombre='investigacion'));
39	SELECT * FROM empleados WHERE salario!=ANY(SELECT salario FROM empleados);
40	SELECT * FROM empleados AS emple WHERE salario<(SELECT AVG(salario) FROM empleados where iddepart=emple.iddepart);
41	
42	
43	
44	
45	
46	
47	
48	
49	