USE [sape]
GO
/****** Object:  Table [dbo].[ALUMNO_LOG]    Script Date: 12/05/2016 22:04:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ALUMNO_LOG](
	[IDALUMNO] [int] NULL,
	[NOMBRE] [varchar](50) NULL,
	[APELLIDO] [varchar](50) NULL,
	[DIRECCION] [varchar](1000) NULL,
	[FECHA_NACIMIENTO] [date] NULL,
	[CONDICION] [varchar](100) NULL,
	[FECHAEVENTO] [datetime] NULL,
	[usuario] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Alumnos]    Script Date: 12/05/2016 22:04:36 ******/
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
	[Direccion] [varchar](1000) NULL,
	[Fecha_nacimiento] [date] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CUENTAPAGOXPASAJERO]    Script Date: 12/05/2016 22:04:36 ******/
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
/****** Object:  Table [dbo].[LOGACCESO]    Script Date: 12/05/2016 22:04:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LOGACCESO](
	[IDLOGACSSESO] [int] IDENTITY(1,1) NOT NULL,
	[USUARIO] [varchar](20) NULL,
	[CONDICION] [varchar](20) NULL,
	[IP] [varchar](20) NULL,
	[USUARIOPC] [varchar](100) NULL,
	[FECHA] [datetime] NULL,
 CONSTRAINT [PK_LOGACCESO] PRIMARY KEY CLUSTERED 
(
	[IDLOGACSSESO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PAGOS]    Script Date: 12/05/2016 22:04:37 ******/
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
/****** Object:  Table [dbo].[PAIS]    Script Date: 12/05/2016 22:04:37 ******/
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
/****** Object:  Table [dbo].[PASAJERO]    Script Date: 12/05/2016 22:04:37 ******/
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
/****** Object:  Table [dbo].[PASAJEROSBAK]    Script Date: 12/05/2016 22:04:37 ******/
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
/****** Object:  Table [dbo].[Usuarios]    Script Date: 12/05/2016 22:04:37 ******/
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
INSERT [dbo].[ALUMNO_LOG] ([IDALUMNO], [NOMBRE], [APELLIDO], [DIRECCION], [FECHA_NACIMIENTO], [CONDICION], [FECHAEVENTO], [usuario]) VALUES (10003, N'sape', N'sape', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ALUMNO_LOG] ([IDALUMNO], [NOMBRE], [APELLIDO], [DIRECCION], [FECHA_NACIMIENTO], [CONDICION], [FECHAEVENTO], [usuario]) VALUES (10008, N'sapeoe', N'sapeoe', NULL, NULL, N'Accion Creado', NULL, NULL)
INSERT [dbo].[ALUMNO_LOG] ([IDALUMNO], [NOMBRE], [APELLIDO], [DIRECCION], [FECHA_NACIMIENTO], [CONDICION], [FECHAEVENTO], [usuario]) VALUES (10009, N'sapeoe', N'sapeoe', NULL, NULL, N'Accion Creado', NULL, NULL)
INSERT [dbo].[ALUMNO_LOG] ([IDALUMNO], [NOMBRE], [APELLIDO], [DIRECCION], [FECHA_NACIMIENTO], [CONDICION], [FECHAEVENTO], [usuario]) VALUES (10010, N'sapeo', N'sapeoe', NULL, NULL, N'Accion Creado', NULL, NULL)
INSERT [dbo].[ALUMNO_LOG] ([IDALUMNO], [NOMBRE], [APELLIDO], [DIRECCION], [FECHA_NACIMIENTO], [CONDICION], [FECHAEVENTO], [usuario]) VALUES (10009, N'sape', N'sape', NULL, NULL, N'Accion Actualizacion', NULL, NULL)
INSERT [dbo].[ALUMNO_LOG] ([IDALUMNO], [NOMBRE], [APELLIDO], [DIRECCION], [FECHA_NACIMIENTO], [CONDICION], [FECHAEVENTO], [usuario]) VALUES (10009, N'sape', N'sapee', NULL, NULL, N'Accion Actualizacion', NULL, NULL)
INSERT [dbo].[ALUMNO_LOG] ([IDALUMNO], [NOMBRE], [APELLIDO], [DIRECCION], [FECHA_NACIMIENTO], [CONDICION], [FECHAEVENTO], [usuario]) VALUES (10009, N'sapee', N'sapee', NULL, NULL, N'Accion Actualizacion', CAST(N'2016-05-12 20:08:44.383' AS DateTime), NULL)
INSERT [dbo].[ALUMNO_LOG] ([IDALUMNO], [NOMBRE], [APELLIDO], [DIRECCION], [FECHA_NACIMIENTO], [CONDICION], [FECHAEVENTO], [usuario]) VALUES (10009, N'saee', N'sapee', NULL, CAST(N'2016-05-12' AS Date), N'Accion Actualizacion', CAST(N'2016-05-12 20:11:47.050' AS DateTime), NULL)
INSERT [dbo].[ALUMNO_LOG] ([IDALUMNO], [NOMBRE], [APELLIDO], [DIRECCION], [FECHA_NACIMIENTO], [CONDICION], [FECHAEVENTO], [usuario]) VALUES (10011, N'sapeo', N'sapeoe', N'sapeoe', CAST(N'2012-05-12' AS Date), N'Accion Creado', CAST(N'2016-05-12 20:16:20.270' AS DateTime), NULL)
INSERT [dbo].[ALUMNO_LOG] ([IDALUMNO], [NOMBRE], [APELLIDO], [DIRECCION], [FECHA_NACIMIENTO], [CONDICION], [FECHAEVENTO], [usuario]) VALUES (10012, N'sapeo', N'sapeoe', N'sapeoe', CAST(N'2012-05-12' AS Date), N'Accion Creado', CAST(N'2016-05-12 20:16:23.970' AS DateTime), NULL)
INSERT [dbo].[ALUMNO_LOG] ([IDALUMNO], [NOMBRE], [APELLIDO], [DIRECCION], [FECHA_NACIMIENTO], [CONDICION], [FECHAEVENTO], [usuario]) VALUES (10013, N'sapeo', N'sapeoe', N'sapeoe', CAST(N'2012-05-12' AS Date), N'Accion Creado', CAST(N'2016-05-12 20:16:24.393' AS DateTime), NULL)
INSERT [dbo].[ALUMNO_LOG] ([IDALUMNO], [NOMBRE], [APELLIDO], [DIRECCION], [FECHA_NACIMIENTO], [CONDICION], [FECHAEVENTO], [usuario]) VALUES (10013, N'saee', N'sapee', N'tacna', CAST(N'2016-05-12' AS Date), N'Accion Actualizacion', CAST(N'2016-05-12 20:17:04.813' AS DateTime), NULL)
INSERT [dbo].[ALUMNO_LOG] ([IDALUMNO], [NOMBRE], [APELLIDO], [DIRECCION], [FECHA_NACIMIENTO], [CONDICION], [FECHAEVENTO], [usuario]) VALUES (10020, N'saee', N'sapee', N'tacna', CAST(N'2016-05-12' AS Date), N'Accion Actualizacion', CAST(N'2016-05-12 20:24:45.400' AS DateTime), NULL)
INSERT [dbo].[ALUMNO_LOG] ([IDALUMNO], [NOMBRE], [APELLIDO], [DIRECCION], [FECHA_NACIMIENTO], [CONDICION], [FECHAEVENTO], [usuario]) VALUES (10020, N'saeee', N'sapee', N'tacna', CAST(N'2016-05-12' AS Date), N'Accion Actualizacion', CAST(N'2016-05-12 20:24:59.437' AS DateTime), NULL)
INSERT [dbo].[ALUMNO_LOG] ([IDALUMNO], [NOMBRE], [APELLIDO], [DIRECCION], [FECHA_NACIMIENTO], [CONDICION], [FECHAEVENTO], [usuario]) VALUES (10020, N'saeeeeeeeeeee', N'sapee', N'tacna', CAST(N'2016-05-12' AS Date), N'Accion Actualizacion', CAST(N'2016-05-12 20:25:10.303' AS DateTime), NULL)
INSERT [dbo].[ALUMNO_LOG] ([IDALUMNO], [NOMBRE], [APELLIDO], [DIRECCION], [FECHA_NACIMIENTO], [CONDICION], [FECHAEVENTO], [usuario]) VALUES (10014, N'sapeo', N'sapeoe', N'sapeoe', CAST(N'2012-05-12' AS Date), N'Accion Creado', CAST(N'2016-05-12 20:24:34.793' AS DateTime), NULL)
INSERT [dbo].[ALUMNO_LOG] ([IDALUMNO], [NOMBRE], [APELLIDO], [DIRECCION], [FECHA_NACIMIENTO], [CONDICION], [FECHAEVENTO], [usuario]) VALUES (10015, N'sapeo', N'sapeoe', N'sapeoe', CAST(N'2012-05-12' AS Date), N'Accion Creado', CAST(N'2016-05-12 20:24:35.247' AS DateTime), NULL)
INSERT [dbo].[ALUMNO_LOG] ([IDALUMNO], [NOMBRE], [APELLIDO], [DIRECCION], [FECHA_NACIMIENTO], [CONDICION], [FECHAEVENTO], [usuario]) VALUES (10016, N'sapeo', N'sapeoe', N'sapeoe', CAST(N'2012-05-12' AS Date), N'Accion Creado', CAST(N'2016-05-12 20:24:35.650' AS DateTime), NULL)
INSERT [dbo].[ALUMNO_LOG] ([IDALUMNO], [NOMBRE], [APELLIDO], [DIRECCION], [FECHA_NACIMIENTO], [CONDICION], [FECHAEVENTO], [usuario]) VALUES (10017, N'sapeo', N'sapeoe', N'sapeoe', CAST(N'2012-05-12' AS Date), N'Accion Creado', CAST(N'2016-05-12 20:24:35.850' AS DateTime), NULL)
INSERT [dbo].[ALUMNO_LOG] ([IDALUMNO], [NOMBRE], [APELLIDO], [DIRECCION], [FECHA_NACIMIENTO], [CONDICION], [FECHAEVENTO], [usuario]) VALUES (10018, N'sapeo', N'sapeoe', N'sapeoe', CAST(N'2012-05-12' AS Date), N'Accion Creado', CAST(N'2016-05-12 20:24:36.033' AS DateTime), NULL)
INSERT [dbo].[ALUMNO_LOG] ([IDALUMNO], [NOMBRE], [APELLIDO], [DIRECCION], [FECHA_NACIMIENTO], [CONDICION], [FECHAEVENTO], [usuario]) VALUES (10019, N'sapeo', N'sapeoe', N'sapeoe', CAST(N'2012-05-12' AS Date), N'Accion Creado', CAST(N'2016-05-12 20:24:36.207' AS DateTime), NULL)
INSERT [dbo].[ALUMNO_LOG] ([IDALUMNO], [NOMBRE], [APELLIDO], [DIRECCION], [FECHA_NACIMIENTO], [CONDICION], [FECHAEVENTO], [usuario]) VALUES (10020, N'sapeo', N'sapeoe', N'sapeoe', CAST(N'2012-05-12' AS Date), N'Accion Creado', CAST(N'2016-05-12 20:24:36.413' AS DateTime), NULL)
INSERT [dbo].[ALUMNO_LOG] ([IDALUMNO], [NOMBRE], [APELLIDO], [DIRECCION], [FECHA_NACIMIENTO], [CONDICION], [FECHAEVENTO], [usuario]) VALUES (10021, N'sapeo', N'sapeoe', N'sapeoe', CAST(N'2012-05-12' AS Date), N'Accion Creado', CAST(N'2016-05-12 20:25:46.203' AS DateTime), NULL)
INSERT [dbo].[ALUMNO_LOG] ([IDALUMNO], [NOMBRE], [APELLIDO], [DIRECCION], [FECHA_NACIMIENTO], [CONDICION], [FECHAEVENTO], [usuario]) VALUES (10022, N'BENDEZU GONZALES', N'KEVIN ANDRé', N'TACNA', CAST(N'2016-05-12' AS Date), N'Accion Creado', CAST(N'2016-05-12 20:38:59.770' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Alumnos] ON 

INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [Direccion], [Fecha_nacimiento]) VALUES (10011, N'sapeo', N'sapeoe', N'sapeoe', CAST(N'2012-05-12' AS Date))
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [Direccion], [Fecha_nacimiento]) VALUES (10012, N'sapeo', N'sapeoe', N'sapeoe', CAST(N'2012-05-12' AS Date))
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [Direccion], [Fecha_nacimiento]) VALUES (10013, N'saee', N'sapee', N'tacna', CAST(N'2016-05-12' AS Date))
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [Direccion], [Fecha_nacimiento]) VALUES (10014, N'sapeo', N'sapeoe', N'sapeoe', CAST(N'2012-05-12' AS Date))
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [Direccion], [Fecha_nacimiento]) VALUES (10015, N'sapeo', N'sapeoe', N'sapeoe', CAST(N'2012-05-12' AS Date))
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [Direccion], [Fecha_nacimiento]) VALUES (10016, N'sapeo', N'sapeoe', N'sapeoe', CAST(N'2012-05-12' AS Date))
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [Direccion], [Fecha_nacimiento]) VALUES (10017, N'sapeo', N'sapeoe', N'sapeoe', CAST(N'2012-05-12' AS Date))
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [Direccion], [Fecha_nacimiento]) VALUES (10018, N'sapeo', N'sapeoe', N'sapeoe', CAST(N'2012-05-12' AS Date))
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [Direccion], [Fecha_nacimiento]) VALUES (10019, N'sapeo', N'sapeoe', N'sapeoe', CAST(N'2012-05-12' AS Date))
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [Direccion], [Fecha_nacimiento]) VALUES (10020, N'saeeeeeeeeeee', N'sapee', N'tacna', CAST(N'2016-05-12' AS Date))
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [Direccion], [Fecha_nacimiento]) VALUES (10021, N'sapeo', N'sapeoe', N'sapeoe', CAST(N'2012-05-12' AS Date))
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [Direccion], [Fecha_nacimiento]) VALUES (10022, N'BENDEZU GONZALES', N'KEVIN ANDRé', N'TACNA', CAST(N'2016-05-12' AS Date))
SET IDENTITY_INSERT [dbo].[Alumnos] OFF
INSERT [dbo].[CUENTAPAGOXPASAJERO] ([IDPASAJERO], [TOTAL]) VALUES (N'P0002', 2)
INSERT [dbo].[CUENTAPAGOXPASAJERO] ([IDPASAJERO], [TOTAL]) VALUES (N'P0009', 4)
SET IDENTITY_INSERT [dbo].[LOGACCESO] ON 

