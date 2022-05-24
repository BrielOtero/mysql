2	CREATE USER	user1@localhost IDENTIFIED BY 'pass';
4	GRANT SELECT ON tema6.empleados TO user1@localhost;
	-- Da error porque no puedes otorgarte privilegios a ti mismo. Es decir, desde el usuario user1 no puedes dar privilegios a user1;
	-- Para solucionarlo lo que hay que hacer es ejecutar la consulta desde un usuario con permisos de root;
7	SET PASSWORD FOR user1@localhost = PASSWORD('password');
8	GRANT SELECT(nombre,loc) ON tema6.depart TO user1@localhost WITH GRANT OPTION;
9	-- No puedes hacer el Select * porque no tienes acceso a todas las columnas. A los que tengo acceso si los puedo ver.
10	CREATE USER IF NOT EXISTS user2@localhost IDENTIFIED BY 'pass2',user3@192.168.1.144 IDENTIFIED BY 'pass3';
11
15
18
19
20
22
23
25
27
28
30
