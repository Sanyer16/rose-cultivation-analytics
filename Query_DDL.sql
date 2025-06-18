
use [bootcamp];

------> CREAR BASE DE DATOS <------

CREATE DATABASE bootcamp;

USE bootcamp;
SELECT table_name = t.name
FROM sys.tables t
INNER JOIN sys.schemas s ON t.schema_id = s.schema_id
WHERE s.name = 'dbo';

------> CREAR TABLAS <------

--TABLA Ciclo_Facturacion:
CREATE TABLE tb_Ciclo_Facturacion (
    id_ciclo_facturacion INT IDENTITY(1,1),
    fecha_inicio         DATE NOT NULL,
    fecha_fin            DATE NOT NULL
);

SELECT * FROM tb_Ciclo_Facturacion;

/*====================================================*/

--TABLA Poda:

CREATE TABLE tb_Poda (
    id_poda              INT IDENTITY(1,1),
    fecha_poda           DATE NOT NULL,
    id_operario          INT  NOT NULL,
	id_ciclo_facturacion INT  NOT NULL,
	id_ubicacion_cama    INT  NOT NULL
);

SELECT * FROM tb_Poda

/*====================================================*/

--TABLA Tallo_Podado:

CREATE TABLE tb_Tallo_Podado (
    id_tallo_podado INT IDENTITY(1,1),
    cantidad        INT  NOT NULL,
    id_poda         INT  NOT NULL
);

SELECT * FROM tb_Tallo_Podado;


/*====================================================*/

--TABLA Ubicacion_Cama:

CREATE TABLE tb_Ubicacion_Cama (
    id_ubicacion_cama INT IDENTITY(1,1),
    bloque            VARCHAR(50) NOT NULL,
    numero_cama       INT  NOT NULL
);

SELECT * FROM tb_Ubicacion_Cama;

/*====================================================*/

--TABLA Operario:

CREATE TABLE tb_Operario (
    id_operario      INT IDENTITY(1,1),
    numero_documento VARCHAR(50) NOT NULL,
    nombres          VARCHAR(50) NOT NULL,
	apellidos        VARCHAR(50) NOT NULL
);

SELECT * FROM tb_Operario;

/*====================================================*//*====================================================*/

-------------------------> ADICIONAR LLAVE PRIMARIA A CADA TABLA <-------------------------
--LLAVES PRIMARIAS:

ALTER TABLE tb_Ciclo_Facturacion
ADD CONSTRAINT PK_tb_Ciclo_Facturacion PRIMARY KEY (id_ciclo_facturacion);

ALTER TABLE tb_Poda
ADD CONSTRAINT PK_tb_Poda PRIMARY KEY (id_poda);

ALTER TABLE tb_Tallo_Podado
ADD CONSTRAINT PK_tb_Tallo_Podado PRIMARY KEY (id_tallo_podado);

ALTER TABLE tb_Ubicacion_Cama
ADD CONSTRAINT PK_tb_Ubicacion_Cama PRIMARY KEY (id_ubicacion_cama);

ALTER TABLE tb_Operario
ADD CONSTRAINT PK_tb_Operario PRIMARY KEY (id_operario);

--LLAVES FORANEAS:

ALTER TABLE tb_Tallo_Podado
ADD CONSTRAINT FK_tb_Tallo_Podado_tb_Poda
FOREIGN KEY (id_poda) 
REFERENCES tb_Poda(id_poda);

ALTER TABLE tb_Poda
ADD CONSTRAINT FK_tb_Poda_tb_Operario
FOREIGN KEY (id_operario) 
REFERENCES tb_Operario(id_operario);

ALTER TABLE tb_Poda
ADD CONSTRAINT FK_tb_Poda_tb_Ciclo_Facturacion
FOREIGN KEY (id_ciclo_facturacion) 
REFERENCES tb_Ciclo_Facturacion(id_ciclo_facturacion);

ALTER TABLE tb_Poda
ADD CONSTRAINT FK_tb_Poda_tb_Ubicacion_Cama
FOREIGN KEY (id_ubicacion_cama) 
REFERENCES tb_Ubicacion_Cama(id_ubicacion_cama);

/*====================================================*//*====================================================*/
/*====================================================*//*====================================================*/

--INSERT INTO tb_Operario:

INSERT INTO tb_Operario (numero_documento, nombres, apellidos) VALUES ('123456789', 'Juan', 'Pérez');
INSERT INTO tb_Operario (numero_documento, nombres, apellidos) VALUES ('987654321', 'María', 'Gómez');
INSERT INTO tb_Operario (numero_documento, nombres, apellidos) VALUES ('456789012', 'Carlos', 'Rodríguez');
INSERT INTO tb_Operario (numero_documento, nombres, apellidos) VALUES ('654321098', 'Elena', 'Martínez');
INSERT INTO tb_Operario (numero_documento, nombres, apellidos) VALUES ('789012345', 'Luis', 'Sánchez');
INSERT INTO tb_Operario (numero_documento, nombres, apellidos) VALUES ('210987654', 'Sophie', 'Dubois');
INSERT INTO tb_Operario (numero_documento, nombres, apellidos) VALUES ('543210987', 'Pablo', 'García');
INSERT INTO tb_Operario (numero_documento, nombres, apellidos) VALUES ('876543210', 'Isabella', 'Moreno');
INSERT INTO tb_Operario (numero_documento, nombres, apellidos) VALUES ('109876543', 'Miguel', 'López');
INSERT INTO tb_Operario (numero_documento, nombres, apellidos) VALUES ('321098765', 'Olivia', 'Fernández');

