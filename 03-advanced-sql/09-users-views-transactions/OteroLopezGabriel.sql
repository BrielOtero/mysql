1	SELECT USER,HOST FROM mysql.user;
2	CREATE USER	user1@localhost IDENTIFIED BY 'pass';
3	-- Solo me puedo conectar a information_schema. Solo veo esa porque el usuario no tiene los permisos para ver las otras.
4	GRANT SELECT ON tema6.empleados TO user1@localhost;
	-- Da error porque no puedes otorgarte privilegios a ti mismo. Es decir, desde el usuario user1 no puedes dar privilegios a user1;
	-- Para solucionarlo lo que hay que hacer es ejecutar la consulta desde un usuario con permisos de root; 
5	-- No se puede acceder a depart porque el user1 no tiene acceso a la tabla depart;
6
7
8
9
10
11
12
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
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72