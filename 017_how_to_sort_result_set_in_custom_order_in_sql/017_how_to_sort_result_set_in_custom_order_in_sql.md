## Question

Write a SQL query to display the result in custom sort order.


![1045_20220219_232813.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1645293569372/Y14SQlhLC.png)


## Solution

If you need to display the result in ascending or descending order you can achieve the same directly using `asc` or `desc` keyword in `order by `clause`. But if you need to display it in custom order in report, you can use the `case` expression to do it. 


```
-- solution: custom ordering in sql server
select city_name
from dbo.city
order by case when city_name = 'Helsinki' then 10
			  when city_name = 'Copenhagen' then 20
			  when city_name = 'Stockholm' then 30
	     else 100 end
```
If you check the `case` expression result below, I have used the numbers 10, 20 etc. But it does not matter. You can use number or letters in ascending order to display the result in ascending order. 

If you like this SQL interview question, you may also like the below scenario based interview question and answers.

- [How to generate permutations in SQL?](https://blog.rajanand.org/how-to-generate-permutations-in-sql)
- [How to do reciprocal in SQL?](https://blog.rajanand.org/how-to-calculate-total-travel-hours-between-city-x-and-y-and-vice-versa)
- [How to find account balance (running total) in SQL?](https://blog.rajanand.org/how-to-find-an-account-balance-in-sql)
