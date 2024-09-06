CREATE DATABASE LABORATORIO;
USE LABORATORIO;

CREATE TABLE FACTURAS (
LETRA CHAR,
NUMERO INT,
 CLIENTEID INT,
 ARTICULOID INT,
 FECHA DATE,
 MONTO DOUBLE,
 PRIMARY KEY(LETRA, NUMERO)
);

CREATE TABLE ARTICULOS (
ARTICULOID INT PRIMARY KEY,
 NOMBRE VARCHAR(50),
 PRECIO DOUBLE,
 STOCK INT);
 
 CREATE TABLE CLIENTES (
CLIENTEID INT PRIMARY KEY,
 NOMBRE VARCHAR(25),
 APELLIDO VARCHAR(25),
 CUIT CHAR(16),
 DIRECCION VARCHAR(50),
 COMENTARIOS VARCHAR(50)
);

SHOW DATABASES;

# SHOW TABLES;

DESCRIBE clientes;

ALTER TABLE FACTURAS
CHANGE CLIENTEID IDCLIENTE INT,
CHANGE ARTICULOID IDARTICULO INT,
MODIFY MONTO DOUBLE UNSIGNED;

ALTER TABLE ARTICULOS
CHANGE ARTICULOID IDARTICULO INT,
MODIFY NOMBRE VARCHAR(75),
MODIFY PRECIO DOUBLE UNSIGNED NOT NULL,
MODIFY STOCK INT UNSIGNED NOT NULL;

ALTER TABLE CLIENTES
CHANGE CLIENTEID IDCLIENTE INT,
MODIFY NOMBRE VARCHAR(30) NOT NULL,
MODIFY APELLIDO VARCHAR(35) NOT NULL,
CHANGE COMENTARIOS OBSERVACIONES VARCHAR(255);

INSERT INTO FACTURAS
VALUES ('A', 28, 14, 335, '2021-03-18', 1589.50),
       ('A', 39, 26, 157, '2021-04-12', 979.75),
       ('B', 8, 17, 95, '2021-04-25', 513.35),
       ('B', 12, 5, 411, '2021-05-03', 2385.70),
	   ('B', 19, 50, 157, '2021-05-26', 979.75);
       
INSERT INTO ARTICULOS
VALUES (95, 'Webcam con Micrófono Plug & Play', 513.35, 39),
       (157, 'Apple AirPods Pro', 979.75, 152),
       (335, 'Lavasecarropas Automático Samsung', 1589.50, 12),
       (411, 'Gloria Trevi / Gloria / CD+DVD', 2385.70, 2);       
       
INSERT INTO CLIENTES
VALUES (5, 'Santiago', 'González', '23-24582359-9', 'Uriburu 558 - 7ºA', 'VIP'),
       (14, 'Gloria', 'Fernández', '23-35965852-5', 'Constitución 323', 'GBA'),
       (17, 'Gonzalo', 'López', '23-33587416-0', 'Arias 2624', 'GBA'),
       (26, 'Carlos', 'García', '23-42321230-9', 'Pasteur 322 - 2ºC', 'VIP'),
       (50, 'Micaela', 'Altieri', '23-22885566-5', 'Santamarina 1255', 'GBA');       
       
ALTER TABLE CLIENTES_NEPTUNO
MODIFY IDCLIENTE VARCHAR(5) PRIMARY KEY,
MODIFY NOMBRECOMPANIA VARCHAR(100) NOT NULL,
MODIFY PAIS VARCHAR(15) NOT NULL;

RENAME TABLE CLIENTES  TO CONTACTOS;

ALTER TABLE clientes
MODIFY COD_CLIENTE VARCHAR(7) PRIMARY KEY,
MODIFY EMPRESA VARCHAR(100) NOT NULL,
MODIFY CIUDAD VARCHAR(25) NOT NULL,
MODIFY RESPONSABLE VARCHAR(30);

