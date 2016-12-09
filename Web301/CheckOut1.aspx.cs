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
        //string subTotal = "";
        //Claires code for breadcrumbs and header
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
            //subTotal = (string)Session["SubTotal"];
            //lblOrderTotal.Text += subTotal;
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {

            if (IsValid)
            {
                string imagePath = string.Empty;
                if (FileUpload1.HasFile)
                {
                    string fileName = System.IO.Path.GetFileName(FileUpload1.FileName);
                    imagePath = Server.MapPath("~/Images/" + fileName);
                    FileUpload1.SaveAs(imagePath);
                }
                var customer = new Customer();
                customer.FirstName = txtFirstName.Text;
                customer.LastName = txtLastName.Text;
                customer.EmailAddress = txtEmail.Text;
                customer.Address = txtAddress.Text;
                customer.City = txtCity.Text;
                customer.State = ddlCounties.Text;
                customer.Zip = txtZip.Text;
                customer.Phone = txtPhone.Text;
                customer.PersonalisedImage = imagePath;
                Session["Customer"] = customer;

                //Claires code for insert to Database
                //puts the variables into certain columns of table
                SqlDataSource.InsertParameters["Email"].DefaultValue = txtEmail.Text;
                SqlDataSource.InsertParameters["FirstName"].DefaultValue = txtFirstName.Text;
                SqlDataSource.InsertParameters["LastName"].DefaultValue = txtLastName.Text;
                SqlDataSource.InsertParameters["Address1"].DefaultValue = txtAddress.Text;
                SqlDataSource.InsertParameters["City"].DefaultValue = txtCity.Text;
                SqlDataSource.InsertParameters["County"].DefaultValue = ddlCounties.Text;
                SqlDataSource.InsertParameters["PostCode"].DefaultValue = txtZip.Text;
                SqlDataSource.InsertParameters["PhoneNumber"].DefaultValue = txtPhone.Text;
                SqlDataSource.InsertParameters["PersonalisedImage"].DefaultValue = imagePath;
                try
                {
                    //tries to do the insert
                    SqlDataSource.Insert();
                    Response.Redirect("~/CheckOut2.aspx");//if successfull
                }
                catch (Exception ex)//if error occurs shows a message
                {
                    lblError.Text = "A database error has occured " + ex.Message;
                }
            
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
