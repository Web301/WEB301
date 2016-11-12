using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web301
{
    public partial class CheckOut1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.AddBreadcrumbLink("/CheckOut1.aspx", "Home");

            string header = "Checkout";
            Master.HeaderText = header;
            Master.AddCurrentPage("Checkout");
            if (!Request.IsSecureConnection)
            {
                string url = ConfigurationManager.AppSettings["SecurePath"] + "CheckOut1.aspx";
                Response.Redirect(url);
            }
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var customer = new Customer();
                customer.FirstName = txtFirstName.Text;
                customer.LastName = txtLastName.Text;
                customer.EmailAddress = txtEmail.Text;
                customer.Address = txtAddress.Text;
                customer.City = txtCity.Text;
                customer.State = txtState.Text;
                customer.Zip = txtZip.Text;
                customer.Phone = txtPhone.Text;
                Session["Customer"] = customer;
                Response.Redirect("~/CheckOut2.aspx");
            }  
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Session.Remove("Cart");
            string url = ConfigurationManager.AppSettings["UnsecurePath"] + "Order.aspx";
            Response.Redirect(url);
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            string url = ConfigurationManager.AppSettings["UnsecurePath"] + "Order.aspx";
            Response.Redirect(url);
        }
    }
}