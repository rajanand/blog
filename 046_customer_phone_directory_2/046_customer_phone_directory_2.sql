/*-------------------------------------------
046_customer_phone_directory_2
Rajanand Ilangovan
https://blog.rajanand.org
https://learn.rajanand.org
--------------------------------------------*/

use testdb;
go

drop table if exists dbo.customer_directory;
go

create table dbo.customer_directory (
    customer_id int not null primary key,
    customer_name varchar(50),
	mobile_phone varchar(50),
	landline_phone varchar(50),
	work_phone varchar(50)
)
go



insert into dbo.customer_directory 
(customer_id, customer_name, mobile_phone, landline_phone, work_phone) values
(1,'Alfredo Lasse','999-444-1111',NULL,'555-666-2255'),
(2,'Kristapor Jarl',NULL,NULL,'888-999-5566'),
(3,'Silvio Leonardo','666-555-3387',NULL,NULL),
(4,'Tom Cleto','111-333-5544','888-777-7744',NULL),
(5,'Emigdio Silvio','777-888-9999','999-555-1111','333-555-6666'),
(6,'Magnus Noé',NULL,NULL,NULL),
(7,'Praggnanandhaa',NULL,'555-777-2189',NULL)
go

select * from dbo.customer_directory;

-- List out all the customer phone numbers in a single column.

-- solution #1
select 
customer_id,
customer_name,
'mobile_phone' as phone_number_type,
mobile_phone as phone_number
from dbo.customer_directory 
where mobile_phone is not null

union all

select 
customer_id,
customer_name,
'landline_phone' as phone_number_type,
landline_phone as phone_number
from dbo.customer_directory 
where landline_phone is not null

union all
 
select 
customer_id,
customer_name,
'work_phone' as phone_number_type,
work_phone as phone_number
from dbo.customer_directory 
where work_phone is not null
order by customer_id,
phone_number_type



-- solution #2
select
customer_id,
customer_name,
phone_number_type,
phone_number
from dbo.customer_directory as c
unpivot (phone_number for phone_number_type in (mobile_phone, landline_phone, work_phone)) as p
order by customer_id,
phone_number_type

go
