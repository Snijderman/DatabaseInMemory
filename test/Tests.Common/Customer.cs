using System;
using System.Collections.Generic;

namespace Tests.Common
{
   public class Customer
   {
      public Customer()
      {
         this.PhoneNumbers = new Dictionary<PhoneType, string>();
         this.Addresses = new Dictionary<AddressType, Address>();
      }

      // Creates Auto primary key
      public int Id { get; set; }

      public string FirstName { get; set; }

      public string LastName { get; set; }

      public string Email { get; set; }

      public Dictionary<PhoneType, string> PhoneNumbers { get; set; }

      public Dictionary<AddressType, Address> Addresses { get; set; }

      public DateTime CreatedAt { get; set; }
   }
}
