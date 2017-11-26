using Microsoft.VisualStudio.TestTools.UnitTesting;
using SqliteDatabaseInMemoryNetStandard;

namespace SqliteDatabaseInMemoryNetStandardTests
{
    [TestClass]
   public class MemoryDatabaseTests
   {
      [TestMethod]
      public void TestMethod1()
      {
         var db = new MemoryDatabase();
         db.Setup();

         //TestCount(db, 0);
         CreateTablesFirst(db);
         CreateTables(db);
         TestCount(db, 0);
         CreateTablesFirst(db);

         //db.Close();
         //TestCount(db, 0);
      }
      private void CreateTablesFirst(MemoryDatabase db)
      {
         using (var conn = db.OpenDbConnection())
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
   }
}
