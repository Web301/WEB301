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
            Master.AddBreadcrumbLink("/Default.aspx", "Home");

            string header = "Home";
            Master.HeaderText = header;
            Master.AddCurrentPage("Home");
        }
    }
}