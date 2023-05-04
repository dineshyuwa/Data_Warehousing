USE Target
EXEC sys.sp_cdc_enable_table
	@source_schema= N'dbo'
  , @source_name=N'OrderDim'
  , @role_name=NULL
  , @capture_instance=N'ToyStoreOrder'
  , @supports_net_changes=1
  , @captured_column_list=N'orderID,prodID,storeID,customerID,dateID,qty'
  , @filegroup_name=N'Primary';

GO