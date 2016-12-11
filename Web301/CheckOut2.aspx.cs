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
        private string cardMonth;
        private string cardYear;

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

            GetShipping();

            DisplayOrderCost();



        }

        private void DisplayOrderCost()
        {
            cart = CartItemList.GetCart();
            subTotal = cart.GetCartCost;
            lblSubTotal.Text = string.Format("Order Sub-Total:\t {0:c2}", subTotal);

            if (shipping == 0)
            {
                lblShipping.ForeColor = System.Drawing.Color.IndianRed;
                lblShipping.Text = "FREE SHIPPING!!";
            }
            else
            {
                lblShipping.Text = string.Format("Shipping Cost:\t {0:c2}", shipping);
            }

            OrderTotal = subTotal + shipping;
            lblOrderTotal.Text = string.Format("Your Order Total:\t {0:c2}", OrderTotal);
        }

        private void GetShipping()
        {
            if (subTotal > 50)
                shipping = 0;
            else
                shipping = 10;
        }
        

        protected void btnAccept_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                Customer customer = GetCustomerDetails();
                string expDate = customer.ExpirationDate;
                cardMonth = expDate.Substring(0, 2);
                cardYear = expDate.Substring(3, 2);


                //WRITE TO DATABASE HERE

                //Claires code for insert to Customer Table
                //puts the variables into certain columns of table
                //AMENDED 11/12 TO TAKE DETAILS FROM THE CUSTOMER OBJECT-PL
                SqlDataSourceCustomer.InsertParameters["Email"].DefaultValue = customer.EmailAddress;
                SqlDataSourceCustomer.InsertParameters["FirstName"].DefaultValue = customer.FirstName;
                SqlDataSourceCustomer.InsertParameters["LastName"].DefaultValue = customer.LastName;
                SqlDataSourceCustomer.InsertParameters["Address1"].DefaultValue = customer.Address;
                SqlDataSourceCustomer.InsertParameters["City"].DefaultValue = customer.City;
                SqlDataSourceCustomer.InsertParameters["County"].DefaultValue = customer.State;
                SqlDataSourceCustomer.InsertParameters["PostCode"].DefaultValue = customer.Zip;
                SqlDataSourceCustomer.InsertParameters["PhoneNumber"].DefaultValue = customer.Phone;
                SqlDataSourceCustomer.InsertParameters["PersonalisedImage"].DefaultValue = customer.PersonalisedImage;

                //Claires code for insert to SalesOrder Table
                SqlDataSourceSalesOrders.InsertParameters["CustEmail"].DefaultValue = customer.EmailAddress;
                SqlDataSourceSalesOrders.InsertParameters["SalesOrderDate"].DefaultValue = DateTime.Now.ToShortDateString();
                SqlDataSourceSalesOrders.InsertParameters["Subtotal"].DefaultValue = subTotal.ToString();
                SqlDataSourceSalesOrders.InsertParameters["ShippingMethod"].DefaultValue = "Standard";
                SqlDataSourceSalesOrders.InsertParameters["Shipping"].DefaultValue = shipping.ToString();
                SqlDataSourceSalesOrders.InsertParameters["Total"].DefaultValue = OrderTotal.ToString();
                SqlDataSourceSalesOrders.InsertParameters["CreditCardType"].DefaultValue = customer.CardType;
                SqlDataSourceSalesOrders.InsertParameters["CardNumber"].DefaultValue = customer.CardNumber;
                SqlDataSourceSalesOrders.InsertParameters["ExpMonth"].DefaultValue = cardMonth;
                SqlDataSourceSalesOrders.InsertParameters["ExpYear"].DefaultValue = cardYear;


                try
                {
                    //tries to do the insert
                    SqlDataSourceCustomer.Insert();
                    SqlDataSourceSalesOrders.Insert();
                }
                catch (Exception ex)//if error occurs shows a message
                {
                    lblError.Text = "A database error has occured " + ex.Message;
                }

                Session.Remove("Cart");
                Response.Redirect("~/Confirmation.aspx");
            }
        }

        private Customer GetCustomerDetails()
        {
            var customer = (Customer)Session["Customer"];
            customer.ShippingMethod = "Standard";
            customer.CardType = ddlCardType.SelectedValue;
            customer.CardNumber = txtCardNumber.Text;
            customer.ExpirationDate = txtExpiration.Text;
            return customer;
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