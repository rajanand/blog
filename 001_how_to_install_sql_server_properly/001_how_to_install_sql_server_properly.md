

In this tutorial, We will install the SQL Server 2019 developer edition in windows 10.  This developer edition is a full-featured **free** edition, licensed to use in a non-production environment for development and test database. The installation step will be mostly same for the different versions (i.e, 2014, 2017 etc) and editions (i.e., Express, Standard, Enterprise etc).

# Sql Server 2019 Developer Edition installation steps
1. Go to SQL Server downloads page and click “ [Download now](https://www.microsoft.com/en-IN/sql-server/sql-server-downloads) ” under Developer edition or you can just directly click  [here](https://go.microsoft.com/fwlink/?linkid=866662) . 
![00-ssms-installation-steps-by-rajanand.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1642488520023/GNYHXio7H.png)
1. Installer will be downloaded. Double click the installer to start the installation process.  
1. Click “Custom” as the installation type as shown below.
![01-ssms-installation-steps-by-rajanand.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1642488565233/SKFkhI2SF7.png)
1. This will download the SQL Server software with size about 1.5GB
![02-ssms-installation-steps-by-rajanand.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1642488691707/r2p4BX2Id.png)
1. Click “Installation” as this is the first time we are going to install SQL Server.
![03-ssms-installation-steps-by-rajanand.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1642488750946/F-dztr47N.png)
1.  Click the first option “New SQL Server stand-alone installation” 
![04-ssms-installation-steps-by-rajanand.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1642488773383/BojMEI4cY.png)
1. Leave the default option “Developer” edition.
![05-ssms-installation-steps-by-rajanand.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1642488785291/kuNGFGKcL.png)
1. Accept the license terms and privacy statements.
![06-ssms-installation-steps-by-rajanand.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1642488794266/VhI6AFFqP.png)
1. Check the Install rules. If there are any issue, read the error message and fix that. If there are no error messages, and just a warning message is there like below, then that is fine.
![07-ssms-installation-steps-by-rajanand.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1642488819553/Z_yAntQKl.png)
1. Select only the “Database engine service” in feature selection.
![08-ssms-installation-steps-by-rajanand.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1642489056527/5Q114Xasu.png)
1. Leave the default SQL Server instance Id/name. (i.e., `MSSQLSERVER`) and click Next.
![09-ssms-installation-steps-by-rajanand.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1642489070959/xbTAbl5qz.png)
1. Click Next on the service accounts configuration page.  
![10-ssms-installation-steps-by-rajanand.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1642489158375/310UoXZAe.png)
1. In Database engine configuration select Mixed mode (SQL Server authentication and Windows authentication) as authentication. By using this mixed mode, you will be able to login to the SQL Server instance with your current windows login and with username and password. 
 Enter any strong password that you can remember for SQL Server authentication method.  
User name: `sa`  
Password: AnyPasswordThatYouDontForget  
Then click “Add current user” to add the currently logged-in user as administrator. 
![11-ssms-installation-steps-by-rajanand.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1642489147432/ebzuXnjNE.png)
1. Review it once and then click “Install”. This step will take some time to complete.
![12-ssms-installation-steps-by-rajanand.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1642489202668/CQDy5pmyi.png)
1. Installation process may take from 15 to 30 min to complete. 
![13-ssms-installation-steps-by-rajanand.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1642489283401/eic0usa6D.png)
1. Once installation completes, you should see the message like below. Then you can close it.
![15-ssms-installation-steps-by-rajanand.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1642489998748/sTnOxXlpx.png)

Now, you may open SQL Server Management Studio and login to the server.
