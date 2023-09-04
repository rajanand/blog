--031_employees_earns_more_than_their_business_unit_average


use testdb;
go

drop table if exists dbo.employee_details;
drop table if exists dbo.business_unit;


create table dbo.business_unit (
	bu_id int not null primary key,
	bu_name varchar(100) not null
)
go

create table dbo.employee_details (
	emp_id int not null primary key,
	emp_name nvarchar(100) not null,
	bu_id int null foreign key references dbo.business_unit(bu_id),
	manager_id int foreign key references dbo.employee_details(emp_id),
	salary int not null
)
go

insert into dbo.business_unit values 
(1, 'Insights and Data'),
(2, 'Security and Compliance'),
(3, 'Human Resource Management'),
(4, 'Application Development'),
(5, 'Project Management Office')

go

insert into dbo.employee_details values
(1,'Samvel Josef',NULL,NULL,750000),
(2,'Feliciano Chris',1,1,500000),
(3,'Olaf Humberto',1,2,400000),
(4,'Jonatan Le�n',1,2,300000),
(5,'Aron Flemming',1,2,550000),
(6,'Bj�rn Lars',2,1,600000),
(7,'Alfredo Lasse',2,6,500000),
(8,'Kristapor Jarl',2,6,250000),
(9,'Silvio Leonardo',3,1,250000),
(10,'Tom Cleto',3,9,150000),
(11,'Emigdio Silvio',4,1,625000),
(12,'Magnus No�',4,11,600000),
(13,'Simon Johan',4,11,550000),
(14,'Lias Sebastian',4,13,600000),
(15,'Jakob Ezequiel',4,13,450000),
(16,'Lina Nisha',5,6,150000),
(17,'Durga Pravina',5,9,220000),
(18,'Gauri Dipti',5,11,470000),
(19,'Vikram Veda',5,2,225000),
(20,'Sakshi Singh',5,13,100000)
go

select * from dbo.business_unit
select * from dbo.employee_details
go

--emp earns more than their business unit average
;with bu_average as (
	select b.bu_id,
	avg(salary) as avg_bu_salary
	from dbo.employee_details as e
	inner join dbo.business_unit as b on b.bu_id = e.bu_id
	group by b.bu_id
) 
select e.emp_id,
e.emp_name,
b.bu_name as business_unit_name,
e.salary,
a.avg_bu_salary
from dbo.employee_details as e
inner join bu_average as a on e.bu_id = a.bu_id
inner join dbo.business_unit as b on b.bu_id = e.bu_id
where e.salary > a.avg_bu_salary
go
