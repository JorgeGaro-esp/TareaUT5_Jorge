CREATE DATABASE ventas;
USE ventas;

CREATE TABLE comercial(
    id INT(10),
    nombre VARCHAR(100),
    apellido1 VARCHAR(100),
    apellido2 VARCHAR(100),
    ciudad VARCHAR(100),
    comision FLOAT,
    CONSTRAINT PK_comercial PRIMARY KEY (id)
);

CREATE TABLE cliente(
    id INT(10),
    nombre VARCHAR(25),
    primer_apellido VARCHAR(15),
    ciudad VARCHAR(100),
    categoria INT(10),
    id_comercial INT(10),
    CONSTRAINT PK_cliente PRIMARY KEY (id),
    CONSTRAINT FK_cliente_comercial FOREIGN KEY (id_comercial)
        REFERENCES comercial(id)
);

-- Cambiar encoding de la base de datos
ALTER DATABASE ventas CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Modificar columna nombre de cliente
ALTER TABLE cliente MODIFY nombre VARCHAR(100) NOT NULL;

-- Comprobar cambios
DESCRIBE cliente;

-- Renombrar primer_apellido → apellido1
ALTER TABLE cliente CHANGE primer_apellido apellido1 VARCHAR(100) NOT NULL;

-- Añadir apellido2 entre apellido1 y ciudad
ALTER TABLE cliente ADD apellido2 VARCHAR(100) AFTER apellido1;

-- Eliminar columna categoria
ALTER TABLE cliente DROP COLUMN categoria;

-- Valor por defecto en comision
ALTER TABLE comercial MODIFY comision FLOAT DEFAULT 10;
