DECLARE
 @object_name VARCHAR(128)
,@type       CHAR(2)
,@time       VARCHAR(8)

DECLARE c_objects CURSOR FOR
   SELECT name, type
     FROM sys.objects
    WHERE type IN ('SO', 'U', 'V')
      AND schema_id = (select schema_id from sys.schemas where name = 'PayrollData')
   FOR READ ONLY
BEGIN

   SELECT @time = CONVERT(VARCHAR, GetDate(), 108)
   PRINT Concat(@time, ' - Start grant for PayrollDataAdmin');

   OPEN c_objects
   FETCH NEXT FROM c_objects INTO @object_name, @type
   WHILE @@FETCH_STATUS = 0
   BEGIN

      SELECT @time = CONVERT(VARCHAR, GetDate(), 108)

      IF (@type = 'U')
      BEGIN
         PRINT Concat(@time, ' - Set permissions for table:    ', @object_name);
         EXECUTE('GRANT INSERT ON [PayrollData].[' + @object_name + '] TO [PayrollDataAdmin]');
         EXECUTE('GRANT SELECT ON [PayrollData].[' + @object_name + '] TO [PayrollDataAdmin]');
         EXECUTE('GRANT UPDATE ON [PayrollData].[' + @object_name + '] TO [PayrollDataAdmin]');
         IF (@object_name = 'AffectedPayrollRelatie')
            EXECUTE('GRANT DELETE ON [PayrollData].[' + @object_name + '] TO [PayrollDataAdmin]');
      END
      ELSE IF (@type = 'V')
      BEGIN
         PRINT Concat(@time, ' - Set permissions for view:     ', @object_name);
         EXECUTE('GRANT SELECT ON [PayrollData].[' + @object_name + '] TO [PayrollDataAdmin]');
      END
      ELSE IF (@type = 'SO')
      BEGIN
         PRINT Concat(@time, ' - Set permissions for sequence: ', @object_name);
         EXECUTE('GRANT UPDATE ON [PayrollData].[' + @object_name + '] TO [PayrollDataAdmin]');
      END

      FETCH NEXT FROM c_objects INTO @object_name, @type

   END

   PRINT Concat(@time, ' - End grant for PayrollDataAdmin');

   CLOSE c_objects
   DEALLOCATE c_objects
END