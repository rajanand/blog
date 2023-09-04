use testdb;

select distinct match_id,season,start_date,
case when batting_team < bowling_team then batting_team + ' vs ' + bowling_team else bowling_team + ' vs ' + batting_team end as match_between
--into #match_header
from dbo.all_matches
--where venue = 'Sawai Mansingh Stadium'
order by start_date, 1;


-- #Which season had most number of double headers?
select season, sum(counts) as double_header_count
from (
	select season, start_date, count(distinct start_date) as counts
	from #match_header 
	--where season = '2011'
	group by season, start_date
	having count(1) > 1
)x
group by season


select from #match_header 