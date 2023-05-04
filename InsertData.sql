USE [Target]
GO

INSERT INTO [dbo].[CustomerDim]
           ([customerID]
           ,[name]
           ,[address]
           ,[state]
           ,[city]
           ,[country]
           ,[segmentID])
     VALUES
           (002
           ,'Guga'
           ,'colombo'
           ,'western'
           ,'colombo'
           ,'srilanka'
           ,002),
		   (
		   003,
		   'shankavi',
		   'vavuniya',
		   'nothern',
		   'vavuniya',
		   'srilanka',
		   001
		   ),
		   (
		   004,
		   'Athavan',
		   'jaffna',
		   'nothern',
		   'jaffna',
		   'somalia',
		   001
		   )


GO


