--Who has scored consecutive 30+ scores?
use testdb;
go

drop table if exists dbo.players;
drop table if exists dbo.score_detail;
go

create table dbo.players (
	player_id int primary key,
	player_name varchar(50),
)
go
create table dbo.score_detail (
	innings_id int,
	player_id int,
	score int,
	primary key(innings_id, player_id)
)
go

insert into dbo.players values 
(1,'Devon Conway'),
(2,'Ruturaj Gaikwad'),
(3,'Ambati Rayudu'),
(4,'Robin Uthappa');

insert into dbo.score_detail values 
(1,1,35),
(1,2,50),
(1,3,20),
(1,4,30),
(2,1,5),
(2,2,40),
(2,3,8),
(2,4,32),
(3,1,40),
(3,2,77),
(3,3,25),
(3,4,44),
(4,1,62),
(4,2,54),
(4,3,20),
(4,4,31),
(5,1,2),
(5,2,82),
(5,3,29),
(5,4,1)
go


select * from players;
select * from score_detail;


-- #solution 1
declare @min_score int = 30;
declare @consecutive_innings int = 3;

;with cte1 as (
	select player_id, 
	innings_id,
	case when score >= @min_score then @min_score else 0 end as score
	from dbo.score_detail
), cte2 as (
	select player_id,
	score,
	(row_number() over(partition by player_id order by score, innings_id) - innings_id) as grp
	from cte1
)
select player_name, score as scored_at_least, count(1) as consecutive_innings
from cte2
inner join dbo.players as p on cte2.player_id = p.player_id
where score = @min_score
group by player_name, score, grp
having count(1) >= @consecutive_innings
order by consecutive_innings desc, player_name asc
go

-- #solution 2
declare @min_score int = 30;
declare @consecutive_innings int = 3;

;with cte1 as (
	select player_id, 
	innings_id,
	case when score >= @min_score then @min_score else 0 end as score
	from dbo.score_detail

), cte2 as (
	select player_id,
	innings_id,
	score,
	case when lag(score) over(partition by player_id order by innings_id) - score = 0 then 0 else 1 end as diff
	from cte1
), cte3 as (
	select player_id,
	score,
	sum(diff) over(partition by player_id order by innings_id) as grp
	from cte2
)
select player_name, score as scored_at_least, count(1) as consecutive_innings
from cte3
inner join dbo.players as p on cte3.player_id = p.player_id
where score = @min_score
group by player_name, score, grp
having count(1) >= @consecutive_innings
order by consecutive_innings desc, player_name asc
go


