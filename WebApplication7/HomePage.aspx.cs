using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication7
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserName"] == null)
                {
                    Response.Redirect("login.aspx");
                }
            }
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Myprescription.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("DoctorView.aspx");

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Help.aspx");
        }
    }
}