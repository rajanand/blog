-- 007_how_to_calculate_total_travel_hours

--create test data
USE TestDB;

DROP TABLE IF EXISTS dbo.travel_detail;

CREATE TABLE dbo.travel_detail (
    id int identity(1,1),
    from_city varchar(100),
    to_city varchar(100),
    travel_time_hours smallint
)
GO

INSERT INTO dbo.travel_detail values
    ('Oslo','Helsinki',125),
    ('Helsinki','Oslo',110),
    ('Stockholm','Oslo',132),
    ('Oslo','Stockholm',180),
    ('Copenhagen','Helsinki',148),
    ('Helsinki','Copenhagen',84),
    ('Stockholm','Copenhagen',116),
    ('Helsinki','Stockholm',124)
GO

SELECT * FROM dbo.travel_detail




-- solution 1
;with travel(city_1, city_2, travel_time_hours) as (
    select 
    city_1 = case when from_city < to_city then from_city else to_city end,
    city_2 = case when from_city > to_city then from_city else to_city end,
    travel_time_hours
    from dbo.travel_detail
)
select 
city_1,
city_2,
sum(travel_time_hours) as total_travel_hours
from travel
group by city_1, city_2
order by city_1, city_2

go

-- solution 2
;with travel(city_1, city_2, travel_time_hours) as (
	select from_city, to_city, travel_time_hours 
	from dbo.travel_detail 
	where from_city < to_city
	union all
	select to_city, from_city, travel_time_hours 
	from dbo.travel_detail 
	where from_city > to_city
)
select 
city_1, 
city_2, 
sum(travel_time_hours) as total_travel_hours
from travel
group by city_1,city_2
order by city_1


 