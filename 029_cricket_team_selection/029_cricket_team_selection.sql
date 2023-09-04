-- team selection

use testdb;
go

drop table if exists players;
create table players (
	player_id int not null primary key,
	player_name varchar(100) not null,
	role varchar(100) not null
)
go

drop table if exists teams;
create table teams (
	team_id int not null primary key,
	team_name varchar(100) not null
)
go

insert into players values 
(1,'Virat Kohli','Batsman'),
(2,'Joe Root','Batsman'),
(3,'Steven Smith','Batsman'),
(4,'Babar Azam','Batsman'),
(5,'David Warner','Batsman'),
(6,'Jos Buttler','Batsman'),
(7,'Adam Gilchrist','Wicket Keeper'),
(8,'MS Dhoni','Wicket Keeper'),
(9,'Kumar Sangakkara','Wicket Keeper'),
(10,'Ravindra Jadeja','All Rounder'),
(11,'Hardik Pandya','All Rounder'),
(12,'Glenn Maxwell','All Rounder'),
(13,'Ravichandran Ashwin','Spin Bowler'),
(14,'Muttiah Muralitharan','Spin Bowler'),
(15,'Anil Kumble','Spin Bowler'),
(16,'Jasprit Bumrah','Fast Bowler'),
(17,'Umran Malik','Fast Bowler'),
(18,'Brett Lee','Fast Bowler'),
(19,'Shaun Tait','Fast Bowler'),
(20,'Shoaib Akthar','Fast Bowler'),
(21,'James Anderson','Fast Bowler')
go

insert into teams values
(1,'Chennai Super Kings'),
(2,'Royal Challengers Bangalore'),
(3,'Kolkata Knight Riders')
go

--each team should have 7 players
-- 2 batsman
-- 1 wk
-- 1 all rounder
-- 1 spinner
-- 2 fast bowler


-- solution 1
;with team_selection as (
	select player_id,
	player_name,
	role,
	ntile(3) over(partition by role order by newid()) as team_id
	from players
)
select team_name, 
role, 
player_name
from team_selection as p
inner join teams as t on t.team_id = p.team_id
order by team_name, 
role


-- solution 2 (with rank, dense_rank or row_number)
;with team_selection as (
	select player_id,
	player_name,
	role,
	(row_number() over(partition by role order by newid()))%3+1 as team_id
	from players
)
select team_name, 
role, 
player_name
from team_selection as p
inner join teams as t on t.team_id = p.team_id
order by team_name, 
role




