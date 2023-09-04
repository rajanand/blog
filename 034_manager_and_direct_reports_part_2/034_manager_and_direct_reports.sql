-- 034_manager_and_direct_reports_part_2

use testdb;
go

drop table if exists dbo.manager_details;
create table dbo.manager_details (
	manager_id int not null primary key,
	manager_name nvarchar(100),
	direct_reports_name nvarchar(max)
)
go


insert into manager_details (manager_id,manager_name,direct_reports_name) values
(1	,'Samvel Josef','Feliciano Chris,Bjørn Lars,Silvio Leonardo,,Emigdio Silvio'),
(2	,'Feliciano Chris','Vikram Veda,Olaf Humberto,Jonatan León,Aron Flemming'),
(6	,'Bjørn Lars','Alfredo Lasse,Kristapor Jarl,Lina Nisha'),
(9	,'Silvio Leonardo','Durga Pravina,Tom Cleto'),
(11	,'Emigdio Silvio','Gauri Dipti,Magnus Noé,Simon Johan'),
(13	,'Simon Johan','Lias Sebastian,Jakob Ezequiel,Sakshi Singh')
go

-- scroll down for solution.







































-- solution
	select manager_id, 
	manager_name, 
	value as direct_reports_name
	from manager_details
	cross apply string_split(direct_reports_name, ',')
	where trim(value) <> '';




