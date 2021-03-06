IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PayrollData].[Bron]') AND type in (N'U'))
BEGIN
CREATE TABLE [PayrollData].[Bron](
   [Id] [varchar](50) NOT NULL,
   [Omschrijving] [varchar](100) NULL,
 CONSTRAINT [PK_Bron] PRIMARY KEY CLUSTERED 
(
   [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
