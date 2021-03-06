IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PayrollData].[Aanlevering]') AND type in (N'U'))
BEGIN
CREATE TABLE [PayrollData].[Aanlevering](
   [PartitionKeyId] [int] NOT NULL,
   [Id] [int] IDENTITY(1,1) NOT NULL,
   [BatchId] [int] NOT NULL,
   [AdministratieId] [int] NOT NULL,
   [AanleverSequentie] [varchar](50) NOT NULL,
   [Geldig] [bit] NOT NULL,
   [OpslagDatum] [datetime] NOT NULL,
   [VerwerkingsWijze] [varchar](50) NOT NULL,
   [FiscaalJaar] [int] NULL,
   [VerwerkingsProcesId] [varchar](50) NULL,
   [StartVerwerking] [datetime] NULL,
   [EindeVerwerking] [datetime] NULL,
   [IsDeleted] [bit] NOT NULL CONSTRAINT [DF_Aanlevering_IsDeleted]  DEFAULT ((0)),
 CONSTRAINT [PK_Aanlevering] PRIMARY KEY CLUSTERED 
(
   [PartitionKeyId] ASC,
   [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PayrollData].[FK_Aanlevering_Administratie]') AND parent_object_id = OBJECT_ID(N'[PayrollData].[Aanlevering]'))
ALTER TABLE [PayrollData].[Aanlevering]  WITH CHECK ADD  CONSTRAINT [FK_Aanlevering_Administratie] FOREIGN KEY([PartitionKeyId], [AdministratieId])
REFERENCES [PayrollData].[Administratie] ([PartitionKeyId], [Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PayrollData].[FK_Aanlevering_Administratie]') AND parent_object_id = OBJECT_ID(N'[PayrollData].[Aanlevering]'))
ALTER TABLE [PayrollData].[Aanlevering] CHECK CONSTRAINT [FK_Aanlevering_Administratie]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PayrollData].[FK_Aanlevering_BatchId_Batch_Id]') AND parent_object_id = OBJECT_ID(N'[PayrollData].[Aanlevering]'))
ALTER TABLE [PayrollData].[Aanlevering]  WITH CHECK ADD  CONSTRAINT [FK_Aanlevering_BatchId_Batch_Id] FOREIGN KEY([BatchId])
REFERENCES [PayrollData].[Batch] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PayrollData].[FK_Aanlevering_BatchId_Batch_Id]') AND parent_object_id = OBJECT_ID(N'[PayrollData].[Aanlevering]'))
ALTER TABLE [PayrollData].[Aanlevering] CHECK CONSTRAINT [FK_Aanlevering_BatchId_Batch_Id]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PayrollData].[FK_Aanlevering_PartitionKey]') AND parent_object_id = OBJECT_ID(N'[PayrollData].[Aanlevering]'))
ALTER TABLE [PayrollData].[Aanlevering]  WITH CHECK ADD  CONSTRAINT [FK_Aanlevering_PartitionKey] FOREIGN KEY([PartitionKeyId])
REFERENCES [PayrollData].[PartitionKey] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PayrollData].[FK_Aanlevering_PartitionKey]') AND parent_object_id = OBJECT_ID(N'[PayrollData].[Aanlevering]'))
ALTER TABLE [PayrollData].[Aanlevering] CHECK CONSTRAINT [FK_Aanlevering_PartitionKey]
GO
