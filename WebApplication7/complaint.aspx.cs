using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;

namespace WebApplication7
{
    public partial class complaint : System.Web.UI.Page
    {
        string connectionString = @"Data Source=(localdb)\Projects;Initial Catalog=UserRegistrationDB;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserName"] == null)
                {
                    Response.Redirect("login.aspx");
                }
                view();
            }
        }
        public void view()
        {
            TextBox2.Text = "";
            TextBox1.Text = "";
            Label3.Visible = false;

        }

        protected void BtnUpdateprofile_Click(object sender, EventArgs e)
        {


            Response.Redirect("Update.aspx");
        }
        protected void Btnshowprofile_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }
        protected void BtnPrescription_Click(object sender, EventArgs e)
        {
            Response.Redirect("Myprescription.aspx");
        }

        protected void Btncomplain_Click(object sender, EventArgs e)
        {
            view();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            String username;
           // Session["username"] = "sazia_rh";
            username = Session["username"].ToString();
            DateTime now = DateTime.Today;
            string strDate = now.ToString("yyyy-MM-dd");
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                SqlCommand cmd = new SqlCommand("insert into complaintsTable (UserName,Date,Complaints,About) values ('" + username + "','" + strDate + "','" + TextBox1.Text + "','" + TextBox2.Text + "')", sqlCon);
                cmd.ExecuteNonQuery();
                sqlCon.Close();
            }
            Label3.Visible = true;
            TextBox2.Text = "";
            TextBox1.Text = "";
        }
    }
}