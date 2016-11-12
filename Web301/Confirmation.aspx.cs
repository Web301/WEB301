using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web301
{
    public partial class Confirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.AddBreadcrumbLink("/Confirmation.aspx", "Home");

            string header = "Confirmation";
            Master.HeaderText = header;
            var customer = (Customer)Session["Customer"];
            var date = DateTime.Today.AddDays(1).ToShortDateString();
            lblConfirm.Text = $"Thank you for your order, {customer.FirstName}! It will be shipped on {date}.";
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            string url = ConfigurationManager.AppSettings["UnsecurePath"] + "Order.aspx";
            Response.Redirect(url);
        }
    }
}