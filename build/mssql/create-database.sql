USE [master]
GO
:on error exit

IF EXISTS (SELECT name
FROM sys.databases
WHERE name = N'project_db')
RaisError ('DB Exists; aboring script', 15, 10)

GO
/****** Object:  Database [project_db]    Script Date: 5/17/2020 6:58:10 PM ******/

IF NOT EXISTS (SELECT name
FROM sys.databases
WHERE name = N'project_db')
BEGIN
  CREATE DATABASE [project_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'project_db', FILENAME = N'/var/opt/mssql/data/project_db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'project_db_log', FILENAME = N'/var/opt/mssql/data/project_db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
END
GO


ALTER DATABASE [project_db] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
  EXEC [project_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [project_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [project_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [project_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [project_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [project_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [project_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [project_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [project_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [project_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [project_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [project_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [project_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [project_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [project_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [project_db] SET  ENABLE_BROKER 
GO
ALTER DATABASE [project_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [project_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [project_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [project_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [project_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [project_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [project_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [project_db] SET RECOVERY FULL 
GO
ALTER DATABASE [project_db] SET  MULTI_USER 
GO
ALTER DATABASE [project_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [project_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [project_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [project_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [project_db] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'project_db', N'ON'
GO
ALTER DATABASE [project_db] SET QUERY_STORE = OFF
GO
USE [project_db]
GO
/****** Object:  Table [dbo].[users]    Script Date: 5/17/2020 6:58:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[users]') AND type in (N'U'))
BEGIN
  CREATE TABLE [dbo].[users]
  (
    [id] [int] IDENTITY(1,1) NOT NULL,
    [name] [varchar](50) NULL,
    [email] [varchar](50) NULL,
    CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
  ) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[users] ON 
GO
INSERT [dbo].[users]
  ([id], [name], [email])
VALUES
  (1, N'Gavin', N'gavin@ortussolutions.com')
GO
INSERT [dbo].[users]
  ([id], [name], [email])
VALUES
  (2, N'Luis', N'lmajano@ortussolutions.com')
GO
SET IDENTITY_INSERT [dbo].[users] OFF
GO
USE [master]
GO
ALTER DATABASE [project_db] SET  READ_WRITE 
GO
