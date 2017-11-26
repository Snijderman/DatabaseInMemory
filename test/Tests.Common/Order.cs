using System;

namespace Tests.Common
{
   public class Order
   {
      public int Id { get; set; }

      public int CustomerId { get; set; }

      public int EmployeeId { get; set; }

      public Address ShippingAddress { get; set; } //Blobbed (no Address table)

      public DateTime? OrderDate { get; set; }

      public DateTime? RequiredDate { get; set; }

      public DateTime? ShippedDate { get; set; }

      public int? ShipVia { get; set; }

      public decimal Freight { get; set; }

      public decimal Total { get; set; }
   }
}
