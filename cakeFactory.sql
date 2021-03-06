USE [master]
GO
/****** Object:  Database [CakeFactory]    Script Date: 06/01/2016 12:48:41 ******/
CREATE DATABASE [CakeFactory] ON  PRIMARY 
( NAME = N'CakeFactory', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\CakeFactory.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CakeFactory_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\CakeFactory_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CakeFactory] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CakeFactory].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CakeFactory] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [CakeFactory] SET ANSI_NULLS OFF
GO
ALTER DATABASE [CakeFactory] SET ANSI_PADDING OFF
GO
ALTER DATABASE [CakeFactory] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [CakeFactory] SET ARITHABORT OFF
GO
ALTER DATABASE [CakeFactory] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [CakeFactory] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [CakeFactory] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [CakeFactory] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [CakeFactory] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [CakeFactory] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [CakeFactory] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [CakeFactory] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [CakeFactory] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [CakeFactory] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [CakeFactory] SET  DISABLE_BROKER
GO
ALTER DATABASE [CakeFactory] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [CakeFactory] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [CakeFactory] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [CakeFactory] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [CakeFactory] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [CakeFactory] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [CakeFactory] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [CakeFactory] SET  READ_WRITE
GO
ALTER DATABASE [CakeFactory] SET RECOVERY SIMPLE
GO
ALTER DATABASE [CakeFactory] SET  MULTI_USER
GO
ALTER DATABASE [CakeFactory] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [CakeFactory] SET DB_CHAINING OFF
GO
USE [CakeFactory]
GO
/****** Object:  Table [dbo].[Pastel]    Script Date: 06/01/2016 12:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pastel](
	[id_pas] [int] IDENTITY(1,1) NOT NULL,
	[url_pas] [nvarchar](150) NULL,
	[costo_pas] [decimal](18, 2) NULL,
	[descripcion_pas] [nvarchar](50) NULL,
	[imagen_pas] [image] NULL,
 CONSTRAINT [PK_id_pas] PRIMARY KEY CLUSTERED 
(
	[id_pas] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[obtenerPastelPorId]    Script Date: 06/01/2016 12:49:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[obtenerPastelPorId]
	@id_pas int
as
	select id_pas, url_pas, costo_pas, descripcion_pas, imagen_pas from Pastel where id_pas = @id_pas
GO
/****** Object:  StoredProcedure [dbo].[obtenerPastel]    Script Date: 06/01/2016 12:49:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[obtenerPastel]
as
select id_pas, url_pas, costo_pas, descripcion_pas, imagen_pas from Pastel
GO
/****** Object:  StoredProcedure [dbo].[modificarPastel]    Script Date: 06/01/2016 12:49:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[modificarPastel](
	@id_pas int,
	@url_pas nvarchar(150),
	@costo_pas decimal(18,2),
	@descripcion_pas nvarchar(50)
)
as
	update Pastel set url_pas = @url_pas , costo_pas = @costo_pas ,descripcion_pas = @descripcion_pas where id_pas = @id_pas
GO
/****** Object:  StoredProcedure [dbo].[insertarPastel]    Script Date: 06/01/2016 12:49:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[insertarPastel](
	@url_pas nvarchar(150),
	@costo_pas decimal(18,2),
	@descripcion_pas nvarchar(50),
	@imagen_pas image
)
as
	Insert into Pastel (url_pas , costo_pas,descripcion_pas, imagen_pas ) values (@url_pas , @costo_pas,@descripcion_pas, @imagen_pas  )
GO
/****** Object:  StoredProcedure [dbo].[borrarPastel]    Script Date: 06/01/2016 12:49:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[borrarPastel](
	@id_pas int
	
)
as
	Delete Pastel where id_pas = @id_pas
GO
