IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PayrollData].[SourceFileMetadata]') AND type in (N'U'))
BEGIN
CREATE TABLE [PayrollData].[SourceFileMetadata](
   [Id] [int] IDENTITY(1,1) NOT NULL,
   [BatchId] [int] NULL,
   [Location] [varchar](256) NOT NULL,
 CONSTRAINT [PK_SourceFileMetadata] PRIMARY KEY CLUSTERED 
(
   [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PayrollData].[FK_SourceFileMetadata_Batch]') AND parent_object_id = OBJECT_ID(N'[PayrollData].[SourceFileMetadata]'))
ALTER TABLE [PayrollData].[SourceFileMetadata]  WITH CHECK ADD  CONSTRAINT [FK_SourceFileMetadata_Batch] FOREIGN KEY([BatchId])
REFERENCES [PayrollData].[Batch] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PayrollData].[FK_SourceFileMetadata_Batch]') AND parent_object_id = OBJECT_ID(N'[PayrollData].[SourceFileMetadata]'))
ALTER TABLE [PayrollData].[SourceFileMetadata] CHECK CONSTRAINT [FK_SourceFileMetadata_Batch]
GO
