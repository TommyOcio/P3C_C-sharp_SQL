USE [sape]
GO
/****** Object:  Table [dbo].[Alumnos]    Script Date: 12/05/2016 17:21:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Alumnos](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Direccion] [text] NULL,
	[Fecha_nacimiento] [date] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CUENTAPAGOXPASAJERO]    Script Date: 12/05/2016 17:21:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CUENTAPAGOXPASAJERO](
	[IDPASAJERO] [char](5) NOT NULL,
	[TOTAL] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PAGOS]    Script Date: 12/05/2016 17:21:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PAGOS](
	[NUMPAGO] [int] NULL,
	[IDRESERVA] [int] NULL,
	[IDPASAJERO] [varchar](50) NULL,
	[FECHA] [varchar](500) NULL,
	[MONTO] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PAIS]    Script Date: 12/05/2016 17:21:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PAIS](
	[IDPAIS] [varchar](50) NULL,
	[PAIS] [varchar](500) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PASAJERO]    Script Date: 12/05/2016 17:21:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PASAJERO](
	[IDPASAJERO] [varchar](50) NOT NULL,
	[NOMBRES] [varchar](500) NULL,
	[IDPAIS] [varchar](500) NULL,
	[TELEFONO] [varchar](500) NULL,
	[EMAIL] [varchar](500) NULL,
 CONSTRAINT [PK_PASAJERO] PRIMARY KEY CLUSTERED 
(
	[IDPASAJERO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PASAJEROSBAK]    Script Date: 12/05/2016 17:21:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PASAJEROSBAK](
	[IDPASAJERO] [char](5) NOT NULL,
	[NOMBRES] [varchar](50) NOT NULL,
	[IDPAIS] [char](4) NOT NULL,
	[TELEFONO] [char](15) NOT NULL,
	[EMAIL] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDPASAJERO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 12/05/2016 17:21:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[Contraseña] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Alumnos] ON 

INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [Direccion], [Fecha_nacimiento]) VALUES (1, N'Marchelo', N'Sanchez', N'tacna', CAST(N'2016-05-07' AS Date))
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [Direccion], [Fecha_nacimiento]) VALUES (2, N'Nestor', N'Mercedez', N'Tacna', CAST(N'2016-05-07' AS Date))
SET IDENTITY_INSERT [dbo].[Alumnos] OFF
INSERT [dbo].[CUENTAPAGOXPASAJERO] ([IDPASAJERO], [TOTAL]) VALUES (N'P0002', 2)
INSERT [dbo].[CUENTAPAGOXPASAJERO] ([IDPASAJERO], [TOTAL]) VALUES (N'P0009', 4)
INSERT [dbo].[PAGOS] ([NUMPAGO], [IDRESERVA], [IDPASAJERO], [FECHA], [MONTO]) VALUES (4, 2, N'P0002', N'08/10/2011', 200)
INSERT [dbo].[PAGOS] ([NUMPAGO], [IDRESERVA], [IDPASAJERO], [FECHA], [MONTO]) VALUES (5, 2, N'P0002', N'10/10/2011', 300)
INSERT [dbo].[PAGOS] ([NUMPAGO], [IDRESERVA], [IDPASAJERO], [FECHA], [MONTO]) VALUES (6, 6, N'P0009', N'18/12/2011', 1000)
INSERT [dbo].[PAGOS] ([NUMPAGO], [IDRESERVA], [IDPASAJERO], [FECHA], [MONTO]) VALUES (7, 6, N'P0009', N'19/12/2011', 700)
INSERT [dbo].[PAGOS] ([NUMPAGO], [IDRESERVA], [IDPASAJERO], [FECHA], [MONTO]) VALUES (8, 6, N'P0009', N'20/12/2011', 200)
INSERT [dbo].[PAGOS] ([NUMPAGO], [IDRESERVA], [IDPASAJERO], [FECHA], [MONTO]) VALUES (8, 6, N'P0009', N'20/12/2011', 200)
INSERT [dbo].[PAIS] ([IDPAIS], [PAIS]) VALUES (N'0016', N'CHILE')
INSERT [dbo].[PASAJERO] ([IDPASAJERO], [NOMBRES], [IDPAIS], [TELEFONO], [EMAIL]) VALUES (N'P0002', N'PAULA VALTIERRA', N'0010', N'3333333333', N'pau_val@hotmail.com')
INSERT [dbo].[PASAJERO] ([IDPASAJERO], [NOMBRES], [IDPAIS], [TELEFONO], [EMAIL]) VALUES (N'P0016', N'EMMANUEL URIAS', N'0010', N'98888888', N'LEUR0985@GMAIL.COM')
INSERT [dbo].[PASAJEROSBAK] ([IDPASAJERO], [NOMBRES], [IDPAIS], [TELEFONO], [EMAIL]) VALUES (N'P0016', N'EMMANUEL URIAS', N'0010', N'98888888       ', N'LEUR0985@GMAIL.COM')
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([Id], [Nombre], [Contraseña]) VALUES (3, N'admin', N'uRRsokm1uyRsOe8UMNLrlw==')
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Contraseña]) VALUES (4, N'sape', N'uRRsokm1uyRsOe8UMNLrlw==')
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Contraseña]) VALUES (5, N'troll', N'kxkUdjdX0VINV9Kf6uU/LQ==')
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Contraseña]) VALUES (6, N'tommy', N'xaGx5MRoA/Nj9BWjjAupIw==')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
