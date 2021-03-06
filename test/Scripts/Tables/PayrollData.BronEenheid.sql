IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PayrollData].[BronEenheid]') AND type in (N'U'))
BEGIN
CREATE TABLE [PayrollData].[BronEenheid](
   [Id] [int] IDENTITY(1,1) NOT NULL,
   [BronId] [varchar](50) NOT NULL,
   [BronKanaal] [varchar](50) NOT NULL,
   [BronKenmerk] [varchar](100) NULL,
   [Noodstop] [bit] NOT NULL CONSTRAINT [DF_BronEenheid_Noodstop]  DEFAULT ((0)),
   [Debiteurnummer] [nvarchar](50) NULL,
 CONSTRAINT [PK_BronEenheid] PRIMARY KEY CLUSTERED 
(
   [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PayrollData].[FK_BronEenheid_Bron]') AND parent_object_id = OBJECT_ID(N'[PayrollData].[BronEenheid]'))
ALTER TABLE [PayrollData].[BronEenheid]  WITH CHECK ADD  CONSTRAINT [FK_BronEenheid_Bron] FOREIGN KEY([BronId])
REFERENCES [PayrollData].[Bron] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PayrollData].[FK_BronEenheid_Bron]') AND parent_object_id = OBJECT_ID(N'[PayrollData].[BronEenheid]'))
ALTER TABLE [PayrollData].[BronEenheid] CHECK CONSTRAINT [FK_BronEenheid_Bron]
GO
