IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PayrollData].[Entiteit]') AND type in (N'U'))
BEGIN
CREATE TABLE [PayrollData].[Entiteit](
   [PartitionKeyId] [int] NOT NULL,
   [Id] [bigint] NOT NULL,
   [AdministratieId] [int] NOT NULL,
   [AanleveringId] [int] NULL,
   [OuderEntiteitId] [bigint] NULL,
   [EntiteitTypeId] [bigint] NOT NULL,
   [Identificatie] [varchar](50) NOT NULL,
   [Geldig] [bit] NOT NULL,
   [PayrollRelatieId] [varchar](50) NULL,
   [IsDeleted] [bit] NOT NULL CONSTRAINT [DF_Entiteit_IsDeleted]  DEFAULT ((0)),
 CONSTRAINT [PK_Entiteit] PRIMARY KEY CLUSTERED 
(
   [PartitionKeyId] ASC,
   [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PayrollData].[FK_Entiteit_Aanlevering]') AND parent_object_id = OBJECT_ID(N'[PayrollData].[Entiteit]'))
ALTER TABLE [PayrollData].[Entiteit]  WITH NOCHECK ADD  CONSTRAINT [FK_Entiteit_Aanlevering] FOREIGN KEY([PartitionKeyId], [AanleveringId])
REFERENCES [PayrollData].[Aanlevering] ([PartitionKeyId], [Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PayrollData].[FK_Entiteit_Aanlevering]') AND parent_object_id = OBJECT_ID(N'[PayrollData].[Entiteit]'))
ALTER TABLE [PayrollData].[Entiteit] CHECK CONSTRAINT [FK_Entiteit_Aanlevering]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PayrollData].[FK_Entiteit_Administratie]') AND parent_object_id = OBJECT_ID(N'[PayrollData].[Entiteit]'))
ALTER TABLE [PayrollData].[Entiteit]  WITH NOCHECK ADD  CONSTRAINT [FK_Entiteit_Administratie] FOREIGN KEY([PartitionKeyId], [AdministratieId])
REFERENCES [PayrollData].[Administratie] ([PartitionKeyId], [Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PayrollData].[FK_Entiteit_Administratie]') AND parent_object_id = OBJECT_ID(N'[PayrollData].[Entiteit]'))
ALTER TABLE [PayrollData].[Entiteit] CHECK CONSTRAINT [FK_Entiteit_Administratie]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PayrollData].[FK_Entiteit_Entiteit]') AND parent_object_id = OBJECT_ID(N'[PayrollData].[Entiteit]'))
ALTER TABLE [PayrollData].[Entiteit]  WITH NOCHECK ADD  CONSTRAINT [FK_Entiteit_Entiteit] FOREIGN KEY([PartitionKeyId], [OuderEntiteitId])
REFERENCES [PayrollData].[Entiteit] ([PartitionKeyId], [Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PayrollData].[FK_Entiteit_Entiteit]') AND parent_object_id = OBJECT_ID(N'[PayrollData].[Entiteit]'))
ALTER TABLE [PayrollData].[Entiteit] CHECK CONSTRAINT [FK_Entiteit_Entiteit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PayrollData].[FK_Entiteit_EntiteitType]') AND parent_object_id = OBJECT_ID(N'[PayrollData].[Entiteit]'))
ALTER TABLE [PayrollData].[Entiteit]  WITH NOCHECK ADD  CONSTRAINT [FK_Entiteit_EntiteitType] FOREIGN KEY([EntiteitTypeId])
REFERENCES [PayrollData].[EntiteitType] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PayrollData].[FK_Entiteit_EntiteitType]') AND parent_object_id = OBJECT_ID(N'[PayrollData].[Entiteit]'))
ALTER TABLE [PayrollData].[Entiteit] CHECK CONSTRAINT [FK_Entiteit_EntiteitType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PayrollData].[FK_Entiteit_PartitionKey]') AND parent_object_id = OBJECT_ID(N'[PayrollData].[Entiteit]'))
ALTER TABLE [PayrollData].[Entiteit]  WITH NOCHECK ADD  CONSTRAINT [FK_Entiteit_PartitionKey] FOREIGN KEY([PartitionKeyId])
REFERENCES [PayrollData].[PartitionKey] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PayrollData].[FK_Entiteit_PartitionKey]') AND parent_object_id = OBJECT_ID(N'[PayrollData].[Entiteit]'))
ALTER TABLE [PayrollData].[Entiteit] CHECK CONSTRAINT [FK_Entiteit_PartitionKey]
GO

IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = object_id(N'[PayrollData].[Entiteit]') AND name = N'IsNull')
BEGIN
   PRINT N'Altering [PayrollData].[Entiteit], adding IsNull ...'
   ALTER TABLE [PayrollData].[Entiteit]
       ADD  [IsNull] [bit] NOT NULL DEFAULT ((0))
   PRINT N'Alter complete.'
END
GO