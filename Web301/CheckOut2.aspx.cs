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
    {
        private decimal subTotal;
        private int shipping;
        private CartItemList cart;
        private decimal OrderTotal;

        //Claires code for breadcrumbs and header
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

            cart = CartItemList.GetCart();
            subTotal = cart.GetCartCost;
            lblSubTotal.Text = string.Format("Order Sub-Total:\t {0:c2}", subTotal);
            GetShipping();
            OrderTotal = subTotal + shipping;
            lblOrderTotal.Text = string.Format("Your Order Total:\t {0:c2}", OrderTotal);


        }

        private void GetShipping()
        {
            if (subTotal > 50)
            {
                shipping = 0;
                lblShipping.ForeColor = System.Drawing.Color.IndianRed;
                lblShipping.Text = "FREE SHIPPING!!";
            }

            else
            {
                shipping = 10;
                lblShipping.Text = string.Format("Shipping Cost:\t {0:c2}", shipping);
            }
        }

        protected void btnAccept_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var customer = (Customer)Session["Customer"];
                customer.ShippingMethod = "Standard";
                customer.CardType = ddlCardType.SelectedValue;
                customer.CardNumber = txtCardNumber.Text;
                customer.ExpirationDate = txtExpiration.Text;
                //WRITE TO DATABASE HERE



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