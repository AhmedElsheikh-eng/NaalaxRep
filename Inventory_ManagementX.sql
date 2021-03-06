USE [master]
GO
/****** Object:  Database [Inventory_ManagementX]    Script Date: 2/7/2021 7:59:28 PM ******/
CREATE DATABASE [Inventory_ManagementX]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Inventory_ManagementX', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Inventory_ManagementX.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Inventory_ManagementX_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Inventory_ManagementX_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Inventory_ManagementX] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Inventory_ManagementX].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Inventory_ManagementX] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Inventory_ManagementX] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Inventory_ManagementX] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Inventory_ManagementX] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Inventory_ManagementX] SET ARITHABORT OFF 
GO
ALTER DATABASE [Inventory_ManagementX] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Inventory_ManagementX] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Inventory_ManagementX] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Inventory_ManagementX] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Inventory_ManagementX] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Inventory_ManagementX] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Inventory_ManagementX] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Inventory_ManagementX] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Inventory_ManagementX] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Inventory_ManagementX] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Inventory_ManagementX] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Inventory_ManagementX] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Inventory_ManagementX] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Inventory_ManagementX] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Inventory_ManagementX] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Inventory_ManagementX] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Inventory_ManagementX] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Inventory_ManagementX] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Inventory_ManagementX] SET  MULTI_USER 
GO
ALTER DATABASE [Inventory_ManagementX] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Inventory_ManagementX] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Inventory_ManagementX] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Inventory_ManagementX] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Inventory_ManagementX] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Inventory_ManagementX', N'ON'
GO
USE [Inventory_ManagementX]
GO
/****** Object:  Table [dbo].[Activities]    Script Date: 2/7/2021 7:59:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activities](
	[Activity_ID] [int] IDENTITY(1,1) NOT NULL,
	[Activity_Name] [nvarchar](max) NULL,
	[Activity_AR] [nvarchar](max) NULL,
	[Status] [nchar](10) NOT NULL,
	[LastUpdate] [date] NOT NULL,
	[Entered_By] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Activities] PRIMARY KEY CLUSTERED 
(
	[Activity_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Auxiliary]    Script Date: 2/7/2021 7:59:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auxiliary](
	[Aux_ID] [int] IDENTITY(1,1) NOT NULL,
	[GL_ID] [int] NULL,
	[Aux_Name] [nvarchar](50) NULL,
	[Aux_Name_AR] [nvarchar](50) NOT NULL,
	[Entered_By] [nchar](10) NOT NULL,
	[LastUpdate] [date] NOT NULL,
	[Status] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Auxiliary] PRIMARY KEY CLUSTERED 
(
	[Aux_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Branches]    Script Date: 2/7/2021 7:59:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branches](
	[Branch_ID] [int] IDENTITY(1,1) NOT NULL,
	[City_ID] [int] NOT NULL,
	[Country_ID] [int] NOT NULL,
	[Branch_Name] [nchar](10) NULL,
	[Branch_Name_AR] [nchar](10) NOT NULL,
	[Opening_Date] [date] NULL,
	[Location] [nvarchar](max) NULL,
	[Comment] [nchar](10) NULL,
	[Status] [nchar](10) NOT NULL,
	[LastUpdate] [date] NOT NULL,
	[Entered_By] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Branches_1] PRIMARY KEY CLUSTERED 
(
	[Branch_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cities]    Script Date: 2/7/2021 7:59:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[City_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Name_AR] [nvarchar](50) NOT NULL,
	[Country_ID] [int] NOT NULL,
	[Status] [nchar](10) NOT NULL,
	[LastUpdate] [date] NOT NULL,
	[Entered_By] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Citey] PRIMARY KEY CLUSTERED 
(
	[City_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Companies]    Script Date: 2/7/2021 7:59:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[Comp_ID] [int] IDENTITY(1,1) NOT NULL,
	[Comp_Type_ID] [int] NULL,
	[City_ID] [int] NULL,
	[Country_ID] [int] NULL,
	[Comp_Name] [nchar](10) NULL,
	[Comp_Name_AR] [nchar](10) NOT NULL,
	[Logo] [nvarchar](max) NULL,
	[Activity_ID] [int] NULL,
	[Commercial_No] [nchar](10) NULL,
	[IssueDate] [date] NULL,
	[EndDate] [date] NULL,
	[Curr_ID] [int] NULL,
	[Status] [nchar](10) NOT NULL,
	[LastUpdate] [date] NOT NULL,
	[Entered_By] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[Comp_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Company_Type]    Script Date: 2/7/2021 7:59:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company_Type](
	[Comp_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Name_AR] [nvarchar](max) NULL,
	[Status] [nchar](10) NULL,
	[LastUpdate] [date] NULL,
	[Entered_By] [nvarchar](50) NULL,
 CONSTRAINT [PK_Company_Type] PRIMARY KEY CLUSTERED 
(
	[Comp_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Countries]    Script Date: 2/7/2021 7:59:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Country_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Name_AR] [nvarchar](50) NOT NULL,
	[CountryKey] [nchar](10) NULL,
	[Status] [nchar](10) NOT NULL,
	[LastUpdate] [date] NOT NULL,
	[Entered_By] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[Country_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Currencies]    Script Date: 2/7/2021 7:59:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currencies](
	[Curr_ID] [int] IDENTITY(1,1) NOT NULL,
	[Curr_Name] [nchar](10) NULL,
	[Curr_Name_AR] [nchar](10) NULL,
	[CurrentCost] [float] NOT NULL,
	[EX_Rate] [float] NULL,
	[Last_Ex_Rare_Date] [date] NULL,
	[Status] [nchar](10) NOT NULL,
	[LastUpdate] [date] NOT NULL,
	[Entered_By] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Currencies] PRIMARY KEY CLUSTERED 
(
	[Curr_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 2/7/2021 7:59:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Cus_ID] [int] IDENTITY(1,1) NOT NULL,
	[Cus_Name] [nvarchar](max) NULL,
	[Cus_Name_AR] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Phone] [int] NULL,
	[E_Mail] [nvarchar](50) NULL,
	[Web_Site] [nvarchar](50) NULL,
	[Entered_By] [nvarchar](50) NOT NULL,
	[LastUpdate] [date] NOT NULL,
	[Status] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Cus_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employess]    Script Date: 2/7/2021 7:59:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employess](
	[Emp_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Name_AR] [nvarchar](max) NOT NULL,
	[Job_Tittle] [nvarchar](50) NULL,
	[Status] [nchar](10) NOT NULL,
	[LastUpdate] [date] NOT NULL,
	[Entered_By] [nchar](10) NOT NULL,
	[Branch_ID] [int] NULL,
 CONSTRAINT [PK_Employess] PRIMARY KEY CLUSTERED 
(
	[Emp_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GL]    Script Date: 2/7/2021 7:59:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GL](
	[GL_ID] [int] IDENTITY(1,1) NOT NULL,
	[Genreal_Name] [nvarchar](50) NULL,
	[Genreal_Name_AR] [nvarchar](50) NULL,
	[Status] [nchar](10) NOT NULL,
	[LastUpdate] [date] NOT NULL,
	[Entered_By] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_GL] PRIMARY KEY CLUSTERED 
(
	[GL_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Installment]    Script Date: 2/7/2021 7:59:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Installment](
	[Inst_ID] [int] IDENTITY(1,1) NOT NULL,
	[Cus_ID] [int] NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[No_Of_Inst] [int] NOT NULL,
	[Amount] [float] NOT NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_Installment] PRIMARY KEY CLUSTERED 
(
	[Inst_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 2/7/2021 7:59:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[Invoice_ID] [int] IDENTITY(1,1) NOT NULL,
	[Isuue_Date] [date] NOT NULL,
	[Cus_ID] [int] NULL,
	[Supp_ID] [int] NULL,
	[Comp_ID] [int] NULL,
	[Item_ID] [int] NOT NULL,
	[Unit_ID] [int] NOT NULL,
	[Qunt] [int] NOT NULL,
	[Price_Unit] [float] NOT NULL,
	[DisCount] [float] NULL,
	[Branch_ID] [int] NOT NULL,
	[Tax_No] [int] NULL,
	[Tax_NoFor_Comp] [int] NULL,
	[Payment_Method] [nchar](10) NOT NULL,
	[Curr_ID] [int] NOT NULL,
	[WareHouse_ID] [int] NULL,
	[Status] [nchar](10) NOT NULL,
	[LastUpdate] [date] NOT NULL,
	[Entered_By] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[Invoice_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Items]    Script Date: 2/7/2021 7:59:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[Item_ID] [int] IDENTITY(1,1) NOT NULL,
	[Item_Grp_ID] [int] NULL,
	[BarCode] [int] NULL,
	[Item_Name] [nvarchar](max) NULL,
	[Item_Name_AR] [nvarchar](max) NOT NULL,
	[Unit_ID] [int] NOT NULL,
	[Qunt] [int] NULL,
	[OpeningBalance] [float] NULL,
	[PriceForOnce] [float] NULL,
	[Price_dozen] [float] NULL,
	[Min_Limit] [int] NULL,
	[Max_Limit] [int] NULL,
	[Exp_Date] [date] NULL,
	[Comp_ID] [int] NULL,
	[Country_ID] [int] NULL,
	[City_ID] [int] NULL,
	[Status] [nchar](10) NOT NULL,
	[LastUpdate] [date] NOT NULL,
	[Entered_By] [nvarchar](50) NOT NULL,
	[Warehouse_ID] [int] NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[Item_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Items_Group]    Script Date: 2/7/2021 7:59:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items_Group](
	[Item_Grp_ID] [int] IDENTITY(1,1) NOT NULL,
	[Item_Grp_Name] [nvarchar](max) NULL,
	[Item_GrpName_AR] [nvarchar](max) NOT NULL,
	[Comment] [nchar](10) NULL,
	[Status] [nchar](10) NOT NULL,
	[LastUpdate] [date] NOT NULL,
	[Entered_By] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Items_Group] PRIMARY KEY CLUSTERED 
(
	[Item_Grp_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 2/7/2021 7:59:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[Supp_ID] [int] IDENTITY(1,1) NOT NULL,
	[Supp_Name] [nvarchar](max) NULL,
	[Supp_Name_AR] [nvarchar](max) NULL,
	[Phone] [int] NULL,
	[Address] [nvarchar](max) NULL,
	[E_Mail] [nvarchar](50) NULL,
	[Web_Site] [nvarchar](50) NULL,
	[Representative_Name] [nvarchar](max) NULL,
	[Representative_Phone] [int] NULL,
	[Status] [nchar](10) NOT NULL,
	[LastUpdate] [date] NOT NULL,
	[Entered_By] [nvarchar](50) NOT NULL,
	[Country_ID] [int] NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[Supp_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tree]    Script Date: 2/7/2021 7:59:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tree](
	[Acc_No] [int] IDENTITY(1,1) NOT NULL,
	[GL_ID] [int] NOT NULL,
	[Aux_ID] [int] NOT NULL,
	[Acc_Name] [nvarchar](50) NULL,
	[Acc_Name_AR] [nvarchar](50) NULL,
	[Type] [nchar](10) NULL,
	[Status] [nchar](10) NOT NULL,
	[LastUpdate] [date] NOT NULL,
	[Entered_By] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Tree] PRIMARY KEY CLUSTERED 
(
	[Acc_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Units]    Script Date: 2/7/2021 7:59:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Units](
	[Unit_ID] [int] IDENTITY(1,1) NOT NULL,
	[Unit_Name] [nchar](10) NULL,
	[Unit_Name_AR] [nchar](10) NOT NULL,
	[Comment] [nchar](10) NULL,
	[Status] [nchar](10) NOT NULL,
	[LastUpdate] [date] NOT NULL,
	[Entered_By] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Units] PRIMARY KEY CLUSTERED 
(
	[Unit_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WareHouse]    Script Date: 2/7/2021 7:59:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WareHouse](
	[Warehouse_ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Name_AR] [nvarchar](max) NOT NULL,
	[Emp_ID] [int] NULL,
	[Keeper_Phone] [int] NULL,
	[Size] [float] NULL,
	[Location] [nvarchar](max) NULL,
	[Entered_By] [nvarchar](50) NOT NULL,
	[LastUpdate] [date] NOT NULL,
	[Status] [nchar](10) NOT NULL,
	[Branch_ID] [int] NULL,
 CONSTRAINT [PK_WareHouse] PRIMARY KEY CLUSTERED 
(
	[Warehouse_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[Activities] ADD  CONSTRAINT [DF_Activities_Status]  DEFAULT (N'Active,Closed,Entered,Pending,Deleted,Approved') FOR [Status]
GO
ALTER TABLE [dbo].[Auxiliary] ADD  CONSTRAINT [DF_Auxiliary_Status]  DEFAULT (N'Active,Closed,Entered,Pending,Deleted,Approved') FOR [Status]
GO
ALTER TABLE [dbo].[Branches] ADD  CONSTRAINT [DF_Branches_Status]  DEFAULT (N'Active,Closed,Entered,Pending,Deleted,Approved') FOR [Status]
GO
ALTER TABLE [dbo].[Cities] ADD  CONSTRAINT [DF_Cities_Status]  DEFAULT (N'Active,Closed,Entered,Pending,Deleted,Approved') FOR [Status]
GO
ALTER TABLE [dbo].[Companies] ADD  CONSTRAINT [DF_Companies_Status]  DEFAULT (N'Active,Closed,Entered,Pending,Deleted,Approved') FOR [Status]
GO
ALTER TABLE [dbo].[Auxiliary]  WITH CHECK ADD  CONSTRAINT [FK_Auxiliary_GL] FOREIGN KEY([GL_ID])
REFERENCES [dbo].[GL] ([GL_ID])
GO
ALTER TABLE [dbo].[Auxiliary] CHECK CONSTRAINT [FK_Auxiliary_GL]
GO
ALTER TABLE [dbo].[Branches]  WITH CHECK ADD  CONSTRAINT [FK_Branches_City] FOREIGN KEY([City_ID])
REFERENCES [dbo].[Cities] ([City_ID])
GO
ALTER TABLE [dbo].[Branches] CHECK CONSTRAINT [FK_Branches_City]
GO
ALTER TABLE [dbo].[Branches]  WITH CHECK ADD  CONSTRAINT [FK_Branches_Country] FOREIGN KEY([Country_ID])
REFERENCES [dbo].[Countries] ([Country_ID])
GO
ALTER TABLE [dbo].[Branches] CHECK CONSTRAINT [FK_Branches_Country]
GO
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_Cities_Country] FOREIGN KEY([Country_ID])
REFERENCES [dbo].[Countries] ([Country_ID])
GO
ALTER TABLE [dbo].[Cities] CHECK CONSTRAINT [FK_Cities_Country]
GO
ALTER TABLE [dbo].[Companies]  WITH CHECK ADD  CONSTRAINT [FK_Companies_Activity] FOREIGN KEY([Activity_ID])
REFERENCES [dbo].[Activities] ([Activity_ID])
GO
ALTER TABLE [dbo].[Companies] CHECK CONSTRAINT [FK_Companies_Activity]
GO
ALTER TABLE [dbo].[Companies]  WITH CHECK ADD  CONSTRAINT [FK_Companies_City] FOREIGN KEY([City_ID])
REFERENCES [dbo].[Cities] ([City_ID])
GO
ALTER TABLE [dbo].[Companies] CHECK CONSTRAINT [FK_Companies_City]
GO
ALTER TABLE [dbo].[Companies]  WITH CHECK ADD  CONSTRAINT [FK_Companies_CompType] FOREIGN KEY([Comp_Type_ID])
REFERENCES [dbo].[Company_Type] ([Comp_Type_ID])
GO
ALTER TABLE [dbo].[Companies] CHECK CONSTRAINT [FK_Companies_CompType]
GO
ALTER TABLE [dbo].[Companies]  WITH CHECK ADD  CONSTRAINT [FK_Companies_Country] FOREIGN KEY([Country_ID])
REFERENCES [dbo].[Countries] ([Country_ID])
GO
ALTER TABLE [dbo].[Companies] CHECK CONSTRAINT [FK_Companies_Country]
GO
ALTER TABLE [dbo].[Companies]  WITH CHECK ADD  CONSTRAINT [FK_Companies_Curr] FOREIGN KEY([Curr_ID])
REFERENCES [dbo].[Currencies] ([Curr_ID])
GO
ALTER TABLE [dbo].[Companies] CHECK CONSTRAINT [FK_Companies_Curr]
GO
ALTER TABLE [dbo].[Employess]  WITH CHECK ADD  CONSTRAINT [FK_Employess_Branches] FOREIGN KEY([Branch_ID])
REFERENCES [dbo].[Branches] ([Branch_ID])
GO
ALTER TABLE [dbo].[Employess] CHECK CONSTRAINT [FK_Employess_Branches]
GO
ALTER TABLE [dbo].[Installment]  WITH CHECK ADD  CONSTRAINT [FK_Installment_Cust] FOREIGN KEY([Cus_ID])
REFERENCES [dbo].[Customers] ([Cus_ID])
GO
ALTER TABLE [dbo].[Installment] CHECK CONSTRAINT [FK_Installment_Cust]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Branch] FOREIGN KEY([Branch_ID])
REFERENCES [dbo].[Branches] ([Branch_ID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Branch]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Comp] FOREIGN KEY([Comp_ID])
REFERENCES [dbo].[Companies] ([Comp_ID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Comp]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Curr] FOREIGN KEY([Curr_ID])
REFERENCES [dbo].[Currencies] ([Curr_ID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Curr]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Cus] FOREIGN KEY([Cus_ID])
REFERENCES [dbo].[Customers] ([Cus_ID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Cus]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Items] FOREIGN KEY([Item_ID])
REFERENCES [dbo].[Items] ([Item_ID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Items]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Supp] FOREIGN KEY([Supp_ID])
REFERENCES [dbo].[Suppliers] ([Supp_ID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Supp]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Unit] FOREIGN KEY([Unit_ID])
REFERENCES [dbo].[Units] ([Unit_ID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Unit]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Ware] FOREIGN KEY([WareHouse_ID])
REFERENCES [dbo].[WareHouse] ([Warehouse_ID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Ware]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_City] FOREIGN KEY([City_ID])
REFERENCES [dbo].[Cities] ([City_ID])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_City]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Comp] FOREIGN KEY([Comp_ID])
REFERENCES [dbo].[Companies] ([Comp_ID])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Comp]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Country] FOREIGN KEY([Country_ID])
REFERENCES [dbo].[Countries] ([Country_ID])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Country]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_IteGr] FOREIGN KEY([Item_Grp_ID])
REFERENCES [dbo].[Items_Group] ([Item_Grp_ID])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_IteGr]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Unit] FOREIGN KEY([Unit_ID])
REFERENCES [dbo].[Units] ([Unit_ID])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Unit]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_WareH] FOREIGN KEY([Warehouse_ID])
REFERENCES [dbo].[WareHouse] ([Warehouse_ID])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_WareH]
GO
ALTER TABLE [dbo].[Suppliers]  WITH CHECK ADD  CONSTRAINT [FK_Suppliers_SuppliersCountry] FOREIGN KEY([Country_ID])
REFERENCES [dbo].[Countries] ([Country_ID])
GO
ALTER TABLE [dbo].[Suppliers] CHECK CONSTRAINT [FK_Suppliers_SuppliersCountry]
GO
ALTER TABLE [dbo].[Tree]  WITH CHECK ADD  CONSTRAINT [FK_Tree_Aux] FOREIGN KEY([Aux_ID])
REFERENCES [dbo].[Auxiliary] ([Aux_ID])
GO
ALTER TABLE [dbo].[Tree] CHECK CONSTRAINT [FK_Tree_Aux]
GO
ALTER TABLE [dbo].[Tree]  WITH CHECK ADD  CONSTRAINT [FK_Tree_GL] FOREIGN KEY([GL_ID])
REFERENCES [dbo].[GL] ([GL_ID])
GO
ALTER TABLE [dbo].[Tree] CHECK CONSTRAINT [FK_Tree_GL]
GO
ALTER TABLE [dbo].[WareHouse]  WITH CHECK ADD  CONSTRAINT [FK_WareHouse_Branch] FOREIGN KEY([Branch_ID])
REFERENCES [dbo].[Branches] ([Branch_ID])
GO
ALTER TABLE [dbo].[WareHouse] CHECK CONSTRAINT [FK_WareHouse_Branch]
GO
ALTER TABLE [dbo].[WareHouse]  WITH CHECK ADD  CONSTRAINT [FK_WareHouse_Emp] FOREIGN KEY([Emp_ID])
REFERENCES [dbo].[Employess] ([Emp_ID])
GO
ALTER TABLE [dbo].[WareHouse] CHECK CONSTRAINT [FK_WareHouse_Emp]
GO
ALTER TABLE [dbo].[Activities]  WITH CHECK ADD  CONSTRAINT [CK_ActivitiesStatus] CHECK  (([Status]='Active,Closed,Entered,Pending,Deleted,Approved'))
GO
ALTER TABLE [dbo].[Activities] CHECK CONSTRAINT [CK_ActivitiesStatus]
GO
ALTER TABLE [dbo].[Auxiliary]  WITH CHECK ADD  CONSTRAINT [CK_AuxiliaryStatus] CHECK  (([Status]='Active,Closed,Entered,Pending,Deleted,Approved'))
GO
ALTER TABLE [dbo].[Auxiliary] CHECK CONSTRAINT [CK_AuxiliaryStatus]
GO
ALTER TABLE [dbo].[Branches]  WITH CHECK ADD  CONSTRAINT [CK_BranchesStatus] CHECK  (([Status]='Active,Closed,Entered,Pending,Deleted,Approved'))
GO
ALTER TABLE [dbo].[Branches] CHECK CONSTRAINT [CK_BranchesStatus]
GO
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD  CONSTRAINT [CK_CitiesStatus] CHECK  (([Status]='Active,Closed,Entered,Pending,Deleted,Approved'))
GO
ALTER TABLE [dbo].[Cities] CHECK CONSTRAINT [CK_CitiesStatus]
GO
ALTER TABLE [dbo].[Companies]  WITH CHECK ADD  CONSTRAINT [CK_CompaniesStatus] CHECK  (([Status]='Active,Closed,Entered,Pending,Deleted,Approved'))
GO
ALTER TABLE [dbo].[Companies] CHECK CONSTRAINT [CK_CompaniesStatus]
GO
ALTER TABLE [dbo].[Countries]  WITH CHECK ADD  CONSTRAINT [CK_CountriesStatus] CHECK  (([Status]='Active,Closed,Entered,Pending,Deleted,Approved'))
GO
ALTER TABLE [dbo].[Countries] CHECK CONSTRAINT [CK_CountriesStatus]
GO
ALTER TABLE [dbo].[Currencies]  WITH CHECK ADD  CONSTRAINT [CK_CurrenciesStatus] CHECK  (([Status]='Active,Closed,Entered,Pending,Deleted,Approved'))
GO
ALTER TABLE [dbo].[Currencies] CHECK CONSTRAINT [CK_CurrenciesStatus]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [CK_CustomersStatus] CHECK  (([Status]='Active,Closed,Entered,Pending,Deleted,Approved'))
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [CK_CustomersStatus]
GO
ALTER TABLE [dbo].[Employess]  WITH CHECK ADD  CONSTRAINT [CK_EmployessStatus] CHECK  (([Status]='Active,Closed,Entered,Pending,Deleted,Approved'))
GO
ALTER TABLE [dbo].[Employess] CHECK CONSTRAINT [CK_EmployessStatus]
GO
ALTER TABLE [dbo].[GL]  WITH CHECK ADD  CONSTRAINT [CK_GLStatus] CHECK  (([Status]='Active,Closed,Entered,Pending,Deleted,Approved'))
GO
ALTER TABLE [dbo].[GL] CHECK CONSTRAINT [CK_GLStatus]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [CK_InvoiceStatus] CHECK  (([Status]='Active,Closed,Entered,Pending,Deleted,Approved'))
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [CK_InvoiceStatus]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [CK_ItemsStatus] CHECK  (([Status]='Active,Closed,Entered,Pending,Deleted,Approved'))
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [CK_ItemsStatus]
GO
ALTER TABLE [dbo].[Items_Group]  WITH CHECK ADD  CONSTRAINT [CK_Items_GroupStatus] CHECK  (([Status]='Active,Closed,Entered,Pending,Deleted,Approved'))
GO
ALTER TABLE [dbo].[Items_Group] CHECK CONSTRAINT [CK_Items_GroupStatus]
GO
ALTER TABLE [dbo].[Suppliers]  WITH CHECK ADD  CONSTRAINT [Status] CHECK  (([Status]='Active,Closed,Entered,Pending,Deleted,Approved'))
GO
ALTER TABLE [dbo].[Suppliers] CHECK CONSTRAINT [Status]
GO
ALTER TABLE [dbo].[Tree]  WITH CHECK ADD  CONSTRAINT [CK_TreeStatus] CHECK  (([Status]='Active,Closed,Entered,Pending,Deleted,Approved'))
GO
ALTER TABLE [dbo].[Tree] CHECK CONSTRAINT [CK_TreeStatus]
GO
ALTER TABLE [dbo].[Units]  WITH CHECK ADD  CONSTRAINT [CK_UnitsStatus] CHECK  (([Status]='Active,Closed,Entered,Pending,Deleted,Approved'))
GO
ALTER TABLE [dbo].[Units] CHECK CONSTRAINT [CK_UnitsStatus]
GO
ALTER TABLE [dbo].[WareHouse]  WITH CHECK ADD  CONSTRAINT [CK_WareHouseStatus] CHECK  (([Status]='Active,Closed,Entered,Pending,Deleted,Approved'))
GO
ALTER TABLE [dbo].[WareHouse] CHECK CONSTRAINT [CK_WareHouseStatus]
GO
USE [master]
GO
ALTER DATABASE [Inventory_ManagementX] SET  READ_WRITE 
GO
