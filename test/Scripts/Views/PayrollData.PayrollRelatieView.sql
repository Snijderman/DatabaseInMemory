IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[PayrollData].[PayrollRelatieView]'))
  EXEC('create view [PayrollData].[PayrollRelatieView] as select 1 as a;')
GO

EXEC dbo.sp_executesql @statement = N'
ALTER VIEW [PayrollData].[PayrollRelatieView]
AS
SELECT E.PayrollRelatieId AS PayrollRelatieId,
       E.PartitionKeyId AS EntiteitPartitionKeyId,
	   E.Id AS EntiteitId,
	   E.Geldig AS EntiteitGeldig,
	   A.PartitionKeyId AS AanleveringPartitionKeyId,
	   A.Id AS AanleveringId,
	   A.AanleverSequentie AS AanleveringAanleverSequentie,
	   A.VerwerkingsWijze AS AanleveringVerwerkingsWijze,
	   A.Geldig AS AanleveringGeldig,
	   B.Id AS BatchId,
	   B.Geldig AS BatchGeldig,
	   B.VorigeAanmaak AS BatchVorigeAanmaak,
	   B.HuidigeAanmaak AS BatchHuidigeAanmaak,
	   B.BronEenheidId AS BronEenheidId
FROM PayrollData.Entiteit E
JOIN PayrollData.Aanlevering A ON E.AanleveringId = A.Id 
                              AND E.PartitionKeyId = A.PartitionKeyId
JOIN PayrollData.Batch B ON B.ID = A.BatchId
WHERE E.PayrollRelatieId IS NOT NULL
  AND E.IsDeleted = 0
  AND A.IsDeleted = 0
  AND B.IsDeleted = 0' 

GO
