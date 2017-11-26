IF NOT EXISTS ( SELECT 1 FROM sys.indexes WHERE name='IX_PayrollData_AffectedPayrollRelatie_CurrentBatchId_IsDeleted' AND object_id = OBJECT_ID('PayrollData.AffectedPayrollRelatie'))
BEGIN
   CREATE NONCLUSTERED INDEX [IX_PayrollData_AffectedPayrollRelatie_CurrentBatchId_IsDeleted]
   ON [PayrollData].[AffectedPayrollRelatie] ([CurrentBatchId],[IsDeleted])
   INCLUDE ([PartitionKeyId],[EntiteitId],[GeldigAfter])
END
