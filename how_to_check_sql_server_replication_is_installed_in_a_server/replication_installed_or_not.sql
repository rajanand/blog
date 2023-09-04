
DECLARE @replication_installed int;  
EXEC @replication_installed = master.sys.sp_MS_replication_installed;  
SELECT @replication_installed; 
GO

EXECUTE master.dbo.xp_instance_regread 'HKEY_LOCAL_MACHINE',   
        'SOFTWARE\Microsoft\MSSQLServer\Replication',  
        'IsInstalled'
