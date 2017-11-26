IF NOT EXISTS ( SELECT 1 FROM sys.indexes WHERE name='IX_PayrollData_GenesteEntiteitWaarde' AND object_id = OBJECT_ID('PayrollData.EntiteitWaarde'))
BEGIN
   CREATE NONCLUSTERED INDEX [IX_PayrollData_GenesteEntiteitWaarde]
   ON [PayrollData].[EntiteitWaarde] ([PartitionKeyId],[EntiteitId])
   INCLUDE ([Id],[Code],[Ingangsdatum],[Einddatum],[VerdienMoment],[Waarde])
END
