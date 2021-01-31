.echo on
.headers on

-- Name: Scott Revillar
-- File: SQL-exercise01.sql
--Date: January 13, 2021

drop table if exists hotrods;

create table hotrods (
  vin int primary key,
  year int check(year >= 1920 and year <= 2021),
  mileage real,
  make text,
  condition text
);

insert into hotrods values (49654, 2019,1801.4,'Ford', 'like new');
insert into hotrods values (112456, 1988,79000.9,'Dodge', 'used');
insert into hotrods values (607897, 1975,89467.4,'Porsche', 'used');
insert into hotrods values (3343480, 2020,4003.3,'Chevrolet', 'like new');
insert into hotrods values (12346444, 1965,210000,'Ford', 'used');


select * from hotrods;
select * from hotrods where make like 'pet';
select * from hotrods where year > 2005;
select * from hotrods where condition = 'like new';