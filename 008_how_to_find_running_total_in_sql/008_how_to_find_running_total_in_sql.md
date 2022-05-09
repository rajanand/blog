## Question:

You have a `transaction_detail` table with a record for each transaction. The transaction type could be debit, credit or refund. You need to add an additional column to track account balance. 

Write a SQL query to achieve the expected output.


![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1643741735004/70s8dDQ_K.png)


## Answer:

Let us create the test data first. 
```
-- create test data
USE demo;
GO
CREATE TABLE dbo.transaction_detail (
	date date,
	transaction_type varchar(50),
	amount money
	)
GO

INSERT INTO dbo.transaction_detail VALUES
('2022-01-01','credit',1000),
('2022-01-16','debit',300),
('2022-01-31','credit',150),
('2022-02-04','debit',50),
('2022-02-13','refund',50),
('2022-02-28','credit',400),
('2022-03-21','debit',500)
GO

```

To get the desired result, you can use aggregate function `sum` with window function to calculate the **running total** for each row in a window. But, we have not defined the window (i.e, `partition by` is not defined to define the window) here. Had we have to calculate the account balance for each account, we would have defined the window as account. So this query just calculates the running total for all the records in the table.

```
-- solution
SELECT 
date,
transaction_type,
amount,
balance = SUM(CASE WHEN transaction_type = 'debit' then amount * -1 
			  else amount end) 
		  OVER(ORDER BY date)
FROM dbo.transaction_detail


-- clean up
-- USE demo;
-- DROP TABLE dbo.transaction_detail
```

This is the solution I have come up with. If you have achieved the output in any other way, let me know in comments. Thank you.

