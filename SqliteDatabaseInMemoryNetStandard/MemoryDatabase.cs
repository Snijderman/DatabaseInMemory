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

         InMemoryDbConnection.Close();
         InMemoryDbConnection.Dispose();
         InMemoryDbConnection = null;
      }

      public virtual IDbConnection OpenDbConnection()
      {
         if (InMemoryDbConnection == null)
         {
            InMemoryDbConnection = new MemoryConnection("Data Source=:memory:");
            InMemoryDbConnection.Open();
         }

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
            //return Convert<object, typeof(T)>(cmd.ExecuteScalar());
         }
      }

      static T Parse<T>(object value)
      {
         // or ConvertFromInvariantString if you are doing serialization
         return (T)TypeDescriptor.GetConverter(typeof(T)).ConvertFromString(value.ToString());
      }
   }
}
