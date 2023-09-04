-- custom sort

use TestDB;
go

drop table if exists dbo.country
go

create table dbo.country (
	country_code char(2) not null primary key,
	country_name varchar(50) not null
)
go

insert into dbo.country values
('AF', 'Afghanistan'),
('BH', 'Bahrain'),
('CA', 'Canada'),
('DK', 'Denmark'),
('EC', 'Ecuador'),
('FO', 'Faroe Islands'),
('DE', 'Germany'),
('HT', 'Haiti'),
('IS', 'Iceland'),
('JM', 'Jamaica'),
('KZ', 'Kazakhstan'),
('LA', 'Laos'),
('MG', 'Madagascar'),
('NA', 'Namibia'),
('OM', 'Oman'),
('PK', 'Pakistan'),
('QA', 'Qatar'),
('RO', 'Romania'),
('CH', 'Switzerland'),
('TW', 'Taiwan'),
('UK', 'United Kingdom'),
('US', 'United States of America'),
('VA', 'Vatican City'),
('WF', 'Wallis and Futuna'),
('YE', 'Yemen'),
('ZM', 'Zambia')
go


select * from dbo.country order by country_name asc

		select * from dbo.country 
		order by case when country_name = 'United States of America' then '1'
					  when country_name = 'United Kingdom' then '2'
					  when country_name = 'Canada' then '3'
				 else country_name end asc

 


