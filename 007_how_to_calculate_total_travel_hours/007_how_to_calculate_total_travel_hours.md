
## Question
You are working for an airline company and you have received a dataset of Pilot's travel time between cities. 
You need to determine the reciprocal and find the total travel hours between cities.  That means, the pilot's travel from city '1' to '2' and city '2' to '1' should be considered as one and then the total travel hours has to be calculated.

Write an SQL query to achieve the expected output.

![04-reciprocal-input-data-output.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1643696437905/pppVnfP9w.png)

## Answer

Let us create the test data first. 
```
--create test data
USE demo;

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

--clean up
--USE demo;
--DROP TABLE dbo.travel_detail
```
To achieve the desired result, you should swap the city names within the row based on some order. That means, you can sort the from_city and to_city names in a row in ascending or descending order and then keep the first city as `city_1` and the other as city_2. To do this, you can use less than <kbd> < </kbd> or greater than <kbd>\></kbd> operator on `from_city` and `to_city`. 

![04-reciprocal-step-1.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1643698330299/7HQnHHdEK.png)

This way you will be able to aggregate the `travel_time_hours` by grouping `city_1` and `city_2`.

```
--solution
USE demo;

select 
city_1,
city_2,
total_travel_hours = sum(travel_time_hours)
from (
	select 
	city_1 = case when from_city < to_city then from_city else to_city end,
	city_2 = case when from_city > to_city then from_city else to_city end,
	travel_time_hours
	from dbo.travel_detail
)x
group by city_1, city_2
order by city_1, city_2
```
This is the solution I have come up with. If you have achieved the output in other way, let me know in comments.

If you like this interview question and answer, you may also like the below scenario based questions.

- [How to sort result set in custom order in SQL](https://blog.rajanand.org/how-to-sort-result-set-in-custom-order-in-sql)
- [How to generate permutations in SQL](https://blog.rajanand.org/how-to-generate-permutations-in-sql)
- [How to find account balance (running total) in SQL](https://blog.rajanand.org/how-to-find-an-account-balance-in-sql)


