IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PayrollData].[EntiteitType]') AND type in (N'U'))
BEGIN
CREATE TABLE [PayrollData].[EntiteitType](
   [Id] [bigint] IDENTITY(1,1) NOT NULL,
   [Name] [nvarchar](256) NOT NULL,
   [Created] [datetime] NULL,
   [Updated] [datetime] NULL,
   [IsPayrollRelatie] [bit] NOT NULL CONSTRAINT [DF_EntiteitType_IsPayrollRelatie]  DEFAULT ((0)),
 CONSTRAINT [PK_EntiteitType] PRIMARY KEY CLUSTERED 
(
   [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
