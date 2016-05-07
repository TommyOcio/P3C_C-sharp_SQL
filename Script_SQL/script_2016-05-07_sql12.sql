USE [sape]
GO
/****** Object:  Table [dbo].[Alumnos]    Script Date: 07/05/2016 21:32:41 ******/
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
/****** Object:  Table [dbo].[Usuarios]    Script Date: 07/05/2016 21:32:42 ******/
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
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([Id], [Nombre], [Contraseña]) VALUES (3, N'admin', N'uRRsokm1uyRsOe8UMNLrlw==')
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Contraseña]) VALUES (4, N'sape', N'uRRsokm1uyRsOe8UMNLrlw==')
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Contraseña]) VALUES (5, N'troll', N'kxkUdjdX0VINV9Kf6uU/LQ==')
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Contraseña]) VALUES (6, N'tommy', N'xaGx5MRoA/Nj9BWjjAupIw==')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
