-- 043_subscriptions_2
-- List out the subscribers name with total number of subscriptions and number of subscriptions that overlaps.


use testdb;
go

drop table if exists dbo.subscribers;
drop table if exists dbo.subscriptions;
go

create table dbo.subscribers (
	subscriber_id int not null primary key,
	subscriber_name varchar(100) not null
);
go

create table dbo.subscriptions (
	subscription_id int not null primary key,
	subscriber_id int not null,
	subscription_name varchar(100) not null,
	from_date date not null,
	to_date date not null
);
go

insert into dbo.subscribers values
(1,'Rajanand'),
(2,'Tharoon'),
(3,'Ramesh'),
(4,'Lakshmi'),
(5,'Meenakshi')
go

insert into dbo.subscriptions values
(1,1,'Amazon Prime','2022-01-15','2022-02-14'),
(2,1,'Disney+ Hotstar','2022-02-16','2022-02-23'),
(3,2,'Amazon Prime','2022-01-18','2022-01-25'),
(4,2,'Netflix','2022-01-20','2022-01-28'),
(5,2,'Sony Liv','2022-01-20','2022-01-22'),
(6,2,'Youtube Premium','2022-01-29','2022-01-31'),
(7,3,'Netflix','2022-01-30','2022-02-12'),
(8,3,'Disney+ Hotstar','2022-02-05','2022-02-11'),
(9,3,'Sony Liv','2022-02-12','2022-02-13'),
(10,3,'Zee5','2022-02-14','2022-02-18'),
(11,3,'Sun Nxt','2022-02-20','2022-02-28'),
(12,4,'Sun Nxt','2022-03-01','2022-03-13'),
(13,5,'Disney+ Hotstar','2022-01-01','2022-06-30')

go


--select * from dbo.subscribers;
--select * from dbo.subscriptions;



-- List out the subscribers name with total number of subscriptions and number of subscriptions that overlaps.


;with subscription_overlap  as (
	select distinct s1.subscriber_id,
	count(1) over(partition by s1.subscriber_id) as overlap_subscription_counts
	from dbo.subscriptions as s1
	inner join dbo.subscriptions as s2 
		on s1.subscriber_id = s2.subscriber_id
		and s1.subscription_id < s2.subscription_id
	where (s1.from_date <= s2.to_date and s1.to_date >= s2.from_date) 
), subscriptions as (
	select subscriber_id,
	count(1) over(partition by subscriber_id) as total_subscription_counts
	from dbo.subscriptions
)

select distinct 
c.subscriber_id,
c.subscriber_name,
total_subscription_counts,
coalesce(overlap_subscription_counts,0) as overlap_subscription_counts
from subscriptions as s 
inner join dbo.subscribers as c on s.subscriber_id = c.subscriber_id
left join subscription_overlap as o on s.subscriber_id = o.subscriber_id
order by c.subscriber_id,
subscriber_name,
total_subscription_counts


go

