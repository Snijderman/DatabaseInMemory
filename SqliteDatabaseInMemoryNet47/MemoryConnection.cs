using Microsoft.Data.Sqlite;
using System.Data;

namespace SqliteDatabaseInMemoryNet47
{
   internal class MemoryConnection : SqliteConnection
   {
      public MemoryConnection(string connectionString) : base(connectionString)
      { }

      protected override void Dispose(bool disposing)
      {
         if (!disposing || this.State == ConnectionState.Closed)
            base.Dispose(disposing);

         // do not dispose, keep connection (and the database in memory!!!!) alive
      }
   }
}
