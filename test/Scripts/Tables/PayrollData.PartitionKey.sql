IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PayrollData].[PartitionKey]') AND type in (N'U'))
BEGIN
CREATE TABLE [PayrollData].[PartitionKey](
   [Id] [int] NOT NULL,
   [BronId] [varchar](50) NOT NULL,
   [BronEenheidBronKanaal] [varchar](50) NOT NULL,
   [AdministratieIdentificatie] [varchar](50) NULL,
   [Jaar] [int] NULL,
 CONSTRAINT [PK_PartitionKey] PRIMARY KEY CLUSTERED 
(
   [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
