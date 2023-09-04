-- How to sort result in custom order in SQL?
USE testdb;
GO

CREATE TABLE dbo.city (
	id int not null identity(1,1) primary key,
	city_name varchar(50)
)
GO

INSERT INTO dbo.city values ('Copenhagen'),('Helsinki'),('Oslo'),('Stockholm');
GO


select city_name 
from dbo.city
order by case when city_name = 'Helsinki' then 'a' 
			 when  city_name = 'Copenhagen' then 'b'
			 when  city_name = 'Stockholm' then 'c'
			 else 'z' end asc






















































