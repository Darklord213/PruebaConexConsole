USE [master]
GO
/****** Object:  Database [CursoOnLine]    Script Date: 10/05/2023 15:34:58 ******/
CREATE DATABASE [CursoOnLine]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CursoOnLine', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\CursoOnLine.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CursoOnLine_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\CursoOnLine_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CursoOnLine] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CursoOnLine].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CursoOnLine] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CursoOnLine] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CursoOnLine] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CursoOnLine] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CursoOnLine] SET ARITHABORT OFF 
GO
ALTER DATABASE [CursoOnLine] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CursoOnLine] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CursoOnLine] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CursoOnLine] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CursoOnLine] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CursoOnLine] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CursoOnLine] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CursoOnLine] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CursoOnLine] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CursoOnLine] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CursoOnLine] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CursoOnLine] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CursoOnLine] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CursoOnLine] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CursoOnLine] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CursoOnLine] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CursoOnLine] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CursoOnLine] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CursoOnLine] SET  MULTI_USER 
GO
ALTER DATABASE [CursoOnLine] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CursoOnLine] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CursoOnLine] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CursoOnLine] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CursoOnLine] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CursoOnLine] SET QUERY_STORE = OFF
GO
USE [CursoOnLine]
GO
/****** Object:  Table [dbo].[Comentario]    Script Date: 10/05/2023 15:34:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comentario](
	[ComentarioID] [int] IDENTITY(1,1) NOT NULL,
	[Alumno] [nvarchar](500) NULL,
	[Puntaje] [int] NULL,
	[ComentarioTexto] [nvarchar](max) NULL,
	[CursoID] [int] NULL,
 CONSTRAINT [PK_Comentario] PRIMARY KEY CLUSTERED 
(
	[ComentarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Curso]    Script Date: 10/05/2023 15:34:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curso](
	[CursoID] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [nvarchar](500) NULL,
	[Descripcion] [nvarchar](500) NULL,
	[FechaPublicacion] [datetime] NULL,
	[Fotoportada] [varbinary](max) NULL,
 CONSTRAINT [PK_Curso] PRIMARY KEY CLUSTERED 
(
	[CursoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CursoInstructor]    Script Date: 10/05/2023 15:34:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CursoInstructor](
	[CursoId] [int] NOT NULL,
	[InstructorID] [int] NOT NULL,
 CONSTRAINT [PK_CursoInstructor] PRIMARY KEY CLUSTERED 
(
	[CursoId] ASC,
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 10/05/2023 15:34:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[InstructorID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](500) NULL,
	[Apellidos] [nvarchar](500) NULL,
	[Grado] [nvarchar](500) NULL,
	[FotoPerfil] [varbinary](max) NULL,
 CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED 
(
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Precio]    Script Date: 10/05/2023 15:34:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Precio](
	[PrecioID] [int] IDENTITY(1,1) NOT NULL,
	[PrecioActual] [money] NULL,
	[Promocion] [money] NULL,
	[Cursoid] [int] NULL,
 CONSTRAINT [PK_Precio] PRIMARY KEY CLUSTERED 
(
	[PrecioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Comentario] ON 

INSERT [dbo].[Comentario] ([ComentarioID], [Alumno], [Puntaje], [ComentarioTexto], [CursoID]) VALUES (1, N'Adrian Figueroa', 5, N'Es el mejor curso del mundo mundial', 1)
INSERT [dbo].[Comentario] ([ComentarioID], [Alumno], [Puntaje], [ComentarioTexto], [CursoID]) VALUES (2, N'Camilo Figueroa', 5, N'Curso Guenisimo', 1)
INSERT [dbo].[Comentario] ([ComentarioID], [Alumno], [Puntaje], [ComentarioTexto], [CursoID]) VALUES (3, N'Chelo Delgado', 4, N'Curso mas o menos', 2)
SET IDENTITY_INSERT [dbo].[Comentario] OFF
GO
SET IDENTITY_INSERT [dbo].[Curso] ON 

INSERT [dbo].[Curso] ([CursoID], [Titulo], [Descripcion], [FechaPublicacion], [Fotoportada]) VALUES (1, N'React Hooks Firebase y Material', N'Curso de Programacion', CAST(N'2020-02-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Curso] ([CursoID], [Titulo], [Descripcion], [FechaPublicacion], [Fotoportada]) VALUES (2, N'ASP.Net Core y Reacts Hooks', N'Curso .NEt', CAST(N'2020-11-05T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Curso] OFF
GO
INSERT [dbo].[CursoInstructor] ([CursoId], [InstructorID]) VALUES (1, 1)
INSERT [dbo].[CursoInstructor] ([CursoId], [InstructorID]) VALUES (1, 2)
INSERT [dbo].[CursoInstructor] ([CursoId], [InstructorID]) VALUES (1, 3)
INSERT [dbo].[CursoInstructor] ([CursoId], [InstructorID]) VALUES (2, 1)
INSERT [dbo].[CursoInstructor] ([CursoId], [InstructorID]) VALUES (2, 4)
GO
SET IDENTITY_INSERT [dbo].[Instructor] ON 

INSERT [dbo].[Instructor] ([InstructorID], [Nombre], [Apellidos], [Grado], [FotoPerfil]) VALUES (1, N'Carlos', N'Del Valle', N'AutoDidacta', NULL)
INSERT [dbo].[Instructor] ([InstructorID], [Nombre], [Apellidos], [Grado], [FotoPerfil]) VALUES (2, N'Pedro Pablo', N'Pasculli', N'RecontraDidacta', NULL)
INSERT [dbo].[Instructor] ([InstructorID], [Nombre], [Apellidos], [Grado], [FotoPerfil]) VALUES (3, N'Juan Carlos', N'Esteban', N'Ingeniero', NULL)
INSERT [dbo].[Instructor] ([InstructorID], [Nombre], [Apellidos], [Grado], [FotoPerfil]) VALUES (4, N'Angel', N'DelMonte', N'Ingeniero', NULL)
SET IDENTITY_INSERT [dbo].[Instructor] OFF
GO
SET IDENTITY_INSERT [dbo].[Precio] ON 

INSERT [dbo].[Precio] ([PrecioID], [PrecioActual], [Promocion], [Cursoid]) VALUES (1, 600.0000, 11.9900, 1)
INSERT [dbo].[Precio] ([PrecioID], [PrecioActual], [Promocion], [Cursoid]) VALUES (2, 950.0000, 13.9900, 2)
SET IDENTITY_INSERT [dbo].[Precio] OFF
GO
ALTER TABLE [dbo].[Comentario]  WITH CHECK ADD  CONSTRAINT [FK_Comentario_Curso] FOREIGN KEY([CursoID])
REFERENCES [dbo].[Curso] ([CursoID])
GO
ALTER TABLE [dbo].[Comentario] CHECK CONSTRAINT [FK_Comentario_Curso]
GO
ALTER TABLE [dbo].[CursoInstructor]  WITH CHECK ADD  CONSTRAINT [FK_CuroInstructor_Cursoid] FOREIGN KEY([CursoId])
REFERENCES [dbo].[Curso] ([CursoID])
GO
ALTER TABLE [dbo].[CursoInstructor] CHECK CONSTRAINT [FK_CuroInstructor_Cursoid]
GO
ALTER TABLE [dbo].[CursoInstructor]  WITH CHECK ADD  CONSTRAINT [FK_Curso_Instructor_Instructor_Id] FOREIGN KEY([InstructorID])
REFERENCES [dbo].[Instructor] ([InstructorID])
GO
ALTER TABLE [dbo].[CursoInstructor] CHECK CONSTRAINT [FK_Curso_Instructor_Instructor_Id]
GO
ALTER TABLE [dbo].[Precio]  WITH CHECK ADD  CONSTRAINT [FK_PRecio_Curso] FOREIGN KEY([Cursoid])
REFERENCES [dbo].[Curso] ([CursoID])
GO
ALTER TABLE [dbo].[Precio] CHECK CONSTRAINT [FK_PRecio_Curso]
GO
USE [master]
GO
ALTER DATABASE [CursoOnLine] SET  READ_WRITE 
GO
