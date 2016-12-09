using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web301
{
    public partial class CheckOut2 : System.Web.UI.Page
    {    //Claires code for breadcrumbs and header
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.AddBreadcrumbLink("/CheckOut2.aspx", "Home");

            string header = "Shipping and Payment";
            Master.HeaderText = header;
            Master.AddCurrentPage("Checkout");
            if (!Request.IsSecureConnection)
            {
                string url = ConfigurationManager.AppSettings["SecurePath"] + "CheckOut2.aspx";
                Response.Redirect(url);
            }
            
            CartItem item = new CartItem();//*** ADDED BY PAUL
            lblOrderTotal.Text = item.DisplayCost();//*** ADDED BY PAUL
        }

        protected void btnAccept_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var customer = (Customer)Session["Customer"];
                //customer.ShippingMethod = rblShipping.SelectedValue;
                customer.CardType = ddlCardType.SelectedValue;
                customer.CardNumber = txtCardNumber.Text;
                customer.ExpirationDate = txtExpiration.Text;
                Session.Remove("Cart");
                Response.Redirect("~/Confirmation.aspx");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Session.Remove("Cart");
            string url = ConfigurationManager.AppSettings["UnsecurePath"] + "Order.aspx";
            Session.Remove("Customer");
            Response.Redirect(url);
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            string url = ConfigurationManager.AppSettings["UnsecurePath"] + "Order.aspx";
            Response.Redirect(url);
        }
    }
}