3
CREATE or REPLACE TABLE juegos(
	IDJuego INT AUTO_INCREMENT PRIMARY KEY,
	Nombre CHAR(40) NOT NULL UNIQUE KEY,
	Plataforma SET('PSP','Wii','Playstation','XBOX','Nintendo DS','PC') COMMENT 'Plataformas soportadas polo xogo',
	PrecioVenta DOUBLE(6,2) UNSIGNED,
	PrecioAlquiler FLOAT(6,2) UNSIGNED,
	StockVenta INT DEFAULT 10 NOT NULL,
	StockAlquiler INT(10) ZEROFILL,
	INDEX(PrecioVenta)
) ENGINE=INNODB CHARSET UTF8;

9
CREATE OR REPLACE TABLE socios(
	Númerosocio INT AUTO_INCREMENT PRIMARY KEY,
	Nombre VARCHAR(15) NOT NULL,
	Apellidos VARCHAR(35) NOT NULL,
	DNI VARCHAR(9) UNIQUE KEY COMMENT'EL DNI del socio',
	País VARCHAR(20),
	Sexo ENUM('H','M'),
	Observaciones TEXT,
	INDEX(Apellidos)
) ENGINE=INNODB CHARSET UTF8;

12
CREATE OR REPLACE TABLE alquileres(
	IDalquiler INT AUTO_INCREMENT PRIMARY KEY,
	NúmeroSocio INT NOT NULL COMMENT'Hace referencias a los socios de la tabla socios' ,
	Juego INT NOT NULL COMMENT'Es el código del juego',
	FechaAlquiler TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FechaDevolución DATETIME,
	FOREIGN KEY (NúmeroSocio) REFERENCES socios(Númerosocio)
		ON UPDATE CASCADE
		ON DELETE RESTRICT,
	FOREIGN KEY (Juego) REFERENCES juegos(IDJuego)
		ON UPDATE CASCADE
		ON DELETE RESTRICT
) ENGINE=INNODB CHARSET UTF8;
-- Las tablas MyISAM no soportan claves foráneas por lo tanto yo lo cambiaria a cascade para que funcione.

15
CREATE OR REPLACE TABLE ventas(
	IDventa INT AUTO_INCREMENT PRIMARY KEY,
	NumSocio INT NOT NULL COMMENT'Hace referencias a los socios de la tabla socios.',
	Juego INT NOT NULL COMMENT'Es el código del juego',
	FechaVenta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	Precio DECIMAL(2),
	FOREIGN KEY (NumSocio) REFERENCES socios(Númerosocio)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY (Juego) REFERENCES juegos(IDJuego)
		ON UPDATE CASCADE
		ON DELETE NO ACTION
) ENGINE=INNODB CHARSET UTF8;
-- No se puede poner set null porque son Not null y por lo tanto no se les puedes asignar null.