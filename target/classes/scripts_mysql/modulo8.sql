******************************************************************************
						DDL INICIAL - UNA TABLA POR JERARQUIA
******************************************************************************

CREATE DATABASE IF NOT EXISTS curso_javase;

USE curso_javase;


CREATE TABLE IF NOT EXISTS compacto (
	id				INT NOT NULL AUTO_INCREMENT,
	numero 			VARCHAR(15) NOT NULL,
	activa 			BOOLEAN DEFAULT 1,
	color 			VARCHAR(50),	
	marca 			VARCHAR(100) NOT NULL,		
    encendido	    BOOLEAN DEFAULT 1,    

    puestos	 		INT NOT NULL,
	PRIMARY KEY(id)
);


CREATE TABLE IF NOT EXISTS camion (
	id				INT NOT NULL AUTO_INCREMENT,
	numero 			VARCHAR(15) NOT NULL,
	activa 			BOOLEAN DEFAULT 1,	
	color 			VARCHAR(50),	
	marca 			VARCHAR(100) NOT NULL,	
    encendido	    BOOLEAN DEFAULT 1, 

    licencia 		VARCHAR(10), 			
    tipo			VARCHAR(3), 

    ejes			INT,         			
    capacidad		DOUBLE,
	PRIMARY KEY(id)
);


CREATE TABLE IF NOT EXISTS pasajeros (	
	id				INT NOT NULL AUTO_INCREMENT,
	numero 			VARCHAR(15) NOT NULL,
	activa 			BOOLEAN DEFAULT 1,
	color 			VARCHAR(50),
	marca 			VARCHAR(100) NOT NULL,			
    encendido	    BOOLEAN DEFAULT 1, 

    licencia 		VARCHAR(10), 			
    tipo			VARCHAR(3), 

    accesoEspecial	BOOLEAN, 
	PRIMARY KEY(id)
);



******************************************************************************
			DDL INICIAL - UNA TABLA PARA REPRESENTAR TRANSPORTES
******************************************************************************


CREATE TABLE IF NOT EXISTS transporte (
	id				INT NOT NULL AUTO_INCREMENT,
	numero 			VARCHAR(15) NOT NULL,
	activa 			BOOLEAN DEFAULT 1,
	color 			VARCHAR(50),
	marca 			VARCHAR(100) NOT NULL,		
    encendido	    BOOLEAN DEFAULT 1,    

    licencia 		VARCHAR(10), 			-- ATRIBUTO DE TRANSPORTE
    tipo			VARCHAR(3),  			-- ATRIBUTO DE TRANSPORTE

    ejes			INT,         			-- ATRIBUTO DE CAMION
    capacidad		DOUBLE,      			-- ATRIBUTO DE CAMION

    accesoEspecial	BOOLEAN,     			-- ATRIBUTO DE PASAJEROS
    discriminador	CHAR(1) NOT NULL,		-- C(CAMION), P(PASAJEROS)

	PRIMARY KEY(id)
);



******************************************************************************
									INSERT
******************************************************************************


USE curso_javase;


INSERT INTO compacto (numero, activa, color, marca, encendido, puestos)
VALUES  ('ABC-001', 1, 'MARRON', 'Audi', 1, 2);


INSERT INTO compacto (numero, activa, color, marca, encendido, puestos)
VALUES  
('ABC-003', 1, 'AMARILLO', 'SEDAN', 1, 2),
('ABC-004', 0, 'AZUL', 'SEDAN', 0, 4),
('ABC-005', 0, 'ROJO', 'SEDAN', 1, 4),
('ABC-006', 1, 'VERDE', 'SEDAN', 0, 2);



******************************************************************************
									SELECT
******************************************************************************


USE curso_javase;


SELECT * FROM compacto;

SELECT numero, activa, color, marca, encendido, puestos FROM compacto;

SELECT * FROM compacto WHERE activa = 1;

SELECT numero, activa, color, marca, encendido, puestos FROM compacto
WHERE encendido = 1 AND puestos = 2;



******************************************************************************
									UPDATE
******************************************************************************

SET SQL_SAFE_UPDATES = 0;

USE curso_javase;


UPDATE compacto SET activa = 0;

UPDATE compacto SET activa = 1 WHERE activa = 0;

UPDATE compacto SET activa = 0, encendido = 0 WHERE activa = 1;



******************************************************************************
									DELETE
******************************************************************************


USE curso_javase;


DELETE FROM compacto WHERE activa <> 0;

DELETE FROM compacto;

