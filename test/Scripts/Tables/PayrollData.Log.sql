IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PayrollData].[Log]') AND type in (N'U'))
BEGIN
CREATE TABLE [PayrollData].[Log](
   [Date] [datetime] NULL,
   [Thread] [nvarchar](255) NULL,
   [Level] [nvarchar](50) NULL,
   [Logger] [nvarchar](255) NULL,
   [Message] [nvarchar](4000) NULL,
   [Exception] [nvarchar](2000) NULL,
   [CorrelationId] [uniqueidentifier] NULL,
   [Source] [nvarchar](255) NULL
) ON [PRIMARY]
END
GO
