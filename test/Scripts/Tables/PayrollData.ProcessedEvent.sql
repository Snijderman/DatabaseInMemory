IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PayrollData].[ProcessedEvent]') AND type in (N'U'))
BEGIN
CREATE TABLE [PayrollData].[ProcessedEvent](
   [EventId] [bigint] NOT NULL,
   [EventName] [nvarchar](50) NOT NULL,
   [ServiceName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProcessedEvent_EventId_ServiceName] PRIMARY KEY CLUSTERED 
(
   [EventId] ASC,
   [ServiceName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
