using ServiceStack.OrmLite;
using System.Data;

namespace DatabaseInMemoryNet47
{
   public class MemoryDatabase
   {
      private OrmLiteConnectionFactory DbFactory;
      public IDbConnection InMemoryDbConnection { get; set; }

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
