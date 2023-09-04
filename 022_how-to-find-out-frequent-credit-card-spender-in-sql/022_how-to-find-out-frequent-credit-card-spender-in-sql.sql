
USE TestDB;
GO

DROP TABLE IF EXISTS #CREDIT_BALANCE

CREATE TABLE #CREDIT_BALANCE (
	id int not null identity(1,1),
	customer_id int,
	as_on_date date,
	credit_balance decimal(18,2)
)
GO

--customer 1
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (1, '2022-02-01', 100000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (1, '2022-02-02', 100000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (1, '2022-02-03', 100000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (1, '2022-02-04', 95000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (1, '2022-02-05', 95000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (1, '2022-02-06', 95000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (1, '2022-02-07', 95000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (1, '2022-02-08', 95000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (1, '2022-02-09', 80000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (1, '2022-02-10', 80000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (1, '2022-02-11', 74000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (1, '2022-02-12', 74000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (1, '2022-02-13', 70000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (1, '2022-02-14', 70000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (1, '2022-02-15', 63000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (1, '2022-02-16', 63000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (1, '2022-02-17', 63000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (1, '2022-02-18', 63000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (1, '2022-02-19', 63000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (1, '2022-02-20', 63000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (1, '2022-02-21', 63000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (1, '2022-02-22', 63000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (1, '2022-02-23', 40000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (1, '2022-02-24', 40000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (1, '2022-02-25', 40000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (1, '2022-02-26', 15000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (1, '2022-02-27', 12000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (1, '2022-02-28', 2000)

--customer 2
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (2, '2022-02-01', 250000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (2, '2022-02-02', 250000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (2, '2022-02-03', 250000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (2, '2022-02-04', 250000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (2, '2022-02-05', 250000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (2, '2022-02-06', 250000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (2, '2022-02-07', 250000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (2, '2022-02-08', 250000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (2, '2022-02-09', 140000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (2, '2022-02-10', 140000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (2, '2022-02-11', 140000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (2, '2022-02-12', 140000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (2, '2022-02-13', 140000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (2, '2022-02-14', 140000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (2, '2022-02-15', 140000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (2, '2022-02-16', 140000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (2, '2022-02-17', 110000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (2, '2022-02-18', 110000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (2, '2022-02-19', 110000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (2, '2022-02-20', 110000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (2, '2022-02-21', 110000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (2, '2022-02-22', 110000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (2, '2022-02-23', 110000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (2, '2022-02-24', 110000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (2, '2022-02-25', 80000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (2, '2022-02-26', 80000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (2, '2022-02-27', 80000)
INSERT INTO #CREDIT_BALANCE (customer_id, as_on_date, credit_balance) VALUES (2, '2022-02-28', 80000)
GO




--SELECT * FROM #CREDIT_BALANCE


;WITH CTE1 AS (
	SELECT id,
	customer_id,
	as_on_date,
	credit_balance,
	LAG(credit_balance,1,credit_balance) OVER(PARTITION BY customer_id ORDER BY as_on_date ASC) AS previous_day_credit_balance
	FROM #CREDIT_BALANCE
),
CTE2 AS (
	SELECT id,
	customer_id,
	as_on_date,
	credit_balance,
	CASE WHEN previous_day_credit_balance - credit_balance = 0 THEN 0 ELSE 1 END AS balance_change
	FROM cte1
),
CTE3 AS (
	SELECT id,
	customer_id,
	as_on_date,
	credit_balance,
	SUM(balance_change) OVER(PARTITION BY customer_id ORDER BY as_on_date) AS balance_group
	FROM cte2
),
CTE4 AS (
	SELECT customer_id,
	MIN(credit_balance) AS credit_balance
	FROM cte3
	GROUP BY customer_id,
	balance_group
)

SELECT customer_id,
COUNT(1) AS spending_days_count,
MAX(credit_balance) - MIN(credit_balance) AS amount_spent
FROM CTE4
GROUP BY customer_id
