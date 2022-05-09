## Question:

You are planning to go for a summer vacation and finalized the cities you want to visit. But you have not finalized in which order you want to visit them yet. 

Write a SQL query to list out all different possible order you can visit these cities. 

Note that you don't want to visit the same city again and you don't want to skip any city in your travel plan either.

![03-permutations-table.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1644727361179/R1v_xwyGG.png)

Expected output: 
![03-permutations-output.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1644727369565/rokHTbXtb.png)

Let us create the test data first for the demo.

```
-- test data
use demo;
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

select id, city_name from dbo.city
```
## Solution: 1
This solution is implemented using the Recursive CTE in SQL Server. If you are using other database engines, you can implement it in similar way.

```
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

```
## Solution: 2
This solution is implemented using a bitwise exclusive or <kbd>^</kbd> in recursive CTE. I [learned](https://michaeljswart.com/2017/02/generate-permutations-fast-using-sql/) this one while I was checking for few other way to implement permutations in SQL.
```
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

```


If you like this interview question, you may also like these scenario based interview question and answers.
 
- [How to sort result set in custom order in SQL?](https://blog.rajanand.org/how-to-sort-result-set-in-custom-order-in-sql)
- [How to do reciprocal in SQL?](https://blog.rajanand.org/how-to-calculate-total-travel-hours-between-city-x-and-y-and-vice-versa)
- [How to find account balance (running total) in SQL?](https://blog.rajanand.org/how-to-find-an-account-balance-in-sql)
