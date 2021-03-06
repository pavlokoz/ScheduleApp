USE [master]
GO
/****** Object:  Database [ScheduleDB]    Script Date: 09.05.2018 13:53:20 ******/
CREATE DATABASE [ScheduleDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ScheduleDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ScheduleDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ScheduleDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ScheduleDB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ScheduleDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ScheduleDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ScheduleDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ScheduleDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ScheduleDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ScheduleDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ScheduleDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ScheduleDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ScheduleDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ScheduleDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ScheduleDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ScheduleDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ScheduleDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ScheduleDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ScheduleDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ScheduleDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ScheduleDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ScheduleDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ScheduleDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ScheduleDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ScheduleDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ScheduleDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ScheduleDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ScheduleDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ScheduleDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ScheduleDB] SET  MULTI_USER 
GO
ALTER DATABASE [ScheduleDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ScheduleDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ScheduleDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ScheduleDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ScheduleDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ScheduleDB]
GO
/****** Object:  Table [dbo].[Auditorium]    Script Date: 09.05.2018 13:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auditorium](
	[AuditoriumId] [bigint] IDENTITY(1,1) NOT NULL,
	[AuditoriumName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Auditorium] PRIMARY KEY CLUSTERED 
(
	[AuditoriumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AuditoriumToPair]    Script Date: 09.05.2018 13:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditoriumToPair](
	[AuditoriumId] [bigint] NOT NULL,
	[PairId] [bigint] NOT NULL,
 CONSTRAINT [PK_AuditoriumToPair] PRIMARY KEY CLUSTERED 
(
	[AuditoriumId] ASC,
	[PairId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Day]    Script Date: 09.05.2018 13:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Day](
	[DayId] [smallint] IDENTITY(1,1) NOT NULL,
	[DayName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Day] PRIMARY KEY CLUSTERED 
(
	[DayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Group]    Script Date: 09.05.2018 13:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[GroupId] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GroupToPair]    Script Date: 09.05.2018 13:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupToPair](
	[GroupId] [bigint] NOT NULL,
	[PairId] [bigint] NOT NULL,
 CONSTRAINT [PK_GroupToPair] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC,
	[PairId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pair]    Script Date: 09.05.2018 13:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pair](
	[PairId] [bigint] IDENTITY(1,1) NOT NULL,
	[DayId] [smallint] NOT NULL,
	[SubjectId] [bigint] NOT NULL,
	[TypeId] [smallint] NOT NULL,
	[WeekendId] [smallint] NOT NULL,
	[TimeId] [smallint] NOT NULL,
 CONSTRAINT [PK_Pair] PRIMARY KEY CLUSTERED 
(
	[PairId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PairTime]    Script Date: 09.05.2018 13:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PairTime](
	[TimeId] [smallint] IDENTITY(1,1) NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
 CONSTRAINT [PK_PairTime] PRIMARY KEY CLUSTERED 
(
	[TimeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PairType]    Script Date: 09.05.2018 13:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PairType](
	[TypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_PairType] PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ScheduleFile]    Script Date: 09.05.2018 13:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ScheduleFile](
	[FileId] [bigint] IDENTITY(1,1) NOT NULL,
	[FilePath] [nvarchar](max) NOT NULL,
	[FileHash] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_File] PRIMARY KEY CLUSTERED 
(
	[FileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 09.05.2018 13:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[SubjectId] [bigint] IDENTITY(1,1) NOT NULL,
	[SubjectName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tutor]    Script Date: 09.05.2018 13:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tutor](
	[TutorId] [bigint] IDENTITY(1,1) NOT NULL,
	[TutorName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Tutor] PRIMARY KEY CLUSTERED 
(
	[TutorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TutorToPair]    Script Date: 09.05.2018 13:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TutorToPair](
	[TutorId] [bigint] NOT NULL,
	[PairId] [bigint] NOT NULL,
 CONSTRAINT [PK_TutorToPair] PRIMARY KEY CLUSTERED 
(
	[TutorId] ASC,
	[PairId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Weekend]    Script Date: 09.05.2018 13:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Weekend](
	[WeekendId] [smallint] IDENTITY(1,1) NOT NULL,
	[WeekendName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Weekend] PRIMARY KEY CLUSTERED 
(
	[WeekendId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Auditorium] ON 

INSERT [dbo].[Auditorium] ([AuditoriumId], [AuditoriumName]) VALUES (60, N'118а')
INSERT [dbo].[Auditorium] ([AuditoriumId], [AuditoriumName]) VALUES (61, N'111')
INSERT [dbo].[Auditorium] ([AuditoriumId], [AuditoriumName]) VALUES (62, N'119а')
INSERT [dbo].[Auditorium] ([AuditoriumId], [AuditoriumName]) VALUES (63, N'265')
INSERT [dbo].[Auditorium] ([AuditoriumId], [AuditoriumName]) VALUES (64, N'270')
INSERT [dbo].[Auditorium] ([AuditoriumId], [AuditoriumName]) VALUES (65, N'366')
INSERT [dbo].[Auditorium] ([AuditoriumId], [AuditoriumName]) VALUES (66, N'272/3')
INSERT [dbo].[Auditorium] ([AuditoriumId], [AuditoriumName]) VALUES (67, N'266')
INSERT [dbo].[Auditorium] ([AuditoriumId], [AuditoriumName]) VALUES (68, N'261')
INSERT [dbo].[Auditorium] ([AuditoriumId], [AuditoriumName]) VALUES (69, N'119б')
INSERT [dbo].[Auditorium] ([AuditoriumId], [AuditoriumName]) VALUES (70, N'365')
INSERT [dbo].[Auditorium] ([AuditoriumId], [AuditoriumName]) VALUES (71, N'367')
SET IDENTITY_INSERT [dbo].[Auditorium] OFF
INSERT [dbo].[AuditoriumToPair] ([AuditoriumId], [PairId]) VALUES (60, 134)
INSERT [dbo].[AuditoriumToPair] ([AuditoriumId], [PairId]) VALUES (60, 151)
INSERT [dbo].[AuditoriumToPair] ([AuditoriumId], [PairId]) VALUES (60, 152)
INSERT [dbo].[AuditoriumToPair] ([AuditoriumId], [PairId]) VALUES (60, 161)
INSERT [dbo].[AuditoriumToPair] ([AuditoriumId], [PairId]) VALUES (61, 135)
INSERT [dbo].[AuditoriumToPair] ([AuditoriumId], [PairId]) VALUES (61, 137)
INSERT [dbo].[AuditoriumToPair] ([AuditoriumId], [PairId]) VALUES (62, 136)
INSERT [dbo].[AuditoriumToPair] ([AuditoriumId], [PairId]) VALUES (63, 138)
INSERT [dbo].[AuditoriumToPair] ([AuditoriumId], [PairId]) VALUES (64, 139)
INSERT [dbo].[AuditoriumToPair] ([AuditoriumId], [PairId]) VALUES (64, 153)
INSERT [dbo].[AuditoriumToPair] ([AuditoriumId], [PairId]) VALUES (64, 162)
INSERT [dbo].[AuditoriumToPair] ([AuditoriumId], [PairId]) VALUES (65, 140)
INSERT [dbo].[AuditoriumToPair] ([AuditoriumId], [PairId]) VALUES (65, 142)
INSERT [dbo].[AuditoriumToPair] ([AuditoriumId], [PairId]) VALUES (65, 156)
INSERT [dbo].[AuditoriumToPair] ([AuditoriumId], [PairId]) VALUES (66, 141)
INSERT [dbo].[AuditoriumToPair] ([AuditoriumId], [PairId]) VALUES (66, 143)
INSERT [dbo].[AuditoriumToPair] ([AuditoriumId], [PairId]) VALUES (66, 144)
INSERT [dbo].[AuditoriumToPair] ([AuditoriumId], [PairId]) VALUES (66, 146)
INSERT [dbo].[AuditoriumToPair] ([AuditoriumId], [PairId]) VALUES (66, 147)
INSERT [dbo].[AuditoriumToPair] ([AuditoriumId], [PairId]) VALUES (67, 145)
INSERT [dbo].[AuditoriumToPair] ([AuditoriumId], [PairId]) VALUES (67, 148)
INSERT [dbo].[AuditoriumToPair] ([AuditoriumId], [PairId]) VALUES (67, 150)
INSERT [dbo].[AuditoriumToPair] ([AuditoriumId], [PairId]) VALUES (68, 149)
INSERT [dbo].[AuditoriumToPair] ([AuditoriumId], [PairId]) VALUES (69, 149)
INSERT [dbo].[AuditoriumToPair] ([AuditoriumId], [PairId]) VALUES (70, 154)
INSERT [dbo].[AuditoriumToPair] ([AuditoriumId], [PairId]) VALUES (70, 155)
INSERT [dbo].[AuditoriumToPair] ([AuditoriumId], [PairId]) VALUES (70, 157)
INSERT [dbo].[AuditoriumToPair] ([AuditoriumId], [PairId]) VALUES (70, 159)
INSERT [dbo].[AuditoriumToPair] ([AuditoriumId], [PairId]) VALUES (70, 160)
INSERT [dbo].[AuditoriumToPair] ([AuditoriumId], [PairId]) VALUES (71, 158)
SET IDENTITY_INSERT [dbo].[Day] ON 

INSERT [dbo].[Day] ([DayId], [DayName]) VALUES (1, N'Понеділок')
INSERT [dbo].[Day] ([DayId], [DayName]) VALUES (2, N'Вівторок')
INSERT [dbo].[Day] ([DayId], [DayName]) VALUES (3, N'Середа')
INSERT [dbo].[Day] ([DayId], [DayName]) VALUES (4, N'Четвер')
INSERT [dbo].[Day] ([DayId], [DayName]) VALUES (5, N'П`ятниця')
INSERT [dbo].[Day] ([DayId], [DayName]) VALUES (6, N'Субота')
INSERT [dbo].[Day] ([DayId], [DayName]) VALUES (7, N'Неділя')
SET IDENTITY_INSERT [dbo].[Day] OFF
SET IDENTITY_INSERT [dbo].[Group] ON 

INSERT [dbo].[Group] ([GroupId], [GroupName]) VALUES (17, N'ПМа-31')
INSERT [dbo].[Group] ([GroupId], [GroupName]) VALUES (18, N'Ма-32')
INSERT [dbo].[Group] ([GroupId], [GroupName]) VALUES (19, N'ПМа-32')
SET IDENTITY_INSERT [dbo].[Group] OFF
INSERT [dbo].[GroupToPair] ([GroupId], [PairId]) VALUES (17, 134)
INSERT [dbo].[GroupToPair] ([GroupId], [PairId]) VALUES (17, 135)
INSERT [dbo].[GroupToPair] ([GroupId], [PairId]) VALUES (17, 136)
INSERT [dbo].[GroupToPair] ([GroupId], [PairId]) VALUES (17, 137)
INSERT [dbo].[GroupToPair] ([GroupId], [PairId]) VALUES (17, 138)
INSERT [dbo].[GroupToPair] ([GroupId], [PairId]) VALUES (17, 139)
INSERT [dbo].[GroupToPair] ([GroupId], [PairId]) VALUES (17, 140)
INSERT [dbo].[GroupToPair] ([GroupId], [PairId]) VALUES (17, 141)
INSERT [dbo].[GroupToPair] ([GroupId], [PairId]) VALUES (17, 142)
INSERT [dbo].[GroupToPair] ([GroupId], [PairId]) VALUES (17, 143)
INSERT [dbo].[GroupToPair] ([GroupId], [PairId]) VALUES (17, 144)
INSERT [dbo].[GroupToPair] ([GroupId], [PairId]) VALUES (17, 145)
INSERT [dbo].[GroupToPair] ([GroupId], [PairId]) VALUES (17, 146)
INSERT [dbo].[GroupToPair] ([GroupId], [PairId]) VALUES (17, 147)
INSERT [dbo].[GroupToPair] ([GroupId], [PairId]) VALUES (17, 148)
INSERT [dbo].[GroupToPair] ([GroupId], [PairId]) VALUES (17, 149)
INSERT [dbo].[GroupToPair] ([GroupId], [PairId]) VALUES (17, 150)
INSERT [dbo].[GroupToPair] ([GroupId], [PairId]) VALUES (18, 135)
INSERT [dbo].[GroupToPair] ([GroupId], [PairId]) VALUES (18, 137)
INSERT [dbo].[GroupToPair] ([GroupId], [PairId]) VALUES (18, 138)
INSERT [dbo].[GroupToPair] ([GroupId], [PairId]) VALUES (18, 140)
INSERT [dbo].[GroupToPair] ([GroupId], [PairId]) VALUES (18, 148)
INSERT [dbo].[GroupToPair] ([GroupId], [PairId]) VALUES (18, 150)
INSERT [dbo].[GroupToPair] ([GroupId], [PairId]) VALUES (19, 151)
INSERT [dbo].[GroupToPair] ([GroupId], [PairId]) VALUES (19, 152)
INSERT [dbo].[GroupToPair] ([GroupId], [PairId]) VALUES (19, 153)
INSERT [dbo].[GroupToPair] ([GroupId], [PairId]) VALUES (19, 154)
INSERT [dbo].[GroupToPair] ([GroupId], [PairId]) VALUES (19, 155)
INSERT [dbo].[GroupToPair] ([GroupId], [PairId]) VALUES (19, 156)
INSERT [dbo].[GroupToPair] ([GroupId], [PairId]) VALUES (19, 157)
INSERT [dbo].[GroupToPair] ([GroupId], [PairId]) VALUES (19, 158)
INSERT [dbo].[GroupToPair] ([GroupId], [PairId]) VALUES (19, 159)
INSERT [dbo].[GroupToPair] ([GroupId], [PairId]) VALUES (19, 160)
INSERT [dbo].[GroupToPair] ([GroupId], [PairId]) VALUES (19, 161)
INSERT [dbo].[GroupToPair] ([GroupId], [PairId]) VALUES (19, 162)
SET IDENTITY_INSERT [dbo].[Pair] ON 

INSERT [dbo].[Pair] ([PairId], [DayId], [SubjectId], [TypeId], [WeekendId], [TimeId]) VALUES (134, 1, 58, 1, 1, 3)
INSERT [dbo].[Pair] ([PairId], [DayId], [SubjectId], [TypeId], [WeekendId], [TimeId]) VALUES (135, 1, 59, 2, 1, 4)
INSERT [dbo].[Pair] ([PairId], [DayId], [SubjectId], [TypeId], [WeekendId], [TimeId]) VALUES (136, 1, 60, 1, 3, 5)
INSERT [dbo].[Pair] ([PairId], [DayId], [SubjectId], [TypeId], [WeekendId], [TimeId]) VALUES (137, 2, 61, 2, 1, 1)
INSERT [dbo].[Pair] ([PairId], [DayId], [SubjectId], [TypeId], [WeekendId], [TimeId]) VALUES (138, 2, 58, 2, 1, 2)
INSERT [dbo].[Pair] ([PairId], [DayId], [SubjectId], [TypeId], [WeekendId], [TimeId]) VALUES (139, 2, 62, 1, 1, 3)
INSERT [dbo].[Pair] ([PairId], [DayId], [SubjectId], [TypeId], [WeekendId], [TimeId]) VALUES (140, 3, 63, 2, 3, 4)
INSERT [dbo].[Pair] ([PairId], [DayId], [SubjectId], [TypeId], [WeekendId], [TimeId]) VALUES (141, 3, 61, 1, 2, 4)
INSERT [dbo].[Pair] ([PairId], [DayId], [SubjectId], [TypeId], [WeekendId], [TimeId]) VALUES (142, 3, 63, 1, 3, 5)
INSERT [dbo].[Pair] ([PairId], [DayId], [SubjectId], [TypeId], [WeekendId], [TimeId]) VALUES (143, 3, 61, 1, 2, 5)
INSERT [dbo].[Pair] ([PairId], [DayId], [SubjectId], [TypeId], [WeekendId], [TimeId]) VALUES (144, 3, 61, 1, 3, 6)
INSERT [dbo].[Pair] ([PairId], [DayId], [SubjectId], [TypeId], [WeekendId], [TimeId]) VALUES (145, 4, 58, 1, 2, 3)
INSERT [dbo].[Pair] ([PairId], [DayId], [SubjectId], [TypeId], [WeekendId], [TimeId]) VALUES (146, 4, 64, 1, 1, 4)
INSERT [dbo].[Pair] ([PairId], [DayId], [SubjectId], [TypeId], [WeekendId], [TimeId]) VALUES (147, 4, 64, 1, 3, 5)
INSERT [dbo].[Pair] ([PairId], [DayId], [SubjectId], [TypeId], [WeekendId], [TimeId]) VALUES (148, 5, 62, 2, 1, 2)
INSERT [dbo].[Pair] ([PairId], [DayId], [SubjectId], [TypeId], [WeekendId], [TimeId]) VALUES (149, 5, 65, 1, 1, 3)
INSERT [dbo].[Pair] ([PairId], [DayId], [SubjectId], [TypeId], [WeekendId], [TimeId]) VALUES (150, 5, 65, 2, 1, 4)
INSERT [dbo].[Pair] ([PairId], [DayId], [SubjectId], [TypeId], [WeekendId], [TimeId]) VALUES (151, 1, 61, 1, 2, 2)
INSERT [dbo].[Pair] ([PairId], [DayId], [SubjectId], [TypeId], [WeekendId], [TimeId]) VALUES (152, 1, 61, 1, 1, 3)
INSERT [dbo].[Pair] ([PairId], [DayId], [SubjectId], [TypeId], [WeekendId], [TimeId]) VALUES (153, 3, 62, 1, 1, 3)
INSERT [dbo].[Pair] ([PairId], [DayId], [SubjectId], [TypeId], [WeekendId], [TimeId]) VALUES (154, 3, 65, 1, 2, 4)
INSERT [dbo].[Pair] ([PairId], [DayId], [SubjectId], [TypeId], [WeekendId], [TimeId]) VALUES (155, 3, 65, 1, 3, 5)
INSERT [dbo].[Pair] ([PairId], [DayId], [SubjectId], [TypeId], [WeekendId], [TimeId]) VALUES (156, 3, 63, 1, 2, 5)
INSERT [dbo].[Pair] ([PairId], [DayId], [SubjectId], [TypeId], [WeekendId], [TimeId]) VALUES (157, 4, 66, 1, 1, 4)
INSERT [dbo].[Pair] ([PairId], [DayId], [SubjectId], [TypeId], [WeekendId], [TimeId]) VALUES (158, 4, 66, 1, 3, 5)
INSERT [dbo].[Pair] ([PairId], [DayId], [SubjectId], [TypeId], [WeekendId], [TimeId]) VALUES (159, 4, 62, 1, 2, 5)
INSERT [dbo].[Pair] ([PairId], [DayId], [SubjectId], [TypeId], [WeekendId], [TimeId]) VALUES (160, 5, 58, 1, 1, 1)
INSERT [dbo].[Pair] ([PairId], [DayId], [SubjectId], [TypeId], [WeekendId], [TimeId]) VALUES (161, 5, 58, 1, 3, 3)
INSERT [dbo].[Pair] ([PairId], [DayId], [SubjectId], [TypeId], [WeekendId], [TimeId]) VALUES (162, 5, 60, 1, 1, 3)
SET IDENTITY_INSERT [dbo].[Pair] OFF
SET IDENTITY_INSERT [dbo].[PairTime] ON 

INSERT [dbo].[PairTime] ([TimeId], [StartTime], [EndTime]) VALUES (1, CAST(N'08:30:00' AS Time), CAST(N'09:50:00' AS Time))
INSERT [dbo].[PairTime] ([TimeId], [StartTime], [EndTime]) VALUES (2, CAST(N'10:10:00' AS Time), CAST(N'11:30:00' AS Time))
INSERT [dbo].[PairTime] ([TimeId], [StartTime], [EndTime]) VALUES (3, CAST(N'11:50:00' AS Time), CAST(N'13:10:00' AS Time))
INSERT [dbo].[PairTime] ([TimeId], [StartTime], [EndTime]) VALUES (4, CAST(N'13:30:00' AS Time), CAST(N'14:50:00' AS Time))
INSERT [dbo].[PairTime] ([TimeId], [StartTime], [EndTime]) VALUES (5, CAST(N'15:05:00' AS Time), CAST(N'16:25:00' AS Time))
INSERT [dbo].[PairTime] ([TimeId], [StartTime], [EndTime]) VALUES (6, CAST(N'16:40:00' AS Time), CAST(N'18:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[PairTime] OFF
SET IDENTITY_INSERT [dbo].[PairType] ON 

INSERT [dbo].[PairType] ([TypeId], [TypeName]) VALUES (1, N'Лаболаторна')
INSERT [dbo].[PairType] ([TypeId], [TypeName]) VALUES (2, N'Лекція')
SET IDENTITY_INSERT [dbo].[PairType] OFF
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (58, N'ТІМС')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (59, N'БАЗИ ДАНИХ ТА ІНФОРМАЦІЙНІ СИСТЕМИ')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (60, N'БД ТА ІС')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (61, N'СИСТЕМИ ЗАХИСТУ ІНФОРМАЦІЇ')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (62, N'ПРОГРАМНЕ ЗАБЕЗПЕЧЕННЯ')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (63, N'КОМПЮТЕРНА ГРАФІКА')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (64, N'(ДВ)ТЕОРІЯ НАДІЙНОСТІ')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (65, N'ЧИСЕЛЬНІ МЕТОДИ')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (66, N'(ДВ) ІНТЕРНЕТ-ТЕХНОЛОГІЇ ОБРОБКИ ДАНИХ')
SET IDENTITY_INSERT [dbo].[Subject] OFF
SET IDENTITY_INSERT [dbo].[Tutor] ON 

INSERT [dbo].[Tutor] ([TutorId], [TutorName]) VALUES (86, N'Жерновий К. Ю.')
INSERT [dbo].[Tutor] ([TutorId], [TutorName]) VALUES (87, N'Николайчук Л. В.')
INSERT [dbo].[Tutor] ([TutorId], [TutorName]) VALUES (88, N'Костів В. Я.')
INSERT [dbo].[Tutor] ([TutorId], [TutorName]) VALUES (89, N'Малець Р. Б.')
INSERT [dbo].[Tutor] ([TutorId], [TutorName]) VALUES (90, N'Голуб Б. М.')
INSERT [dbo].[Tutor] ([TutorId], [TutorName]) VALUES (91, N'Сеньо П. С.')
INSERT [dbo].[Tutor] ([TutorId], [TutorName]) VALUES (92, N'Білоус Т. В.')
INSERT [dbo].[Tutor] ([TutorId], [TutorName]) VALUES (93, N'Ковальчук О. В.')
INSERT [dbo].[Tutor] ([TutorId], [TutorName]) VALUES (94, N'Мельничин А. В.')
INSERT [dbo].[Tutor] ([TutorId], [TutorName]) VALUES (95, N'Ковальчук Б. М.')
INSERT [dbo].[Tutor] ([TutorId], [TutorName]) VALUES (96, N'Гнатишин О. П.')
INSERT [dbo].[Tutor] ([TutorId], [TutorName]) VALUES (97, N'Пасічник Т. В.')
INSERT [dbo].[Tutor] ([TutorId], [TutorName]) VALUES (98, N'Дудикевич А. Т.')
INSERT [dbo].[Tutor] ([TutorId], [TutorName]) VALUES (99, N'Ярмола Г. П.')
INSERT [dbo].[Tutor] ([TutorId], [TutorName]) VALUES (100, N'Стойко Т. І.')
INSERT [dbo].[Tutor] ([TutorId], [TutorName]) VALUES (101, N'Коркуна А.М.)')
INSERT [dbo].[Tutor] ([TutorId], [TutorName]) VALUES (102, N'Коркуна А. М.')
INSERT [dbo].[Tutor] ([TutorId], [TutorName]) VALUES (103, N'Фундак Л. І.')
INSERT [dbo].[Tutor] ([TutorId], [TutorName]) VALUES (104, N'Шевчук С. П.')
INSERT [dbo].[Tutor] ([TutorId], [TutorName]) VALUES (105, N'Хімка У. Т.')
SET IDENTITY_INSERT [dbo].[Tutor] OFF
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (86, 134)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (86, 145)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (87, 134)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (87, 145)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (88, 135)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (88, 136)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (89, 136)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (89, 162)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (90, 137)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (90, 141)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (90, 143)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (91, 138)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (92, 139)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (93, 139)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (94, 140)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (94, 142)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (94, 156)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (95, 144)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (96, 146)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (96, 147)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (97, 148)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (98, 149)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (99, 149)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (99, 150)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (100, 151)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (100, 152)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (100, 153)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (100, 157)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (100, 159)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (101, 151)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (101, 152)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (102, 153)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (102, 159)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (103, 154)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (103, 155)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (103, 160)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (103, 161)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (104, 154)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (104, 155)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (105, 157)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (105, 158)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (105, 160)
INSERT [dbo].[TutorToPair] ([TutorId], [PairId]) VALUES (105, 161)
SET IDENTITY_INSERT [dbo].[Weekend] ON 

INSERT [dbo].[Weekend] ([WeekendId], [WeekendName]) VALUES (1, N'Обидва')
INSERT [dbo].[Weekend] ([WeekendId], [WeekendName]) VALUES (2, N'Знаменник')
INSERT [dbo].[Weekend] ([WeekendId], [WeekendName]) VALUES (3, N'Чисельник')
SET IDENTITY_INSERT [dbo].[Weekend] OFF
ALTER TABLE [dbo].[AuditoriumToPair]  WITH CHECK ADD  CONSTRAINT [FK_AuditoriumToPair_Auditorium] FOREIGN KEY([AuditoriumId])
REFERENCES [dbo].[Auditorium] ([AuditoriumId])
GO
ALTER TABLE [dbo].[AuditoriumToPair] CHECK CONSTRAINT [FK_AuditoriumToPair_Auditorium]
GO
ALTER TABLE [dbo].[AuditoriumToPair]  WITH CHECK ADD  CONSTRAINT [FK_AuditoriumToPair_Pair] FOREIGN KEY([PairId])
REFERENCES [dbo].[Pair] ([PairId])
GO
ALTER TABLE [dbo].[AuditoriumToPair] CHECK CONSTRAINT [FK_AuditoriumToPair_Pair]
GO
ALTER TABLE [dbo].[GroupToPair]  WITH CHECK ADD  CONSTRAINT [FK_GroupToPair_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([GroupId])
GO
ALTER TABLE [dbo].[GroupToPair] CHECK CONSTRAINT [FK_GroupToPair_Group]
GO
ALTER TABLE [dbo].[GroupToPair]  WITH CHECK ADD  CONSTRAINT [FK_GroupToPair_Pair] FOREIGN KEY([PairId])
REFERENCES [dbo].[Pair] ([PairId])
GO
ALTER TABLE [dbo].[GroupToPair] CHECK CONSTRAINT [FK_GroupToPair_Pair]
GO
ALTER TABLE [dbo].[Pair]  WITH CHECK ADD  CONSTRAINT [FK_Pair_Day] FOREIGN KEY([DayId])
REFERENCES [dbo].[Day] ([DayId])
GO
ALTER TABLE [dbo].[Pair] CHECK CONSTRAINT [FK_Pair_Day]
GO
ALTER TABLE [dbo].[Pair]  WITH CHECK ADD  CONSTRAINT [FK_Pair_PairTime] FOREIGN KEY([TimeId])
REFERENCES [dbo].[PairTime] ([TimeId])
GO
ALTER TABLE [dbo].[Pair] CHECK CONSTRAINT [FK_Pair_PairTime]
GO
ALTER TABLE [dbo].[Pair]  WITH CHECK ADD  CONSTRAINT [FK_Pair_PairType] FOREIGN KEY([TypeId])
REFERENCES [dbo].[PairType] ([TypeId])
GO
ALTER TABLE [dbo].[Pair] CHECK CONSTRAINT [FK_Pair_PairType]
GO
ALTER TABLE [dbo].[Pair]  WITH CHECK ADD  CONSTRAINT [FK_Pair_Subject] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([SubjectId])
GO
ALTER TABLE [dbo].[Pair] CHECK CONSTRAINT [FK_Pair_Subject]
GO
ALTER TABLE [dbo].[Pair]  WITH CHECK ADD  CONSTRAINT [FK_Pair_Weekend] FOREIGN KEY([WeekendId])
REFERENCES [dbo].[Weekend] ([WeekendId])
GO
ALTER TABLE [dbo].[Pair] CHECK CONSTRAINT [FK_Pair_Weekend]
GO
ALTER TABLE [dbo].[TutorToPair]  WITH CHECK ADD  CONSTRAINT [FK_TutorToPair_Pair] FOREIGN KEY([PairId])
REFERENCES [dbo].[Pair] ([PairId])
GO
ALTER TABLE [dbo].[TutorToPair] CHECK CONSTRAINT [FK_TutorToPair_Pair]
GO
ALTER TABLE [dbo].[TutorToPair]  WITH CHECK ADD  CONSTRAINT [FK_TutorToPair_Tutor] FOREIGN KEY([TutorId])
REFERENCES [dbo].[Tutor] ([TutorId])
GO
ALTER TABLE [dbo].[TutorToPair] CHECK CONSTRAINT [FK_TutorToPair_Tutor]
GO
/****** Object:  StoredProcedure [dbo].[ClearDB]    Script Date: 09.05.2018 13:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ClearDB]
AS
BEGIN
DELETE FROM [AuditoriumToPair]
DELETE FROM [GroupToPair]
DELETE FROM [TutorToPair]
DELETE FROM [Auditorium]
DELETE FROM [Group]
DELETE FROM [Tutor]
DELETE FROM [Pair]
DELETE FROM [Subject]
DELETE FROM [ScheduleFile]
END
GO
/****** Object:  StoredProcedure [dbo].[GetAuditoriumId]    Script Date: 09.05.2018 13:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAuditoriumId] @AuditoriumName nvarchar(max)
	AS
	BEGIN 
		DECLARE
			@AuditoriumId bigint
		SELECT TOP 1 @AuditoriumId = [dbo].[Auditorium].[AuditoriumId]
		FROM [dbo].[Auditorium]
		WHERE [dbo].[Auditorium].[AuditoriumName] = @AuditoriumName
		
		IF (ISNULL(@AuditoriumId, 1) = 1)
		BEGIN	
			INSERT INTO [dbo].[Auditorium]			
			VALUES (@AuditoriumName)
			SELECT @AuditoriumId = SCOPE_IDENTITY()
		END
		RETURN @AuditoriumId
	END
GO
/****** Object:  StoredProcedure [dbo].[GetGroupId]    Script Date: 09.05.2018 13:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetGroupId] @GroupName nvarchar(max)
	AS
	BEGIN 
		DECLARE
			@GroupId bigint
		SELECT TOP 1 @GroupId = [dbo].[Group].[GroupId]
		FROM [dbo].[Group]
		WHERE [dbo].[Group].[GroupName] = @GroupName
		
		IF (ISNULL(@GroupId, 1) = 1)
		BEGIN	
			INSERT INTO [dbo].[Group]			
			VALUES (@GroupName)
			SELECT @GroupId = SCOPE_IDENTITY()
		END
		RETURN @GroupId 
	END
GO
/****** Object:  StoredProcedure [dbo].[GetHashesOfFiles]    Script Date: 09.05.2018 13:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetHashesOfFiles]
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			SELECT [dbo].[ScheduleFile].[FileHash]
			FROM [dbo].[ScheduleFile]
		COMMIT TRANSACTION
	END TRY 
	BEGIN CATCH
		ROLLBACK TRANSACTION
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[GetSubjectId]    Script Date: 09.05.2018 13:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetSubjectId] @SubjectName nvarchar(max)
	AS
	BEGIN 
		DECLARE
			@SubjectId bigint
		SELECT TOP 1 @SubjectId = [dbo].[Subject].[SubjectId]
		FROM [dbo].[Subject]
		WHERE [dbo].[Subject].[SubjectName] = @SubjectName
		
		IF (ISNULL(@SubjectId, 1) = 1)
		BEGIN	
			INSERT INTO [dbo].[Subject]			
			VALUES (@SubjectName)
			SELECT @SubjectId = SCOPE_IDENTITY()
		END
		RETURN @SubjectId
	END
GO
/****** Object:  StoredProcedure [dbo].[GetTutorId]    Script Date: 09.05.2018 13:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTutorId] @TutorName nvarchar(max)
	AS
	BEGIN 
		DECLARE
			@TutorId bigint
		SELECT TOP 1 @TutorId = [dbo].[Tutor].[TutorId]
		FROM [dbo].[Tutor]
		WHERE [dbo].[Tutor].[TutorName] = @TutorName
		
		IF (ISNULL(@TutorId, 1) = 1)
		BEGIN	
			INSERT INTO [dbo].[Tutor]			
			VALUES (@TutorName)
			SELECT @TutorId = SCOPE_IDENTITY()
		END
		RETURN @TutorId
	END
GO
/****** Object:  StoredProcedure [dbo].[InsertAuditoriumForPair]    Script Date: 09.05.2018 13:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertAuditoriumForPair] 
@PairId bigint,
@AuditoriumName nvarchar(max)
AS
BEGIN
	DECLARE	
		@AuditoriumId bigint
	exec @AuditoriumId = [dbo].[GetAuditoriumId] @AuditoriumName = @AuditoriumName

	INSERT INTO [dbo].[AuditoriumToPair] (PairId, AuditoriumId)
	VALUES (@PairId, @AuditoriumId)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertGroupForPair]    Script Date: 09.05.2018 13:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertGroupForPair] 
@PairId bigint,
@GroupName nvarchar(max)
AS
BEGIN
	DECLARE	
		@GroupId bigint
	exec @GroupId = [dbo].[GetGroupId] @GroupName = @GroupName

	INSERT INTO [dbo].[GroupToPair] (PairId, GroupId)
	VALUES (@PairId, @GroupId)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertHashOfFile]    Script Date: 09.05.2018 13:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[InsertHashOfFile]
@filePath nvarchar (max),
@fileHash varbinary (max)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO [dbo].[ScheduleFile](FilePath, FileHash)
			values (@filePath, @fileHash)
		COMMIT TRANSACTION
	END TRY 
	BEGIN CATCH
		ROLLBACK TRANSACTION
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[InsertPair]    Script Date: 09.05.2018 13:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertPair] 
@Type nvarchar(max),
@Weekend nvarchar(max),
@Subject nvarchar(max),
@Day nvarchar(max),
@StartTime time(7),
@EndTime time(7)
AS
BEGIN
	DECLARE	
		@TypeId smallint,
		@WeekendId smallint,
		@SubjectId bigint,
		@DayId smallint,
		@PairTimeId smallint
	select top 1 @WeekendId = [dbo].[Weekend].[WeekendId]
	from [dbo].[Weekend] 
	where [dbo].[Weekend].[WeekendName] = @Weekend

	select top 1 @TypeId = [dbo].[PairType].[TypeId] 
	from [dbo].[PairType]
	where [dbo].[PairType].[TypeName] = @Type

	select top 1 @DayId = [dbo].[Day].[DayId] 
	from [dbo].[Day]
	where [dbo].[Day].[DayName] = @Day
	
	select top 1 @PairTimeId = [dbo].[PairTime].[TimeId] 
	from [dbo].[PairTime]
	where [dbo].[PairTime].[StartTime] = @StartTime and
		  [dbo].[PairTime].[EndTime] = @EndTime

	exec @SubjectId = GetSubjectId @SubjectName = @Subject

	INSERT INTO [dbo].[Pair] (DayId, SubjectId, TypeId, WeekendId, TimeId)
	VALUES (@DayId, @SubjectId, @TypeId, @WeekendId, @PairTimeId)

	SELECT SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[InsertTutorForPair]    Script Date: 09.05.2018 13:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertTutorForPair] 
@PairId bigint,
@TutorName nvarchar(max)
AS
BEGIN
	DECLARE	
		@TutorId bigint
	exec @TutorId = [dbo].[GetTutorId] @TutorName = @TutorName

	INSERT INTO [dbo].[TutorToPair] (PairId, TutorId)
	VALUES (@PairId, @TutorId)
END
GO
USE [master]
GO
ALTER DATABASE [ScheduleDB] SET  READ_WRITE 
GO
