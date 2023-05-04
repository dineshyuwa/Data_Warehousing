SELECT name, is_cdc_enabled
FROM sys.databases

SELECT name, is_tracked_by_cdc
FROM sys.tables