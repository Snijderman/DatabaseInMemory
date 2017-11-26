IF NOT EXISTS ( SELECT 1 FROM sys.indexes WHERE name='IX_PayrollData_GenesteEntiteit_OuderEntiteit' AND object_id = OBJECT_ID('PayrollData.Entiteit'))
BEGIN
   CREATE NONCLUSTERED INDEX [IX_PayrollData_GenesteEntiteit_OuderEntiteit]
   ON [PayrollData].[Entiteit] ([PartitionKeyId],[OuderEntiteitId])
   INCLUDE ([Id],[AdministratieId],[AanleveringId],[EntiteitTypeId],[Identificatie],[Geldig],[PayrollRelatieId])
END