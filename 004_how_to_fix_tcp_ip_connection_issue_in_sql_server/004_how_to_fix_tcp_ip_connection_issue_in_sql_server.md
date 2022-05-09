## Problem
You are unable to connect to SQL Server from SQL Server Management Studio or DBeaver due to TCP/IP connection issue.

## Error message: 

> The TCP/IP connection to the host localhost, port 1433 has failed. Error: "Connection timed out: no further information.. Verify the connection properties. Make sure that an instance of SQL Server is running on the host and accepting TCP/IP connections at the port. Make sure that TCP connections to the port are not blocked by a firewall.".

![tcp ip connection issue in sql server - Rajanand.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1642540221571/vZ_IpilQM.png)


## Solution:

1. Open `SQL Server Configuration Manager` => `SQL Server Network Configuration` =>`Protocols for {Your Instance Name}` and change the status to `Enabled` for `TCP\IP` protocol.  
`MSSQLSERVER` is the default instance name.
![sql server configuration manager - rajanand.org.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1642540211685/BmKjsgORC.png)
1. Open `Services` ( <kbd> Ctrl </kbd> + <kbd> R </kbd> and type `services` and <kbd> Enter </kbd>).
1. Go to Service name `SQL Server (MSSQLSERVER)` (`MSSQLSERVER` is the default SQL Server instance name. If your instance name is different, select that instance name) and right click and restart.
![restart sql server - rajanand.org.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1642540235866/T1cDhUv9x.png)
1. If you try to connect to the SQL Server now, You will be able to connect to the SQL Server.

Check out this gif for for step by step [solution](https://i.imgur.com/zqGL3UH.gif).

![dbeaver-sql-server-tcp-ip-connection-issue-rajanand.org.gif](https://cdn.hashnode.com/res/hashnode/image/upload/v1642537837069/SQ2MEoN1n.gif)
