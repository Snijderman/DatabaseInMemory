using Microsoft.Data.Sqlite;
using System.ComponentModel;
using System.Data;

namespace SqliteDatabaseInMemoryNetStandard
{
   public class MemoryDatabase
   {
      private IDbConnection InMemoryDbConnection { get; set; }

      public void Setup()
      {
         OpenDbConnection();
      }

      public void Close()
      {
         CloseDbConnection();
      }

      private void CloseDbConnection()
      {
         if (InMemoryDbConnection == null)
            return;

         ((MemoryConnection)InMemoryDbConnection).CloseConnection();
         InMemoryDbConnection.Dispose();
         InMemoryDbConnection = null;
      }

      public virtual void OpenDbConnection()
      {
         if (InMemoryDbConnection == null || InMemoryDbConnection.State == ConnectionState.Closed)
         {
            CloseDbConnection();

            //InMemoryDbConnection = new MemoryConnection("Data Source=:memory:;");
            InMemoryDbConnection = new MemoryConnection("Data Source=[PayrollData]; Mode=Memory;");
            InMemoryDbConnection.Open();

            //var db = ((SqliteConnection)InMemoryDbConnection).Database;
            //((SqliteConnection)InMemoryDbConnection).ChangeDatabase("PayrollData");
            //db = ((SqliteConnection)InMemoryDbConnection).Database;

            //using (var command = new SqliteCommand("attach database as PayrollData", (SqliteConnection)InMemoryDbConnection))
            //{
            //   command.ExecuteScalar();
            //}
            ////var tst = new SqliteCommand("attach database as PayrollData", (SqliteConnection)InMemoryDbConnection);

         }
      }

      public IDbConnection GetDbConnection()
      {
         if (InMemoryDbConnection == null)
            OpenDbConnection();

         return InMemoryDbConnection;
      }

      public void ExecuteCommand(string sql)
      {
         using (var cmd = InMemoryDbConnection.CreateCommand())
         {
            cmd.CommandText = sql;
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
         }
      }


      public T ExecuteScalar<T>(string sql)
      {
         using (var cmd = InMemoryDbConnection.CreateCommand())
         {
            cmd.CommandText = sql;
            cmd.CommandType = CommandType.Text;
            return Parse<T>(cmd.ExecuteScalar());
         }
      }

      static T Parse<T>(object value)
      {
         // or ConvertFromInvariantString if you are doing serialization
         return (T)TypeDescriptor.GetConverter(typeof(T)).ConvertFromString(value.ToString());
      }
   }
}
