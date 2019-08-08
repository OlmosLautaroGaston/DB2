create table EMPLEADOS(
	DNI varchar(8) primary key,
	Nombre varchar(100),
	Apellido varchar(255),
	Departamento int references DEPARTAMENTOS(CODIGO)
);
create table DEPARTAMENTOS(
	CODIGO int primary key,
	Nombre varchar(100),
	presupuesto int
);
select * from departamentos;
select * from empleados;
insert into departamentos values (11,'calidad',40000);
insert into empleados values (89267109,'Esther','Vázquez',11);
select apellido from empleados;
select apellido from empleados group by apellido;
select * from empleados where apellido in('Lopez');
select * from empleados where apellido in('Lopez','Perez');
select * from empleados where departamento in(14);
select * from empleados where departamento in(37,77);
select * from empleados where departamento=37 or departamento=77;
select * from empleados where apellido like 'P%';
select sum(presupuesto) from departamentos;
select count(dni),departamento from empleados group by departamento;

/**consultas innerjoin**/

select t1.nombre,apellido,t2.nombre,presupuesto 
from empleados t1 inner join departamentos t2 
on t1.departamento =t2.codigo;

select t1.nombre,apellido,t2.nombre,presupuesto 
from empleados t1 inner join departamentos t2 
on t1.departamento =t2.codigo 
where presupuesto>=60000;

select * from departamentos where presupuesto >=(select avg(presupuesto) from departamentos);
select avg(presupuesto) from departamentos;
/** the best innerjoin **/
select count(dni),t2.nombre 
from empleados t1 inner join departamentos t2 
on t1.departamento =t2.codigo  
group by t2.nombre 
having count(dni)>=2;

/**consultas update**/
update departamentos set presupuesto = presupuesto-(presupuesto*0.1);
update departamentos set presupuesto=21120 where nombre='Marketing';
update departamentos set presupuesto=1788 where nombre='Contabilidad';
update departamentos set presupuesto=1228 where nombre='Informatica';
update departamentos set presupuesto=2218 where nombre='Publica';
update departamentos set presupuesto=1245 where nombre='Limpieza';
update departamentos set presupuesto=45651 where nombre='Diseño';
update departamentos set presupuesto=65565 where nombre='seguridad';
update departamentos set presupuesto=12788 where nombre='Administracion';
update departamentos set presupuesto=40000 where nombre='calidad';

update empleados set departamento=10 where departamento=37;
delete from empleados where departamento=10;
select * from empleados;
delete from empleados;
