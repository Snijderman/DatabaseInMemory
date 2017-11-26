using DatabaseInMemoryNet47;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Tests.Common;
using System.Data;
using ServiceStack.OrmLite;

namespace DatabaseInMemmoryNet47Tests
{
   [TestClass]
   public class MemoryDatabaseTests
   {
      [TestMethod]
      public void TestMethod1()
      {
         var db = new MemoryDatabase();
         db.Setup();

         CreateTables(db.OpenDbConnection());
         Assert.IsTrue(Test(db.OpenDbConnection()));
         Assert.IsTrue(TestCount<Employee>(db.OpenDbConnection(), 0));
         //Assert.IsTrue(TestCount<Customer>(db.OpenDbConnection(), 0));
      }

      private void CreateTables(IDbConnection conn)
      {
         using (conn)
         {
            conn.CreateTable<Employee>();
            Assert.IsTrue(Test(conn));
         }
      }

      private bool TestCount<T>(IDbConnection conn, int count)
      {
         return conn.Count<T>() == count;
      }

      private bool Test(IDbConnection conn)
      {
         return conn.Count<Employee>() == 0;
      }
   }
}