ALTER TABLE PEDIDOS
MODIFY NUMERO_PEDIDO INT UNSIGNED PRIMARY KEY,
MODIFY CODIGO_CLIENTE VARCHAR(7) NOT NULL,
MODIFY FECHA_PEDIDO DATE NOT NULL,
MODIFY FORMA_PAGO ENUM('CONTADO', 'APLAZADO', 'TARJETA'),
MODIFY ENVIADO ENUM ('SI', 'NO');

ALTER TABLE PRODUCTOS
MODIFY COD_PRODUCTO INT UNSIGNED PRIMARY KEY,
MODIFY SECCION VARCHAR(20) NOT NULL,
MODIFY NOMBRE VARCHAR(40) NOT NULL,
MODIFY IMPORTADO ENUM('VERDADERO', 'FALSO') NOT NULL,
MODIFY ORIGEN VARCHAR(25) NOT NULL,
MODIFY DIA INT UNSIGNED NOT NULL,
MODIFY MES INT UNSIGNED NOT NULL,
MODIFY ANO INT UNSIGNED NOT NULL;

USE LABORATORIO;

CREATE TABLE `nacimientos`(
  `SEXO`text,
  `FECHA` date,
  `TIPO_PARTO` text,
  `ATENC_PART` text,
  `LOCAL_PART` text,
  `SEMANAS` int(11) DEFAULT NULL,
  `PESO` int(11) DEFAULT NULL,
  `TALLA` int(11) DEFAULT NULL,
  `EDAD_PADRE` int(11) DEFAULT NULL,
  `NIVEL_PADRE` text,
  `OCUPA_P` text,
  `EDAD_MADRE` int(11) DEFAULT NULL,
  `ESTADO_CIVIL_MADRE` text,
  `COMUNA` int(11) DEFAULT NULL,
  `URBA_RURAL` text,
  `HIJOS_VIVOS` int(11) DEFAULT NULL,
  `HIJOS_FALLECIDOS` int(11) DEFAULT NULL,
  `HIJOS_TOTAL` int(11) DEFAULT NULL,
  `NACIONALIDAD` text,
  `ESTABLECIMIENTO` text
);

SELECT * FROM nacimientos;

CREATE TABLE `pedidos_neptuno` (
  `IdPedido` int(11) PRIMARY KEY,
  `NombreCompania` varchar(45) NOT NULL,
  `Empleado` varchar(15) NOT NULL,
  `FechaPedido` date DEFAULT NULL,
  `Transportista` varchar(20),
  `Cargo` double DEFAULT NULL
);

select * from nacimientos;

select * from clientes_neptuno;

select nombrecompania, ciudad, pais from clientes_neptuno;

SELECT NOMBRECOMPANIA, CIUDAD, PAIS FROM CLIENTES_NEPTUNO
ORDER BY PAIS;

SELECT NOMBRECOMPANIA, CIUDAD, PAIS FROM CLIENTES_NEPTUNO
ORDER BY PAIS, CIUDAD;

select NOMBRECOMPANIA, CIUDAD, PAIS FROM CLIENTES_NEPTUNO
ORDER BY PAIS, CIUDAD LIMIT 10;

select NOMBRECOMPANIA, CIUDAD, PAIS FROM CLIENTES_NEPTUNO
ORDER BY PAIS, CIUDAD LIMIT 5 OFFSET 10;

SELECT * FROM NACIMIENTOS WHERE NACIONALIDAD = 'EXTRANJERA';

SELECT * FROM NACIMIENTOS WHERE EDAD_MADRE < 18
ORDER BY EDAD_MADRE;

SELECT * FROM NACIMIENTOS WHERE EDAD_MADRE = EDAD_PADRE;

SELECT * FROM NACIMIENTOS WHERE EDAD_PADRE-EDAD_MADRE > 40;

SELECT * FROM CLIENTES_NEPTUNO WHERE PAIS = 'ARGENTINA';

SELECT * FROM NACIMIENTOS WHERE SEXO = 'FEMENINO' AND
NACIONALIDAD = 'EXTRANJERA' AND ESTADO_CIVIL_MADRE = 'SOLTERA'
AND EDAD_MADRE > 40;

