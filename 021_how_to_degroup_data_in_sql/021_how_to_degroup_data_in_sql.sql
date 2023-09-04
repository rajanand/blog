
-- 021_how_to_degroup_data_in_sql

USE TestDB;
GO

DROP TABLE IF EXISTS order_details
CREATE TABLE order_details (
	order_id INT,
	product VARCHAR(50) NOT NULL,
	quantity INT,
	amount DECIMAL(10,2)
)
GO

INSERT INTO order_details
SELECT order_id,product, quantity, amount
FROM (VALUES(1001,'Laptop',1001,75000),
			(1001,'Monitor',2, 30000),
			(1002,'Speaker',4, 12000)
)X(order_id,product, quantity, amount)
GO

SELECT * FROM order_details;

--Solution
DECLARE @max_num INT = (SELECT MAX(quantity) FROM order_details)

;WITH numbers(num) AS (
    SELECT 1
    UNION ALL
    SELECT num+1
    FROM numbers 
    WHERE num <= @max_num
)

SELECT order_id, 
product,
1 as quantity,
CAST(amount / quantity AS DECIMAL(18,2)) AS amount
FROM order_details
CROSS JOIN numbers
WHERE quantity >= num
ORDER BY order_id,
product
OPTION(MAXRECURSION 0)
 