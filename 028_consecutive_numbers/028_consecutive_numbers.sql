
--use TestDB;
--go

--create table dbo.consecutive (
--	id int identity(1,1),
--	num int
--)

--insert into dbo.consecutive values (1),(1),(1),(2),(1),(2),(2);
--go

--#solution 1
select c1.*, c2.*
from dbo.consecutive as c1
inner join dbo.consecutive as c2 on c1.id > c2.id and c1.num = c2.num


--#solution 2
select num from (
	select *, 
	next1_num = lead(num, 1) over(order by id asc),
	next2_num = lead(num, 2) over(order by id asc)
	from dbo.consecutive
)x
where num = next1_num and next1_num = next2_num;


---

--create table dbo.logs (
--	id int identity(1,1),
--	num int
--)

--insert into dbo.logs values (1),(1),(1),(2),(1),(2),(2);
--go

--insert into dbo.logs values (2),(2),(2)



select distinct num as consecutiveNums 
from (select num,sum(c) over (order by id) as flag 
from (
select id, num, case when LAG(Num) OVER (order by id)- Num = 0 then 0 else 1 end as c
from logs
) a
) b
group by num,flag
having count(*) >=4   --(you can change 3 to any number)


----Approach1
--select distinct num as consecutiveNums 
--from (select num,sum(c) over (order by id) as flag from 
--(select id, num, case when LAG(Num) OVER (order by id)- Num = 0 then 0 else 1 end as c
--from logs) a
--) b
--group by num,flag
--having count(*) >=3   --(you can change 3 to any number)
--Approach2
select distinct num as ConsecutiveNums from
(select num, id - row_number() over (order by num, id) rank from logs) a
group by num,rank
having count(*) >5


select distinct num as ConsecutiveNums 
from (
select num, id - row_number() over (order by num, id) rank from logs
) a
group by num,rank
having count(*) >4

select id, innings_id, player_name, score 
from dbo.innings
order by player_name, innings_id


select distinct num as consecutiveNums 
from (
	select num,sum(c) over (order by id) as flag 
	from (select id, num, case when LAG(Num) OVER (order by id)- Num = 0 then 0 else 1 end as c 
		  from logs) a
) b
group by num,flag
having count(*) >=3 
