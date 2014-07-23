using BLL.Manager;
using BLL.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP.NET_Demo
{
    public partial class Default : System.Web.UI.Page
    {
        static bool[] rowChanged;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.Initialilze();
            }
            
        }

        private void Initialilze()
        {
           
            grdProduct.DataSource = ProductManager.GetProducts();
            grdProduct.DataBind();
            rowChanged = new bool[grdProduct.Rows.Count];
        }

        protected void TextBox_TextChanged(object sender, EventArgs e)
        {
            TextBox thisTextBox = (TextBox)sender;
            GridViewRow thisGridViewRow = (GridViewRow)thisTextBox.Parent.Parent;
            int row = thisGridViewRow.RowIndex;
            rowChanged[row] = true;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            List<Product> updated = new List<Product>();
            if (this.IsPostBack)
            {
                int totalRows = grdProduct.Rows.Count;
                for (int r = 0; r < totalRows; r++)
                {
                    if (rowChanged[r])
                    {
                        GridViewRow thisGridViewRow = grdProduct.Rows[r];
                        TextBox hf1 = (TextBox)thisGridViewRow.FindControl("txtEditPrice");
                        string price = hf1.Text;
                        Product @new = new Product(thisGridViewRow.Cells[0].Text,thisGridViewRow.Cells[1].Text, Double.Parse(price), false);
                        updated.Add(@new);

                    }
                }
            }

        }
    }
}