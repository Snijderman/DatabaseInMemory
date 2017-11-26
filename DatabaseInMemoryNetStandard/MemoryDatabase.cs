using ServiceStack.OrmLite;
using System.Data;

namespace DatabaseInMemoryNetStandard
{
   public class MemoryDatabase
    {
      public IDbConnection InMemoryDbConnection { get; set; }
      private OrmLiteConnectionFactory DbFactory;

      public void Setup()
      {
         //OrmLiteConfig.DialectProvider = SqliteDialect.Provider;
         this.DbFactory = new OrmLiteConnectionFactory(":memory:", SqliteDialect.Provider);
      }

      public virtual IDbConnection OpenDbConnection()
      {
         if (InMemoryDbConnection == null)
         {
            InMemoryDbConnection = new OrmLiteConnection(DbFactory);
            InMemoryDbConnection.Open();
         }

         return InMemoryDbConnection;
      }
   }
}
