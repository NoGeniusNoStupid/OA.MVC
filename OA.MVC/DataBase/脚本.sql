USE [master]
GO
/****** Object:  Database [OA]    Script Date: 2018-10-16 17:28:05 ******/
CREATE DATABASE [OA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OA', FILENAME = N'E:\DevelopmentSelf\GraduationDesign\OA.MVC\DataBase\OA.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'OA_log', FILENAME = N'E:\DevelopmentSelf\GraduationDesign\OA.MVC\DataBase\OA_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [OA] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OA] SET ARITHABORT OFF 
GO
ALTER DATABASE [OA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OA] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [OA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OA] SET RECOVERY FULL 
GO
ALTER DATABASE [OA] SET  MULTI_USER 
GO
ALTER DATABASE [OA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OA] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'OA', N'ON'
GO
USE [OA]
GO
/****** Object:  Table [dbo].[ActionInfo]    Script Date: 2018-10-16 17:28:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ActionInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SubTime] [datetime] NOT NULL,
	[DelFlag] [smallint] NOT NULL,
	[ModifiedOn] [nvarchar](max) NOT NULL,
	[Remark] [nvarchar](256) NULL,
	[Url] [nvarchar](512) NOT NULL,
	[HttpMethod] [nvarchar](32) NOT NULL,
	[ActionMethodName] [nvarchar](32) NULL,
	[ControllerName] [nvarchar](128) NULL,
	[ActionInfoName] [nvarchar](32) NOT NULL,
	[Sort] [nvarchar](max) NULL,
	[ActionTypeEnum] [smallint] NOT NULL,
	[MenuIcon] [varchar](512) NULL,
	[IconWidth] [int] NOT NULL,
	[IconHeight] [int] NOT NULL,
 CONSTRAINT [PK_ActionInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Books]    Script Date: 2018-10-16 17:28:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Author] [nvarchar](200) NOT NULL,
	[PublisherId] [int] NOT NULL,
	[PublishDate] [datetime] NOT NULL,
	[ISBN] [nvarchar](50) NOT NULL,
	[WordsCount] [int] NOT NULL,
	[UnitPrice] [decimal](19, 4) NOT NULL,
	[ContentDescription] [nvarchar](max) NULL,
	[AurhorDescription] [nvarchar](max) NULL,
	[EditorComment] [nvarchar](max) NULL,
	[TOC] [nvarchar](max) NULL,
	[CategoryId] [int] NULL,
	[Clicks] [int] NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 2018-10-16 17:28:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DepName] [nvarchar](32) NOT NULL,
	[ParentId] [int] NOT NULL,
	[TreePath] [nvarchar](128) NOT NULL,
	[Level] [int] NOT NULL,
	[IsLeaf] [bit] NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DepartmentActionInfo]    Script Date: 2018-10-16 17:28:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DepartmentActionInfo](
	[ActionInfo_ID] [int] NOT NULL,
	[Department_ID] [int] NOT NULL,
 CONSTRAINT [PK_DepartmentActionInfo] PRIMARY KEY CLUSTERED 
(
	[ActionInfo_ID] ASC,
	[Department_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KeyWordsRank]    Script Date: 2018-10-16 17:28:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KeyWordsRank](
	[Id] [uniqueidentifier] NOT NULL,
	[KeyWords] [nvarchar](255) NULL,
	[SearchCount] [int] NULL,
 CONSTRAINT [PK_KeyWordsRank] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[R_UserInfo_ActionInfo]    Script Date: 2018-10-16 17:28:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[R_UserInfo_ActionInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserInfoID] [int] NOT NULL,
	[ActionInfoID] [int] NOT NULL,
	[IsPass] [bit] NOT NULL,
 CONSTRAINT [PK_R_UserInfo_ActionInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoleInfo]    Script Date: 2018-10-16 17:28:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](32) NOT NULL,
	[DelFlag] [smallint] NOT NULL,
	[SubTime] [datetime] NOT NULL,
	[Remark] [nvarchar](256) NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[Sort] [nvarchar](max) NULL,
 CONSTRAINT [PK_RoleInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoleInfoActionInfo]    Script Date: 2018-10-16 17:28:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleInfoActionInfo](
	[ActionInfo_ID] [int] NOT NULL,
	[RoleInfo_ID] [int] NOT NULL,
 CONSTRAINT [PK_RoleInfoActionInfo] PRIMARY KEY CLUSTERED 
(
	[ActionInfo_ID] ASC,
	[RoleInfo_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SearchDetails]    Script Date: 2018-10-16 17:28:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SearchDetails](
	[Id] [uniqueidentifier] NOT NULL,
	[KeyWords] [nvarchar](255) NULL,
	[SearchDateTime] [datetime] NULL,
 CONSTRAINT [PK_SearchDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 2018-10-16 17:28:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UName] [nvarchar](32) NULL,
	[UPwd] [nvarchar](16) NOT NULL,
	[SubTime] [datetime] NOT NULL,
	[DelFlag] [smallint] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[Remark] [nvarchar](256) NULL,
	[Sort] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserInfoDepartment]    Script Date: 2018-10-16 17:28:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfoDepartment](
	[Department_ID] [int] NOT NULL,
	[UserInfo_ID] [int] NOT NULL,
 CONSTRAINT [PK_UserInfoDepartment] PRIMARY KEY CLUSTERED 
(
	[Department_ID] ASC,
	[UserInfo_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserInfoRoleInfo]    Script Date: 2018-10-16 17:28:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfoRoleInfo](
	[RoleInfo_ID] [int] NOT NULL,
	[UserInfo_ID] [int] NOT NULL,
 CONSTRAINT [PK_UserInfoRoleInfo] PRIMARY KEY CLUSTERED 
(
	[RoleInfo_ID] ASC,
	[UserInfo_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [IX_FK_DepartmentActionInfo_Department]    Script Date: 2018-10-16 17:28:06 ******/
CREATE NONCLUSTERED INDEX [IX_FK_DepartmentActionInfo_Department] ON [dbo].[DepartmentActionInfo]
(
	[Department_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ActionInfoR_UserInfo_ActionInfo]    Script Date: 2018-10-16 17:28:06 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ActionInfoR_UserInfo_ActionInfo] ON [dbo].[R_UserInfo_ActionInfo]
(
	[ActionInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UserInfoR_UserInfo_ActionInfo]    Script Date: 2018-10-16 17:28:06 ******/
CREATE NONCLUSTERED INDEX [IX_FK_UserInfoR_UserInfo_ActionInfo] ON [dbo].[R_UserInfo_ActionInfo]
(
	[UserInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_RoleInfoActionInfo_RoleInfo]    Script Date: 2018-10-16 17:28:06 ******/
CREATE NONCLUSTERED INDEX [IX_FK_RoleInfoActionInfo_RoleInfo] ON [dbo].[RoleInfoActionInfo]
(
	[RoleInfo_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UserInfoDepartment_UserInfo]    Script Date: 2018-10-16 17:28:06 ******/
CREATE NONCLUSTERED INDEX [IX_FK_UserInfoDepartment_UserInfo] ON [dbo].[UserInfoDepartment]
(
	[UserInfo_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UserInfoRoleInfo_UserInfo]    Script Date: 2018-10-16 17:28:06 ******/
CREATE NONCLUSTERED INDEX [IX_FK_UserInfoRoleInfo_UserInfo] ON [dbo].[UserInfoRoleInfo]
(
	[UserInfo_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DepartmentActionInfo]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentActionInfo_ActionInfo] FOREIGN KEY([ActionInfo_ID])
REFERENCES [dbo].[ActionInfo] ([ID])
GO
ALTER TABLE [dbo].[DepartmentActionInfo] CHECK CONSTRAINT [FK_DepartmentActionInfo_ActionInfo]
GO
ALTER TABLE [dbo].[DepartmentActionInfo]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentActionInfo_Department] FOREIGN KEY([Department_ID])
REFERENCES [dbo].[Department] ([ID])
GO
ALTER TABLE [dbo].[DepartmentActionInfo] CHECK CONSTRAINT [FK_DepartmentActionInfo_Department]
GO
ALTER TABLE [dbo].[R_UserInfo_ActionInfo]  WITH CHECK ADD  CONSTRAINT [FK_ActionInfoR_UserInfo_ActionInfo] FOREIGN KEY([ActionInfoID])
REFERENCES [dbo].[ActionInfo] ([ID])
GO
ALTER TABLE [dbo].[R_UserInfo_ActionInfo] CHECK CONSTRAINT [FK_ActionInfoR_UserInfo_ActionInfo]
GO
ALTER TABLE [dbo].[R_UserInfo_ActionInfo]  WITH CHECK ADD  CONSTRAINT [FK_UserInfoR_UserInfo_ActionInfo] FOREIGN KEY([UserInfoID])
REFERENCES [dbo].[UserInfo] ([ID])
GO
ALTER TABLE [dbo].[R_UserInfo_ActionInfo] CHECK CONSTRAINT [FK_UserInfoR_UserInfo_ActionInfo]
GO
ALTER TABLE [dbo].[RoleInfoActionInfo]  WITH CHECK ADD  CONSTRAINT [FK_RoleInfoActionInfo_ActionInfo] FOREIGN KEY([ActionInfo_ID])
REFERENCES [dbo].[ActionInfo] ([ID])
GO
ALTER TABLE [dbo].[RoleInfoActionInfo] CHECK CONSTRAINT [FK_RoleInfoActionInfo_ActionInfo]
GO
ALTER TABLE [dbo].[RoleInfoActionInfo]  WITH CHECK ADD  CONSTRAINT [FK_RoleInfoActionInfo_RoleInfo] FOREIGN KEY([RoleInfo_ID])
REFERENCES [dbo].[RoleInfo] ([ID])
GO
ALTER TABLE [dbo].[RoleInfoActionInfo] CHECK CONSTRAINT [FK_RoleInfoActionInfo_RoleInfo]
GO
ALTER TABLE [dbo].[UserInfoDepartment]  WITH CHECK ADD  CONSTRAINT [FK_UserInfoDepartment_Department] FOREIGN KEY([Department_ID])
REFERENCES [dbo].[Department] ([ID])
GO
ALTER TABLE [dbo].[UserInfoDepartment] CHECK CONSTRAINT [FK_UserInfoDepartment_Department]
GO
ALTER TABLE [dbo].[UserInfoDepartment]  WITH CHECK ADD  CONSTRAINT [FK_UserInfoDepartment_UserInfo] FOREIGN KEY([UserInfo_ID])
REFERENCES [dbo].[UserInfo] ([ID])
GO
ALTER TABLE [dbo].[UserInfoDepartment] CHECK CONSTRAINT [FK_UserInfoDepartment_UserInfo]
GO
ALTER TABLE [dbo].[UserInfoRoleInfo]  WITH CHECK ADD  CONSTRAINT [FK_UserInfoRoleInfo_RoleInfo] FOREIGN KEY([RoleInfo_ID])
REFERENCES [dbo].[RoleInfo] ([ID])
GO
ALTER TABLE [dbo].[UserInfoRoleInfo] CHECK CONSTRAINT [FK_UserInfoRoleInfo_RoleInfo]
GO
ALTER TABLE [dbo].[UserInfoRoleInfo]  WITH CHECK ADD  CONSTRAINT [FK_UserInfoRoleInfo_UserInfo] FOREIGN KEY([UserInfo_ID])
REFERENCES [dbo].[UserInfo] ([ID])
GO
ALTER TABLE [dbo].[UserInfoRoleInfo] CHECK CONSTRAINT [FK_UserInfoRoleInfo_UserInfo]
GO
USE [master]
GO
ALTER DATABASE [OA] SET  READ_WRITE 
GO
