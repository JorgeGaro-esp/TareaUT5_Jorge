CREATE DATABASE instituto;
USE instituto;

CREATE TABLE profesor(
    codigoPro INT PRIMARY KEY,
    nombrePro VARCHAR(50)
);

CREATE TABLE modulo(
    codigoMod INT PRIMARY KEY,
    nombreMod VARCHAR(50),
    codigoPro INT,
    CONSTRAINT FK_modulo_profesor FOREIGN KEY (codigoPro)
        REFERENCES profesor(codigoPro)
);

CREATE TABLE alumno(
    numeMatri INT PRIMARY KEY,
    nombreAlu VARCHAR(50)
);

CREATE TABLE matricula(
    numeMatri INT,
    codigoMod INT,
    nota DECIMAL(4,2),
    CONSTRAINT PK_matricula PRIMARY KEY (numeMatri, codigoMod),
    CONSTRAINT FK_matricula_alumno FOREIGN KEY (numeMatri)
        REFERENCES alumno(numeMatri),
    CONSTRAINT FK_matricula_modulo FOREIGN KEY (codigoMod)
        REFERENCES modulo(codigoMod)
);
