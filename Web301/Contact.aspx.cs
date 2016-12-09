using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web301
{
    public partial class Contact : Page
    {//Claires code for breadcrumbs and header
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.AddBreadcrumbLink("/Contact.aspx", "Home");

            string header = "Contact Us";
            Master.HeaderText = header;
            Master.AddCurrentPage("Contact");
        }
    }
}