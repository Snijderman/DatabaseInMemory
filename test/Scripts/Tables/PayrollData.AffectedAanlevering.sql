IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PayrollData].[AffectedAanlevering]') AND type in (N'U'))
BEGIN
CREATE TABLE [PayrollData].[AffectedAanlevering](
   [PartitionKeyId] [int] NOT NULL,
   [CurrentBatchId] [int] NOT NULL,
   [BatchId] [int] NOT NULL,
   [AanleveringId] [int] NOT NULL,
   [GeldigBefore] [bit] NOT NULL,
   [GeldigAfter] [bit] NOT NULL,
   [IsDeleted] [bit] NOT NULL CONSTRAINT [DF_AffectedAanlevering_IsDeleted]  DEFAULT ((0)),
 CONSTRAINT [PK_AffectedAanlevering] PRIMARY KEY CLUSTERED 
(
   [PartitionKeyId] ASC,
   [CurrentBatchId] ASC,
   [BatchId] ASC,
   [AanleveringId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
