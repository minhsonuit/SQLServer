SELECT c.session_id, c.creation_time, c.is_open, t.text
FROM sys.dm_exec_cursors (1231) c
CROSS APPLY sys.dm_exec_sql_text (c.sql_handle) t
