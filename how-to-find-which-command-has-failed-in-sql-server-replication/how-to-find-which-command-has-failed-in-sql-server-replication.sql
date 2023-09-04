
SELECT top 100 
entry_time AS trans_entry_time_in_dist_db,
publisher_database_id,
xact_id,
xact_seqno
FROM distribution.dbo.MSrepl_transactions
ORDER BY entry_time DESC

EXEC distribution.dbo.sp_browsereplcmds @xact_seqno_start = '0x0005B68700176AEC000C' 

