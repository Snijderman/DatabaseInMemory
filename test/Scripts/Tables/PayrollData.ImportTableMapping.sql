IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PayrollData].[ImportTableMapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [PayrollData].[ImportTableMapping](
   [Id] [int] IDENTITY(1,1) NOT NULL,
   [Name] [nvarchar](max) NULL,
   [UniqueIdentifier] [nvarchar](max) NULL,
   [PrimaryKey] [nvarchar](max) NULL,
   [SortNr] [int] NULL,
   [SequenceName] [nvarchar](max) NULL,
 CONSTRAINT [PK_ImportTableMapping] PRIMARY KEY CLUSTERED 
(
   [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
