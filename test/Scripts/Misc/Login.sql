IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'PayrollDataAdmin')
   CREATE LOGIN [PayrollDataAdmin] WITH PASSWORD=N'uPa@2016=Live!', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PayrollDataAdmin')
   CREATE USER [PayrollDataAdmin] FOR LOGIN [PayrollDataAdmin] WITH DEFAULT_SCHEMA=[PayrollData]
GO

USE MASTER
GO

GRANT ADMINISTER BULK OPERATIONS TO PayrollDataAdmin
GO