USE [TestDB]
GO

DROP TABLE IF EXISTS dbo.employees;
GO

CREATE TABLE dbo.employees (
	emp_id INT  PRIMARY KEY,
	emp_name VARCHAR(50) NOT NULL,
	gender CHAR(1) NOT NULL,
	job_title VARCHAR(50) NOT NULL,
	birth_date DATE NOT NULL,
	hire_date DATE NOT NULL,
	salary INT NOT NULL
)
GO

INSERT [dbo].[employees] ([emp_id], [emp_name], [gender], [job_title], [birth_date], [hire_date], [salary]) VALUES (1, N'Sharon Salavaria', N'F', N'Design Engineer', CAST(N'1961-05-02' AS Date), CAST(N'2011-01-18' AS Date), 120000)
INSERT [dbo].[employees] ([emp_id], [emp_name], [gender], [job_title], [birth_date], [hire_date], [salary]) VALUES (2, N'Stephanie Conroy', N'F', N'Network Manager', CAST(N'1984-03-25' AS Date), CAST(N'2009-02-04' AS Date), 40000)
INSERT [dbo].[employees] ([emp_id], [emp_name], [gender], [job_title], [birth_date], [hire_date], [salary]) VALUES (3, N'Christian Kleinerman', N'M', N'Maintenance Supervisor', CAST(N'1976-01-18' AS Date), CAST(N'2008-12-14' AS Date), 110000)
INSERT [dbo].[employees] ([emp_id], [emp_name], [gender], [job_title], [birth_date], [hire_date], [salary]) VALUES (4, N'Annette Hill', N'F', N'Purchasing Assistant', CAST(N'1978-01-29' AS Date), CAST(N'2010-12-06' AS Date), 90000)
INSERT [dbo].[employees] ([emp_id], [emp_name], [gender], [job_title], [birth_date], [hire_date], [salary]) VALUES (5, N'Karen Berg', N'F', N'Application Specialist', CAST(N'1978-05-19' AS Date), CAST(N'2009-02-16' AS Date), 80000)
INSERT [dbo].[employees] ([emp_id], [emp_name], [gender], [job_title], [birth_date], [hire_date], [salary]) VALUES (6, N'Ramesh Meyyappan', N'M', N'Application Specialist', CAST(N'1988-03-13' AS Date), CAST(N'2009-02-03' AS Date), 90000)
INSERT [dbo].[employees] ([emp_id], [emp_name], [gender], [job_title], [birth_date], [hire_date], [salary]) VALUES (7, N'Chris Norred', N'M', N'Control Specialist', CAST(N'1987-05-26' AS Date), CAST(N'2009-03-06' AS Date), 140000)
INSERT [dbo].[employees] ([emp_id], [emp_name], [gender], [job_title], [birth_date], [hire_date], [salary]) VALUES (8, N'Linda Mitchell', N'F', N'Sales Representative', CAST(N'1980-02-27' AS Date), CAST(N'2011-05-31' AS Date), 60000)
INSERT [dbo].[employees] ([emp_id], [emp_name], [gender], [job_title], [birth_date], [hire_date], [salary]) VALUES (9, N'Zainal Arifin', N'M', N'Document Control Manager', CAST(N'1976-01-30' AS Date), CAST(N'2009-01-04' AS Date), 100000)
INSERT [dbo].[employees] ([emp_id], [emp_name], [gender], [job_title], [birth_date], [hire_date], [salary]) VALUES (10, N'Kevin Brown', N'M', N'Marketing Assistant', CAST(N'1987-05-03' AS Date), CAST(N'2007-01-26' AS Date), 90000)
INSERT [dbo].[employees] ([emp_id], [emp_name], [gender], [job_title], [birth_date], [hire_date], [salary]) VALUES (11, N'Sean Chai', N'M', N'Document Control Assistant', CAST(N'1987-03-12' AS Date), CAST(N'2009-01-22' AS Date), 90000)
INSERT [dbo].[employees] ([emp_id], [emp_name], [gender], [job_title], [birth_date], [hire_date], [salary]) VALUES (12, N'Magnus Hedlund', N'M', N'Facilities Administrative Assistant', CAST(N'1971-08-27' AS Date), CAST(N'2009-12-21' AS Date), 130000)
INSERT [dbo].[employees] ([emp_id], [emp_name], [gender], [job_title], [birth_date], [hire_date], [salary]) VALUES (13, N'Terri Duffy', N'F', N'Vice President of Engineering', CAST(N'1971-08-01' AS Date), CAST(N'2008-01-31' AS Date), 180000)
INSERT [dbo].[employees] ([emp_id], [emp_name], [gender], [job_title], [birth_date], [hire_date], [salary]) VALUES (14, N'Peter Connelly', N'M', N'Network Administrator', CAST(N'1980-05-28' AS Date), CAST(N'2009-02-23' AS Date), 70000)
INSERT [dbo].[employees] ([emp_id], [emp_name], [gender], [job_title], [birth_date], [hire_date], [salary]) VALUES (15, N'Amy Alberts', N'F', N'European Sales Manager', CAST(N'1957-09-20' AS Date), CAST(N'2012-04-16' AS Date), 80000)
INSERT [dbo].[employees] ([emp_id], [emp_name], [gender], [job_title], [birth_date], [hire_date], [salary]) VALUES (16, N'A. Scott Wright', N'M', N'Master Scheduler', CAST(N'1968-09-17' AS Date), CAST(N'2008-12-12' AS Date), 10000)
INSERT [dbo].[employees] ([emp_id], [emp_name], [gender], [job_title], [birth_date], [hire_date], [salary]) VALUES (17, N'Hazem Abolrous', N'M', N'Quality Assurance Manager', CAST(N'1977-10-26' AS Date), CAST(N'2009-02-28' AS Date), 120000)
INSERT [dbo].[employees] ([emp_id], [emp_name], [gender], [job_title], [birth_date], [hire_date], [salary]) VALUES (18, N'Mike Seamans', N'M', N'Accountant', CAST(N'1979-07-01' AS Date), CAST(N'2009-03-08' AS Date), 10000)
INSERT [dbo].[employees] ([emp_id], [emp_name], [gender], [job_title], [birth_date], [hire_date], [salary]) VALUES (19, N'Ovidiu Cracium', N'M', N'Senior Tool Designer', CAST(N'1978-01-17' AS Date), CAST(N'2010-12-05' AS Date), 120000)
INSERT [dbo].[employees] ([emp_id], [emp_name], [gender], [job_title], [birth_date], [hire_date], [salary]) VALUES (20, N'Tete Mensa-Annan', N'M', N'Sales Representative', CAST(N'1978-01-05' AS Date), CAST(N'2012-09-30' AS Date), 90000)
GO

