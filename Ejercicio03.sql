CREATE DATABASE videoclub;
USE videoclub;

CREATE TABLE director(
    DNI VARCHAR(9),
    nombre VARCHAR(50),
    nacionalidad VARCHAR(50),
    CONSTRAINT PK_director PRIMARY KEY (DNI),
    CONSTRAINT UQ_director_nombre UNIQUE (nombre)
);

CREATE TABLE pelicula(
    titulo VARCHAR(100),
    nacionalidad VARCHAR(50),
    productora VARCHAR(50),
    fecha DATE,
    director VARCHAR(50),
    CONSTRAINT PK_pelicula PRIMARY KEY (titulo),
    CONSTRAINT FK_pelicula_director FOREIGN KEY (director)
        REFERENCES director(nombre)
);

CREATE TABLE actor(
    nombre VARCHAR(50),
    nacionalidad VARCHAR(50),
    sexo VARCHAR(1),
    CONSTRAINT PK_actor PRIMARY KEY (nombre)
);

CREATE TABLE ejemplares(
    titulo VARCHAR(100),
    numero_ejemplar INT,
    estado VARCHAR(20),
    CONSTRAINT PK_ejemplar PRIMARY KEY (titulo, numero_ejemplar),
    CONSTRAINT FK_ejemplar_pelicula FOREIGN KEY (titulo)
        REFERENCES pelicula(titulo)
);

CREATE TABLE socio(
    DNI VARCHAR(9),
    nombre VARCHAR(50),
    telefono VARCHAR(15),
    direccion VARCHAR(100),
    aval VARCHAR(9),
    fechanac DATE,
    CONSTRAINT PK_socio PRIMARY KEY (DNI),
    CONSTRAINT FK_socio_aval FOREIGN KEY (aval)
        REFERENCES socio(DNI)
);

CREATE TABLE alquiler(
    titulo VARCHAR(100),
    numero_ejemplar INT,
    socio VARCHAR(9),
    fecha_prestamo DATE,
    fecha_devolucion DATE,
    importe DECIMAL(6,2) NOT NULL,
    CONSTRAINT PK_alquiler PRIMARY KEY (titulo, numero_ejemplar, socio),
    CONSTRAINT FK_alquiler_ejemplar FOREIGN KEY (titulo, numero_ejemplar)
        REFERENCES ejemplares(titulo, numero_ejemplar),
    CONSTRAINT FK_alquiler_socio FOREIGN KEY (socio)
        REFERENCES socio(DNI),
    CONSTRAINT CK_fechas CHECK (fecha_devolucion >= fecha_prestamo)
);

CREATE TABLE pelicula_actor(
    titulo VARCHAR(100),
    actor VARCHAR(50),
    participacion VARCHAR(20),
    CONSTRAINT PK_pelicula_actor PRIMARY KEY (titulo, actor),
    CONSTRAINT FK_pa_pelicula FOREIGN KEY (titulo)
        REFERENCES pelicula(titulo),
    CONSTRAINT FK_pa_actor FOREIGN KEY (actor)
        REFERENCES actor(nombre)
);

ALTER TABLE pelicula ADD DineroGenerado DECIMAL(10,2) NOT NULL;
