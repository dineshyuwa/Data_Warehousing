USE [master]
GO
/****** Object:  Database [ToyStore]    Script Date: 11/29/2022 9:37:09 PM ******/
CREATE DATABASE [ToyStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ToyStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ToyStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ToyStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ToyStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ToyStore] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ToyStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ToyStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ToyStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ToyStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ToyStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ToyStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [ToyStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ToyStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ToyStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ToyStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ToyStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ToyStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ToyStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ToyStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ToyStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ToyStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ToyStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ToyStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ToyStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ToyStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ToyStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ToyStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ToyStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ToyStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ToyStore] SET  MULTI_USER 
GO
ALTER DATABASE [ToyStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ToyStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ToyStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ToyStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ToyStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ToyStore] SET QUERY_STORE = OFF
GO
USE [ToyStore]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 11/29/2022 9:37:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customerID] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[address] [varchar](50) NOT NULL,
	[state] [varchar](50) NOT NULL,
	[city] [varchar](50) NOT NULL,
	[country] [varchar](50) NOT NULL,
	[segmentID] [int] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerSegment]    Script Date: 11/29/2022 9:37:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerSegment](
	[segmentID] [int] NOT NULL,
	[segmentName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CustomerSegment] PRIMARY KEY CLUSTERED 
(
	[segmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Date]    Script Date: 11/29/2022 9:37:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Date](
	[dateID] [int] NOT NULL,
	[holiday] [int] NOT NULL,
	[month] [int] NOT NULL,
	[day] [int] NOT NULL,
	[year] [int] NOT NULL,
 CONSTRAINT [PK_Date] PRIMARY KEY CLUSTERED 
(
	[dateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/29/2022 9:37:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[orderID] [int] NOT NULL,
	[prodID] [int] NOT NULL,
	[storeID] [int] NOT NULL,
	[customerID] [int] NOT NULL,
	[DateID] [int] NOT NULL,
	[qty] [int] NOT NULL,
	[unitPrice] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/29/2022 9:37:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[prodID] [int] NOT NULL,
	[description] [varchar](50) NOT NULL,
	[unitOfMeasurement] [varchar](50) NOT NULL,
	[qtyInHand] [varchar](50) NOT NULL,
	[productCategoryID] [int] NOT NULL,
	[promotionID] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[prodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 11/29/2022 9:37:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[productCategoryID] [int] NOT NULL,
	[categoryName] [varchar](50) NOT NULL,
	[description] [varchar](50) NOT NULL,
	[prodTypeID] [int] NOT NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[productCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 11/29/2022 9:37:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[prodTypeID] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[prodTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotion]    Script Date: 11/29/2022 9:37:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotion](
	[promotionID] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[discount] [float] NOT NULL,
 CONSTRAINT [PK_Promotion] PRIMARY KEY CLUSTERED 
(
	[promotionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 11/29/2022 9:37:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[storeID] [int] NOT NULL,
	[address] [varchar](50) NOT NULL,
	[city] [varchar](50) NOT NULL,
	[country] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Store] PRIMARY KEY CLUSTERED 
(
	[storeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_CustomerSegment] FOREIGN KEY([segmentID])
REFERENCES [dbo].[CustomerSegment] ([segmentID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_CustomerSegment]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([customerID])
REFERENCES [dbo].[Customer] ([customerID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Date] FOREIGN KEY([DateID])
REFERENCES [dbo].[Date] ([dateID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Date]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Product] FOREIGN KEY([prodID])
REFERENCES [dbo].[Product] ([prodID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Product]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Store] FOREIGN KEY([storeID])
REFERENCES [dbo].[Store] ([storeID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Store]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductCategory] FOREIGN KEY([productCategoryID])
REFERENCES [dbo].[ProductCategory] ([productCategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductCategory]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Promotion] FOREIGN KEY([promotionID])
REFERENCES [dbo].[Promotion] ([promotionID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Promotion]
GO
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategory_ProductType] FOREIGN KEY([prodTypeID])
REFERENCES [dbo].[ProductType] ([prodTypeID])
GO
ALTER TABLE [dbo].[ProductCategory] CHECK CONSTRAINT [FK_ProductCategory_ProductType]
GO
USE [master]
GO
ALTER DATABASE [ToyStore] SET  READ_WRITE 
GO
