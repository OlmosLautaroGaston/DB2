/** AGENDA **/

CREATE TABLE agenda (
	ID_DIA varchar,
	ID_MES varchar,
	HORA_ENTRADA time without time zone,
	HORA_SALIDA time without time zone,
	ID_DNI integer,
	PRIMARY KEY(ID_DIA, ID_MES)
);
/** ODONTOLOGO **/

CREATE TABLE odontologo (
	ID_DNI INTEGER PRIMARY KEY,
	NOMBRE VARCHAR,
	APELLIDO VARCHAR,
	FECHACONTRATACION timestamp without time zone,
	FECHADESPIDO timestamp without time zone null
);
/** RESTRICCION AGENDA-ODONTOLOGO **/

ALTER TABLE agenda
ADD CONSTRAINT CONSTRAINT_DNI FOREIGN KEY(ID_DNI) REFERENCES odontologo(ID_DNI);

/** PACIENTE **/

CREATE TABLE paciente (
	PACIENTE_DNI INTEGER PRIMARY KEY,
	NOMBRE VARCHAR,
	APELLIDO VARCHAR,
	FECHANACIMIENTO timestamp without time zone
);

/** TIPO DE TURNO **/

CREATE TABLE tipoturno(
	TRATAMIENTO VARCHAR,
	PRECIO INTEGER,
	PRIMARY KEY(TRATAMIENTO,PRECIO)
);

/** RESTRICCIONES TIPO DE TURNO - UNIQUE **/

ALTER TABLE tipoturno
ADD CONSTRAINT CONSTRA_unique2 
UNIQUE (PRECIO);
ALTER TABLE tipoturno
ADD CONSTRAINT CONSTRA_unique1
UNIQUE (TRATAMIENTO);

/** TURNO**/

CREATE TABLE turno(
	TIPO_TURNO VARCHAR,
	TRATAMIENTO VARCHAR REFERENCES tipoturno(TRATAMIENTO),
	PRECIO INTEGER REFERENCES tipoturno(PRECIO),
	DNI_ODONT INTEGER REFERENCES odontologo(ID_DNI),
	DNI_PAC INTEGER REFERENCES paciente(PACIENTE_DNI)
);

/** TURNO DISPONIBLE **/

CREATE TABLE turnosdisponibles(
	FECHA timestamp without time zone,
	HORA time without time zone,
	IDDNI INTEGER REFERENCES odontologo(ID_DNI),
	ESTADO boolean
);

/** DATOS **/

SELECT * FROM odontologo;
SELECT * FROM agenda;
SELECT * FROM paciente;
SELECT * FROM turno;
SELECT * FROM tipoturno;
SELECT * FROM turnosdisponibles;

/** DATOS ODONTOLOGOS **/

INSERT INTO odontologo VALUES (33421123,'Jorge','Videla');
INSERT INTO odontologo VALUES (41155173,'Lautaro','Martin');
INSERT INTO odontologo VALUES (12333124,'Rafael','Tisera');
INSERT INTO odontologo VALUES (43212312,'Carlos','Acosta');
INSERT INTO odontologo VALUES (56787767,'Mariel','Ojeda');

/** DATOS AGENDA **/

INSERT INTO agenda VALUES ('Lunes','Febrero','09:00','18:00',33421123);
INSERT INTO agenda VALUES ('Lunes','Enero','09:00','18:00',33421123);
INSERT INTO agenda VALUES ('Martes','Febrero','09:00','18:00',41155173);
INSERT INTO agenda VALUES ('Martes','Enero','09:00','18:00',41155173);
INSERT INTO agenda VALUES ('Miercoles','Febrero','09:00','18:00',41155173);
INSERT INTO agenda VALUES ('Miercoles','Enero','09:00','18:00',41155173);
INSERT INTO agenda VALUES ('Jueves','Febrero','09:00','18:00',43212312);
INSERT INTO agenda VALUES ('Jueves','Enero','09:00','18:00',43212312);
INSERT INTO agenda VALUES ('Viernes','Febrero','09:00','18:00',12333124);
INSERT INTO agenda VALUES ('Viernes','Enero','09:00','18:00',12333124);
INSERT INTO agenda VALUES ('Sabado','Febrero','09:00','18:00',56787767);
INSERT INTO agenda VALUES ('Sabado','Enero','09:00','18:00',56787767);

/** DATOS PACIENTES **/

INSERT INTO paciente VALUES(42569874,'Cosme','Fulanito','1998-05-21');
INSERT INTO paciente VALUES(39852658,'Jorge','Novilla','1978-07-22');
INSERT INTO paciente VALUES(25698741,'Lucas','Aguirre','1965-10-05');
INSERT INTO paciente VALUES(24316457,'Federico','Tobares','1978-05-21');
INSERT INTO paciente VALUES(23518949,'Marcos','Polo','1999-07-12');
INSERT INTO paciente VALUES(65481898,'Lucas','Peregrino','2001-04-30');
INSERT INTO paciente VALUES(12654984,'Rolando','Castro','2006-11-21');
INSERT INTO paciente VALUES(12514984,'Matias','Sanches','2007-03-03');
INSERT INTO paciente VALUES(26548495,'Martina','Martinez','1968-02-22');
INSERT INTO paciente VALUES(32159489,'Julia','Rodriguez','1999-12-04');
/** DATOS TURNO **/


/** DATOS TIPO DE TURNO **/

INSERT INTO tipoturno VALUES('conducto',250);
INSERT INTO tipoturno VALUES('Endodoncia',400);
INSERT INTO tipoturno VALUES('Ortodoncia',300);
INSERT INTO tipoturno VALUES('Periodoncia',100);
INSERT INTO tipoturno VALUES('Limpieza',150);
INSERT INTO tipoturno VALUES('Restauracion ',375);

INSERT INTO turno VALUES('Simple','conducto',250,41155173,39852658);
INSERT INTO turno VALUES('Doble','Endodoncia',400,12333124,25698741);
INSERT INTO turno VALUES('Doble','Ortodoncia',300,12333124,65481898);
INSERT INTO turno VALUES('Simple','Periodoncia',100,41155173,26548495);
INSERT INTO turno VALUES('Simple','Limpieza',150,56787767,32159489);