SELECT IDCLIENTE, NOMBRECOMPANIA, CONCAT_WS
(DIRECCION, ' - ', CIUDAD, ' - ', PAIS) AS UBICACION
FROM CLIENTES_NEPTUNO; 

SELECT IDCLIENTE, UPPER(NOMBRECOMPANIA) AS EMPRESA,
CONCAT_WS(' - ', DIRECCION, CIUDAD, PAIS) AS UBICACION
FROM CLIENTES_NEPTUNO;

SELECT LOWER(IDCLIENTE) AS CODIGO, UPPER(NOMBRECOMPANIA) AS EMPRESA,
CONCAT_WS(' - ', DIRECCION, CIUDAD, PAIS) AS UBICACION
FROM CLIENTES_NEPTUNO;

SELECT FECHA, LEFT(SEXO, 1) AS SEXO, left(TIPO_PARTO, 1) AS TIPO
FROM NACIMIENTOS;

SELECT *, UPPER(CONCAT(LEFT(CIUDAD, 1), LEFT(PAIS, 1),
RIGHT(PAIS, 2))) AS CODIGO FROM CLIENTES_NEPTUNO;

SELECT *, LOWER(CONCAT(LEFT(CIUDAD, 1), LEFT(PAIS, 1),
RIGHT(PAIS, 2))) AS CODIGO FROM CLIENTES_NEPTUNO;

SELECT SEXO, FECHA, TIPO_PARTO, ATENC_PART, LOCAL_PART,
SUBSTRING(FECHA, 4, 2) AS MES
FROM NACIMIENTOS ORDER BY MES;

SELECT SEXO, FECHA, TIPO_PARTO,
REPLACE(NACIONALIDAD, 'chilena', 'ciudadana') AS NACIONALIDAD
FROM NACIMIENTOS;

SELECT *, ROUND(CARGO * 0.21) AS IVA
FROM PEDIDOS_NEPTUNO;

SELECT COUNT(*) FROM PEDIDOS_NEPTUNO;

SELECT COUNT(TRANSPORTISTA) AS  'ENTREGAS SPEEDY EXPRESS'
FROM PEDIDOS_NEPTUNO
WHERE TRANSPORTISTA = 'SPEEDY EXPRESS';

SELECT COUNT(EMPLEADO) AS VENTAS
FROM PEDIDOS_NEPTUNO
WHERE EMPLEADO LIKE 'C%';

CREATE TABLE VARONES
SELECT * FROM NACIMIENTOS WHERE SEXO = 'MASCULINO';

CREATE TABLE MUEJERES
SELECT * FROM NACIMIENTOS WHERE SEXO = 'FEMENINO';

CREATE TABLE INDETERMINADOS
SELECT * FROM NACIMIENTOS WHERE SEXO = 'INDETERMINADO';

DROP TABLE NACIMIENTOS;

SET SQL_SAFE_UPDATES = 0;
UPDATE CLIENTES_NEPTUNO
SET PAIS = 'USA' WHERE PAIS = 'ESTADOS UNIDOS';
SELECT * FROM CLIENTES_NEPTUNO;

UPDATE CLIENTES_NEPTUNO
SET NOMBRECOMPANIA = UPPER(NOMBRECOMPANIA);
SELECT * FROM CLIENTES_NEPTUNO;

UPDATE CLIENTES_NEPTUNO
SET CIUDAD = UPPER(CIUDAD), PAIS = UPPER(PAIS);
SELECT * FROM CLIENTES_NEPTUNO;

ALTER TABLE EMPLEADOS ADD NOMBRE_EMPLEADO VARCHAR(30) AFTER IDEMPLEADO;
UPDATE EMPLEADOS
SET NOMBRE_EMPLEADO = CONCAT(APELLIDOS , ', ', NOMBRE);
ALTER TABLE EMPLEADOS DROP APELLIDOS, DROP NOMBRE; 
SELECT * FROM EMPLEADOS;





