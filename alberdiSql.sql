CREATE TABLE if not exists USUARIOS (ID integer PRIMARY KEY,USUARIO text unique,PASSWORD text);
CREATE TABLE if not exists ENVASE (ID integer PRIMARY KEY,NOMBRE text,TIPO text,VOLUMEN int,DESCRIPCION text);
SELECT * FROM USUARIOS;
INSERT INTO USUARIOS values(2,'lauta','12345');
CREATE TABLE if not exists TAPA (ID integer PRIMARY KEY,NOMBRE text,DESCRIPCION text);