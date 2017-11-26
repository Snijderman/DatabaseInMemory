IF NOT EXISTS ( SELECT 1 FROM sys.indexes WHERE name='IX_PayrollData_Entiteit_Aanlevering_Geldig_IsDeleted' AND object_id = OBJECT_ID('PayrollData.Entiteit'))
BEGIN
   CREATE NONCLUSTERED INDEX [IX_PayrollData_Entiteit_Aanlevering_Geldig_IsDeleted]
   ON [PayrollData].[Entiteit] ([PartitionKeyId],[AanleveringId],[Geldig],[IsDeleted],[PayrollRelatieId])
END