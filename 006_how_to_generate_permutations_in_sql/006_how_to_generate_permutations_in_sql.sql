-- 006_how_to_generate_permutations_in_sql

use testdb;
go

if object_id (N'dbo.city', N'u') is not null 
drop table dbo.city
go

create table dbo.city (
	id int identity(1,1),
	city_name varchar(100)
)

insert into dbo.city (city_name) values 
  ('Oslo'),
  ('Helsinki'),
  ('Stockholm'),
  ('Copenhagen')

select id, city_name from dbo.city;

-- solution 1
declare @total_cities int = (select count(1) from dbo.city);
;with travel (travel_path, level) as (
	select cast(city_name as varchar(200)), 
    level = 1 
    from dbo.city
	union all
	select cast(travel.travel_path + ' -> ' + city.city_name as varchar(200)), 
    level = level + 1
	from dbo.city
	inner join travel on level < @total_cities
	where charindex(city.city_name, travel.travel_path) = 0
	)

select 
id = row_number() over(order by travel_path),
travel_path
from travel
where level = @total_cities
order by id

-- solution 2
;with bitmasks as ( 
	select cast(city_name as varchar(max)) as city_name, 
	cast(power(2, row_number() over (order by city_name) - 1) as int) as bitmask 
	from dbo.city 
),
travel as (
	select city_name as travel_path,
	bitmask
	from bitmasks
	union all
	select p.travel_path + ' -> ' + b.city_name,
	p.bitmask ^ b.bitmask
	from travel p
	join bitmasks b on p.bitmask ^ b.bitmask > p.bitmask
)
select travel_path
from travel
where bitmask = power(2, (select count(*) from dbo.city)) - 1
order by travel_path
