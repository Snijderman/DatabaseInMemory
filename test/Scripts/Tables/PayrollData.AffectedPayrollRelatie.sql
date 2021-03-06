IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PayrollData].[AffectedPayrollRelatie]') AND type in (N'U'))
BEGIN
CREATE TABLE [PayrollData].[AffectedPayrollRelatie](
   [PartitionKeyId] [int] NOT NULL,
   [CurrentBatchId] [int] NOT NULL,
   [BatchId] [int] NOT NULL,
   [AanleveringId] [int] NOT NULL,
   [EntiteitId] [bigint] NOT NULL,
   [PayrollRelatieId] [varchar](50) NOT NULL,
   [GeldigBefore] [bit] NOT NULL,
   [GeldigAfter] [bit] NOT NULL,
   [IsDeleted] [bit] NOT NULL CONSTRAINT [DF_AffectedPayrollRelatie_IsDeleted]  DEFAULT ((0)),
 CONSTRAINT [PK_AffectedPayrollRelatie] PRIMARY KEY CLUSTERED 
(
   [PartitionKeyId] ASC,
   [CurrentBatchId] ASC,
   [BatchId] ASC,
   [AanleveringId] ASC,
   [EntiteitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
