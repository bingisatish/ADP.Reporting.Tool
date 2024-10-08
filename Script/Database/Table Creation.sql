USE [Explore.ADP.Report]
GO
/****** Object:  Table [dbo].[Alphabet]    Script Date: 05/31/2024 07:56:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Alphabet]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Alphabet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Alphabet] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[UpdatedBy] [nvarchar](100) NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_Alphabet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ClientInformation]    Script Date: 05/31/2024 07:56:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClientInformation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ClientInformation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AlphabetId] [int] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[UpdatedBy] [nvarchar](100) NULL,
 CONSTRAINT [PK_ClientInformation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ReportType]    Script Date: 05/31/2024 07:56:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReportType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ReportType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NULL,
	[Type] [nvarchar](200) NULL,
	[Description] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[UpdatedBy] [nvarchar](100) NULL,
 CONSTRAINT [PK_ReportType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[RequestInformation]    Script Date: 05/31/2024 07:56:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RequestInformation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RequestInformation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[RequestType] [nvarchar](200) NULL,
	[Description] [nvarchar](1000) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](200) NULL,
	[UpdatedBy] [nvarchar](200) NULL,
	[ReportId] [int] NOT NULL,
 CONSTRAINT [PK_RequestInformation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SqlFileData]    Script Date: 05/31/2024 07:56:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SqlFileData]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SqlFileData](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RequestId] [int] NOT NULL,
	[Description] [nvarchar](500) NULL,
	[SqlFileData] [nvarchar](max) NOT NULL,
	[CreatedDate] [date] NULL,
	[UpdatedDate] [date] NULL,
    [CreatedBy] [nvarchar](100) NULL,
	[UpdatedBy] [nvarchar](100) NULL,
 CONSTRAINT [PK_SqlFileData] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  ForeignKey [FK_ClientInformation_Alphabet]    Script Date: 05/31/2024 07:56:44 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClientInformation_Alphabet]') AND parent_object_id = OBJECT_ID(N'[dbo].[ClientInformation]'))
ALTER TABLE [dbo].[ClientInformation]  WITH CHECK ADD  CONSTRAINT [FK_ClientInformation_Alphabet] FOREIGN KEY([AlphabetId])
REFERENCES [dbo].[Alphabet] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClientInformation_Alphabet]') AND parent_object_id = OBJECT_ID(N'[dbo].[ClientInformation]'))
ALTER TABLE [dbo].[ClientInformation] CHECK CONSTRAINT [FK_ClientInformation_Alphabet]
GO
/****** Object:  ForeignKey [FK_ReportType_ClientInformation]    Script Date: 05/31/2024 07:56:44 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ReportType_ClientInformation]') AND parent_object_id = OBJECT_ID(N'[dbo].[ReportType]'))
ALTER TABLE [dbo].[ReportType]  WITH CHECK ADD  CONSTRAINT [FK_ReportType_ClientInformation] FOREIGN KEY([ClientId])
REFERENCES [dbo].[ClientInformation] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ReportType_ClientInformation]') AND parent_object_id = OBJECT_ID(N'[dbo].[ReportType]'))
ALTER TABLE [dbo].[ReportType] CHECK CONSTRAINT [FK_ReportType_ClientInformation]
GO
/****** Object:  ForeignKey [FK_RequestInformation_ClientInformation]    Script Date: 05/31/2024 07:56:44 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RequestInformation_ClientInformation]') AND parent_object_id = OBJECT_ID(N'[dbo].[RequestInformation]'))
ALTER TABLE [dbo].[RequestInformation]  WITH CHECK ADD  CONSTRAINT [FK_RequestInformation_ClientInformation] FOREIGN KEY([ClientId])
REFERENCES [dbo].[ClientInformation] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RequestInformation_ClientInformation]') AND parent_object_id = OBJECT_ID(N'[dbo].[RequestInformation]'))
ALTER TABLE [dbo].[RequestInformation] CHECK CONSTRAINT [FK_RequestInformation_ClientInformation]
GO
/****** Object:  ForeignKey [FK_RequestInformation_ReportType]    Script Date: 05/31/2024 07:56:44 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RequestInformation_ReportType]') AND parent_object_id = OBJECT_ID(N'[dbo].[RequestInformation]'))
ALTER TABLE [dbo].[RequestInformation]  WITH CHECK ADD  CONSTRAINT [FK_RequestInformation_ReportType] FOREIGN KEY([ReportId])
REFERENCES [dbo].[ReportType] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RequestInformation_ReportType]') AND parent_object_id = OBJECT_ID(N'[dbo].[RequestInformation]'))
ALTER TABLE [dbo].[RequestInformation] CHECK CONSTRAINT [FK_RequestInformation_ReportType]
GO
/****** Object:  ForeignKey [FK_SqlFileData_RequestInformation]    Script Date: 05/31/2024 07:56:44 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SqlFileData_RequestInformation]') AND parent_object_id = OBJECT_ID(N'[dbo].[SqlFileData]'))
ALTER TABLE [dbo].[SqlFileData]  WITH CHECK ADD  CONSTRAINT [FK_SqlFileData_RequestInformation] FOREIGN KEY([RequestId])
REFERENCES [dbo].[RequestInformation] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SqlFileData_RequestInformation]') AND parent_object_id = OBJECT_ID(N'[dbo].[SqlFileData]'))
ALTER TABLE [dbo].[SqlFileData] CHECK CONSTRAINT [FK_SqlFileData_RequestInformation]
GO
