create table almacenes(
	codigo int primary key,
	lugar varchar(100),
	capacidad int
);
create table cajas(
	numreferencia char(5) primary key,
	contenido varchar(100),
	valor int,
	almacen int references almacenes(codigo)
);

select * from cajas;
select * from almacenes;

insert into almacenes values (1,'Bilbao',150);
insert into almacenes values (2,'Mendoza',200);
insert into almacenes values (3,'Capital',1000);
insert into almacenes values (4,'Chapanay',325);
insert into almacenes values (5,'Berlin',050);
insert into almacenes values (6,'Costa',847);
insert into almacenes values (7,'Barcelona',3);

insert into cajas values ('a2d55','Cajas',100,1);
insert into cajas values ('a8d8w','Tijeras',250,1);
insert into cajas values ('dwas2','Ladrillos',300,2);
insert into cajas values ('cvbf8','Frutas',582,3);
insert into cajas values ('w5h5f','Mesas',478,3);
insert into cajas values ('51daw','Electronica',352,4);
insert into cajas values ('sdw8d','Vasos',225,4);
insert into cajas values ('adw8d','Cubiertos',125,5);
insert into cajas values ('aaa5d','Platos',50,5);
insert into cajas values ('wwda1','Parlantes',500,6);
insert into cajas values ('jyu31','Mouses',650,6);
insert into cajas values ('h5rt','Papel',200,2);


/**Consultas complejas**/

select avg(valor),almacen from cajas group by almacen;

select t1.codigo,avg(valor) from
almacenes t1 inner join cajas t2
on t1.codigo=t2.almacen
group by t1.codigo
having avg(valor)>=150;

select avg(valor),almacen from cajas group by almacen;

select t2.numreferencia,t1.lugar from
almacenes t1 inner join cajas t2
on t1.codigo=t2.almacen

select count(numreferencia),almacen from cajas group by almacen;

select t1.codigo from
almacenes t1 inner join cajas t2
on t1.codigo=t2.almacen
group by codigo
having count(numreferencia)>capacidad;

select t2.numreferencia from
almacenes t1 inner join cajas t2
on t1.codigo=t2.almacen
where lugar='Bilbao';

update cajas set valor = valor-(valor*0.1);
update cajas set valor = valor-(valor*0.20) where valor>(select avg(valor) from cajas);
select * from cajas;
select avg(valor) from cajas;
delete from cajas where valor <100;


delete from cajas 
where almacen in(
select t1.codigo from
almacenes t1 inner join cajas t2
on t1.codigo=t2.almacen
group by codigo
having count(numreferencia)>capacidad);