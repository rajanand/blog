SQL Server management studio does not have the dark theme by default. You can make the below change to enable the dark theme option.

1. Go to the below path  
`C:\Program Files (x86)\Microsoft SQL Server Management Studio 18\Common7\IDE\`  
2. Modify the below file in Administrator mode. If you are using notepad++, you can launch it in admin mode.  
File name: `ssms.pkgundef`  
![1.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1646500808267/bqRqzZlPI.png)
3. Search for `Dark` and add <kbd>//</kbd> in front of the below line to comment and save the file.  
[$RootKey$\Themes\{1ded0138-47ce-435e-84ef-9ec1f439b749}]  
![2.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1646500856209/0lbbEk-fq.png)
4. Open SSMS => Tools => Options => Environment => General => Color theme and choose dark theme.  
![4.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1646501317549/_foiVuG2B.png)
5. Restart the SSMS.  
![3.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1646500855531/YjDvO4AQI.png)

If you like this tips, you can sign up for my [newsletter](http://newsletter.rajanand.org) to receive these tips directly in your inbox.
