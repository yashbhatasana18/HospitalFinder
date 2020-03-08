USE [master]
GO
/****** Object:  Database [3TierHospitalFinder]    Script Date: 3/8/2020 1:06:15 PM ******/
CREATE DATABASE [3TierHospitalFinder] ON  PRIMARY 
( NAME = N'3TierHospitalFinder', FILENAME = N'E:\DE_bk\3TierHospitalFinder.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'3TierHospitalFinder_log', FILENAME = N'E:\DE_bk\3TierHospitalFinder_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [3TierHospitalFinder].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [3TierHospitalFinder] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [3TierHospitalFinder] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [3TierHospitalFinder] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [3TierHospitalFinder] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [3TierHospitalFinder] SET ARITHABORT OFF 
GO
ALTER DATABASE [3TierHospitalFinder] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [3TierHospitalFinder] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [3TierHospitalFinder] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [3TierHospitalFinder] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [3TierHospitalFinder] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [3TierHospitalFinder] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [3TierHospitalFinder] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [3TierHospitalFinder] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [3TierHospitalFinder] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [3TierHospitalFinder] SET  DISABLE_BROKER 
GO
ALTER DATABASE [3TierHospitalFinder] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [3TierHospitalFinder] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [3TierHospitalFinder] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [3TierHospitalFinder] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [3TierHospitalFinder] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [3TierHospitalFinder] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [3TierHospitalFinder] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [3TierHospitalFinder] SET  MULTI_USER 
GO
ALTER DATABASE [3TierHospitalFinder] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [3TierHospitalFinder] SET DB_CHAINING OFF 
GO
USE [3TierHospitalFinder]
GO
/****** Object:  Table [dbo].[MST_Category]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MST_Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
	[CreationDate] [datetime] NOT NULL CONSTRAINT [DF_HospitalCategory_CreationDate]  DEFAULT (getdate()),
	[ModificationDate] [datetime] NOT NULL CONSTRAINT [DF_MST_Category_ModificationDate]  DEFAULT (getdate()),
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_HospitalCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MST_CategoryType]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MST_CategoryType](
	[CategoryTypeID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryType] [varchar](50) NOT NULL,
	[CreationDate] [datetime] NOT NULL CONSTRAINT [DF_CategoryType_CreationDate]  DEFAULT (getdate()),
	[ModificationDate] [datetime] NOT NULL CONSTRAINT [DF_CategoryType_ModificationDate]  DEFAULT (getdate()),
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_CategoryType] PRIMARY KEY CLUSTERED 
(
	[CategoryTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MST_City]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MST_City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[StateID] [int] NOT NULL,
	[CityName] [varchar](50) NOT NULL,
	[PinCode] [varchar](10) NULL,
	[STDCode] [varchar](10) NULL,
	[CreationDate] [datetime] NOT NULL CONSTRAINT [DF_MST_City_CreationDate]  DEFAULT (getdate()),
	[ModificationDate] [datetime] NOT NULL CONSTRAINT [DF_MST_City_ModificationDate]  DEFAULT (getdate()),
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_LOC_City] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MST_Hospital]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MST_Hospital](
	[HospitalID] [int] IDENTITY(1,1) NOT NULL,
	[HospitalName] [varchar](150) NOT NULL,
	[CityID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[CategoryTypeID] [int] NOT NULL,
	[Address] [varchar](250) NOT NULL,
	[MobileNumber] [varchar](100) NULL,
	[TelePhoneNumber] [varchar](100) NULL,
	[Fax] [varchar](100) NULL,
	[Website] [varchar](100) NULL,
	[EmailID] [varchar](100) NULL,
	[AmbulancePhoneNumber] [varchar](100) NULL,
	[EmergencyNumber] [varchar](100) NULL,
	[CreationDate] [datetime] NOT NULL CONSTRAINT [DF_Hospital_CreationDate]  DEFAULT (getdate()),
	[ModificationDate] [datetime] NOT NULL CONSTRAINT [DF_Hospital_ModificationDate]  DEFAULT (getdate()),
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_Hospital] PRIMARY KEY CLUSTERED 
(
	[HospitalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MST_State]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MST_State](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [varchar](100) NOT NULL,
	[CreationDate] [datetime] NOT NULL CONSTRAINT [DF_MST_State_CreationDate]  DEFAULT (getdate()),
	[ModificationDate] [datetime] NOT NULL CONSTRAINT [DF_MST_State_ModificationDate]  DEFAULT (getdate()),
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_MST_State] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SEC_User]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SEC_User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](100) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[CreationDate] [datetime] NOT NULL CONSTRAINT [DF_SEC_User_CreationDate]  DEFAULT (getdate()),
	[ModificationDate] [datetime] NOT NULL CONSTRAINT [DF_SEC_User_ModificationDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_SEC_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[MST_Category] ON 

INSERT [dbo].[MST_Category] ([CategoryID], [CategoryName], [CreationDate], [ModificationDate], [UserID]) VALUES (1, N'abc', CAST(N'2020-03-08 09:29:19.193' AS DateTime), CAST(N'2020-03-08 09:29:19.193' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[MST_Category] OFF
SET IDENTITY_INSERT [dbo].[MST_CategoryType] ON 

INSERT [dbo].[MST_CategoryType] ([CategoryTypeID], [CategoryType], [CreationDate], [ModificationDate], [UserID]) VALUES (1, N'orthopedic', CAST(N'2020-03-08 09:29:57.090' AS DateTime), CAST(N'2020-03-08 09:29:57.090' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[MST_CategoryType] OFF
SET IDENTITY_INSERT [dbo].[MST_City] ON 

INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [PinCode], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (1, 1, N'Rajkot ', N'360001', N'281', CAST(N'2020-03-08 09:30:44.877' AS DateTime), CAST(N'2020-03-08 09:30:44.877' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[MST_City] OFF
SET IDENTITY_INSERT [dbo].[MST_Hospital] ON 

INSERT [dbo].[MST_Hospital] ([HospitalID], [HospitalName], [CityID], [CategoryID], [CategoryTypeID], [Address], [MobileNumber], [TelePhoneNumber], [Fax], [Website], [EmailID], [AmbulancePhoneNumber], [EmergencyNumber], [CreationDate], [ModificationDate], [UserID]) VALUES (3, N'Sterling', 1, 1, 1, N'xyz', N'1234567898', N'8798564565', N'asb@gah.com', N'asb@gah.com', N'asb@gah.com', N'1234569875', N'2136524023', CAST(N'2020-03-08 09:30:48.077' AS DateTime), CAST(N'2020-03-08 09:30:48.077' AS DateTime), 1)
INSERT [dbo].[MST_Hospital] ([HospitalID], [HospitalName], [CityID], [CategoryID], [CategoryTypeID], [Address], [MobileNumber], [TelePhoneNumber], [Fax], [Website], [EmailID], [AmbulancePhoneNumber], [EmergencyNumber], [CreationDate], [ModificationDate], [UserID]) VALUES (4, N'ghjh1213', 1, 1, 1, N'hjghgj', N'12312', N'123213', N'4156', N'ghk.gui', N'ghjhgj', N'123123', N'1231', CAST(N'2020-03-08 12:54:12.167' AS DateTime), CAST(N'2020-03-08 12:54:33.570' AS DateTime), 3)
SET IDENTITY_INSERT [dbo].[MST_Hospital] OFF
SET IDENTITY_INSERT [dbo].[MST_State] ON 

INSERT [dbo].[MST_State] ([StateID], [StateName], [CreationDate], [ModificationDate], [UserID]) VALUES (1, N'Gujarat ', CAST(N'2020-03-08 09:30:26.743' AS DateTime), CAST(N'2020-03-08 09:30:26.743' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[MST_State] OFF
SET IDENTITY_INSERT [dbo].[SEC_User] ON 

INSERT [dbo].[SEC_User] ([UserID], [UserName], [Password], [Email], [CreationDate], [ModificationDate]) VALUES (1, N'yash', N'1', N'yashbhatasana1852@gmail.com ', CAST(N'2020-03-01 18:39:33.657' AS DateTime), CAST(N'2020-03-01 19:31:01.843' AS DateTime))
INSERT [dbo].[SEC_User] ([UserID], [UserName], [Password], [Email], [CreationDate], [ModificationDate]) VALUES (2, N'rutvik', N'1', N'pesivadiyarutvik@gmail.com', CAST(N'2020-03-08 12:09:53.903' AS DateTime), CAST(N'2020-03-08 12:09:53.903' AS DateTime))
INSERT [dbo].[SEC_User] ([UserID], [UserName], [Password], [Email], [CreationDate], [ModificationDate]) VALUES (3, N'raj', N'1', N'	rajakbari25@gmail.com', CAST(N'2020-03-08 12:10:26.070' AS DateTime), CAST(N'2020-03-08 12:10:26.070' AS DateTime))
INSERT [dbo].[SEC_User] ([UserID], [UserName], [Password], [Email], [CreationDate], [ModificationDate]) VALUES (4, N'darshit', N'1', N'vdrt1999@gmail.com', CAST(N'2020-03-08 12:10:50.710' AS DateTime), CAST(N'2020-03-08 12:10:50.710' AS DateTime))
SET IDENTITY_INSERT [dbo].[SEC_User] OFF
ALTER TABLE [dbo].[MST_Category]  WITH CHECK ADD  CONSTRAINT [FK_MST_Category_SEC_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[SEC_User] ([UserID])
GO
ALTER TABLE [dbo].[MST_Category] CHECK CONSTRAINT [FK_MST_Category_SEC_User]
GO
ALTER TABLE [dbo].[MST_CategoryType]  WITH CHECK ADD  CONSTRAINT [FK_MST_CategoryType_SEC_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[SEC_User] ([UserID])
GO
ALTER TABLE [dbo].[MST_CategoryType] CHECK CONSTRAINT [FK_MST_CategoryType_SEC_User]
GO
ALTER TABLE [dbo].[MST_City]  WITH CHECK ADD  CONSTRAINT [FK_MST_City_MST_State] FOREIGN KEY([StateID])
REFERENCES [dbo].[MST_State] ([StateID])
GO
ALTER TABLE [dbo].[MST_City] CHECK CONSTRAINT [FK_MST_City_MST_State]
GO
ALTER TABLE [dbo].[MST_City]  WITH CHECK ADD  CONSTRAINT [FK_MST_City_SEC_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[SEC_User] ([UserID])
GO
ALTER TABLE [dbo].[MST_City] CHECK CONSTRAINT [FK_MST_City_SEC_User]
GO
ALTER TABLE [dbo].[MST_Hospital]  WITH CHECK ADD  CONSTRAINT [FK_MST_Hospital_MST_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[MST_Category] ([CategoryID])
GO
ALTER TABLE [dbo].[MST_Hospital] CHECK CONSTRAINT [FK_MST_Hospital_MST_Category]
GO
ALTER TABLE [dbo].[MST_Hospital]  WITH CHECK ADD  CONSTRAINT [FK_MST_Hospital_MST_CategoryType] FOREIGN KEY([CategoryTypeID])
REFERENCES [dbo].[MST_CategoryType] ([CategoryTypeID])
GO
ALTER TABLE [dbo].[MST_Hospital] CHECK CONSTRAINT [FK_MST_Hospital_MST_CategoryType]
GO
ALTER TABLE [dbo].[MST_Hospital]  WITH CHECK ADD  CONSTRAINT [FK_MST_Hospital_MST_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[MST_City] ([CityID])
GO
ALTER TABLE [dbo].[MST_Hospital] CHECK CONSTRAINT [FK_MST_Hospital_MST_City]
GO
ALTER TABLE [dbo].[MST_Hospital]  WITH CHECK ADD  CONSTRAINT [FK_MST_Hospital_SEC_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[SEC_User] ([UserID])
GO
ALTER TABLE [dbo].[MST_Hospital] CHECK CONSTRAINT [FK_MST_Hospital_SEC_User]
GO
ALTER TABLE [dbo].[MST_State]  WITH CHECK ADD  CONSTRAINT [FK_MST_State_SEC_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[SEC_User] ([UserID])
GO
ALTER TABLE [dbo].[MST_State] CHECK CONSTRAINT [FK_MST_State_SEC_User]
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Category_DeleteByPK]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_Category_DeleteByPK]
	@CategoryID int

AS

DELETE FROM [dbo].[MST_Category]

WHERE [dbo].[MST_Category].[CategoryID] = @CategoryID




GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Category_Insert]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_Category_Insert]

	@CategoryName		varchar(50),
	@CreationDate		datetime,
	@ModificationDate	datetime,
	@UserID				int

AS

INSERT INTO [dbo].[MST_Category]
           (
		   [CategoryName]
           ,[CreationDate]
		   ,[ModificationDate]
		   ,[UserID]
		   )
     VALUES
           (
				@CategoryName,
				@CreationDate,
				@ModificationDate,
				@UserID
			)



GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Category_SelectAll]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_Category_SelectAll]

AS

SELECT
	[dbo].[MST_Category].[CategoryID],
	[dbo].[MST_Category].[CategoryName],
	[dbo].[MST_Category].[CreationDate],
	[dbo].[MST_Category].[ModificationDate],
	[dbo].[SEC_User].[UserName]

FROM	[dbo].[MST_Category]

INNER JOIN [dbo].[SEC_User]
ON [dbo].[SEC_User].[UserID] = [dbo].[MST_Category].[UserID]

ORDER BY [dbo].[MST_Category].[CategoryName]

GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Category_SelectByPK]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_Category_SelectByPK]
	@CategoryID	int
AS

SELECT
	[dbo].[MST_Category].[CategoryID],
	[dbo].[MST_Category].[CategoryName]

FROM	[dbo].[MST_Category]

WHERE [dbo].[MST_Category].[CategoryID]	=	@CategoryID

ORDER BY [dbo].[MST_Category].[CategoryName]

GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Category_SelectDropDownList]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_Category_SelectDropDownList]

AS

SELECT
	[dbo].[MST_Category].[CategoryName],
	[dbo].[MST_Category].[CategoryID]

FROM	[dbo].[MST_Category]

ORDER BY [dbo].[MST_Category].[CategoryName]

GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Category_UpdateByPK]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_Category_UpdateByPK]
	@CategoryID int,
	@CategoryName varchar(50),
	@ModificationDate datetime
	
AS

UPDATE	[dbo].[MST_Category]

SET		[dbo].[MST_Category].[CategoryName]		= @CategoryName,
		[dbo].[MST_Category].[ModificationDate] = @ModificationDate

WHERE	[dbo].[MST_Category].[CategoryID] = @CategoryID


GO
/****** Object:  StoredProcedure [dbo].[PR_MST_CategoryType_DeleteByPK]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_CategoryType_DeleteByPK]
	@CategoryTypeID int

AS

DELETE FROM [dbo].[MST_CategoryType]

WHERE [dbo].[MST_CategoryType].[CategoryTypeID] = @CategoryTypeID




GO
/****** Object:  StoredProcedure [dbo].[PR_MST_CategoryType_Insert]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_CategoryType_Insert]

	@CategoryType		varchar(50),
	@CreationDate		datetime,
	@ModificationDate	datetime,
	@UserID				int

AS

INSERT INTO [dbo].[MST_CategoryType]
           (
		   [CategoryType]
           ,[CreationDate]
		   ,[ModificationDate]
		   ,[UserID]
		   )
     VALUES
           (
				@CategoryType,
				@CreationDate,
				@ModificationDate,
				@UserID
			)



GO
/****** Object:  StoredProcedure [dbo].[PR_MST_CategoryType_SelectAll]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_CategoryType_SelectAll]

AS

SELECT
	[dbo].[MST_CategoryType].[CategoryTypeID],
	[dbo].[MST_CategoryType].[CategoryType],
	[dbo].[MST_CategoryType].[CreationDate],
	[dbo].[MST_CategoryType].[ModificationDate],
	[dbo].[SEC_User].[UserName]

FROM	[dbo].[MST_CategoryType]

INNER JOIN [dbo].[SEC_User]
ON [dbo].[SEC_User].[UserID] = [dbo].[MST_CategoryType].[UserID]

ORDER BY [dbo].[MST_CategoryType].[CategoryType]

GO
/****** Object:  StoredProcedure [dbo].[PR_MST_CategoryType_SelectByPK]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_CategoryType_SelectByPK]
	@CategoryTypeID	int
AS

SELECT
	[dbo].[MST_CategoryType].[CategoryTypeID],
	[dbo].[MST_CategoryType].[CategoryType]

FROM	[dbo].[MST_CategoryType]

WHERE [dbo].[MST_CategoryType].[CategoryTypeID]	=	@CategoryTypeID

ORDER BY [dbo].[MST_CategoryType].[CategoryType]

GO
/****** Object:  StoredProcedure [dbo].[PR_MST_CategoryType_SelectDropDownList]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_CategoryType_SelectDropDownList]

AS

SELECT
	[dbo].[MST_CategoryType].[CategoryType],
	[dbo].[MST_CategoryType].[CategoryTypeID],
	[dbo].[MST_CategoryType].[UserID]

FROM	[dbo].[MST_CategoryType]

ORDER BY [dbo].[MST_CategoryType].[CategoryType]

GO
/****** Object:  StoredProcedure [dbo].[PR_MST_CategoryType_UpdateByPK]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_CategoryType_UpdateByPK]
	@CategoryTypeID int,
	@CategoryType varchar(50),
	@ModificationDate datetime
	
AS

UPDATE	[dbo].[MST_CategoryType]

SET		[dbo].[MST_CategoryType].[CategoryType] = @CategoryType,
		[dbo].[MST_CategoryType].[ModificationDate] = @ModificationDate

WHERE	[dbo].[MST_CategoryType].[CategoryTypeID] = @CategoryTypeID


GO
/****** Object:  StoredProcedure [dbo].[PR_MST_City_DeleteByPK]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_City_DeleteByPK]
	@CityID int

AS

DELETE FROM [dbo].[MST_City]

WHERE [dbo].[MST_City].[CityID] = @CityID




GO
/****** Object:  StoredProcedure [dbo].[PR_MST_City_Insert]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_City_Insert]

					@StateID			int,
					@CityName			varchar(50),
					@PinCode			varchar(50),
					@STDCode			varchar(50),
					@CreationDate		datetime,
					@ModificationDate	datetime,
					@UserID				int

AS

INSERT INTO [dbo].[MST_City]
           (
					 [StateID]
					,[CityName]
					,[PinCode]
					,[STDCode]
					,[CreationDate]
					,[ModificationDate]
					,[UserID]
		   )
     VALUES
           (
					@StateID 
				   ,@CityName
				   ,@PinCode 
				   ,@STDCode 
				   ,@CreationDate
				   ,@ModificationDate
				   ,@UserID
		   )




GO
/****** Object:  StoredProcedure [dbo].[PR_MST_City_SelectAll]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_City_SelectAll]

AS

SELECT [dbo].[MST_City].[CityID]
	  ,[dbo].[MST_City].[CityName]
	  ,[dbo].[MST_State].[StateName]
      ,[dbo].[MST_City].[PinCode]
      ,[dbo].[MST_City].[STDCode]
	  ,[dbo].[MST_City].[StateID]
	  ,[dbo].[MST_City].[CreationDate]
	  ,[dbo].[MST_City].[ModificationDate]
	  ,[dbo].[SEC_User].[UserName]

FROM	[dbo].[MST_City]

INNER JOIN	[dbo].[MST_State] 
ON [dbo].[MST_State].[StateID] = [dbo].[MST_City].[StateID]

INNER JOIN [dbo].[SEC_User]
ON [dbo].[SEC_User].[UserID] = [dbo].[MST_City].[UserID]

ORDER BY [dbo].[MST_City].[CityName],[dbo].[MST_State].[StateName]


GO
/****** Object:  StoredProcedure [dbo].[PR_MST_City_SelectByPK]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_City_SelectByPK] 
	@CityID int

AS

SELECT [dbo].[MST_City].[CityID]
	  ,[dbo].[MST_City].[CityName]
	  ,[dbo].[MST_State].[StateName]
      ,[dbo].[MST_City].[PinCode]
      ,[dbo].[MST_City].[STDCode]
	  ,[dbo].[MST_City].[StateID]

FROM [dbo].[MST_City]
  
INNER JOIN	[dbo].[MST_State] 
ON [dbo].[MST_State].[StateID] = [dbo].[MST_City].[StateID]

WHERE [dbo].[MST_City].[CityID]=@CityID

ORDER BY [dbo].[MST_City].[StateID],[dbo].[MST_City].[CityName]


GO
/****** Object:  StoredProcedure [dbo].[PR_MST_City_SelectDropDownList]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_City_SelectDropDownList]

AS

SELECT
	[dbo].[MST_City].[CityName],
	[dbo].[MST_City].[CityID]

FROM	[dbo].[MST_City]

ORDER BY [dbo].[MST_City].[CityName]

GO
/****** Object:  StoredProcedure [dbo].[PR_MST_City_SelectDropDownListByStateID]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_City_SelectDropDownListByStateID]
	@StateID int
AS

SELECT
	[dbo].[MST_City].[CityID],
	[dbo].[MST_City].[CityName],
	[dbo].[MST_City].[StateID]

FROM	[dbo].[MST_City]

INNER JOIN [dbo].[MST_State]
ON [dbo].[MST_State].[StateID]	=	[dbo].[MST_City].[StateID]

WHERE [dbo].[MST_City].[StateID]	=	@StateID

ORDER BY [dbo].[MST_City].[CityName]

GO
/****** Object:  StoredProcedure [dbo].[PR_MST_City_UpdateByPK]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_City_UpdateByPK]

	@CityID				int,
	@StateID			int,
	@CityName			varchar(50),
	@PinCode			varchar(10),
	@STDCode			varchar(10),
	@ModificationDate	datetime

AS

UPDATE [dbo].[MST_City]
   SET [dbo].[MST_City].[StateID]			=		@StateID 
      ,[dbo].[MST_City].[CityName]			=		@CityName
      ,[dbo].[MST_City].[PinCode]			= 		@PinCode 
      ,[dbo].[MST_City].[STDCode]			= 		@STDCode 
	  ,[dbo].[MST_City].[ModificationDate]	=		@ModificationDate

WHERE [dbo].[MST_City].[CityID] = @CityID





GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Hospital_CityWiseHospital]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_Hospital_CityWiseHospital]
	@CityID	int
AS

SELECT   ROW_NUMBER() over (order by [dbo].[MST_Hospital].[HospitalName]) as SrNo
		,[dbo].[MST_Hospital].[HospitalID]
		,[dbo].[MST_City].[CityID]
		,[dbo].[MST_City].[CityName]
		,[dbo].[MST_Hospital].[HospitalName]		
		,[dbo].[MST_Hospital].[CityID]	
		,[dbo].[MST_Hospital].[CategoryID]
		,[dbo].[MST_Hospital].[CategoryTypeID]				
		,[dbo].[MST_Hospital].[Address]				
		,[dbo].[MST_Hospital].[MobileNumber]		
		,[dbo].[MST_Hospital].[TelephoneNumber]		
		,[dbo].[MST_Hospital].[Fax]					
		,[dbo].[MST_Hospital].[Website]				
		,[dbo].[MST_Hospital].[EmailID]				
		,[dbo].[MST_Hospital].[AmbulancePhoneNumber]	
		,[dbo].[MST_Hospital].[EmergencyNumber]

FROM [dbo].[MST_Hospital]

INNER JOIN [dbo].[MST_City]
ON [dbo].[MST_City].[CityID] = [dbo].[MST_Hospital].[CityID]

INNER JOIN [dbo].[MST_State]
ON [dbo].[MST_State].[StateID] = [dbo].[MST_City].[StateID]

WHERE [dbo].[MST_City].[CityID]		=	@CityID	

ORDER BY [dbo].[MST_Hospital].[HospitalName]



GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Hospital_DeleteByPK]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_Hospital_DeleteByPK]
	@HospitalID int

AS

DELETE FROM [dbo].[MST_Hospital]

WHERE [dbo].[MST_Hospital].[HospitalID] = @HospitalID




GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Hospital_Insert]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_Hospital_Insert]

	@HospitalName			varchar(150),
	@CityID					int,
	@CategoryID				int,
	@CategoryTypeID			int,
	@Address				varchar(250),
	@MobileNumber			varchar(100),
	@TelePhoneNumber		varchar(100),
	@Fax					varchar(100),
	@Website				varchar(100),
	@EmailID				varchar(100),
	@AmbulancePhoneNumber	varchar(100),
	@EmergencyNumber		varchar(100),
	@CreationDate			datetime,
	@ModificationDate		datetime,
	@UserID					int


AS

INSERT INTO [dbo].[MST_Hospital]
           (
		   [HospitalName]
		   ,[CityID]
		   ,[CategoryID]
		   ,[CategoryTypeID]
		   ,[Address]
		   ,[MobileNumber]
		   ,[TelePhoneNumber]
		   ,[Fax]
		   ,[Website]
		   ,[EmailID]
		   ,[AmbulancePhoneNumber]
		   ,[EmergencyNumber]
           ,[CreationDate]
		   ,[ModificationDate]
		   ,[UserID]
		   )
     VALUES
           (
				@HospitalName,
				@CityID,
				@CategoryID,
				@CategoryTypeID,
				@Address,
				@MobileNumber,
				@TelePhoneNumber,
				@Fax,
				@Website,
				@EmailID,
				@AmbulancePhoneNumber,
				@EmergencyNumber,
				@CreationDate,
				@ModificationDate,
				@UserID
			)



GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Hospital_SelectAll]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_MST_Hospital_SelectAll]

AS

SELECT  ROW_NUMBER() over (order by [dbo].[MST_Hospital].[HospitalID]) as SrNo
		,[dbo].[MST_Hospital].[HospitalID]
		,[dbo].[MST_Hospital].[HospitalName]
		,[dbo].[MST_City].[CityName]
		,[dbo].[MST_State].[StateName]	
		,[dbo].[MST_Hospital].[CityID]						
		,[dbo].[MST_Hospital].[Address]				
		,[dbo].[MST_Hospital].[MobileNumber]		
		,[dbo].[MST_Hospital].[TelephoneNumber]		
		,[dbo].[MST_Hospital].[Fax]					
		,[dbo].[MST_Hospital].[Website]				
		,[dbo].[MST_Hospital].[EmailID]				
		,[dbo].[MST_Hospital].[AmbulancePhoneNumber]	
		,[dbo].[MST_Hospital].[EmergencyNumber]
		,[dbo].[MST_Category].[CategoryName]
		,[dbo].[MST_CategoryType].[CategoryType]
		,[dbo].[MST_CategoryType].[CategoryType]
		,[dbo].[SEC_User].[UserName]


FROM [dbo].[MST_Hospital]

INNER JOIN [dbo].[MST_City]
ON [dbo].[MST_City].[CityID] = [dbo].[MST_Hospital].[CityID]

INNER JOIN [dbo].[MST_State]
ON [dbo].[MST_State].[StateID] = [dbo].[MST_City].[StateID]

INNER JOIN [dbo].[MST_Category]
ON [dbo].[MST_Category].[CategoryID] = [dbo].[MST_Hospital].[CategoryID]

INNER JOIN [dbo].[MST_CategoryType]
ON [dbo].[MST_CategoryType].[CategoryTypeID] = [dbo].[MST_Hospital].[CategoryTypeID]

INNER JOIN [dbo].[SEC_User]
ON [dbo].[SEC_User].[UserID] = [dbo].[MST_Hospital].[UserID]
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Hospital_SelectByPK]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_MST_Hospital_SelectByPK]
	@HospitalID		int
AS

SELECT   [dbo].[MST_Hospital].[HospitalID]
		,[dbo].[MST_Hospital].[HospitalName]		
		,[dbo].[MST_Hospital].[CityID]	
		,[dbo].[MST_Hospital].[CategoryID]
		,[dbo].[MST_Hospital].[CategoryTypeID]				
		,[dbo].[MST_Hospital].[Address]				
		,[dbo].[MST_Hospital].[MobileNumber]		
		,[dbo].[MST_Hospital].[TelePhoneNumber]		
		,[dbo].[MST_Hospital].[Fax]					
		,[dbo].[MST_Hospital].[Website]				
		,[dbo].[MST_Hospital].[EmailID]				
		,[dbo].[MST_Hospital].[AmbulancePhoneNumber]	
		,[dbo].[MST_Hospital].[EmergencyNumber]

FROM [dbo].[MST_Hospital]

INNER JOIN [dbo].[MST_City]
ON [dbo].[MST_City].[CityID] = [dbo].[MST_Hospital].[CityID]

INNER JOIN [dbo].[MST_State]
ON [dbo].[MST_State].[StateID] = [dbo].[MST_City].[StateID]

WHERE [dbo].[MST_Hospital].[HospitalID]		=	@HospitalID	

ORDER BY [dbo].[MST_Hospital].[HospitalName]



GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Hospital_StateWiseHospital]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_Hospital_StateWiseHospital]
	@StateID	int
AS

SELECT   ROW_NUMBER() over (order by [dbo].[MST_Hospital].[HospitalName]) as SrNo
		,[dbo].[MST_Hospital].[HospitalID]
		,[dbo].[MST_State].[StateID]
		,[dbo].[MST_State].[StateName]
		,[dbo].[MST_City].[CityID]
		,[dbo].[MST_City].[CityName]
		,[dbo].[MST_Hospital].[HospitalName]		
		,[dbo].[MST_Hospital].[CityID]	
		,[dbo].[MST_Hospital].[CategoryID]
		,[dbo].[MST_Hospital].[CategoryTypeID]				
		,[dbo].[MST_Hospital].[Address]				
		,[dbo].[MST_Hospital].[MobileNumber]		
		,[dbo].[MST_Hospital].[TelephoneNumber]		
		,[dbo].[MST_Hospital].[Fax]					
		,[dbo].[MST_Hospital].[Website]				
		,[dbo].[MST_Hospital].[EmailID]				
		,[dbo].[MST_Hospital].[AmbulancePhoneNumber]	
		,[dbo].[MST_Hospital].[EmergencyNumber]

FROM [dbo].[MST_Hospital]

INNER JOIN [dbo].[MST_City]
ON [dbo].[MST_City].[CityID] = [dbo].[MST_Hospital].[CityID]

INNER JOIN [dbo].[MST_State]
ON [dbo].[MST_State].[StateID] = [dbo].[MST_City].[StateID]

WHERE [dbo].[MST_State].[StateID]	=	@StateID	

ORDER BY [dbo].[MST_Hospital].[HospitalName]



GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Hospital_UpdateByPK]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_MST_Hospital_UpdateByPK]
	@HospitalID				int,
	@HospitalName			varchar(150),
	@CityID					int,
	@CategoryTypeID			int,
	@CategoryID				int,
	@Address				varchar(250),
	@MobileNumber			varchar(100),
	@TelephoneNumber		varchar(100),
	@Fax					varchar(100),
	@Website				varchar(100),
	@EmailID				varchar(100),
	@AmbulancePhoneNumber	varchar(100),
	@EmergencyNumber		varchar(100),
	@ModificationDate		datetime

AS

UPDATE	 [dbo].[MST_Hospital]

   SET	 [dbo].[MST_Hospital].[HospitalName]		=	@HospitalName
		,[dbo].[MST_Hospital].[CityID]				=	@CityID	
		,[dbo].[MST_Hospital].[CategoryID]			=	@CategoryID	
		,[dbo].[MST_Hospital].[CategoryTypeID]		=	@CategoryTypeID	
		,[dbo].[MST_Hospital].[Address]				=	@Address
		,[dbo].[MST_Hospital].[MobileNumber]		=	@MobileNumber
		,[dbo].[MST_Hospital].[TelephoneNumber]		=	@TelephoneNumber
		,[dbo].[MST_Hospital].[Fax]					=	@Fax
		,[dbo].[MST_Hospital].[Website]				=	@Website
		,[dbo].[MST_Hospital].[EmailID]				=	@EmailID
		,[dbo].[MST_Hospital].[AmbulancePhoneNumber]=	@AmbulancePhoneNumber	
		,[dbo].[MST_Hospital].[EmergencyNumber]		=	@EmergencyNumber
		,[dbo].[MST_Hospital].[ModificationDate]	=	@ModificationDate

WHERE	[dbo].[MST_Hospital].[HospitalID]	=	@HospitalID

GO
/****** Object:  StoredProcedure [dbo].[PR_MST_State_DeleteByPK]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_State_DeleteByPK]
	@StateID int

AS

DELETE FROM [dbo].[MST_State]

WHERE [dbo].[MST_State].[StateID] = @StateID



GO
/****** Object:  StoredProcedure [dbo].[PR_MST_State_Insert]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_State_Insert]

	@StateName			varchar(50),
	@CreationDate		datetime,
	@ModificationDate	datetime,
	@UserID				int

AS

INSERT INTO [dbo].[MST_State]
(
	[StateName],
	[CreationDate],
	[ModificationDate],
	[UserID]
)
VALUES
(
	@StateName,
	@CreationDate,
	@ModificationDate,
	@UserID
)



GO
/****** Object:  StoredProcedure [dbo].[PR_MST_State_SelectAll]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_State_SelectAll]

AS

SELECT
	[dbo].[MST_State].[StateID],
	[dbo].[MST_State].[StateName],
	[dbo].[MST_State].[CreationDate],
	[dbo].[MST_State].[ModificationDate],
	[dbo].[SEC_User].[UserName]

FROM	[dbo].[MST_State]

INNER JOIN [dbo].[SEC_User]
ON [dbo].[SEC_User].[UserID] = [dbo].[MST_State].[UserID]

ORDER BY [dbo].[MST_State].[StateName]

GO
/****** Object:  StoredProcedure [dbo].[PR_MST_State_SelectByPK]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_State_SelectByPK]
	@StateID int
AS

SELECT
		[dbo].[MST_State].[StateID],
		[dbo].[MST_State].[StateName]

FROM	[dbo].[MST_State]

WHERE 
		[dbo].[MST_State].[StateID] = @StateID

ORDER BY 
		[dbo].[MST_State].[StateName]

GO
/****** Object:  StoredProcedure [dbo].[PR_MST_State_SelectDropDownList]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_State_SelectDropDownList]

AS

SELECT
	[dbo].[MST_State].[StateName],
	[dbo].[MST_State].[StateID]

FROM	[dbo].[MST_State]

ORDER BY [dbo].[MST_State].[StateName]

GO
/****** Object:  StoredProcedure [dbo].[PR_MST_State_UpdateByPK]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_State_UpdateByPK]
	@StateID int,
	@StateName varchar(100),
	@ModificationDate datetime
	
AS

UPDATE	[dbo].[MST_State]

SET		[dbo].[MST_State].[StateName]			= @StateName,
		[dbo].[MST_State].[ModificationDate]	= @ModificationDate

WHERE	[dbo].[MST_State].[StateID] = @StateID


GO
/****** Object:  StoredProcedure [dbo].[PR_SEC_User_CheckPassword]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_SEC_User_CheckPassword]
	@UserID   		int,
	@UserName		varchar(100),
	@UserPassword   varchar(50)

AS
SET NOCOUNT ON

DECLARE	@StartTime	datetime
DECLARE	@EndTime	datetime
SET		@StartTime = getdate()

SELECT
		[dbo].[SEC_User].[UserID],
		[dbo].[SEC_User].[UserName],
		[dbo].[SEC_User].[Password],
		[dbo].[SEC_User].[Email],
		[dbo].[SEC_User].[CreationDate],
		[dbo].[SEC_User].[ModificationDate]

FROM	[dbo].[SEC_User]

WHERE	[dbo].[SEC_User].[UserID] = @UserID AND
		[dbo].[SEC_User].[UserName] = @UserName AND
		[dbo].[SEC_User].[Password] = @UserPassword


SET		@EndTime = getdate()





GO
/****** Object:  StoredProcedure [dbo].[PR_SEC_User_Delete]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_SEC_User_Delete]
	@UserID int
AS

DELETE FROM [dbo].[SEC_User]

WHERE [dbo].[SEC_User].[UserID] = @UserID



GO
/****** Object:  StoredProcedure [dbo].[PR_SEC_User_Insert]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_SEC_User_Insert]

	@UserName			varchar(100),
	@Password			varchar(50),
	@Email				varchar(100),
	@CreationDate		datetime,
	@ModificationDate	datetime
	
AS

INSERT INTO [dbo].[SEC_User]
           (
			   [dbo].[SEC_User].[UserName]
			   ,[dbo].[SEC_User].[Password]
			   ,[dbo].[SEC_User].[Email]
			   ,[dbo].[SEC_User].[CreationDate]
			   ,[dbo].[SEC_User].[ModificationDate]
		   )
     VALUES
           (
				@UserName,
				@Password,
				@Email,
				@CreationDate,
				@ModificationDate
			)



GO
/****** Object:  StoredProcedure [dbo].[PR_SEC_User_Login]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_SEC_User_Login]
	@UserName varchar(100),
	@Password varchar(50)

AS

SELECT
	 [dbo].[SEC_User].[UserID]
	,[dbo].[SEC_User].[UserName]
	,[dbo].[SEC_User].[Password]
	,[dbo].[SEC_User].[Email]

FROM	[dbo].[SEC_User]

WHERE	[dbo].[SEC_User].[UserName] = @UserName 
	and	[dbo].[SEC_User].[Password] = @Password



GO
/****** Object:  StoredProcedure [dbo].[PR_SEC_User_SelectAll]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_SEC_User_SelectAll]

AS

SELECT
		[dbo].[SEC_User].[UserID],
		[dbo].[SEC_User].[UserName],
		[dbo].[SEC_User].[Email],
		[dbo].[SEC_User].[Password],
		[dbo].[SEC_User].[CreationDate],
		[dbo].[SEC_User].[ModificationDate]

FROM [dbo].[SEC_User]

ORDER BY [dbo].[SEC_User].[UserName]

GO
/****** Object:  StoredProcedure [dbo].[PR_SEC_User_SelectByPK]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_SEC_User_SelectByPK]
	@UserID int
AS

SELECT
		[dbo].[SEC_User].[UserID],
		[dbo].[SEC_User].[UserName],
		[dbo].[SEC_User].[Password],
		[dbo].[SEC_User].[Email],
		[dbo].[SEC_User].[CreationDate],
		[dbo].[SEC_User].[ModificationDate]

FROM	[dbo].[SEC_User]

WHERE 
		[dbo].[SEC_User].[UserID] = @UserID

ORDER BY 
		[dbo].[SEC_User].[UserName]

GO
/****** Object:  StoredProcedure [dbo].[PR_SEC_User_Update]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_SEC_User_Update]
	@UserID				int,
	@UserName			varchar(100),
	@Password			varchar(50),
	@Email				varchar(100),
	@ModificationDate	datetime
	
AS

UPDATE	[dbo].[SEC_User]

SET		[dbo].[SEC_User].[UserName]			=	@UserName,
		[dbo].[SEC_User].[Password]			=	@Password,
		[dbo].[SEC_User].[Email]			=	@Email,
		[dbo].[SEC_User].[ModificationDate]	=	@ModificationDate

WHERE	[dbo].[SEC_User].[UserID] = @UserID


GO
/****** Object:  StoredProcedure [dbo].[PR_SEC_User_Verify]    Script Date: 3/8/2020 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_SEC_User_Verify]
	@UserName	varchar(100),
	@Email		varchar(100)

AS

SELECT	
		 [dbo].[SEC_User].[UserName]
		,[dbo].[SEC_User].[Email]
		,[dbo].[SEC_User].[UserID]

FROM	[dbo].[SEC_User]

WHERE	[dbo].[SEC_User].[Email]	=	 @Email
	OR	[dbo].[SEC_User].[UserName]	=	@UserName

GO
USE [master]
GO
ALTER DATABASE [3TierHospitalFinder] SET  READ_WRITE 
GO
