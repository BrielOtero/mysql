2	CREATE USER	user1@localhost IDENTIFIED BY 'pass';
4	GRANT SELECT ON tema6.empleados TO user1@localhost;
	-- Da error porque no puedes otorgarte privilegios a ti mismo. Es decir, desde el usuario user1 no puedes dar privilegios a user1;
	-- Para solucionarlo lo que hay que hacer es ejecutar la consulta desde un usuario con permisos de root;
7	SET PASSWORD FOR user1@localhost = PASSWORD('password');
8	GRANT SELECT(nombre,loc) ON tema6.depart TO user1@localhost WITH GRANT OPTION;
9	-- No puedes hacer el Select * porque no tienes acceso a todas las columnas. A los que tengo acceso si los puedo ver.
10	CREATE USER IF NOT EXISTS user2@localhost IDENTIFIED BY 'pass2',user3@192.168.1.144 IDENTIFIED BY 'pass3';
11	GRANT ALL ON tema6.* TO user2@localhost;
	GRANT SELECT,INSERT ON tema6.depart TO user3@192.168.1.144;
15	-- Sucede que en la tabla depart si podemos insertar datos ya que tenemos permisos de consulta e inserción pero en emple no podemos porque no tenémos permisos de inserción para insertarla.
18	RENAME USER user2@localhost TO usuario2@localhost, user3@192.168.1.144 TO usuario3@192.168.1.144; 
19	REVOKE SELECT ON vista FROM usuario3@192.168.1.144;
20	DROP USER IF EXISTS usuario3@192.168.1.144;
	SELECT USER, HOST FROM mysql.user;
22	GRANT DELETE, CREATE ON tema6.* TO usuario2@'%';
23	GRANT UPDATE(jefe), INSERT(comision) ON tema6.empleados TO usuario2;
25	UPDATE tema6.empleados SET jefe=2 WHERE jefe=1;
	-- Ha funcionado correctamente y dónde antes el jefe era 1 ahora es 2;
27	GRANT USAGE ON *.* TO user1@localhost WITH MAX_USER_CONNECTIONS 2;
28	GRANT USAGE ON *.* TO user1@localhost WITH MAX_QUERIES_PER_HOUR 10;
30	FLUSH PRIVILEGES;
