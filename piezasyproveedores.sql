create table piezas(
	codigo int primary key,
	nombre varchar(100)
);
create table proveedores(
	id char(4) primary key,
	nombre varchar(100)
);
create table suministra(
	codigopieza int references piezas(codigo),
	idproveedor char(4) references proveedores(id),
	precio int
);
insert into piezas values(1,'tuercas');
insert into piezas values(2,'tornillos');
insert into piezas values(3,'arandelas');
insert into piezas values(4,'clavos');
insert into proveedores values('TNBC','Skellington Supplies');
insert into proveedores values('RBT','Susan Calvin Corp');
insert into proveedores values('HAL','Sonya Corp');
insert into proveedores values('KSWQ','Jagermeister');
insert into proveedores values('MADN','Jacques de Molay');
insert into proveedores values('WWSA','Inst Asoc');
insert into suministra values(1,'TNBC',150);
insert into suministra values(1,'RBT',200);
insert into suministra values(1,'MADN',120);
insert into suministra values(2,'WWSA',300);
insert into suministra values(2,'KSWQ',350);
insert into suministra values(3,'HAL',175);
insert into suministra values(4,'RBT',45);
insert into suministra values(4,'TNBC',50);
insert into suministra values(4,'KSWQ',55);
insert into suministra values(3,'MADN',150);


select * from suministra;
select * from piezas;
select * from proveedores;

select codigopieza,avg(precio) from suministra group by codigopieza;

select t1.nombre
from proveedores t1 inner join suministra t2 
on t1.id=t2.idproveedor 
where codigopieza=1;

select t3.nombre,max(t2.precio),t1.nombre
from proveedores t1 left outer join suministra t2 
on t1.id=t2.idproveedor inner join piezas t3
on t2.codigopieza=t3.codigo group by t3.nombre;

select max(t1.precio),t2.nombre
from suministra t1 inner join piezas t2
on t1.codigopieza=t2.codigo inner join proveedores t3
on t3.id=t1.idproveedor
group by t2.nombre;

update suministra set precio=7 where codigopieza=1 and idproveedor='TNBC';
update suministra set precio=precio+1;
delete from suministra where idproveedor='RBT';
delete from suministra where idproveedor='RBT' and codigopieza=4;