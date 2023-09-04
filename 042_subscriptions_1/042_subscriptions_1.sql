-- 042 subscriptions



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



-- List out the subscribers name with the subscriptions that overlaps.

--solution 1
;with subscription_overlap  as (
	select s1.subscriber_id,
	s1.subscription_id as subscription_id_1,
	s2.subscription_id as subscription_id_2,
	s1.subscription_name as subscription_1,
	s2.subscription_name as subscription_2,
	case when (s1.from_date <= s2.to_date and s1.to_date >= s2.from_date) 
		 then 1 else 0 end as is_overlap
	from dbo.subscriptions as s1
	inner join dbo.subscriptions as s2 
		on s1.subscriber_id = s2.subscriber_id
		and s1.subscription_id < s2.subscription_id
	where (s1.from_date <= s2.to_date and s1.to_date >= s2.from_date) 
)
select 
c.subscriber_name,
s.subscription_1 + ' <-> ' + s.subscription_2 as overlap_subscriptions 
from subscription_overlap as s
inner join dbo.subscribers as c on s.subscriber_id = c.subscriber_id
order by subscriber_name,
overlap_subscriptions


go


----------------------------------


-- between operator will not work for the below example. 
 -- If subscription 2 start and end date is within the subscription 1 start and end date, it will not work. 
 -- So, you have to use between operator to check for both (sub1 & sub2) to make it work.
 -- sub1 Jan 18th - 25th
 -- sub2 Jan 20th - 22nd

--solution 2
;with subscription_overlap  as (
	select s1.subscriber_id,
	s1.subscription_id as subscription_id_1,
	s2.subscription_id as subscription_id_2,
	s1.subscription_name as subscription_1,
	s2.subscription_name as subscription_2,
	case when (s1.from_date between s2.from_date and s2.to_date 
				or s1.to_date between s2.from_date and s2.to_date
				or s2.from_date between s1.from_date and s1.to_date 
				or s2.to_date between s1.from_date and s1.to_date) 
		then 1 else 0 end as is_overlap
	from dbo.subscriptions as s1
	inner join dbo.subscriptions as s2 
		on s1.subscriber_id = s2.subscriber_id
		and s1.subscription_id < s2.subscription_id
	where (s1.from_date between s2.from_date and s2.to_date 
			or s1.to_date between s2.from_date and s2.to_date
			or s2.from_date between s1.from_date and s1.to_date 
			or s2.to_date between s1.from_date and s1.to_date) 
)
select 
c.subscriber_name,
s.subscription_1 + ' <-> ' + s.subscription_2 as overlap_subscriptions 
from subscription_overlap as s
inner join dbo.subscribers as c on s.subscriber_id = c.subscriber_id
order by subscriber_name,
overlap_subscriptions

 
go

