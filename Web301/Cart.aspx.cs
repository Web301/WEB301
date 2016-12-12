using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web301
{
    public partial class Cart : System.Web.UI.Page
    {
        static string Message = "Congratulations!! You Have Qualified for Free Shipping.";//*** ADDED BY PAUL
        static decimal ThresholdValue = 50;//*** ADDED BY PAUL
        static CartEventListener cartPrice = new CartEventListener(Message, ThresholdValue);//*** ADDED BY PAUL

        private CartItemList cart;
        //Claires & Pauls code
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.AddBreadcrumbLink("/Cart.aspx", "Home");

            string header = "Your Shopping Cart";
            Master.HeaderText = header;
            Master.AddCurrentPage("Cart");

            cart = CartItemList.GetCart();
            if (!IsPostBack)
            {
                this.DisplayCart();
            } 
            CartItem item = new CartItem();//*** ADDED BY PAUL
            lblSubTotal.Text = item.DisplayCost();//*** ADDED BY PAUL

            decimal cartTotal = cart.GetCartCost;
            //decimal itemTotal = (cart.Count * cart.GetCartCost);
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            // Assign the delegate to the composed delegate
            // The Show message method is called when the TotalPrice exceeds a Threshold vlaue, in this case 50.
            cartPrice.Exceeded += new CartEventListener.ThresholdExceededHandler(ShowMessage);

            cartPrice.AddPriceToTotal(cartTotal);
        }

        private void ShowMessage(string message)
        {
            lblFreeShip.Text = message;
        }

        private void DisplayCart()
        {
            lstCart.Items.Clear();
            CartItem item;
            for (int i = 0; i < cart.Count; i++)
            {
                item = cart[i];
                lstCart.Items.Add(item.Display());
            }
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            
            if (cart.Count > 0)
            {
                if (lstCart.SelectedIndex > -1)
                {
                    cart.RemoveAt(lstCart.SelectedIndex);
                    this.DisplayCart();
                    CartItem item = new CartItem();//*** ADDED BY PAUL
                    lblSubTotal.Text = item.DisplayCost();//*** ADDED BY PAUL

                    decimal cartTotal = cart.GetCartCost;
                    if (cartTotal <= 50)
                    {
                        lblFreeShip.Text = "";
                    }
                }
                else
                {
                    lblMessage.Text = "Please select the item you want to remove.";
                }
            }
        }

        protected void btnEmpty_Click(object sender, EventArgs e)
        {
            if (cart.Count > 0)
            {
                cart.Clear();
                lstCart.Items.Clear();
                CartItem item = new CartItem();//*** ADDED BY PAUL
                lblSubTotal.Text = item.DisplayCost();//*** ADDED BY PAUL
                lblFreeShip.Text = "";
            }
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {            
            string url = ConfigurationManager.AppSettings["SecurePath"] + "CheckOut1.aspx";
            Response.Redirect(url);
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            string url = ConfigurationManager.AppSettings["UnsecurePath"] + "Order.aspx";
            Response.Redirect(url);
        }
    }
}