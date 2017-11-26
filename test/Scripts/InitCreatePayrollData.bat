CLS
ECHO Initial create objects for PayrollData schema.
ECHO.

set /p inServerName=Specify SQL server instance:
set /p inDatabaseName=Specify Database name:

REM Schema's
PUSHD ".\Schemas"
ECHO PayrollData schema
sqlcmd /S %inServerName% /d %inDatabaseName% -E -i "CreatePayrollDataSchema.sql"
PUSHD ".."

REM Tables
PUSHD ".\Tables"
ECHO PayrollData.PartitionKey
sqlcmd /S %inServerName% /d %inDatabaseName% -E -i "PayrollData.PartitionKey.sql"
ECHO PayrollData.Bron
sqlcmd /S %inServerName% /d %inDatabaseName% -E -i "PayrollData.Bron.sql"
ECHO PayrollData.BronEenheid
sqlcmd /S %inServerName% /d %inDatabaseName% -E -i "PayrollData.BronEenheid.sql"
ECHO PayrollData.Batch
sqlcmd /S %inServerName% /d %inDatabaseName% -E -i "PayrollData.Batch.sql"
ECHO PayrollData.SourceFileMetadata
sqlcmd /S %inServerName% /d %inDatabaseName% -E -i "PayrollData.SourceFileMetadata.sql"
ECHO PayrollData.BatchSourceFile
sqlcmd /S %inServerName% /d %inDatabaseName% -E -i "PayrollData.BatchSourceFile.sql"
ECHO PayrollData.Administratie
sqlcmd /S %inServerName% /d %inDatabaseName% -E -i "PayrollData.Administratie.sql"
ECHO PayrollData.Aanlevering
sqlcmd /S %inServerName% /d %inDatabaseName% -E -i "PayrollData.Aanlevering.sql"
ECHO PayrollData.EntiteitType
sqlcmd /S %inServerName% /d %inDatabaseName% -E -i "PayrollData.EntiteitType.sql"
ECHO PayrollData.Entiteit
sqlcmd /S %inServerName% /d %inDatabaseName% -E -i "PayrollData.Entiteit.sql"
ECHO PayrollData.EntiteitWaarde
sqlcmd /S %inServerName% /d %inDatabaseName% -E -i "PayrollData.EntiteitWaarde.sql"
ECHO PayrollData.AffectedBatch
sqlcmd /S %inServerName% /d %inDatabaseName% -E -i "PayrollData.AffectedBatch.sql"
ECHO PayrollData.AffectedAanlevering
sqlcmd /S %inServerName% /d %inDatabaseName% -E -i "PayrollData.AffectedAanlevering.sql"
ECHO PayrollData.AffectedPayrollRelatie
sqlcmd /S %inServerName% /d %inDatabaseName% -E -i "PayrollData.AffectedPayrollRelatie.sql"
ECHO PayrollData.ProcessedEvent
sqlcmd /S %inServerName% /d %inDatabaseName% -E -i "PayrollData.ProcessedEvent.sql"
ECHO PayrollData.Log
sqlcmd /S %inServerName% /d %inDatabaseName% -E -i "PayrollData.Log.sql"
ECHO PayrollData.Event
sqlcmd /S %inServerName% /d %inDatabaseName% -E -i "PayrollData.Event.sql"
ECHO PayrollData.FileLog
sqlcmd /S %inServerName% /d %inDatabaseName% -E -i "PayrollData.FileLog.sql"
ECHO PayrollData.ImportMappingType
sqlcmd /S %inServerName% /d %inDatabaseName% -E -i "PayrollData.ImportMappingType.sql"
ECHO PayrollData.ImportTableMapping
sqlcmd /S %inServerName% /d %inDatabaseName% -E -i "PayrollData.ImportTableMapping.sql"
ECHO PayrollData.ImportColumnMapping
sqlcmd /S %inServerName% /d %inDatabaseName% -E -i "PayrollData.ImportColumnMapping.sql"
PUSHD ".."

REM Views
PUSHD ".\Views"
ECHO PayrollData.PayrollRelatieView
sqlcmd /S %inServerName% /d %inDatabaseName% -E -i "PayrollData.PayrollRelatieView.sql"
PUSHD ".."

REM Sequences
PUSHD ".\Sequences"
ECHO PayrollData.EntiteitSequence
sqlcmd /S %inServerName% /d %inDatabaseName% -E -i "PayrollData.EntiteitSequence.sql"
ECHO PayrollData.EntiteitWaardeSequence
sqlcmd /S %inServerName% /d %inDatabaseName% -E -i "PayrollData.EntiteitWaardeSequence.sql"
ECHO PayrollData.PartitionKeySequence
sqlcmd /S %inServerName% /d %inDatabaseName% -E -i "PayrollData.PartitionKeySequence.sql"
PUSHD ".."

REM Indexes
PUSHD ".\Indexes"
ECHO IX_PayrollData_GenesteEntiteit_OuderEntiteit
sqlcmd /S %inServerName% /d %inDatabaseName% -E -i "IX_PayrollData_GenesteEntiteit_OuderEntiteit.sql"
ECHO IX_PayrollData_GenesteEntiteitWaarde
sqlcmd /S %inServerName% /d %inDatabaseName% -E -i "IX_PayrollData_GenesteEntiteitWaarde.sql"
ECHO IX_PayrollData_Entiteit_Aanlevering_Geldig_IsDeleted
sqlcmd /S %inServerName% /d %inDatabaseName% -E -i "IX_PayrollData_Entiteit_Aanlevering_Geldig_IsDeleted.sql"
ECHO IX_PayrollData_AffectedPayrollRelatie_CurrentBatchId_IsDeleted
sqlcmd /S %inServerName% /d %inDatabaseName% -E -i "IX_PayrollData_AffectedPayrollRelatie_CurrentBatchId_IsDeleted.sql"
PUSHD ".."

REM Misc
PUSHD ".\Misc"
ECHO Logins
sqlcmd /S %inServerName% /d %inDatabaseName% -E -i "Login.sql"
ECHO GrantToPayrollDataAdmin
sqlcmd /S %inServerName% /d %inDatabaseName% -E -i "GrantToPayrollDataAdmin.sql"
PUSHD ".."

REM ECHO.
REM PAUSE