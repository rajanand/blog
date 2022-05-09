In this post, I will show you few tips that you can use in your day-to-day SQL development workflow. If you are working with SQL Server, most likely that you will using SQL Server Management Studio on daily basic to manage and develop new SQL queries. These tips you can easily incorporate and your productivity will increase instantly.

## 1. Execute SQL query in loop

If you want any query to be executed more than once, either you can select the query and execute (F5) it multiple times and write a while loop to execute desired number of times. You might not have come across that the batch separator "GO" can be used to execute the query `n` number of times. 
```
SELECT 'execute 3 times' 
GO 3
```
This trick will be extremely helpful if you want to insert some dummy data to a table for testing purpose. 
```
--Execute SQL command in loop with "GO"
use demo;
create table marks (
	student_id int identity(1,1), 
	marks tinyint, 
	create_datetime datetime2
)
GO

insert into marks 
select cast(rand()*100 as int), getdate()
GO 1000 -- 1000 records will be inserted

select * from marks
drop table marks
```

![ssms-execute-query-in-loop-go-rajanand.org.gif](https://cdn.hashnode.com/res/hashnode/image/upload/v1643176687893/At77qv_6F.gif)

## 2. Copy and paste multiple values at once.

<kbd>Ctrl</kbd>+<kbd>C</kbd> - Copy multiple values.
Hold down <kbd>Ctrl</kbd>+<kbd>Shift</kbd> and then press <kbd>V</kbd> few times to cycle through copied values from clipboard.

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1643350171319/Wk5JNVOV4.png)

