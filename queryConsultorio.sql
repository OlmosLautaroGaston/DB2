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
	TRATAMIENTO VARCHAR UNIQUE,
	TIPOTURNO INTEGER,
	PRIMARY KEY(TRATAMIENTO,TIPOTURNO)
);

/** TURNO**/

CREATE TABLE turno(
	IDTURNO SERIAL UNIQUE,
	PRECIO INTEGER,
	TRATAMIENTO VARCHAR REFERENCES tipoturno(TRATAMIENTO),
	DNI_ODONT INTEGER REFERENCES odontologo(ID_DNI),
	DNI_PAC INTEGER REFERENCES paciente(PACIENTE_DNI),
	PRIMARY KEY(IDTURNO,PRECIO)
);

/** TURNO DISPONIBLE **/

CREATE TABLE turnosdisponibles(
	FECHA timestamp without time zone,
	HORA time without time zone,
	IDDNI INTEGER REFERENCES odontologo(ID_DNI),
	ESTADO boolean
);
/** SUELDOS**/

CREATE TABLE sueldos(
	DNI INTEGER REFERENCES odontologo(ID_DNI),
	MES VARCHAR,
	TURNOS INTEGER REFERENCES turno(IDTURNO)
);

/** DATOS **/

SELECT * FROM odontologo;
SELECT * FROM agenda;
SELECT * FROM paciente;
SELECT * FROM turno;
SELECT * FROM tipoturno;
SELECT * FROM sueldos;

/** DATOS ODONTOLOGOS **/

INSERT INTO odontologo VALUES (33421123,'Jorge','Videla','1998-05-21');
INSERT INTO odontologo VALUES (41155173,'Lautaro','Martin','2005-10-22');
INSERT INTO odontologo VALUES (12333124,'Rafael','Tisera','2001-02-13');
INSERT INTO odontologo VALUES (43212312,'Carlos','Acosta','1998-01-21');
INSERT INTO odontologo VALUES (56787767,'Mariel','Ojeda','2018-12-14');

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

INSERT INTO turno VALUES(1,250,'conducto',41155173,39852658);
INSERT INTO turno VALUES(2,400,'Endodoncia',12333124,25698741);
INSERT INTO turno VALUES(3,300,'Ortodoncia',12333124,65481898);
INSERT INTO turno VALUES(4,100,'Periodoncia',41155173,26548495);
INSERT INTO turno VALUES(5,150,'Limpieza',56787767,32159489);
INSERT INTO turno VALUES(6,250,'conducto',41155173,39852658);
INSERT INTO turno VALUES(7,400,'Endodoncia',56787767,25698741);
INSERT INTO turno VALUES(8,300,'Ortodoncia',12333124,65481898);
INSERT INTO turno VALUES(9,100,'Periodoncia',41155173,26548495);
INSERT INTO turno VALUES(10,150,'Limpieza',56787767,32159489);
INSERT INTO turno VALUES(11,150,'Limpieza',33421123,32159489);

/** DATOS TIPO DE TURNO **/

INSERT INTO tipoturno VALUES('conducto',1);
INSERT INTO tipoturno VALUES('Endodoncia',2);
INSERT INTO tipoturno VALUES('Ortodoncia',2);
INSERT INTO tipoturno VALUES('Periodoncia',1);
INSERT INTO tipoturno VALUES('Limpieza',1);
INSERT INTO tipoturno VALUES('Restauracion ',2);

/** DATOS SUELDOS **/

INSERT INTO sueldos VALUES(41155173,'Enero',1);
INSERT INTO sueldos VALUES(41155173,'Enero',4);
INSERT INTO sueldos VALUES(41155173,'Enero',6);
INSERT INTO sueldos VALUES(56787767,'Enero',5);
INSERT INTO sueldos VALUES(56787767,'Enero',7);
INSERT INTO sueldos VALUES(56787767,'Enero',10);
INSERT INTO sueldos VALUES(12333124,'Enero',2);
INSERT INTO sueldos VALUES(12333124,'Enero',3);
INSERT INTO sueldos VALUES(12333124,'Enero',8);
INSERT INTO sueldos VALUES(33421123,'Enero',11);

select * from odontologo
update odontologo cascade set id_dni=40155173 where nombre='Lautaro';
update turno cascade set dni_odont=40155173 where dni_odont=41155173;

UPDATE odontologo t1
SET t1.id_dni = 40155173
FROM turno t2
WHERE t1.id_dni = t2.dni_odont and t1.id_dni=41155173;

UPDATE odontologo AS t1
SET id_dni = 40155173
FROM turno AS t2
ON t1.id_dni = t2.dni_odont
WHERE t1.id_dni=4155173; 