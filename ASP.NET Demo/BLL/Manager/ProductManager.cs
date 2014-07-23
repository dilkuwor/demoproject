using BLL.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Manager
{
    public static class ProductManager
    {
        public static List<Product> GetProducts()
        {
            return new List<Product> { new Product(Guid.NewGuid().ToString(),"Iphone",656,false),new Product(Guid.NewGuid().ToString(),"Laptop",123,true) };
        }
    }
}
