IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PayrollData].[EntiteitWaarde]') AND type in (N'U'))
BEGIN
CREATE TABLE [PayrollData].[EntiteitWaarde](
   [PartitionKeyId] [int] NOT NULL,
   [Id] [bigint] NOT NULL,
   [EntiteitId] [bigint] NOT NULL,
   [Code] [varchar](50) NOT NULL,
   [Ingangsdatum] [date] NULL,
   [Einddatum] [date] NULL,
   [VerdienMoment] [datetime] NULL,
   [Waarde] [varchar](256) NULL,
   [IsDeleted] [bit] NOT NULL CONSTRAINT [DF_EntiteitWaarde_IsDeleted]  DEFAULT ((0)),
 CONSTRAINT [PK_EntiteitWaarde] PRIMARY KEY CLUSTERED 
(
   [PartitionKeyId] ASC,
   [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PayrollData].[FK_EntiteitWaarde_Entiteit]') AND parent_object_id = OBJECT_ID(N'[PayrollData].[EntiteitWaarde]'))
ALTER TABLE [PayrollData].[EntiteitWaarde]  WITH NOCHECK ADD  CONSTRAINT [FK_EntiteitWaarde_Entiteit] FOREIGN KEY([PartitionKeyId], [EntiteitId])
REFERENCES [PayrollData].[Entiteit] ([PartitionKeyId], [Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PayrollData].[FK_EntiteitWaarde_Entiteit]') AND parent_object_id = OBJECT_ID(N'[PayrollData].[EntiteitWaarde]'))
ALTER TABLE [PayrollData].[EntiteitWaarde] CHECK CONSTRAINT [FK_EntiteitWaarde_Entiteit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PayrollData].[FK_EntiteitWaarde_PartitionKey]') AND parent_object_id = OBJECT_ID(N'[PayrollData].[EntiteitWaarde]'))
ALTER TABLE [PayrollData].[EntiteitWaarde]  WITH NOCHECK ADD  CONSTRAINT [FK_EntiteitWaarde_PartitionKey] FOREIGN KEY([PartitionKeyId])
REFERENCES [PayrollData].[PartitionKey] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PayrollData].[FK_EntiteitWaarde_PartitionKey]') AND parent_object_id = OBJECT_ID(N'[PayrollData].[EntiteitWaarde]'))
ALTER TABLE [PayrollData].[EntiteitWaarde] CHECK CONSTRAINT [FK_EntiteitWaarde_PartitionKey]
GO

IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = object_id(N'[PayrollData].[EntiteitWaarde]') AND name = N'IsNull')
BEGIN
   PRINT N'Altering [PayrollData].[EntiteitWaarde], adding IsNull ...'
   ALTER TABLE [PayrollData].[EntiteitWaarde]
       ADD  [IsNull] [bit] NOT NULL DEFAULT ((0))
   PRINT N'Alter complete.'
END
GO