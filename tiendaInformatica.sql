create table fabricantes(
	codigo serial,
	nombre varchar(100),
	PRIMARY KEY (codigo)
);
drop table fabricantes;
select * from fabricantes;
select * from articulos;
create table articulos(
	codigo serial,
	nombre varchar(100),
	precio int,
	fabricante int,
	foreign key(codigo)references fabricantes(codigo)
	);
insert into articulos values (8,'Altavoces',70,2);

update articulos set precio=precio*0.9;

update articulos set precio=precio-10 where precio >=120;

create view NombreProductos as select nombre from articulos;
select * from NombreProductos;
select codigo,avg(precio) from articulos GROUP BY codigo;

select t2.nombre,avg(precio) from articulos t1 inner join fabricantes t2 on t1.fabricante = t2.codigo GROUP BY t2.codigo;

select t2.nombre,avg(precio) from articulos t1
inner join fabricantes t2
on t1.fabricante = t2.codigo
WHERE precio>=150 GROUP BY t2.codigo;

select nombre,precio from articulos where precio in(select min(precio) from articulos);
select nombre,max(precio) from articulos group by nombre;

select t2.nombre,max(t1.precio) from articulos t1
inner join fabricantes t2
on t1.fabricante = t2.codigo
group by t2.nombre;

