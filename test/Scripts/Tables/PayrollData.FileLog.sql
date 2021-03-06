IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PayrollData].[FileLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [PayrollData].[FileLog](
   [Id] [int] IDENTITY(1,1) NOT NULL,
   [SourcePath] [nvarchar](256) NOT NULL,
   [DestinationPath] [nvarchar](256) NOT NULL,
   [CorrelationId] [uniqueidentifier] NOT NULL,
   [BatchId] [int] NULL,
 CONSTRAINT [PK_FileLog] PRIMARY KEY CLUSTERED 
(
   [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