![ssms-copy-and-paste-multiple-values-at-once-clipboard-ring-rajanand.org.gif](https://cdn.hashnode.com/res/hashnode/image/upload/v1643176761684/Y_omcMUNz.gif)
## 3. Write down column names instead of 'select *'
If you have working with SQL for some time, you may know that selecting all the columns in select clause when all the columns are not necessary. But it is easy to just type * (asterisk) to select all columns than type out all the column names. This will be even time consuming if the number of columns in a table is quite large. 

An easy way to do that is just drag and drop from object explorer. You have to expand the table name and drag the columns folder folder to the Query editor window. By default, the columns will be surrounded by square brackets when dragged from object explorer. If you prefer without square brackets, you can change it in `Tools` => `Options` =>  `SQL Server Object Explorer` => `Surround object names with brackets when dragged` to false.

![ssms-drag-and-drop-column-names-rajanand.org.gif](https://cdn.hashnode.com/res/hashnode/image/upload/v1643176866393/zazASM7C8.gif)
## 4. CTRL+3 is your friend
You can configure frequent used queries in shortcuts and use that to execute. 
`Tools` => `Options` =>  `Environment` => `Keyboard` => `Query Shortcuts`

I like to configure these 3 query shortcuts whenever I install a new SQL Server Management Studio in new computer.  
<kbd>Ctrl</kbd>+<kbd>3</kbd> => `SELECT * FROM `   
<kbd>Ctrl</kbd>+<kbd>4</kbd> => `SELECT Top(5) * FROM `  
<kbd>Ctrl</kbd>+<kbd>5</kbd> => `SELECT COUNT(1) FROM `  
Note that there is a space after `FROM` clause above.

You can configure other shortcuts also. Once you configure the above three shortcuts, you can just select any valid tables and then press the shortcuts to see the results.

![ssms-ctrl+3-shortcut-rajanand.org.gif](https://cdn.hashnode.com/res/hashnode/image/upload/v1643176802605/hi-ZwKRfd.gif)
## 5. Change column names in single-line to multi-line and vice versa
If you have all the column name listed as a comma separated in a single line and you want each column names in a separate line, you can do that with a simple 'Find and Replace'
<kbd>Ctrl</kbd>+<kbd>H</kbd> - To open find and replace window.
Type comma <kbd>,</kbd> in find field and <kbd>,\r</kbd> in replace field.
Then <kbd>Alt</kbd>+<kbd>E</kbd> to enable regular expression and then <kbd>Alt</kbd>+<kbd>A</kbd> to replace all.

Similarly, you can change from multi-line to single-line by just swapping the values in Find and replace.
Find - <kbd>,\r</kbd>
Replace - <kbd>,</kbd>

![ssms-column-names-in-separate-line-rajanand.org.gif](https://cdn.hashnode.com/res/hashnode/image/upload/v1643176913518/PDIeWTM-C.gif)
## 6. Modify multiple lines at once.

Hold down <kbd>Shift</kbd>+<kbd>Alt</kbd> keys and then click in query editor for start region and then the click the end region to select. Now if you check based on how many lines (region) that you have selected that many cursor will be blinking and you can just start typing it.
This will be especially useful if you are just copy and pasting column name from result pane and you want to add comma <kbd>,</kbd> at the start (or end) of the column name.

![ssms-modify-multiple-lines-at-once-rajanand.org.gif](https://cdn.hashnode.com/res/hashnode/image/upload/v1643176921498/6mjWIJqsS.gif)
## 7. Query editor in full screen.
If you using a computer with small screen resolution size, you SQL Server management studio's various windows might cluster query editor space and you may not have enough space. If you switch to full screen mode, you can have a distraction free query query editor. to achieve this, either you can close all the other windows or you can just make the query editor window as full screen using the shortcut <kbd>Shift</kbd>+<kbd>Alt</kbd>+<kbd>Enter</kbd>. This way all other windows will remain there when you exit the full screen.

![ssms-query-editor-in-full-screen-rajanand.org.gif](https://cdn.hashnode.com/res/hashnode/image/upload/v1643178429370/xxGap3tIG.gif)

## 8. Never execute a query in production database inadvertently
If you have worked with databases for quite sometime, either you would have run some query in production that you didn't wanted to run or someone from your team would have done that. Dropping a database or a table or you would have updated/deleted  all the records of the table. Because you forget the where clause.  

You should pay extra attention when you execute any query in production server. In this trick, you will configure the status bar colour for to something different (eye catching) for production servers. So that when you connect to the server, you get a visual cue that you are connected to production server. It's not guaranteed that you will never execute that something in production server inadvertently. There is nothing will stop you from doing that. It's just a visual cue for you to know that you are working in production server.

Go to `Change connection` => `Options`  => `Connection Properties` => `Use custom color` to set different colour.

![ssms-change-status-bar-colour-rajanand.org.gif](https://cdn.hashnode.com/res/hashnode/image/upload/v1643178992239/BuWCDdFoB.gif)

## 9. Don't google for even a simple SQL syntax
Sometimes, you don't remember even a simple SQL syntax and you want to google for it to get the syntax and then copy paste and modify according to your need. Instead of that you can just use Snippets ( <kbd>Ctrl</kbd>+<kbd>K</kbd> and <kbd>Ctrl</kbd>+<kbd>X</kbd> )
You can add your own snippets also. That's for some other day.

![ssms-code-snippets-rajanand.org.gif](https://cdn.hashnode.com/res/hashnode/image/upload/v1643180255033/rWG_oDTBo.gif)

## 10. Surround your code with IF condition or While loop.
This tip also similar to the previous one. If you have a block of code that you want to surround with a `If` , `While` or `Begin..End`, you can use Surround with using the short cut ( <kbd>Ctrl</kbd>+<kbd>K</kbd> and <kbd>Ctrl</kbd>+<kbd>S</kbd> ) or you can simple select the statements and `right` click and select `Surround with`.

![ssms-surround-with-rajanand.org.gif](https://cdn.hashnode.com/res/hashnode/image/upload/v1643182097261/jVnTIuo4A.gif)

## Conclusion

Thanks for reading this post till the end. I hope these tips and tricks help you to improve your SQL development productivity as it does for me. If you have any tricks that you use are not listed in this post or any other questions, let me know in comments section below.

If you would like to receive these tips and tricks directly to your inbox, consider subscribe below. 

