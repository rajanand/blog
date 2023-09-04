-- can you join? Really??
-- Note: You should not use temp table, derived table, CTE or sub query.

use testdb;
go

drop table if exists table_a;
drop table if exists table_b;
drop table if exists table_c;
drop table if exists table_d;
go

create table table_a (id int);
create table table_b (id int);
create table table_c (id int);
create table table_d (id int);
go

insert into table_a values (1),(2),(3),(4),(5);
insert into table_b values (1),(2),(3),(4);
insert into table_c values	   (2),(3),    (5);
insert into table_d values (1),(2);
go


-- 1. this will not work
select 
a.id as id_1,
b.id as id_2,
c.id as id_3,
d.id as id_4
from table_a as a
left join table_b as b on a.id = b.id
inner join table_c as c on b.id = c.id
inner join table_d as d on c.id = d.id

-- 2. this also will not work
select 
a.id as id_1,
b.id as id_2,
c.id as id_3,
d.id as id_4
from table_a as a
left join table_b as b on a.id = b.id
left join table_c as c on b.id = c.id
left join table_d as d on c.id = d.id

-- scorll below for solution









































































 
-- solution 1 using right join
select 
a.id as id_1,
b.id as id_2,
c.id as id_3,
d.id as id_4
from table_b as b
inner join table_c as c on b.id = c.id
inner join table_d as d on c.id = d.id
right join table_a as a on a.id = b.id

go

-- solution 2 using left and nested join
select 
a.id as id_1,
b.id as id_2,
c.id as id_3,
d.id as id_4
from table_a as a
left join (
			table_b as b
			inner join table_c as c on b.id = c.id
			inner join table_d as d on c.id = d.id
			) on a.id = b.id

go