IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PayrollData].[Batch]') AND type in (N'U'))
BEGIN
CREATE TABLE [PayrollData].[Batch](
   [Id] [int] IDENTITY(1,1) NOT NULL,
   [BronEenheidId] [int] NOT NULL,
   [VorigeAanmaak] [bigint] NOT NULL,
   [HuidigeAanmaak] [bigint] NOT NULL,
   [Kenmerk] [varchar](50) NULL,
   [Geldig] [bit] NOT NULL,
   [AanmaakDatum] [datetime] NOT NULL,
   [VerwerkingsProcesId] [varchar](50) NULL,
   [StartVerwerking] [datetime] NULL,
   [EindeVerwerking] [datetime] NULL,
   [IsDeleted] [bit] NOT NULL CONSTRAINT [DF_Batch_IsDeleted]  DEFAULT ((0)),
 CONSTRAINT [PK_Batch] PRIMARY KEY CLUSTERED 
(
   [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PayrollData].[FK_Batch_BronEenheid]') AND parent_object_id = OBJECT_ID(N'[PayrollData].[Batch]'))
ALTER TABLE [PayrollData].[Batch]  WITH CHECK ADD  CONSTRAINT [FK_Batch_BronEenheid] FOREIGN KEY([BronEenheidId])
REFERENCES [PayrollData].[BronEenheid] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PayrollData].[FK_Batch_BronEenheid]') AND parent_object_id = OBJECT_ID(N'[PayrollData].[Batch]'))
ALTER TABLE [PayrollData].[Batch] CHECK CONSTRAINT [FK_Batch_BronEenheid]
GO
