USE TestDB;
GO

DROP TABLE IF EXISTS dbo.product_category;
GO

CREATE TABLE dbo.product_category (
	product_category_id INT NOT NULL PRIMARY KEY,
	product_category_name VARCHAR(50)
)
GO

INSERT INTO dbo.product_category VALUES (1,'Bikes');
INSERT INTO dbo.product_category VALUES (2,'Components');
INSERT INTO dbo.product_category VALUES (3,NULL);
INSERT INTO dbo.product_category VALUES (4,'Accessories');
INSERT INTO dbo.product_category VALUES (5,'Clothing');
GO

SELECT * FROM dbo.product_category;


-- #1 using stuff function and xml path
SELECT STUFF(
	(SELECT ',' + product_category_name
	FROM dbo.product_category
	FOR XML PATH ('')),1,1,'')

-- #2 using substring function and xml path
SELECT SUBSTRING(
	(SELECT ',' + product_category_name
	FROM dbo.product_category
	FOR XML PATH ('')),2,10000)

-- #3 using string_agg function
SELECT STRING_AGG(product_category_name,',')
FROM dbo.product_category 

-- #4 using coalesce when there is null value
DECLARE @concat_string VARCHAR(MAX);
SELECT @concat_string = COALESCE(@concat_string+',','') + COALESCE(product_category_name,'')
FROM dbo.product_category
SELECT @concat_string;
GO

-- #4 using coalesce when there is not any null value
DECLARE @concat_string VARCHAR(MAX);
SELECT @concat_string = COALESCE(@concat_string+',','') + product_category_name
FROM dbo.product_category 
WHERE product_category_name IS NOT NULL
SELECT @concat_string;
GO
