IF NOT EXISTS (SELECT * FROM sys.sequences WHERE object_id = OBJECT_ID(N'[PayrollData].[EntiteitWaardeSequence]'))
BEGIN
   CREATE SEQUENCE [PayrollData].[EntiteitWaardeSequence] 
    AS [bigint]
    START WITH 10000
    INCREMENT BY 100
    MINVALUE -9223372036854775808
    MAXVALUE 9223372036854775807
    CACHE;
END