USE [Target]
GO

INSERT INTO [dbo].[OrderDim]
           ([orderID]
           ,[prodID]
           ,[storeID]
           ,[customerID]
           ,[dateID]
           ,[qty])
     VALUES
           (6
           ,3
           ,2
           ,5
           ,4
           ,715)
GO

USE Target
SELECT * FROM OrderDim

SELECT * FROM cdc.ToyStoreOrder_CT


