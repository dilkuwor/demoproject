using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace BLL.Model
{
    public class Product
    {
        public Product(string id,string name, double prize,bool isEditable)
        {
            this.Name = name;
            this.Price = prize;
            this.ID = new Guid(id);
            this.IsEditable = isEditable;
        }
        public Guid ID { get; set; }
        public string Name { get; set; }
        public double Price { get; set; }
        public bool IsEditable { get; set; }
    }

}