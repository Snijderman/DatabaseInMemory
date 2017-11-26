using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using SqliteDatabaseInMemoryNetStandard;
using System.IO;

namespace SqliteDatabaseInMemoryNetStandardTests
{
    [TestClass]
   public class MemoryDatabaseTests
   {
      [TestMethod]
      public void Test_Create_Simple_Database()
      {
         var db = new MemoryDatabase();
         db.Setup();

         //TestCount(db, 0);
         CreateTablesFirst(db);
         CreateTables(db);
         TestCount(db, 0);
         CreateTablesFirst(db);
         db.GetDbConnection().Close();
         TestCount(db, 0);

         //db.Close();
         //TestCount(db, 0);
      }
      private void CreateTablesFirst(MemoryDatabase db)
      {
         using (var conn = db.GetDbConnection())
         {
            db.ExecuteCommand(@"
                        CREATE TABLE IF NOT EXISTS Employee (
                            [Id] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
                            [Name] NVARCHAR(64) NOT NULL
                        )");
         }

         Assert.IsTrue(db.ExecuteScalar<int>("SELECT count(*) from [Employee]") == 0);
      }

      private void CreateTables(MemoryDatabase db)
      {
         db.ExecuteCommand(@"
                        CREATE TABLE IF NOT EXISTS Employee (
                            [Id] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
                            [Name] NVARCHAR(64) NOT NULL
                        )");

         Assert.IsTrue(db.ExecuteScalar<int>("SELECT count(*) from [Employee]") == 0);
      }

      private void TestCount(MemoryDatabase db, int count)
      {
         Assert.IsTrue(db.ExecuteScalar<int>("SELECT count(*) from [Employee]") == count);
      }

      [TestMethod]
      public void Test_Create_Complex_Database()
      {
         var db = new MemoryDatabase();
         db.Setup();

         //CreateComplexDatabaseSchema(db);

         CreateComplexDatabaseTables(db);
      }

      private void CreateComplexDatabaseTables(MemoryDatabase db)
      {
         //         var sql = @"CREATE TABLE [main].[Bron](
         //   [Id] [varchar](50) NOT NULL,
         //   [Omschrijving] [varchar](100) NULL,
         // CONSTRAINT [PK_Bron] PRIMARY KEY
         //(
         //   [Id] ASC
         //))
         //";
         //         db.ExecuteCommand(sql);

         var sql = GetCreateTableScript(@"E:\Ontwikkel\Test\DatabaseInMemory\test\Scripts\Tables\PayrollData.PartitionKey.sql");
         db.ExecuteCommand(sql);

         sql = GetCreateTableScript(@"E:\Ontwikkel\Test\DatabaseInMemory\test\Scripts\Tables\PayrollData.Bron.sql");
         db.ExecuteCommand(sql);

         sql = GetCreateTableScript(@"E:\Ontwikkel\Test\DatabaseInMemory\test\Scripts\Tables\PayrollData.BronEenheid.sql");
         db.ExecuteCommand(sql);
         sql = GetCreateTableScript(@"E:\Ontwikkel\Test\DatabaseInMemory\test\Scripts\Tables\PayrollData.Batch.sql");
         db.ExecuteCommand(sql);

         sql = GetCreateTableScript(@"E:\Ontwikkel\Test\DatabaseInMemory\test\Scripts\Tables\PayrollData.SourceFileMetadata.sql");
         db.ExecuteCommand(sql);

         //sql = GetCreateTableScript(@"E:\Ontwikkel\Test\DatabaseInMemory\test\Scripts\Tables\PayrollData.BatchSourceFile.sql");
         //db.ExecuteCommand(sql);

         sql = GetCreateTableScript(@"E:\Ontwikkel\Test\DatabaseInMemory\test\Scripts\Tables\PayrollData.Administratie.sql");
         db.ExecuteCommand(sql);

         sql = GetCreateTableScript(@"E:\Ontwikkel\Test\DatabaseInMemory\test\Scripts\Tables\PayrollData.Aanlevering.sql");
         db.ExecuteCommand(sql);

         sql = GetCreateTableScript(@"E:\Ontwikkel\Test\DatabaseInMemory\test\Scripts\Tables\PayrollData.EntiteitType.sql");
         db.ExecuteCommand(sql);

         sql = GetCreateTableScript(@"E:\Ontwikkel\Test\DatabaseInMemory\test\Scripts\Tables\PayrollData.Entiteit.sql");
         db.ExecuteCommand(sql);

         sql = GetCreateTableScript(@"E:\Ontwikkel\Test\DatabaseInMemory\test\Scripts\Tables\PayrollData.EntiteitWaarde.sql");
         db.ExecuteCommand(sql);

         sql = GetCreateTableScript(@"E:\Ontwikkel\Test\DatabaseInMemory\test\Scripts\Tables\PayrollData.AffectedBatch.sql");
         db.ExecuteCommand(sql);

         sql = GetCreateTableScript(@"E:\Ontwikkel\Test\DatabaseInMemory\test\Scripts\Tables\PayrollData.AffectedAanlevering.sql");
         db.ExecuteCommand(sql);

         sql = GetCreateTableScript(@"E:\Ontwikkel\Test\DatabaseInMemory\test\Scripts\Tables\PayrollData.AffectedPayrollRelatie.sql");
         db.ExecuteCommand(sql);

         sql = GetCreateTableScript(@"E:\Ontwikkel\Test\DatabaseInMemory\test\Scripts\Tables\PayrollData.ProcessedEvent.sql");
         db.ExecuteCommand(sql);

         sql = GetCreateTableScript(@"E:\Ontwikkel\Test\DatabaseInMemory\test\Scripts\Tables\PayrollData.Log.sql");
         db.ExecuteCommand(sql);

         sql = GetCreateTableScript(@"E:\Ontwikkel\Test\DatabaseInMemory\test\Scripts\Tables\PayrollData.Event.sql");
         db.ExecuteCommand(sql);

         sql = GetCreateTableScript(@"E:\Ontwikkel\Test\DatabaseInMemory\test\Scripts\Tables\PayrollData.FileLog.sql");
         db.ExecuteCommand(sql);

         sql = GetCreateTableScript(@"E:\Ontwikkel\Test\DatabaseInMemory\test\Scripts\Tables\PayrollData.ImportMappingType.sql");
         db.ExecuteCommand(sql);

         sql = GetCreateTableScript(@"E:\Ontwikkel\Test\DatabaseInMemory\test\Scripts\Tables\PayrollData.ImportTableMapping.sql");
         db.ExecuteCommand(sql);

         sql = GetCreateTableScript(@"E:\Ontwikkel\Test\DatabaseInMemory\test\Scripts\Tables\PayrollData.ImportColumnMapping.sql");
         db.ExecuteCommand(sql);

      }

      private string GetCreateTableScript(string fileName)
      {
         var script = File.ReadAllText(fileName);
         if (string.IsNullOrWhiteSpace(script))
            return null;

         var createTableStart = script.IndexOf("CREATE TABLE", 0, StringComparison.OrdinalIgnoreCase);
         if (createTableStart < 0)
            return null;

         // first strip out everythign before CREATE TABLE
         var ret = script.Substring(createTableStart);
         var withStart = ret.IndexOf("WITH ", 0, StringComparison.OrdinalIgnoreCase);
         ret = $"{ret.Substring(0, withStart)})";

         return ret.Replace("[PayrollData]", "[main]").Replace("CLUSTERED", "");
      }
   }
}
