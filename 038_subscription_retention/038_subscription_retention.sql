
-- Subscription Retention

use testdb;
go

DROP TABLE IF EXISTS dbo.subscriptions;
GO

CREATE TABLE dbo.subscriptions (
	user_id int primary key,
	start_date date,
	end_date date,
	plan_id varchar(100)
);
GO


insert into dbo.subscriptions values 
(1,'2022-01-10','2022-01-30','BEGINNER'),
(2,'2022-01-15','2022-02-20','ADVANCED'),
(3,'2022-01-20','2022-02-28','INTERMEDIATE'),
(4,'2022-01-30','2022-03-30','BEGINNER'),
(5,'2022-01-10',NULL,'INTERMEDIATE'),
(6,'2022-02-10',NULL,'ADVANCED'),
(7,'2022-02-12',NULL,'BEGINNER'),
(8,'2022-03-02','2022-04-13','INTERMEDIATE'),
(9,'2022-03-13',NULL,'BEGINNER'),
(10,'2022-03-18','2022-04-30','ADVANCED')

go


select * from dbo.subscriptions
where start_date <= '20220131'

;with sub_cte as (
	select user_id,
	plan_id,
	datefromparts(datepart(YYYY,start_date),datepart(MM,start_date),'01') as start_month,
	datefromparts(datepart(YYYY,end_date),datepart(MM,end_date),'01') as end_month
	from dbo.subscriptions
), month_intervals_cte as (
	select *,
	dateadd(month,a,start_month) as n_month_from_start
	from sub_cte 
	cross join (values (1),(2),(3)) as x(a)
), retained_cte as (
	select * ,
	case when end_month >= n_month_from_start or end_month is null then 1 else 0 end as is_retained
	from month_intervals_cte
)
select 
start_month,
plan_id,
a as num_month,
(sum(is_retained)*1.0)/ count(1)
from retained_cte
group by start_month,
a,
plan_id

--------------


--with subscriptions as (
--    select
--        user_id,
--        plan_id,
--        date(concat(substring(start_date,1,7),'-01')) as start_month,
--        date(concat(substring(end_date,1,7),'-01')) as end_month
--    from subscriptions
--),
--month_intervals as (
--    select 
--        plan_id, 
--        start_month,
--        num_month,
--        end_month,
--        date_add(start_month, INTERVAL num_month month) as start_plus_n_months
--    from subscriptions
--    cross join (select 1 as num_month union select 2 union select 3) nums
--),
--retained as (
--    select
--        start_month,
--        num_month,
--        plan_id, 
--        end_month >= start_plus_n_months or end_month is null as is_retained 
--    from month_intervals  
--)
--select 
--    start_month,
--    num_month,
--    plan_id,
--    sum(case when is_retained is true then 1.0 else 0 end)/count(*) as retained
--from retained
--group by 1,2,3

 
