23	SELECT nombre, stockAlquiler+stockVenta AS 'stock' FROM juegos ORDER BY stockAlquiler+stockVenta DESC LIMIT 1;
24	SELECT nombre, precioAlquiler, IF(precioAlquiler<=>NULL,0,precioAlquiler*3) AS 'alquiler' FROM juegos;
25	SELECT nombre, precioVenta,stockVenta,precioVenta*stockVenta AS 'venta' FROM juegos ORDER BY venta DESC LIMIT 1;
26	SELECT precioAlquiler,precioAlquiler*166 AS 'pesetasAlquiler',precioVenta,precioVenta*166 AS 'pesetasVenta' FROM juegos;
27	SELECT '10' = 10.0; -- Devuelve 1 porque lo que hace es comparar el String '10' con el número 10 y estos son iguales.
	SELECT '10' = '1.0'; -- Devuelve 0 porque lo que hace es comparar el String '10' con el String '1.0' y estos no son iguales.
	SELECT NULL IS NULL; -- Devuelve 1 porque lo que haces es comprobar si Null es igual a Null y estos lo son.
	SELECT 1.2 BETWEEN 1 and 2; -- Devuelve 1 porque lo que hace es comprobar si 1.2 está entre 1 y 2. Y si lo está.
	SELECT 3,5 BETWEEN 2 and 3; -- Devuelve 3 y 0 porque como tiene esa coma lo que hace es seleccionar por un lado el 3 y por el otro comprobar si 5 está entre 2 y 3 y como no lo esta devuelve 0. 
	SELECT 3 BETWEEN 4 and 3; -- Devuelve 0 porque lo que hace es comprobar si 3 está entre 4 y 3 y como el between está al reves devuelve 0. En los between siempre tiene que ir primero el valor más pequeño y a continuación el más grande.
	SELECT 'abc' < 'b'; -- Devuelve 1 porque comprueba si 'abc' es menor que 'b' pero en 'abc' va letra por letra y comprueba si 'a' es menor a 'b' y si lo es.
	SELECT 'cde' <= 'c'; -- Devuelve 0 porque comprueba si 'cde' es menor o igual que 'c' y va letra por letra comprueba si 'c' es menor o igual que 'c' y si lo es pero a continuación comprueba si 'd' es menor o igual que vacio y no lo es. Por eso da 0.
	SELECT 'a' IN ('b' , 'c' ,'a'); -- Devuelve 1 porque comprueba si 'a' es igual a 'b' o a 'c' o a 'a' y si lo es ya que 'a' es igual a 'a'.
	SELECT 'abcd' LIKE 'a___'; -- Devuelve 1 porque compara si 'abcd' es igual a un string que comienza por 'a' y a continuación tiene 3 caracteres simples cualquiera y si lo son por lo tanto da 1.
	SELECT 1 /*SUMAMOS */+ 2; -- Devuelve 3 porque es una suma de 1+2 y el comentario solo incluye "SUMAMOS " y por lo tanto no afecta a la suma.
	SELECT 1 /*RESTAMOS - */ 2; -- Devuelve Error porque el comentario incluye "RESTAMOS - " y por lo tanto no hace la resta correctamente y la consulta está mal.
	SELECT 'abcd' LIKE 'a__'; -- Devuelve 0 porque comprueba si 'abcd' es igual a un string que comienza por 'a' y a contiuación tiene 2 caracteres simples cualquiera y como 'abcd' cumple lo de que comience por 'a' y a continuación tiene 3 caracteres no lo cumple ya que tiene un caracter simple mas.
28	SELECT nombre,stockVenta FROM juegos WHERE stockVenta NOT BETWEEN 8 AND 15;
29	SELECT @stock:=stockAlquiler AS 'stock' FROM juegos WHERE id=6;
30	SELECT * FROM juegos WHERE stockAlquiler>@stock;
31	SELECT nombre FROM juegos WHERE precioAlquiler IS NOT NULL;
32	SELECT nombre,IFNULL(stockAlquiler,0)+IFNULL(stockVenta,0) AS stockTotal FROM juegos;
33	SELECT nombre,@suma:=IFNULL(stockAlquiler,0)+IFNULL(stockVenta,0) AS suma,if(@suma>=10,'Suficiente','No suficiente') AS suficiente FROM juegos;
34	SELECT nombre, IF(stockAlquiler,stockAlquiler,'No queda stock') AS mensaje FROM juegos;
35	SELECT nombre,@stock:=IFNULL(stockAlquiler,0)+IFNULL(stockVenta,0) AS stock,if(@stock>=10,'Suficiente','No suficiente') AS suficiente FROM juegos ORDER BY stock desc limit 5;
36	SELECT nombre,plataforma,case plataforma when 'PC' then 'Varios' when 'XBOX' then 'Microsoft' else 'Sony' END AS 'fabricante' FROM juegos;
37	SELECT nombre,case plataforma when 'PC' then 'Ordenador' when 'PSP' then 'Consola Portatil' else 'Consola' END AS 'tipo' FROM juegos; SELECT nombre,case when plataforma='PC' then 'Ordenador' when plataforma='PSP' then 'Consola Portatil' else 'Consola' END AS 'tipo' FROM juegos;
38	SELECT nombre, (IFNULL(stockAlquiler,1)*IFNULL(precioAlquiler,1))+(IFNULL(stockVenta,1)*IFNULL(precioVenta,1)) AS beneficios, CASE WHEN (IFNULL(precioVenta,1)*IFNULL(stockVenta, 1))+(IFNULL(precioAlquiler,1)*IFNULL(stockAlquiler, 1))>300 THEN 'rentable' WHEN (IFNULL(precioVenta,1)*IFNULL(stockVenta, 1))+(IFNULL(precioAlquiler,1)*IFNULL(stockVenta, 1)) BETWEEN 100 AND 300 THEN 'rentabilidad media' ELSE 'rentabilidad baja' END AS estimación FROM juegos;
