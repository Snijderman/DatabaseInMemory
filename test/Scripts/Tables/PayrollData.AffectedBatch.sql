IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PayrollData].[AffectedBatch]') AND type in (N'U'))
BEGIN
CREATE TABLE [PayrollData].[AffectedBatch](
   [CurrentBatchId] [int] NOT NULL,
   [BatchId] [int] NOT NULL,
   [GeldigBefore] [bit] NOT NULL,
   [GeldigAfter] [bit] NOT NULL,
   [IsDeleted] [bit] NOT NULL CONSTRAINT [DF_AffectedBatch_IsDeleted]  DEFAULT ((0)),
 CONSTRAINT [PK_AffectedBatch] PRIMARY KEY CLUSTERED 
(
   [CurrentBatchId] ASC,
   [BatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PayrollData].[FK_AffectedBatch_Batch]') AND parent_object_id = OBJECT_ID(N'[PayrollData].[AffectedBatch]'))
ALTER TABLE [PayrollData].[AffectedBatch]  WITH CHECK ADD  CONSTRAINT [FK_AffectedBatch_Batch] FOREIGN KEY([CurrentBatchId])
REFERENCES [PayrollData].[Batch] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PayrollData].[FK_AffectedBatch_Batch]') AND parent_object_id = OBJECT_ID(N'[PayrollData].[AffectedBatch]'))
ALTER TABLE [PayrollData].[AffectedBatch] CHECK CONSTRAINT [FK_AffectedBatch_Batch]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PayrollData].[FK_AffectedBatch_CurrentBatch]') AND parent_object_id = OBJECT_ID(N'[PayrollData].[AffectedBatch]'))
ALTER TABLE [PayrollData].[AffectedBatch]  WITH CHECK ADD  CONSTRAINT [FK_AffectedBatch_CurrentBatch] FOREIGN KEY([CurrentBatchId])
REFERENCES [PayrollData].[Batch] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PayrollData].[FK_AffectedBatch_CurrentBatch]') AND parent_object_id = OBJECT_ID(N'[PayrollData].[AffectedBatch]'))
ALTER TABLE [PayrollData].[AffectedBatch] CHECK CONSTRAINT [FK_AffectedBatch_CurrentBatch]
GO
