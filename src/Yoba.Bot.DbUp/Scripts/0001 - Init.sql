GO
/****** Object:  Table [dbo].[Profile]    Script Date: 11/06/2019 15:10:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profile](
	[Id] [uniqueidentifier] NOT NULL,
	[MainName] [nvarchar](300) NOT NULL,
	[Loisy] [int] NOT NULL,
	[Zashkvory] [int] NOT NULL,
	[Slivi] [int] NOT NULL,
	[CanVote] [bit] NOT NULL,
	[IsTransport] [bit] NOT NULL,
 CONSTRAINT [PK_Profile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Note]    Script Date: 11/06/2019 15:10:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Note](
	[NoteName] [nvarchar](140) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[Added] [datetime] NOT NULL,
	[DisplayNoteName] [nvarchar](200) NOT NULL,
	[Updated] [datetime] NOT NULL,
 CONSTRAINT [PK_Note] PRIMARY KEY CLUSTERED 
(
	[NoteName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attribute]    Script Date: 11/06/2019 15:10:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attribute](
	[Attribute] [nvarchar](200) NOT NULL,
	[Id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Attribute] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProfileName]    Script Date: 11/06/2019 15:10:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfileName](
	[ProfileId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_ProfileName] PRIMARY KEY CLUSTERED 
(
	[ProfileId] ASC,
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProfileJid]    Script Date: 11/06/2019 15:10:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfileJid](
	[ProfileId] [uniqueidentifier] NOT NULL,
	[Jid] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_ProfileJid] PRIMARY KEY CLUSTERED 
(
	[ProfileId] ASC,
	[Jid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProfileAttribute]    Script Date: 11/06/2019 15:10:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfileAttribute](
	[ProfileId] [uniqueidentifier] NOT NULL,
	[AttributeId] [uniqueidentifier] NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ProfileAttribute] PRIMARY KEY CLUSTERED 
(
	[ProfileId] ASC,
	[AttributeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Default [DF__Profile__Slivi__182C9B23]    Script Date: 11/06/2019 15:10:33 ******/
ALTER TABLE [dbo].[Profile] ADD  DEFAULT ((0)) FOR [Slivi]
GO
/****** Object:  Default [DF__Profile__CanVote__1ED998B2]    Script Date: 11/06/2019 15:10:33 ******/
ALTER TABLE [dbo].[Profile] ADD  DEFAULT ((1)) FOR [CanVote]
GO
/****** Object:  Default [DF__Profile__IsTrans__1FCDBCEB]    Script Date: 11/06/2019 15:10:33 ******/
ALTER TABLE [dbo].[Profile] ADD  DEFAULT ((0)) FOR [IsTransport]
GO
/****** Object:  Default [DF_Note_DisplayNoteName]    Script Date: 11/06/2019 15:10:33 ******/
ALTER TABLE [dbo].[Note] ADD  CONSTRAINT [DF_Note_DisplayNoteName]  DEFAULT ('s') FOR [DisplayNoteName]
GO
/****** Object:  ForeignKey [FK_ProfileName_Profile]    Script Date: 11/06/2019 15:10:33 ******/
ALTER TABLE [dbo].[ProfileName]  WITH CHECK ADD  CONSTRAINT [FK_ProfileName_Profile] FOREIGN KEY([ProfileId])
REFERENCES [dbo].[Profile] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProfileName] CHECK CONSTRAINT [FK_ProfileName_Profile]
GO
/****** Object:  ForeignKey [FK_ProfileJid_Profile]    Script Date: 11/06/2019 15:10:33 ******/
ALTER TABLE [dbo].[ProfileJid]  WITH CHECK ADD  CONSTRAINT [FK_ProfileJid_Profile] FOREIGN KEY([ProfileId])
REFERENCES [dbo].[Profile] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProfileJid] CHECK CONSTRAINT [FK_ProfileJid_Profile]
GO
/****** Object:  ForeignKey [FK_ProfileAttribute_Attribute]    Script Date: 11/06/2019 15:10:33 ******/
ALTER TABLE [dbo].[ProfileAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ProfileAttribute_Attribute] FOREIGN KEY([AttributeId])
REFERENCES [dbo].[Attribute] ([Id])
GO
ALTER TABLE [dbo].[ProfileAttribute] CHECK CONSTRAINT [FK_ProfileAttribute_Attribute]
GO
/****** Object:  ForeignKey [FK_ProfileAttribute_Profile]    Script Date: 11/06/2019 15:10:33 ******/
ALTER TABLE [dbo].[ProfileAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ProfileAttribute_Profile] FOREIGN KEY([ProfileId])
REFERENCES [dbo].[Profile] ([Id])
GO
ALTER TABLE [dbo].[ProfileAttribute] CHECK CONSTRAINT [FK_ProfileAttribute_Profile]
GO