SELECT * 
FROM dbo.employees 
ORDER BY salary DESC 

-- nth highest salary

;with emp AS (
	SELECT salary,
	RANK() OVER(ORDER BY salary DESC) AS rownum
	FROM dbo.employees 
)
SELECT DISTINCT salary FROM emp WHERE rownum = 3

;with emp AS (
	SELECT salary,
	DENSE_RANK() OVER(ORDER BY salary DESC) AS rownum
	FROM dbo.employees 
)
SELECT DISTINCT salary FROM emp WHERE rownum = 3

;with emp AS (
	SELECT salary,
	ROW_NUMBER() OVER(ORDER BY salary DESC) AS rownum
	FROM dbo.employees 
)
SELECT salary FROM emp WHERE rownum = 3

SELECT salary 
FROM dbo.employees 
ORDER BY salary DESC 
OFFSET 2 ROWS FETCH NEXT 1 ROWS ONLY


--- emp details with nth highest salary
;with emp AS (
	SELECT *,
	RANK() OVER(ORDER BY salary DESC) AS rownum
	FROM dbo.employees 
)
SELECT emp_id,emp_name,gender,job_title,birth_date,hire_date,salary
FROM emp WHERE rownum = 3

;with emp AS (
	SELECT *,
	DENSE_RANK() OVER(ORDER BY salary DESC) AS rownum
	FROM dbo.employees 
)
SELECT emp_id,emp_name,gender,job_title,birth_date,hire_date,salary
FROM emp WHERE rownum = 3

;with emp AS (
	SELECT salary,
	ROW_NUMBER() OVER(ORDER BY salary DESC) AS rownum
	FROM dbo.employees 
)
SELECT emp_id,emp_name,gender,job_title,birth_date,hire_date,salary 
FROM dbo.employees
WHERE salary = (select salary from emp where rownum = 3)

SELECT emp_id,emp_name,gender,job_title,birth_date,hire_date,salary 
FROM dbo.employees
WHERE salary = (SELECT salary 
				FROM dbo.employees 
				ORDER BY salary DESC  
				OFFSET 2 ROWS FETCH NEXT 1 ROWS ONLY)


 

 