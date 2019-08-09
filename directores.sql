create table despachos(
	numero int primary key,
	capacidad int
);
create table directores(
	dni varchar(8) primary key null,
	nomapels varchar(255),
	dnijefe varchar(8) references directores(dni),
	despacho int references despachos(numero)
);
drop table directores
insert into despachos values(124,500);
insert into despachos values(100,600);
insert into despachos values(50,200);
insert into despachos values(154,100);
insert into directores values(41155173,'jose hernandez',null,154);
insert into directores values(42525365,'lautaro martinez',null,100);
insert into directores values(37054455,'carlos luis alberto',41155173,154);
insert into directores values(35842659,'juana de arco',41155173,50);
insert into directores values(32569854,'norberto cruzado',41155173,100);
insert into directores values(58254154,'maria elisa',32569854,124);
insert into directores values(25987456,'silvina escudero',35842659,154);
insert into directores values(21365478,'santiago fernandez',37054455,100);
insert into directores values(74568521,'rodrigo fernandez',null,100);
insert into directores values(28301700,'pablo perez',null,124);

select * from directores;
select * from despachos;
select dni,nomapels from directores;
select * from directores where dnijefe is null;

select t1.nomapels,t2.capacidad
from directores t1 inner join despachos t2 
on t1.despacho=t2.numero;

select count(dni),despacho from directores group by despacho;

select * from directores where dnijefe in(select dni from directores where dnijefe is null);

select nomapels from directores;
select count(despacho) from directores;

select count(t1.despacho)
from directores t1 inner join despachos t2 
on t1.despacho=t2.numero 
where capacidad in(select count(dni) from directores group by despacho);

select count(dni) from directores group by despacho

update directores set dnijefe=74568521 where nomapels like '%perez';

select t1.nomapels,t2.nomapels from directores t1 inner join directores t2 on t1.dni=t2.dni
where t2.dnijefe in(select nomapels from directores t1 where dnijefe is null);

where t1.dnijefe in(select nomapels from directores where dnijefe is null);

select nomapels from directores t1 where dnijefe is null union
select nomapels from directores t2 where dnijefe is not null
order by t1.nomapels;

delete from directores where dnijefe is not null;

