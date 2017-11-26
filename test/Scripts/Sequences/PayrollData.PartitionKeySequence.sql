IF NOT EXISTS (SELECT * FROM sys.sequences WHERE object_id = OBJECT_ID(N'[PayrollData].[PartitionKeySequence]'))
BEGIN
   CREATE SEQUENCE [PayrollData].[PartitionKeySequence] 
    AS [int]
    START WITH 1
    INCREMENT BY 50
    MINVALUE -2147483648
    MAXVALUE 2147483647
    CACHE;
END