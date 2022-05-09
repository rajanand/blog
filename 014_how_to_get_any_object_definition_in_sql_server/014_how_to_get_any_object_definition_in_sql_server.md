

## Query

```
USE AdventureWorks2019;
GO
SELECT object_name(object_id) as stored_procedure_name,
definition
FROM sys.sql_modules
WHERE object_name(object_id) IN (select name from sys.procedures);

SELECT object_name(object_id) as view_name,
definition
FROM sys.sql_modules
WHERE object_name(object_id) IN (select name from sys.views);

SELECT object_name(object_id) as trigger_name,
definition
FROM sys.sql_modules
WHERE object_name(object_id) IN (select name from sys.triggers);

SELECT object_name(object_id) as function_name,
definition
FROM sys.sql_modules
WHERE object_name(object_id) IN 
	(select name from sys.objects where type IN ('FN','IF','TF'));
```

## Sample Output


![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1652018438539/TBzGJnojf.png align="left")

