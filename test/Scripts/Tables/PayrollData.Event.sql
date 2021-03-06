IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PayrollData].[Event]') AND type in (N'U'))
BEGIN
CREATE TABLE [PayrollData].[Event](
   [Id] [bigint] IDENTITY(1,1) NOT NULL,
   [CorrelationId] [uniqueidentifier] NOT NULL,
   [Name] [nvarchar](50) NOT NULL,
   [Data] [varchar](max) NULL,
   [Created] [datetime] NOT NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
   [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
