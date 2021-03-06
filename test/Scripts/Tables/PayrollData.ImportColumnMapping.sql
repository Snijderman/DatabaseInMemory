IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PayrollData].[ImportColumnMapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [PayrollData].[ImportColumnMapping](
   [Id] [int] IDENTITY(1,1) NOT NULL,
   [ImportTableMappingId] [int] NOT NULL,
   [Name] [nvarchar](max) NULL,
   [DataType] [nvarchar](25) NOT NULL,
   [DataTypeSize] [nvarchar](25) NULL,
   [ImportMappingTypeId] [int] NOT NULL,
   [Code] [nvarchar](max) NULL,
   [Field] [nvarchar](max) NULL,
   [Path] [nvarchar](max) NULL,
   [Identificatie] [nvarchar](max) NULL,
   [ParentTable] [nvarchar](max) NULL,
   [ParentIdColumn] [nvarchar](max) NULL,
   [ParentLinkColumn] [nvarchar](max) NULL,
   [ParentLinkColumnChildren] [nvarchar](max) NULL,
   [LinkColumn] [nvarchar](max) NULL,
   [DefaultValue] [nvarchar](max) NULL,
   [DefaultValueType] [nvarchar](max) NULL,
   [ParentTableId] [bigint] NULL,
   [IsNullable] [bit] NULL,
 CONSTRAINT [PK_ImportColumnMapping] PRIMARY KEY CLUSTERED 
(
   [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