SELECT * FROM tb_Operario;

SELECT COUNT(*) AS total_operarios FROM tb_Operario;
SELECT * FROM tb_Operario WHERE nombres = 'Juan';
SELECT * FROM tb_Operario ORDER BY apellidos ASC;
SELECT * FROM tb_Operario WHERE nombres LIKE 'M%' OR apellidos LIKE 'M%';
SELECT COUNT(*) AS total_operarios FROM tb_Operario WHERE LEFT(numero_documento, 1) = '1';

--INSERT INTO tb_Ciclo_Facturacion:

INSERT INTO tb_Ciclo_Facturacion (fecha_inicio, fecha_fin) VALUES ('2024-01-01 00:00:00', '2024-03-31 23:59:59');
INSERT INTO tb_Ciclo_Facturacion (fecha_inicio, fecha_fin) VALUES ('2024-04-01 00:00:00', '2024-06-30 23:59:59');
INSERT INTO tb_Ciclo_Facturacion (fecha_inicio, fecha_fin) VALUES ('2024-07-01 00:00:00', '2024-09-30 23:59:59');
INSERT INTO tb_Ciclo_Facturacion (fecha_inicio, fecha_fin) VALUES ('2024-10-01 00:00:00', '2024-12-31 23:59:59');
INSERT INTO tb_Ciclo_Facturacion (fecha_inicio, fecha_fin) VALUES ('2025-01-01 00:00:00', '2025-03-31 23:59:59');
INSERT INTO tb_Ciclo_Facturacion (fecha_inicio, fecha_fin) VALUES ('2025-04-01 00:00:00', '2025-06-30 23:59:59');
INSERT INTO tb_Ciclo_Facturacion (fecha_inicio, fecha_fin) VALUES ('2025-07-01 00:00:00', '2025-09-30 23:59:59');
INSERT INTO tb_Ciclo_Facturacion (fecha_inicio, fecha_fin) VALUES ('2025-10-01 00:00:00', '2025-12-31 23:59:59');
INSERT INTO tb_Ciclo_Facturacion (fecha_inicio, fecha_fin) VALUES ('2026-01-01 00:00:00', '2026-03-31 23:59:59');
INSERT INTO tb_Ciclo_Facturacion (fecha_inicio, fecha_fin) VALUES ('2026-04-01 00:00:00', '2026-06-30 23:59:59');

SELECT * FROM tb_Ciclo_Facturacion;
SELECT COUNT(*) AS total_ciclos_facturacion FROM tb_Ciclo_Facturacion;
SELECT * FROM tb_Ciclo_Facturacion WHERE YEAR(fecha_inicio) = 2024;

--INSERT INTO tb_Ubicacion_Cama:

INSERT INTO tb_Ubicacion_Cama (bloque, numero_cama) VALUES ('Bloque A', 1);
INSERT INTO tb_Ubicacion_Cama (bloque, numero_cama) VALUES ('Bloque B', 2);
INSERT INTO tb_Ubicacion_Cama (bloque, numero_cama) VALUES ('Bloque C', 3);
INSERT INTO tb_Ubicacion_Cama (bloque, numero_cama) VALUES ('Bloque A', 4);
INSERT INTO tb_Ubicacion_Cama (bloque, numero_cama) VALUES ('Bloque B', 5);
INSERT INTO tb_Ubicacion_Cama (bloque, numero_cama) VALUES ('Bloque C', 6);
INSERT INTO tb_Ubicacion_Cama (bloque, numero_cama) VALUES ('Bloque A', 7);
INSERT INTO tb_Ubicacion_Cama (bloque, numero_cama) VALUES ('Bloque B', 8);
INSERT INTO tb_Ubicacion_Cama (bloque, numero_cama) VALUES ('Bloque C', 9);
INSERT INTO tb_Ubicacion_Cama (bloque, numero_cama) VALUES ('Bloque A', 10);

SELECT * FROM tb_Ubicacion_Cama;
SELECT * FROM tb_Ubicacion_Cama WHERE bloque = 'Bloque A';
SELECT * FROM tb_Ubicacion_Cama WHERE numero_cama = 3;
SELECT COUNT(*) AS total_camas FROM tb_Ubicacion_Cama;
SELECT * FROM tb_Ubicacion_Cama ORDER BY bloque, numero_cama;

--INSERT INTO tb_Poda:

