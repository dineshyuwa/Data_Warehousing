USE [master]
GO
/****** Object:  Database [Target]    Script Date: 12/1/2022 7:40:06 AM ******/
CREATE DATABASE [Target]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Target', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Target.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Target_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Target_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Target] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Target].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Target] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Target] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Target] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Target] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Target] SET ARITHABORT OFF 
GO
ALTER DATABASE [Target] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Target] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Target] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Target] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Target] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Target] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Target] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Target] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Target] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Target] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Target] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Target] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Target] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Target] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Target] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Target] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Target] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Target] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Target] SET  MULTI_USER 
GO
ALTER DATABASE [Target] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Target] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Target] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Target] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Target] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Target] SET QUERY_STORE = OFF
GO
USE [Target]
GO
/****** Object:  Table [dbo].[CustomerDim]    Script Date: 12/1/2022 7:40:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerDim](
	[customerID] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[address] [varchar](50) NOT NULL,
	[state] [varchar](50) NOT NULL,
	[city] [varchar](50) NOT NULL,
	[country] [varchar](50) NOT NULL,
	[segmentID] [int] NOT NULL,
 CONSTRAINT [PK_CustomerDim] PRIMARY KEY CLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DateDim]    Script Date: 12/1/2022 7:40:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DateDim](
	[dateID] [int] NOT NULL,
	[holiday] [int] NOT NULL,
	[month] [int] NOT NULL,
	[day] [int] NOT NULL,
	[year] [int] NOT NULL,
 CONSTRAINT [PK_DateDim] PRIMARY KEY CLUSTERED 
(
	[dateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MarketBasketMart]    Script Date: 12/1/2022 7:40:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarketBasketMart](
	[DateKey] [int] NOT NULL,
	[ProductA] [int] NOT NULL,
	[ProductB] [int] NOT NULL,
	[Store] [int] NOT NULL,
	[ProductAsalesqty] [int] NOT NULL,
	[ProductBsalesqty] [int] NOT NULL,
	[ProductAsalesamt] [int] NOT NULL,
	[ProductBsalesamt] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDim]    Script Date: 12/1/2022 7:40:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDim](
	[orderID] [int] NOT NULL,
	[prodID] [int] NOT NULL,
	[storeID] [int] NOT NULL,
	[customerID] [int] NOT NULL,
	[dateID] [int] NOT NULL,
	[qty] [int] NOT NULL,
 CONSTRAINT [PK_OrderDim] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDim]    Script Date: 12/1/2022 7:40:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDim](
	[prodID] [int] NOT NULL,
	[description] [varchar](50) NOT NULL,
	[unitOfMeasurement] [varchar](50) NOT NULL,
	[qtyInHand] [int] NOT NULL,
	[productCategoryID] [int] NOT NULL,
	[promotionID] [int] NOT NULL,
	[unitPrice] [int] NOT NULL,
 CONSTRAINT [PK_ProductDim] PRIMARY KEY CLUSTERED 
(
	[prodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PromotionDim]    Script Date: 12/1/2022 7:40:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PromotionDim](
	[promotionID] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[discount] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PromotionDim] PRIMARY KEY CLUSTERED 
(
	[promotionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesFact]    Script Date: 12/1/2022 7:40:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesFact](
	[orderID] [int] NOT NULL,
	[customerID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[dateID] [int] NOT NULL,
	[storeID] [int] NOT NULL,
	[promotionID] [int] NOT NULL,
	[order_value] [int] NOT NULL,
	[order_qty] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoreDim]    Script Date: 12/1/2022 7:40:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreDim](
	[storeID] [int] NOT NULL,
	[address] [varchar](50) NOT NULL,
	[city] [varchar](50) NOT NULL,
	[country] [varchar](50) NOT NULL,
 CONSTRAINT [PK_StoreDim] PRIMARY KEY CLUSTERED 
(
	[storeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderDim]  WITH CHECK ADD  CONSTRAINT [FK_OrderDim_CustomerDim] FOREIGN KEY([customerID])
REFERENCES [dbo].[CustomerDim] ([customerID])
GO
ALTER TABLE [dbo].[OrderDim] CHECK CONSTRAINT [FK_OrderDim_CustomerDim]
GO
ALTER TABLE [dbo].[OrderDim]  WITH CHECK ADD  CONSTRAINT [FK_OrderDim_DateDim] FOREIGN KEY([dateID])
REFERENCES [dbo].[DateDim] ([dateID])
GO
ALTER TABLE [dbo].[OrderDim] CHECK CONSTRAINT [FK_OrderDim_DateDim]
GO
ALTER TABLE [dbo].[OrderDim]  WITH CHECK ADD  CONSTRAINT [FK_OrderDim_ProductDim] FOREIGN KEY([prodID])
REFERENCES [dbo].[ProductDim] ([prodID])
GO
ALTER TABLE [dbo].[OrderDim] CHECK CONSTRAINT [FK_OrderDim_ProductDim]
GO
ALTER TABLE [dbo].[OrderDim]  WITH CHECK ADD  CONSTRAINT [FK_OrderDim_StoreDim] FOREIGN KEY([storeID])
REFERENCES [dbo].[StoreDim] ([storeID])
GO
ALTER TABLE [dbo].[OrderDim] CHECK CONSTRAINT [FK_OrderDim_StoreDim]
GO
ALTER TABLE [dbo].[ProductDim]  WITH CHECK ADD  CONSTRAINT [FK_ProductDim_PromotionDim] FOREIGN KEY([promotionID])
REFERENCES [dbo].[PromotionDim] ([promotionID])
GO
ALTER TABLE [dbo].[ProductDim] CHECK CONSTRAINT [FK_ProductDim_PromotionDim]
GO
ALTER TABLE [dbo].[SalesFact]  WITH CHECK ADD  CONSTRAINT [FK_SalesFact_CustomerDim] FOREIGN KEY([customerID])
REFERENCES [dbo].[CustomerDim] ([customerID])
GO
ALTER TABLE [dbo].[SalesFact] CHECK CONSTRAINT [FK_SalesFact_CustomerDim]
GO
ALTER TABLE [dbo].[SalesFact]  WITH CHECK ADD  CONSTRAINT [FK_SalesFact_DateDim] FOREIGN KEY([dateID])
REFERENCES [dbo].[DateDim] ([dateID])
GO
ALTER TABLE [dbo].[SalesFact] CHECK CONSTRAINT [FK_SalesFact_DateDim]
GO
ALTER TABLE [dbo].[SalesFact]  WITH CHECK ADD  CONSTRAINT [FK_SalesFact_OrderDim] FOREIGN KEY([orderID])
REFERENCES [dbo].[OrderDim] ([orderID])
GO
ALTER TABLE [dbo].[SalesFact] CHECK CONSTRAINT [FK_SalesFact_OrderDim]
GO
ALTER TABLE [dbo].[SalesFact]  WITH CHECK ADD  CONSTRAINT [FK_SalesFact_ProductDim] FOREIGN KEY([productID])
REFERENCES [dbo].[ProductDim] ([prodID])
GO
ALTER TABLE [dbo].[SalesFact] CHECK CONSTRAINT [FK_SalesFact_ProductDim]
GO
ALTER TABLE [dbo].[SalesFact]  WITH CHECK ADD  CONSTRAINT [FK_SalesFact_PromotionDim] FOREIGN KEY([promotionID])
REFERENCES [dbo].[PromotionDim] ([promotionID])
GO
ALTER TABLE [dbo].[SalesFact] CHECK CONSTRAINT [FK_SalesFact_PromotionDim]
GO
ALTER TABLE [dbo].[SalesFact]  WITH CHECK ADD  CONSTRAINT [FK_SalesFact_StoreDim] FOREIGN KEY([storeID])
REFERENCES [dbo].[StoreDim] ([storeID])
GO
ALTER TABLE [dbo].[SalesFact] CHECK CONSTRAINT [FK_SalesFact_StoreDim]
GO
USE [master]
GO
ALTER DATABASE [Target] SET  READ_WRITE 
GO
