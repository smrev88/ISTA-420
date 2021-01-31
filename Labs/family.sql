.echo on
.headers on

-- Name: Scott Revillar
-- File: family.sql
--Date: January 11, 2021

drop table if exists family;

create table family (
  id int,
  name text,
  sex int,
  role text,
  weight real
);

insert into family values (1, 'scott',1,'parent', 175);
insert into family values (2, 'sarah',0,'parent', NULL);
insert into family values (3, 'jack',1,'child', 60);
insert into family values (4, 'jackie',0,'child', 30);
insert into family values (5, 'bear',1,'pet', 68);
insert into family values (6, 'sienna',0,'pet', 65);

select * from family;
select * from family where role like 'pet';
select * from family where weight > 150;
select * from family where sex = 0;