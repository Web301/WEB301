using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web301
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.AddBreadcrumbLink("/About.aspx", "Home");

            string header = "About Us";
            Master.HeaderText = header;
            Master.AddCurrentPage("About");
        }
    }
}