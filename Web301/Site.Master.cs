using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Microsoft.AspNet.Identity;

namespace Web301
{
    public partial class SiteMaster : MasterPage
    {
        public string HeaderText
        {
            set { lblPageHeader.Text = value; }
        }
        public void AddBreadcrumbLink(string url, string text)
        {
            litBreadcrumb.Text += $"<li><a href='{url}'>{text}</a></li>";
        }
        public void AddCurrentPage(string text)
        {
            litBreadcrumb.Text += $"<li class='active'>{text}</li>";
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) // do on initial load
            {
                // loop the navigation li elements to mark the active page 
                //foreach (Control ctl in navList.Controls)
                //{
                //    if (ctl is HtmlGenericControl)
                //    {
                //        // get the current li element and its child <a> element
                //        var li = (HtmlGenericControl)ctl;
                //        var a = (HyperLink)li.Controls[1];

                //        // if the current navigation li element is the active page...
                //        if (Page.AppRelativeVirtualPath.Contains(a.NavigateUrl))
                //        {
                //            // set Bootstrap active class
                //            li.Attributes.Add("class", "active");

                //            return; // exit loop because we've marked the current navigation link as active 
                //        }
                //    }
                //}
            }
        }
        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;

        protected void Page_Init(object sender, EventArgs e)
        {
            // The code below helps to protect against XSRF attacks
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                // Use the Anti-XSRF token from the cookie
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                // Generate a new Anti-XSRF token and save to the cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set Anti-XSRF token
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                // Validate the Anti-XSRF token
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
                }
            }
        }

       
        protected void Page_PreRender(object sender, EventArgs e)
        {
            // set cart count in PreRender event handler because count 
            // can get out of sync if set it in Load

            //spanCount.InnerText = CartItemList.GetCart().Quantity.ToString();
            spanCount.InnerText = CartItemList.GetCart().Count.ToString();

            //Order o = new Order();
            //spanCount.InnerText = o.CartCount();
        }

    
        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
        }
    }

}