INSERT INTO tb_Poda (fecha_poda, id_operario, id_ciclo_facturacion, id_ubicacion_cama) VALUES ('2023-02-15 10:00:00', 1, 1, 1);
INSERT INTO tb_Poda (fecha_poda, id_operario, id_ciclo_facturacion, id_ubicacion_cama) VALUES ('2023-03-20 11:30:00', 3, 1, 3);
INSERT INTO tb_Poda (fecha_poda, id_operario, id_ciclo_facturacion, id_ubicacion_cama) VALUES ('2023-05-05 09:45:00', 5, 2, 5);
INSERT INTO tb_Poda (fecha_poda, id_operario, id_ciclo_facturacion, id_ubicacion_cama) VALUES ('2023-06-10 14:20:00', 7, 2, 7);
INSERT INTO tb_Poda (fecha_poda, id_operario, id_ciclo_facturacion, id_ubicacion_cama) VALUES ('2023-08-18 08:00:00', 9, 3, 9);
INSERT INTO tb_Poda (fecha_poda, id_operario, id_ciclo_facturacion, id_ubicacion_cama) VALUES ('2023-09-25 12:45:00', 2, 3, 2);
INSERT INTO tb_Poda (fecha_poda, id_operario, id_ciclo_facturacion, id_ubicacion_cama) VALUES ('2023-11-05 15:30:00', 4, 1, 4);
INSERT INTO tb_Poda (fecha_poda, id_operario, id_ciclo_facturacion, id_ubicacion_cama) VALUES ('2023-12-12 07:15:00', 6, 1, 6);
INSERT INTO tb_Poda (fecha_poda, id_operario, id_ciclo_facturacion, id_ubicacion_cama) VALUES ('2024-02-20 10:30:00', 8, 2, 8);
INSERT INTO tb_Poda (fecha_poda, id_operario, id_ciclo_facturacion, id_ubicacion_cama) VALUES ('2024-03-25 13:00:00', 10, 2, 10);

SELECT * FROM tb_Poda;
SELECT * FROM tb_Poda WHERE id_operario = 1;
SELECT * FROM tb_Poda WHERE id_ciclo_facturacion = 2;
SELECT COUNT(*) AS total_podas FROM tb_Poda;
SELECT * FROM tb_Poda WHERE fecha_poda BETWEEN '2023-03-01' AND '2023-04-01';
SELECT id_operario, COUNT(*) AS total_podas FROM tb_Poda GROUP BY id_operario;
SELECT * FROM tb_Poda WHERE id_operario = 1 AND id_ciclo_facturacion IN (1, 2);

--INSERT INTO tb_Tallo_Podado:

INSERT INTO tb_Tallo_Podado (cantidad, id_poda) VALUES (20, 5);
INSERT INTO tb_Tallo_Podado (cantidad, id_poda) VALUES (15, 2);
INSERT INTO tb_Tallo_Podado (cantidad, id_poda) VALUES (30, 8);
INSERT INTO tb_Tallo_Podado (cantidad, id_poda) VALUES (25, 3);
INSERT INTO tb_Tallo_Podado (cantidad, id_poda) VALUES (18, 7);
INSERT INTO tb_Tallo_Podado (cantidad, id_poda) VALUES (22, 1);
INSERT INTO tb_Tallo_Podado (cantidad, id_poda) VALUES (12, 9);
INSERT INTO tb_Tallo_Podado (cantidad, id_poda) VALUES (28, 4);
INSERT INTO tb_Tallo_Podado (cantidad, id_poda) VALUES (17, 6);
INSERT INTO tb_Tallo_Podado (cantidad, id_poda) VALUES (23, 10);
INSERT INTO tb_Tallo_Podado (cantidad, id_poda) VALUES (18, 3);
INSERT INTO tb_Tallo_Podado (cantidad, id_poda) VALUES (26, 8);
INSERT INTO tb_Tallo_Podado (cantidad, id_poda) VALUES (14, 1);
INSERT INTO tb_Tallo_Podado (cantidad, id_poda) VALUES (21, 5);
INSERT INTO tb_Tallo_Podado (cantidad, id_poda) VALUES (19, 2);

SELECT * FROM tb_Tallo_Podado;
SELECT SUM(cantidad) AS total_tallos_podados FROM tb_Tallo_Podado;
SELECT * FROM tb_Tallo_Podado WHERE cantidad = 20;
SELECT * FROM tb_Tallo_Podado WHERE cantidad > 25;
SELECT id_poda, SUM(cantidad) AS total_tallos_podados FROM tb_Tallo_Podado GROUP BY id_poda;
SELECT DISTINCT id_poda FROM tb_Tallo_Podado WHERE cantidad = 18;

SELECT op.nombres, op.apellidos, sum(po.cantidad) as 'Cantidad'
FROM [dbo].[tb_Poda] p
INNER JOIN [dbo].[tb_Tallo_Podado] po on p.id_poda      = po.id_poda
INNER JOIN [dbo].[tb_Operario] op     on op.id_operario = p.id_operario
where p.fecha_poda between '2023-08-01' and '2023-12-31'
group by op.id_operario, op.nombres, op.apellidos

SELECT * FROM [dbo].[tb_Tallo_Podado]

SELECT * FROM [dbo].[tb_Operario]