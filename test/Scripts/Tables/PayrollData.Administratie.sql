IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PayrollData].[Administratie]') AND type in (N'U'))
BEGIN
CREATE TABLE [PayrollData].[Administratie](
   [PartitionKeyId] [int] NOT NULL,
   [Id] [int] IDENTITY(1,1) NOT NULL,
   [BatchId] [int] NOT NULL,
   [Identificatie] [varchar](50) NOT NULL,
   [Geldig] [bit] NOT NULL,
   [VerwerkingsProcesId] [varchar](50) NULL,
   [StartVerwerking] [datetime] NULL,
   [EindeVerwerking] [datetime] NULL,
   [IsDeleted] [bit] NOT NULL CONSTRAINT [DF_Administratie_IsDeleted]  DEFAULT ((0)),
 CONSTRAINT [PK_Administratie] PRIMARY KEY CLUSTERED 
(
   [PartitionKeyId] ASC,
   [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PayrollData].[FK_Administratie_Batch]') AND parent_object_id = OBJECT_ID(N'[PayrollData].[Administratie]'))
ALTER TABLE [PayrollData].[Administratie]  WITH CHECK ADD  CONSTRAINT [FK_Administratie_Batch] FOREIGN KEY([BatchId])
REFERENCES [PayrollData].[Batch] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PayrollData].[FK_Administratie_Batch]') AND parent_object_id = OBJECT_ID(N'[PayrollData].[Administratie]'))
ALTER TABLE [PayrollData].[Administratie] CHECK CONSTRAINT [FK_Administratie_Batch]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PayrollData].[FK_Administratie_PartitionKey]') AND parent_object_id = OBJECT_ID(N'[PayrollData].[Administratie]'))
ALTER TABLE [PayrollData].[Administratie]  WITH CHECK ADD  CONSTRAINT [FK_Administratie_PartitionKey] FOREIGN KEY([PartitionKeyId])
REFERENCES [PayrollData].[PartitionKey] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PayrollData].[FK_Administratie_PartitionKey]') AND parent_object_id = OBJECT_ID(N'[PayrollData].[Administratie]'))
ALTER TABLE [PayrollData].[Administratie] CHECK CONSTRAINT [FK_Administratie_PartitionKey]
GO
