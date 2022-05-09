
If you are not having the database files (mdf and ldf) files, you can download the stack overflow demo [database files](https://www.brentozar.com/archive/2018/01/updated-and-smaller-stack-overflow-demo-databases/).

## Method 1: Using SSMS UI

1. Open object explorer in SSMS and connect to the server.
2. Right click on the `Databases` folder and select `Attach`.
![1113_20220405_102326.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1649134957246/NPX6Yamw7.png)
3. Click `Add` and select the mdf file and verify the database name and file locations.
![1114_20220405_102710.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1649134971634/rBCb2XaBD.png)
4. Click `Ok` to create the database.

![1116_20220405_104147.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1649135537867/CRwcp80FH.png)


## Method 2: Using T-SQL query
```
-- change the file location accordingly
USE [master]
GO
CREATE DATABASE [StackOverflow2010] ON 
( FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLSERVER2019\MSSQL\DATA\StackOverflow2010.mdf' ),
( FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLSERVER2019\MSSQL\DATA\StackOverflow2010_log.ldf' )
 FOR ATTACH
GO

```
If this query has helped you to solve an issue, you may also like the other T-SQL queries I have posted at [blog.rajanand.org](https://blog.rajanand.org/sql-server)
