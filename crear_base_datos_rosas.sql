USE [master]
GO
/****** Object:  Database [RosaCultivoDB]    Script Date: 18/06/2025 4:37:36 p. m. ******/
CREATE DATABASE [RosaCultivoDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RosaCultivoDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\RosaCultivoDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RosaCultivoDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\RosaCultivoDB.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [RosaCultivoDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RosaCultivoDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RosaCultivoDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RosaCultivoDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RosaCultivoDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RosaCultivoDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RosaCultivoDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [RosaCultivoDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RosaCultivoDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RosaCultivoDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RosaCultivoDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RosaCultivoDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RosaCultivoDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RosaCultivoDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RosaCultivoDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RosaCultivoDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RosaCultivoDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [RosaCultivoDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RosaCultivoDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RosaCultivoDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RosaCultivoDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RosaCultivoDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RosaCultivoDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RosaCultivoDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RosaCultivoDB] SET RECOVERY FULL 
GO
ALTER DATABASE [RosaCultivoDB] SET  MULTI_USER 
GO
ALTER DATABASE [RosaCultivoDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RosaCultivoDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RosaCultivoDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RosaCultivoDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RosaCultivoDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RosaCultivoDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'RosaCultivoDB', N'ON'
GO
ALTER DATABASE [RosaCultivoDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [RosaCultivoDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [RosaCultivoDB]
GO
/****** Object:  Table [dbo].[tb_Ciclo_Facturacion]    Script Date: 18/06/2025 4:37:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Ciclo_Facturacion](
	[id_ciclo_facturacion] [int] IDENTITY(1,1) NOT NULL,
	[fecha_inicio] [date] NOT NULL,
	[fecha_fin] [date] NOT NULL,
 CONSTRAINT [PK_tb_Ciclo_Facturacion] PRIMARY KEY CLUSTERED 
(
	[id_ciclo_facturacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Operario]    Script Date: 18/06/2025 4:37:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Operario](
	[id_operario] [int] IDENTITY(1,1) NOT NULL,
	[numero_documento] [varchar](50) NOT NULL,
	[nombres] [varchar](50) NOT NULL,
	[apellidos] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tb_Operario] PRIMARY KEY CLUSTERED 
(
	[id_operario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Poda]    Script Date: 18/06/2025 4:37:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Poda](
	[id_poda] [int] IDENTITY(1,1) NOT NULL,
	[fecha_poda] [date] NOT NULL,
	[id_operario] [int] NOT NULL,
	[id_ciclo_facturacion] [int] NOT NULL,
	[id_ubicacion_cama] [int] NOT NULL,
 CONSTRAINT [PK_tb_Poda] PRIMARY KEY CLUSTERED 
(
	[id_poda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Tallo_Podado]    Script Date: 18/06/2025 4:37:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Tallo_Podado](
	[id_tallo_podado] [int] IDENTITY(1,1) NOT NULL,
	[cantidad] [int] NOT NULL,
	[id_poda] [int] NOT NULL,
 CONSTRAINT [PK_tb_Tallo_Podado] PRIMARY KEY CLUSTERED 
(
	[id_tallo_podado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Ubicacion_Cama]    Script Date: 18/06/2025 4:37:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Ubicacion_Cama](
	[id_ubicacion_cama] [int] IDENTITY(1,1) NOT NULL,
	[bloque] [varchar](50) NOT NULL,
	[numero_cama] [int] NOT NULL,
 CONSTRAINT [PK_tb_Ubicacion_Cama] PRIMARY KEY CLUSTERED 
(
	[id_ubicacion_cama] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tb_Ciclo_Facturacion] ON 

INSERT [dbo].[tb_Ciclo_Facturacion] ([id_ciclo_facturacion], [fecha_inicio], [fecha_fin]) VALUES (1, CAST(N'2024-01-01' AS Date), CAST(N'2024-03-31' AS Date))
INSERT [dbo].[tb_Ciclo_Facturacion] ([id_ciclo_facturacion], [fecha_inicio], [fecha_fin]) VALUES (2, CAST(N'2024-04-01' AS Date), CAST(N'2024-06-30' AS Date))
INSERT [dbo].[tb_Ciclo_Facturacion] ([id_ciclo_facturacion], [fecha_inicio], [fecha_fin]) VALUES (3, CAST(N'2024-07-01' AS Date), CAST(N'2024-09-30' AS Date))
INSERT [dbo].[tb_Ciclo_Facturacion] ([id_ciclo_facturacion], [fecha_inicio], [fecha_fin]) VALUES (4, CAST(N'2024-10-01' AS Date), CAST(N'2024-12-31' AS Date))
INSERT [dbo].[tb_Ciclo_Facturacion] ([id_ciclo_facturacion], [fecha_inicio], [fecha_fin]) VALUES (5, CAST(N'2025-01-01' AS Date), CAST(N'2025-03-31' AS Date))
INSERT [dbo].[tb_Ciclo_Facturacion] ([id_ciclo_facturacion], [fecha_inicio], [fecha_fin]) VALUES (6, CAST(N'2025-04-01' AS Date), CAST(N'2025-06-30' AS Date))
INSERT [dbo].[tb_Ciclo_Facturacion] ([id_ciclo_facturacion], [fecha_inicio], [fecha_fin]) VALUES (7, CAST(N'2025-07-01' AS Date), CAST(N'2025-09-30' AS Date))
INSERT [dbo].[tb_Ciclo_Facturacion] ([id_ciclo_facturacion], [fecha_inicio], [fecha_fin]) VALUES (8, CAST(N'2025-10-01' AS Date), CAST(N'2025-12-31' AS Date))
INSERT [dbo].[tb_Ciclo_Facturacion] ([id_ciclo_facturacion], [fecha_inicio], [fecha_fin]) VALUES (9, CAST(N'2026-01-01' AS Date), CAST(N'2026-03-31' AS Date))
INSERT [dbo].[tb_Ciclo_Facturacion] ([id_ciclo_facturacion], [fecha_inicio], [fecha_fin]) VALUES (10, CAST(N'2026-04-01' AS Date), CAST(N'2026-06-30' AS Date))
SET IDENTITY_INSERT [dbo].[tb_Ciclo_Facturacion] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Operario] ON 

INSERT [dbo].[tb_Operario] ([id_operario], [numero_documento], [nombres], [apellidos]) VALUES (1, N'123456789', N'Juan', N'Pérez')
INSERT [dbo].[tb_Operario] ([id_operario], [numero_documento], [nombres], [apellidos]) VALUES (2, N'987654321', N'María', N'Gómez')
INSERT [dbo].[tb_Operario] ([id_operario], [numero_documento], [nombres], [apellidos]) VALUES (3, N'456789012', N'Carlos', N'Rodríguez')
INSERT [dbo].[tb_Operario] ([id_operario], [numero_documento], [nombres], [apellidos]) VALUES (4, N'654321098', N'Elena', N'Martínez')
INSERT [dbo].[tb_Operario] ([id_operario], [numero_documento], [nombres], [apellidos]) VALUES (5, N'789012345', N'Luis', N'Sánchez')
INSERT [dbo].[tb_Operario] ([id_operario], [numero_documento], [nombres], [apellidos]) VALUES (6, N'210987654', N'Sophie', N'Dubois')
INSERT [dbo].[tb_Operario] ([id_operario], [numero_documento], [nombres], [apellidos]) VALUES (7, N'543210987', N'Pablo', N'García')
INSERT [dbo].[tb_Operario] ([id_operario], [numero_documento], [nombres], [apellidos]) VALUES (8, N'876543210', N'Isabella', N'Moreno')
INSERT [dbo].[tb_Operario] ([id_operario], [numero_documento], [nombres], [apellidos]) VALUES (9, N'109876543', N'Miguel', N'López')
INSERT [dbo].[tb_Operario] ([id_operario], [numero_documento], [nombres], [apellidos]) VALUES (10, N'321098765', N'Olivia', N'Fernández')
SET IDENTITY_INSERT [dbo].[tb_Operario] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Poda] ON 

INSERT [dbo].[tb_Poda] ([id_poda], [fecha_poda], [id_operario], [id_ciclo_facturacion], [id_ubicacion_cama]) VALUES (1, CAST(N'2023-02-15' AS Date), 1, 1, 1)
INSERT [dbo].[tb_Poda] ([id_poda], [fecha_poda], [id_operario], [id_ciclo_facturacion], [id_ubicacion_cama]) VALUES (2, CAST(N'2023-03-20' AS Date), 3, 1, 3)
INSERT [dbo].[tb_Poda] ([id_poda], [fecha_poda], [id_operario], [id_ciclo_facturacion], [id_ubicacion_cama]) VALUES (3, CAST(N'2023-05-05' AS Date), 5, 2, 5)
INSERT [dbo].[tb_Poda] ([id_poda], [fecha_poda], [id_operario], [id_ciclo_facturacion], [id_ubicacion_cama]) VALUES (4, CAST(N'2023-06-10' AS Date), 7, 2, 7)
INSERT [dbo].[tb_Poda] ([id_poda], [fecha_poda], [id_operario], [id_ciclo_facturacion], [id_ubicacion_cama]) VALUES (5, CAST(N'2023-08-18' AS Date), 9, 3, 9)
INSERT [dbo].[tb_Poda] ([id_poda], [fecha_poda], [id_operario], [id_ciclo_facturacion], [id_ubicacion_cama]) VALUES (6, CAST(N'2023-09-25' AS Date), 2, 3, 2)
INSERT [dbo].[tb_Poda] ([id_poda], [fecha_poda], [id_operario], [id_ciclo_facturacion], [id_ubicacion_cama]) VALUES (7, CAST(N'2023-11-05' AS Date), 4, 1, 4)
INSERT [dbo].[tb_Poda] ([id_poda], [fecha_poda], [id_operario], [id_ciclo_facturacion], [id_ubicacion_cama]) VALUES (8, CAST(N'2023-12-12' AS Date), 6, 1, 6)
INSERT [dbo].[tb_Poda] ([id_poda], [fecha_poda], [id_operario], [id_ciclo_facturacion], [id_ubicacion_cama]) VALUES (9, CAST(N'2024-02-20' AS Date), 8, 2, 8)
INSERT [dbo].[tb_Poda] ([id_poda], [fecha_poda], [id_operario], [id_ciclo_facturacion], [id_ubicacion_cama]) VALUES (10, CAST(N'2024-03-25' AS Date), 10, 2, 10)
SET IDENTITY_INSERT [dbo].[tb_Poda] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Tallo_Podado] ON 

INSERT [dbo].[tb_Tallo_Podado] ([id_tallo_podado], [cantidad], [id_poda]) VALUES (1, 20, 5)
INSERT [dbo].[tb_Tallo_Podado] ([id_tallo_podado], [cantidad], [id_poda]) VALUES (2, 15, 2)
INSERT [dbo].[tb_Tallo_Podado] ([id_tallo_podado], [cantidad], [id_poda]) VALUES (3, 30, 8)
INSERT [dbo].[tb_Tallo_Podado] ([id_tallo_podado], [cantidad], [id_poda]) VALUES (4, 25, 3)
INSERT [dbo].[tb_Tallo_Podado] ([id_tallo_podado], [cantidad], [id_poda]) VALUES (5, 18, 7)
INSERT [dbo].[tb_Tallo_Podado] ([id_tallo_podado], [cantidad], [id_poda]) VALUES (6, 22, 1)
INSERT [dbo].[tb_Tallo_Podado] ([id_tallo_podado], [cantidad], [id_poda]) VALUES (7, 12, 9)
INSERT [dbo].[tb_Tallo_Podado] ([id_tallo_podado], [cantidad], [id_poda]) VALUES (8, 28, 4)
INSERT [dbo].[tb_Tallo_Podado] ([id_tallo_podado], [cantidad], [id_poda]) VALUES (9, 17, 6)
INSERT [dbo].[tb_Tallo_Podado] ([id_tallo_podado], [cantidad], [id_poda]) VALUES (10, 23, 10)
INSERT [dbo].[tb_Tallo_Podado] ([id_tallo_podado], [cantidad], [id_poda]) VALUES (11, 18, 3)
INSERT [dbo].[tb_Tallo_Podado] ([id_tallo_podado], [cantidad], [id_poda]) VALUES (12, 26, 8)
INSERT [dbo].[tb_Tallo_Podado] ([id_tallo_podado], [cantidad], [id_poda]) VALUES (13, 14, 1)
INSERT [dbo].[tb_Tallo_Podado] ([id_tallo_podado], [cantidad], [id_poda]) VALUES (14, 21, 5)
INSERT [dbo].[tb_Tallo_Podado] ([id_tallo_podado], [cantidad], [id_poda]) VALUES (15, 19, 2)
SET IDENTITY_INSERT [dbo].[tb_Tallo_Podado] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Ubicacion_Cama] ON 

INSERT [dbo].[tb_Ubicacion_Cama] ([id_ubicacion_cama], [bloque], [numero_cama]) VALUES (1, N'Bloque A', 1)
INSERT [dbo].[tb_Ubicacion_Cama] ([id_ubicacion_cama], [bloque], [numero_cama]) VALUES (2, N'Bloque B', 2)
INSERT [dbo].[tb_Ubicacion_Cama] ([id_ubicacion_cama], [bloque], [numero_cama]) VALUES (3, N'Bloque C', 3)
INSERT [dbo].[tb_Ubicacion_Cama] ([id_ubicacion_cama], [bloque], [numero_cama]) VALUES (4, N'Bloque A', 4)
INSERT [dbo].[tb_Ubicacion_Cama] ([id_ubicacion_cama], [bloque], [numero_cama]) VALUES (5, N'Bloque B', 5)
INSERT [dbo].[tb_Ubicacion_Cama] ([id_ubicacion_cama], [bloque], [numero_cama]) VALUES (6, N'Bloque C', 6)
INSERT [dbo].[tb_Ubicacion_Cama] ([id_ubicacion_cama], [bloque], [numero_cama]) VALUES (7, N'Bloque A', 7)
INSERT [dbo].[tb_Ubicacion_Cama] ([id_ubicacion_cama], [bloque], [numero_cama]) VALUES (8, N'Bloque B', 8)
INSERT [dbo].[tb_Ubicacion_Cama] ([id_ubicacion_cama], [bloque], [numero_cama]) VALUES (9, N'Bloque C', 9)
INSERT [dbo].[tb_Ubicacion_Cama] ([id_ubicacion_cama], [bloque], [numero_cama]) VALUES (10, N'Bloque A', 10)
SET IDENTITY_INSERT [dbo].[tb_Ubicacion_Cama] OFF
GO
ALTER TABLE [dbo].[tb_Poda]  WITH CHECK ADD  CONSTRAINT [FK_tb_Poda_tb_Ciclo_Facturacion] FOREIGN KEY([id_ciclo_facturacion])
REFERENCES [dbo].[tb_Ciclo_Facturacion] ([id_ciclo_facturacion])
GO
ALTER TABLE [dbo].[tb_Poda] CHECK CONSTRAINT [FK_tb_Poda_tb_Ciclo_Facturacion]
GO
ALTER TABLE [dbo].[tb_Poda]  WITH CHECK ADD  CONSTRAINT [FK_tb_Poda_tb_Operario] FOREIGN KEY([id_operario])
REFERENCES [dbo].[tb_Operario] ([id_operario])
GO
ALTER TABLE [dbo].[tb_Poda] CHECK CONSTRAINT [FK_tb_Poda_tb_Operario]
GO
ALTER TABLE [dbo].[tb_Poda]  WITH CHECK ADD  CONSTRAINT [FK_tb_Poda_tb_Ubicacion_Cama] FOREIGN KEY([id_ubicacion_cama])
REFERENCES [dbo].[tb_Ubicacion_Cama] ([id_ubicacion_cama])
GO
ALTER TABLE [dbo].[tb_Poda] CHECK CONSTRAINT [FK_tb_Poda_tb_Ubicacion_Cama]
GO
ALTER TABLE [dbo].[tb_Tallo_Podado]  WITH CHECK ADD  CONSTRAINT [FK_tb_Tallo_Podado_tb_Poda] FOREIGN KEY([id_poda])
REFERENCES [dbo].[tb_Poda] ([id_poda])
GO
ALTER TABLE [dbo].[tb_Tallo_Podado] CHECK CONSTRAINT [FK_tb_Tallo_Podado_tb_Poda]
GO
/****** Object:  StoredProcedure [dbo].[sp_filtrar_por_paises]    Script Date: 18/06/2025 4:37:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_filtrar_por_paises]
    @ListaPaises NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM ALUMNO
    WHERE PAIS IN (
        SELECT TRIM(value)
        FROM STRING_SPLIT(@ListaPaises, ',')
    );
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_reporting]    Script Date: 18/06/2025 4:37:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_reporting]

--a.	Que reciba 3 parámetros un entero, un texto y una fecha:

    @entero INT,
    @texto  NVARCHAR(100),
    @fecha  DATE
AS
BEGIN
    DECLARE @anio INT, @mes INT, @dia INT, @largo INT, @comparacion NVARCHAR(20);
    DECLARE @contador INT = 1;

--b. Con el parámetro de fecha se debe sacar año, día y mes como variables aparte:

    SET @anio = YEAR(@fecha);
    SET @mes  = MONTH(@fecha);
    SET @dia  = DAY(@fecha);

	/*
	c.Con la variable texto se debe obtener el largo de la información guarda en esta y dependiendo del largo
	se debe agregar un campo indicando si es mayor a la variable tipo entero o menor.:
	*/

    -- Obtener largo del texto
    SET @largo = LEN(@texto);

    -- Comparar largo con entero
    IF @largo > @entero
        SET @comparacion = 'Mayor';
    ELSE
        SET @comparacion = 'Menor o Igual';

    -- Mostrar info resumen
    SELECT 
        @entero      AS Entero,
        @texto       AS Texto,
        @fecha       AS Fecha,
        @anio        AS Año,
        @mes         AS Mes,
        @dia         AS Dia,
        @largo       AS Largo_Texto,
        @comparacion AS Comparacion;

--d. Después de esto se debe generar un código para que las veces del numero entero imprima la variable texto:

    WHILE @contador <= @entero
    BEGIN
        PRINT @texto;
        SET @contador = @contador + 1;
    END

--e. Y al final me devuelva una consulta de la suma del largo del texto:

    SELECT (@largo * @entero) AS Suma_Largo_Texto;

END;
GO
USE [master]
GO
ALTER DATABASE [RosaCultivoDB] SET  READ_WRITE 
GO
