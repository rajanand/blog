
--SQL Server Management Studio - Tips and Tricks
--Rajanand Ilangovan
--blog.rajanand.org
--Execute SQL command in loop

use demo;
create table marks (
	student_id int identity(1,1), 
	marks tinyint, 
	create_datetime datetime2
)
GO
select * from marks

insert into marks 
select cast(rand()*100 as int), getdate()
GO 1000

select * from marks

drop table marks

-----------------------------------------------------------------------------------
--SQL Server Management Studio - Tips and Tricks
--Rajanand Ilangovan
--blog.rajanand.org
--Copy and Paste multiple values at once. 

--copy (Ctrl + C)
--one two three four


--paste (Ctrl + Shift + V )
-- Hold Ctrl and Shift keys and then Press "V" key multiple times to paste other copied values.

--four three two one

-----------------------------------------------------------------------------------
--SQL Server Management Studio - Tips and Tricks
--Rajanand Ilangovan
--blog.rajanand.org
--Avoid * and write all column names instantly in select clause.

select * from dbo.students
 
-----------------------------------------------------------------------------------
--SQL Server Management Studio - Tips and Tricks
--Rajanand Ilangovan
--blog.rajanand.org
--CTRL+3 to see all the data stored in a table.
--CTRL+4 to see top 5 records
--CTRL+5 to see the table row count.

--tablename

students

-----------------------------------------------------------------------------------
--SQL Server Management Studio - Tips and Tricks
--Rajanand Ilangovan
--blog.rajanand.org
--MOdify multiple lines at once using rectangular region select.
--MOdify multiple lines at once using rectangular region select.
--MOdify multiple lines at once using rectangular region select.
--MOdify multiple lines at once using rectangular region select.

create table employee (
	emp_id int identity(1,1),
	emp_first_name varchar(100),
	emp_last_name varchar(100),
	project_id int
)


select 
emp_id
,emp_first_name
,emp_last_name
,project_id

from employee

--SQL Server Management Studio - Tips and Tricks
--Rajanand Ilangovan
--blog.rajanand.org
--Instantly change row to comma separated column value.



select
student_number,student_name,dept_code,date_of_birth,address_detail,cell_number
from students

--SQL Server Management Studio - Tips and Tricks
--Rajanand Ilangovan
--blog.rajanand.org
--Query editor in full screen

-- Use Shift+Alt+Enter to make your query editor in full screen.

--SQL Server Management Studio - Tips and Tricks
--Rajanand Ilangovan
--blog.rajanand.org
--Never execute a query in production database inadvertently.


--SQL Server Management Studio - Tips and Tricks
--Rajanand Ilangovan
--blog.rajanand.org
--Don't google for even a simple SQL syntax.

select * from students
GO
CREATE VIEW dbo.getactivestudents
AS
    Select * from dbo.students where isactive = 1


--SQL Server Management Studio - Tips and Tricks
--Rajanand Ilangovan
--blog.rajanand.org
--Surround with [Ctrl+K, Ctrl+S]

--List out all the inactive students and count.
--If there are not inactive students, don't display anthing.

declare @are_there_inactive_students bit = (select count(1) from students where IsActive = 0)

IF( @are_there_inactive_students = 1 )
BEGIN

select * from students where IsActive = 0
select count(1) from students where IsActive = 0 
 

END
