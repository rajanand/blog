

use testdb;
go

drop table if exists dbo.employees;
drop table if exists dbo.skills;
go

create table dbo.employees (
	emp_id int not null primary key,
	emp_name nvarchar(100) not null,
	skills_flag int not null
)
go

create table dbo.skills (
	skill_name varchar(100) not null primary key,
	skill_weight int not null
)
go

insert into dbo.employees values 
(1,'Hudson',28),
(2,'Noah',3),
(3,'Oliver',786435),
(4,'Daniel',8512),
(5,'James',34880),
(6,'William',98),
(7,'Benjamin',4736),
(8,'Lucas',24832),
(9,'Henry',196612),
(10,'John',6280),
(11,'Olivia',528),
(12,'Emma',3072),
(13,'Sophia',62),
(14,'Lily',41056),
(15,'Victoria',323)
go

insert into dbo.skills values 
('Python',1),
('SQL',2),
('SSIS',4),
('SSRS',8),
('SSAS',16),
('Power BI',32),
('Tableau',64),
('MicroStrategy',128),
('Qlik Sense',256),
('Business Objects',512),
('Thoughtspot',1024),
('Looker',2048),
('Data Studio',4096),
('Tibco Spotfire',8192),
('OBIEE',16384),
('AWS QuickSight',32768),
('Informatica',65536),
('Alteryx',131072),
('SAS',262144),
('SPSS',524288)
go

--solution

select * from dbo.employees
select * from dbo.skills order by skill_weight


-- MSBI developer (SQL, SSIS, SSAS, SSRS)
declare @skill_weight int;
set @skill_weight = (select sum(skill_weight) from skills where skill_name in('SQL','SSIS','SSAS','SSRS'));

select emp_id,
emp_name
from dbo.employees
where (skills_flag & @skill_weight) = @skill_weight
go

-- Who knows SQL?
declare @skill_weight int;
set @skill_weight = (select sum(skill_weight) from skills where skill_name in('SQL'));

select emp_id,
emp_name ,skills_flag | @skill_weight 
from dbo.employees
where (skills_flag | @skill_weight) = skills_flag
go

--NOT WORKING. work in progress.
-- Either Power BI or Tableau?
declare @skill_weight int;
set @skill_weight = (select sum(skill_weight) from skills where skill_name in('Power BI', 'Tableau'));

select emp_id,
emp_name ,skills_flag, skills_flag | @skill_weight 
from dbo.employees
where (skills_flag | @skill_weight) = skills_flag
go



