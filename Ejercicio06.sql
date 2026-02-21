USE concesionario;

CREATE TABLE distribucion(
    cifconcesi VARCHAR(10),
    codcoche NUMERIC(5),
    cantidad NUMERIC(5)
);

ALTER TABLE distribucion
ADD CONSTRAINT PK_distribucion PRIMARY KEY (cifconcesi, codcoche);

ALTER TABLE distribucion
ADD CONSTRAINT FK_distribucion_concesionario FOREIGN KEY (cifconcesi)
    REFERENCES concesionarios(cifconcesi);

ALTER TABLE distribucion
ADD CONSTRAINT FK_distribucion_coche FOREIGN KEY (codcoche)
    REFERENCES coches(codcoche);
