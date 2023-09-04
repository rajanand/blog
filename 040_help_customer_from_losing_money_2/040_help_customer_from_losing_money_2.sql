-- 040_help_customer_from_losing_money_2

use testdb;
go

drop table if exists dbo.transaction_detail 
go

create table dbo.transaction_detail (
	transaction_id int not null primary key,
	user_id int not null,
	vendor_id int not null,
	transaction_datetime datetime2(0),
	transaction_amount decimal(18,2)
)
go

insert into dbo.transaction_detail values 
(1	,1,1001,'2022-03-24 20:01:01',1000),
(2	,1,1002,'2022-03-24 20:01:42',1000),
(3	,2,1001,'2022-03-24 20:05:42',150 ),
(4	,3,1001,'2022-03-24 20:07:45',120 ),
(5	,4,1002,'2022-03-24 21:07:45',100 ),
(6	,4,1002,'2022-03-24 21:07:50',100 ),
(7	,4,1001,'2022-03-24 21:07:55',300 ),
(8	,5,1002,'2022-03-24 22:15:55',750 ),
(9	,6,1002,'2022-03-24 22:16:55',240 ),
(10	,7,1002,'2022-03-24 22:17:55',320 ),
(11	,8,1001,'2022-03-24 22:25:00',111 ),
(12	,8,1002,'2022-03-24 22:25:09',222 ),
(13	,8,1001,'2022-03-24 22:25:59',111 ),
(14	,8,1002,'2022-03-24 22:26:10',222 ),
(15	,9,1003,'2022-03-24 22:26:10',500 ),
(16	,8,1002,'2022-03-24 22:26:15',222 )
go


select * from dbo.transaction_detail




-- List out the users who have made a transaction with same amount within 60 seconds.

select t1.user_id,
t1.transaction_datetime as transaction_datetime_1,
t2.transaction_datetime as transaction_datetime_2,
t1.transaction_amount
from dbo.transaction_detail as t1
inner join dbo.transaction_detail as t2 
	on t1.user_id = t2.user_id 
	and t1.transaction_id < t2.transaction_id
where datediff(second,t1.transaction_datetime,t2.transaction_datetime) < 60
and t1.transaction_amount = t2.transaction_amount


