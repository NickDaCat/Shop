USE [master]
GO
/****** Object:  Database [Магазин]    Script Date: 15.11.2023 10:54:01 ******/
CREATE DATABASE [Магазин]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Магазин', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Магазин.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Магазин_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Магазин_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Магазин] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Магазин].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Магазин] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Магазин] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Магазин] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Магазин] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Магазин] SET ARITHABORT OFF 
GO
ALTER DATABASE [Магазин] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Магазин] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Магазин] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Магазин] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Магазин] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Магазин] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Магазин] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Магазин] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Магазин] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Магазин] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Магазин] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Магазин] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Магазин] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Магазин] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Магазин] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Магазин] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Магазин] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Магазин] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Магазин] SET  MULTI_USER 
GO
ALTER DATABASE [Магазин] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Магазин] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Магазин] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Магазин] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Магазин] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Магазин] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Магазин] SET QUERY_STORE = ON
GO
ALTER DATABASE [Магазин] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Магазин]
GO
/****** Object:  Table [dbo].[Заказ]    Script Date: 15.11.2023 10:54:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказ](
	[Номер_заказа] [int] NOT NULL,
	[Состав_заказа] [nvarchar](max) NOT NULL,
	[Дата_заказа] [date] NOT NULL,
	[Дата_доставки] [date] NOT NULL,
	[Пункт_выдачи] [int] NOT NULL,
	[ФИО_клиента] [nvarchar](max) NULL,
	[Код_для_получения] [int] NOT NULL,
	[Статус_заказа] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пользователь]    Script Date: 15.11.2023 10:54:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пользователь](
	[Роль_сотрудника] [int] NOT NULL,
	[ФИО] [nvarchar](max) NOT NULL,
	[Логин] [nvarchar](max) NOT NULL,
	[Пароль] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пункт выдачи]    Script Date: 15.11.2023 10:54:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пункт выдачи](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Пункт_Выдачи] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Пункт выдачи_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Роль]    Script Date: 15.11.2023 10:54:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Роль](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Наименование] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Роль] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Товар]    Script Date: 15.11.2023 10:54:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Товар](
	[Артикул] [nvarchar](50) NOT NULL,
	[Наименование] [nvarchar](max) NOT NULL,
	[Единица_измерения] [nvarchar](max) NULL,
	[Стоимость] [int] NULL,
	[Размер_максимально_возможной_скидки] [int] NULL,
	[Производитель] [nvarchar](max) NULL,
	[Поставщик] [nvarchar](max) NULL,
	[Категория_товара] [nvarchar](max) NULL,
	[Действующая_скидка] [int] NULL,
	[Кол_во_на_складе] [int] NULL,
	[Описание] [nvarchar](max) NULL,
	[Изображение] [nvarchar](max) NULL,
 CONSTRAINT [PK_Товар] PRIMARY KEY CLUSTERED 
(
	[Артикул] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Заказ]  WITH CHECK ADD  CONSTRAINT [FK_Заказ_Пункт выдачи] FOREIGN KEY([Пункт_выдачи])
REFERENCES [dbo].[Пункт выдачи] ([id])
GO
ALTER TABLE [dbo].[Заказ] CHECK CONSTRAINT [FK_Заказ_Пункт выдачи]
GO
ALTER TABLE [dbo].[Пользователь]  WITH CHECK ADD  CONSTRAINT [FK_Пользователь_Роль] FOREIGN KEY([Роль_сотрудника])
REFERENCES [dbo].[Роль] ([id])
GO
ALTER TABLE [dbo].[Пользователь] CHECK CONSTRAINT [FK_Пользователь_Роль]
GO
USE [master]
GO
ALTER DATABASE [Магазин] SET  READ_WRITE 
GO
