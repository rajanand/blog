/*-------------------------------------------
045_customer_phone_directory_1
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


-- List out the customer details and the phone number. 
-- If work_phone is available, list work phone. 
-- If not, list mobile phone. If mobile phone is not available, list landline_phone. 
-- If none of the phone number is available, mention as 'not available'















-- solution #1
select 
customer_id,
customer_name,
coalesce(work_phone, mobile_phone, landline_phone, 'not available') as phone_number 
from dbo.customer_directory




















-- solution #2
select 
customer_id,
customer_name,
isnull(isnull(isnull(work_phone, mobile_phone),landline_phone), 'not available') as phone_number
from dbo.customer_directory
























-- solution #3
select 
customer_id,
customer_name,
case when work_phone is not null then work_phone
	 else case when mobile_phone is not null then mobile_phone
			   else case when landline_phone is not null then landline_phone
						 else 'not available' 
						 end
				end
	 end
as phone_number
from dbo.customer_directory

 