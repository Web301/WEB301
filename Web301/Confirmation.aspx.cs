using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using TweetSharp;

namespace Web301
{
    public partial class Confirmation : System.Web.UI.Page
    {
        //Claires code for breadcrumbs and header
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.AddBreadcrumbLink("/Confirmation.aspx", "Home");

            string header = "Confirmation";
            Master.HeaderText = header;
            var customer = (Customer)Session["Customer"];
            var date = DateTime.Today.AddDays(1).ToShortDateString();
            lblConfirm.Text = $"Thank you for your order, {customer.FirstName}! It will be shipped on {date}.";

            Session.Remove("Cart");
            
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            string url = ConfigurationManager.AppSettings["UnsecurePath"] + "Order.aspx";
            Session.Remove("Customer");
            Response.Redirect(url);
        }

        //Pauls code for twitter and claires code for upload picture
        protected void btnUpload2_Click(object sender, EventArgs e)
        {
            string key = "OVIhqFJyhxqBPMYuEe4PgH2Sw";
            string secret = "3RoUbDb0yDw7Z7ohU2uIhq2g6RU0DeXjFBRWkC1s2Tr9baalWB";
            string token = "232583683-Ji1xOzEWQkrC75cUlo2YCOYEUrpeLudw3hVV0i4v";
            string tokenSecret = "a2CtMQ0D7WmeWPDLVhSu5Gr1bT8hGuBH0zwHJ5XlqEz9Y";

            string message = txtMessage.Text.Trim();
             //check if file is there, upload it
            string imagePath = string.Empty;
                if (FileUpload1.HasFile)
                {
                    string fileName = System.IO.Path.GetFileName(FileUpload1.FileName);
                    imagePath = Server.MapPath("~/Images/" + fileName);
                    FileUpload1.SaveAs(imagePath);
                }

                var service = new TweetSharp.TwitterService(key, secret);
            service.AuthenticateWith(token, tokenSecret);

            //Paul- Tweet with image
            if (imagePath.Length > 0)
            {
                using (var stream = new FileStream(imagePath, FileMode.Open))
                {
                    var result = service.SendTweetWithMedia(new SendTweetWithMediaOptions
                    {
                        Status = message,
                        Images = new Dictionary<string, Stream> { { "john", stream } }
                    });
                    lblResult.Text = "Congratulations you have tweeted your order";
                }
            }
            else // just message
            {
                var result = service.SendTweet(new SendTweetOptions
                {
                    Status = message
                });
                if (result != null)
                {
                    lblResult.Text = result.Text.ToString();
                }
            }
        }
    }// end class
}// end ns