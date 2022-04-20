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
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40