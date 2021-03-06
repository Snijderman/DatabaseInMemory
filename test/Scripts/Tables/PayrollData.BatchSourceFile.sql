IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PayrollData].[BatchSourceFile]') AND type in (N'U'))
BEGIN
CREATE TABLE [PayrollData].[BatchSourceFile](
   [Id] [int] IDENTITY(1,1) NOT NULL,
   [BatchId] [int] NOT NULL,
   [AanleverDatum] [datetime] NOT NULL,
   [XmlSourceMachineName] [varchar](255) NOT NULL,
   [XmlSourceFileName] [varchar](255) NOT NULL,
   [XmlSourceFileHash] [char](64) NOT NULL,
   [XmlBlob] [varbinary](max) NULL,
 CONSTRAINT [PK_BatchSourceFile] PRIMARY KEY CLUSTERED 
(
   [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PayrollData].[FK_BatchSourceFile_Batch]') AND parent_object_id = OBJECT_ID(N'[PayrollData].[BatchSourceFile]'))
ALTER TABLE [PayrollData].[BatchSourceFile]  WITH CHECK ADD  CONSTRAINT [FK_BatchSourceFile_Batch] FOREIGN KEY([BatchId])
REFERENCES [PayrollData].[Batch] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PayrollData].[FK_BatchSourceFile_Batch]') AND parent_object_id = OBJECT_ID(N'[PayrollData].[BatchSourceFile]'))
ALTER TABLE [PayrollData].[BatchSourceFile] CHECK CONSTRAINT [FK_BatchSourceFile_Batch]
GO
