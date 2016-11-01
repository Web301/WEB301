using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Web301.Models;

namespace Web301
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            DataView productsTable = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            DataRowView row1 = productsTable[0];
            Product p = new Product();
            p.ImageFile = row1["ImageFile"].ToString();
            Image1.ImageUrl = "Images/" + p.ImageFile;
        }
    }
}