INSERT [dbo].[LOGACCESO] ([IDLOGACSSESO], [USUARIO], [CONDICION], [IP], [USUARIOPC], [FECHA]) VALUES (1, N'tommy', N'Conectado', NULL, NULL, CAST(N'2016-05-12 18:53:38.337' AS DateTime))
INSERT [dbo].[LOGACCESO] ([IDLOGACSSESO], [USUARIO], [CONDICION], [IP], [USUARIOPC], [FECHA]) VALUES (2, N'tommy', N'Conectado', NULL, NULL, CAST(N'2016-05-12 18:55:15.560' AS DateTime))
INSERT [dbo].[LOGACCESO] ([IDLOGACSSESO], [USUARIO], [CONDICION], [IP], [USUARIOPC], [FECHA]) VALUES (3, N'admin', N'Error de acceso', NULL, NULL, CAST(N'2016-05-12 18:59:58.413' AS DateTime))
INSERT [dbo].[LOGACCESO] ([IDLOGACSSESO], [USUARIO], [CONDICION], [IP], [USUARIOPC], [FECHA]) VALUES (4, N'ADMIN', N'Error de acceso', NULL, NULL, CAST(N'2016-05-12 19:00:17.790' AS DateTime))
INSERT [dbo].[LOGACCESO] ([IDLOGACSSESO], [USUARIO], [CONDICION], [IP], [USUARIOPC], [FECHA]) VALUES (5, N'admin', N'Conectado', NULL, NULL, CAST(N'2016-05-12 19:00:25.697' AS DateTime))
INSERT [dbo].[LOGACCESO] ([IDLOGACSSESO], [USUARIO], [CONDICION], [IP], [USUARIOPC], [FECHA]) VALUES (6, N'admin', N'Conectado', NULL, NULL, CAST(N'2016-05-12 20:28:00.183' AS DateTime))
INSERT [dbo].[LOGACCESO] ([IDLOGACSSESO], [USUARIO], [CONDICION], [IP], [USUARIOPC], [FECHA]) VALUES (8, N'sape', N'172.30.103.231', N'SoporteTI', N'Conectado', CAST(N'2016-05-12 22:01:10.290' AS DateTime))
INSERT [dbo].[LOGACCESO] ([IDLOGACSSESO], [USUARIO], [CONDICION], [IP], [USUARIOPC], [FECHA]) VALUES (9, N'admin', N'172.30.103.231', N'SoporteTI', N'Error de acceso', CAST(N'2016-05-12 22:01:28.607' AS DateTime))
SET IDENTITY_INSERT [dbo].[LOGACCESO] OFF
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
