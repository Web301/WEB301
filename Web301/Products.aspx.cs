using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;


namespace Web301
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.AddBreadcrumbLink("/Order.aspx", "Home");

            string header = "Our Products";
            Master.HeaderText = header;
            Master.AddCurrentPage("Products");
            Repeater1.DataSourceID = "SqlDataSource1";

            if (!IsPostBack)
            {
                string[] filePaths = Directory.GetFiles(Server.MapPath("~/Images/"));
                
                List<ListItem> files = new List<ListItem>();
                foreach (string filePath in filePaths)
                {
                    string fileName = Path.GetFileName(filePath);
                    files.Add(new ListItem(fileName, "~/Images/" + fileName));
                }
                //GridView1.DataSource = files;
                //GridView1.DataBind();
            }
        }
        protected void Upload(object sender, EventArgs e)
        {
            //if (FileUpload1.HasFile)
            //{
            //    string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
            //    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Images/") + fileName);
            //    Response.Redirect(Request.Url.AbsoluteUri);
            //    GridView1.DataSource = fileName;
            //    GridView1.DataBind();
            //}
        }
    }
   
}