--023_how_to_find_customers_who_never_placed_an_order.sql

USE TestDB;
GO

DROP TABLE IF EXISTS dbo.customers;
GO

CREATE TABLE dbo.customers (
	customer_id INT IDENTITY(1,1) PRIMARY KEY,
	customer_name VARCHAR(50) NOT NULL
)
GO

DROP TABLE IF EXISTS dbo.orders;
GO

CREATE TABLE dbo.orders (
	order_id INT IDENTITY(1,1) PRIMARY KEY,
	customer_id INT FOREIGN KEY REFERENCES customers(customer_id)
)
GO

SET IDENTITY_INSERT dbo.customers ON; 
INSERT dbo.customers (customer_id, customer_name) VALUES (1, N'Sharon Salavaria');
INSERT dbo.customers (customer_id, customer_name) VALUES (2, N'Stephanie Conroy');
INSERT dbo.customers (customer_id, customer_name) VALUES (3, N'Christian Kleinerman');
INSERT dbo.customers (customer_id, customer_name) VALUES (4, N'Annette Hill');
INSERT dbo.customers (customer_id, customer_name) VALUES (5, N'Karen Berg');
INSERT dbo.customers (customer_id, customer_name) VALUES (6, N'Ramesh Meyyappan');
INSERT dbo.customers (customer_id, customer_name) VALUES (7, N'Chris Norred');
INSERT dbo.customers (customer_id, customer_name) VALUES (8, N'Linda Mitchell');
INSERT dbo.customers (customer_id, customer_name) VALUES (9, N'Zainal Arifin');
INSERT dbo.customers (customer_id, customer_name) VALUES (10, N'Kevin Brown');
SET IDENTITY_INSERT dbo.customers OFF;
GO

SET IDENTITY_INSERT dbo.orders ON; 
INSERT dbo.orders (order_id, customer_id) VALUES (1, 4);
INSERT dbo.orders (order_id, customer_id) VALUES (2, 5);
INSERT dbo.orders (order_id, customer_id) VALUES (3, 3);
INSERT dbo.orders (order_id, customer_id) VALUES (4, 6);
INSERT dbo.orders (order_id, customer_id) VALUES (5, 7);
INSERT dbo.orders (order_id, customer_id) VALUES (6, 3);
INSERT dbo.orders (order_id, customer_id) VALUES (7, 7);
INSERT dbo.orders (order_id, customer_id) VALUES (8, 8);
INSERT dbo.orders (order_id, customer_id) VALUES (9, 3);
SET IDENTITY_INSERT dbo.orders OFF;
GO

SELECT * FROM dbo.customers
SELECT * FROM dbo.orders

set nocount on;
set statistics time on;
-- solution #1: using not exists
select c.customer_name as customers
from customers as c
where not exists (select 1 from orders as o where o.customer_id = c.customer_id)

-- solution #2: using left join
select c.customer_name as customers
from customers as c
left join orders as o on o.customer_id = c.customer_id
where o.customer_id is null;

-- solution #3: using not in
select c.customer_name as customers
from customers as c
where c.customer_id not in (select o.customer_id from orders as o)
set statistics time off;
