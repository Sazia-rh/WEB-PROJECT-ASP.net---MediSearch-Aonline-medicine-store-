using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication7
{
    public partial class Profile : System.Web.UI.Page
    {
        string connectionString = @"Data Source=(localdb)\Projects;Initial Catalog=UserRegistrationDB;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("login.aspx");
            }
            string username;
            //int uid;
            //int userid;
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                //Session["username"] = "sazia_rh";
                username = Session["username"].ToString();
                //uid = Convert.ToInt32(Session["userid"]);
                SqlCommand cmd = new SqlCommand("select profile_img from userregistrationtb where UserName ='" + username + "'", sqlCon);
               // cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.AddWithValue("@UserName", username);
                SqlDataReader rr ;
                rr = cmd.ExecuteReader();
                rr.Read();
                if (rr["profile_img"]!=DBNull.Value)
                {
                    byte[] bytes = (byte[])rr["profile_img"];
               
               
                   //byte[] bytes = (byte[])cmd.ExecuteScalar();
                    string strBase64 = Convert.ToBase64String(bytes);
                    this.profilePicture.ImageUrl = "data:image/jpeg;base64," + strBase64;
                }
                sqlCon.Close();

                sqlCon.Open();
                SqlCommand sqlCmd = new SqlCommand("Select * from userregistrationtb where UserName ='" + username + "'", sqlCon);
                SqlDataReader r;
                r = sqlCmd.ExecuteReader();
                if (r.Read())
                {
                    ProfileNameText.Text = (r["FirstName"].ToString() + "  " + r["LastName"].ToString());
                    TextBoxContactProfile.Text = (r["Contact"].ToString());
                    TextBoxEmail.Text = (r["Email"].ToString());
                    TextBoxAdress.Text = (r["Address"].ToString());

                    r.Close();
                    sqlCon.Close();

                }
                else
                {
                    r.Close();
                    sqlCon.Close();

                }

            }

        }

        protected void Btnshowprofile_Click(object sender, EventArgs e)
        {
            string username;
            //int uid;
            
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                username = Session["username"].ToString();
                SqlCommand cmd = new SqlCommand("profileimgshow", sqlCon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserName", username);

                sqlCon.Open();
                byte[] bytes = (byte[])cmd.ExecuteScalar();
                string strBase64 = Convert.ToBase64String(bytes);
                this.profilePicture.ImageUrl = "data:image/jpeg;base64," + strBase64;
                sqlCon.Close();
                
               
                sqlCon.Open();
                SqlCommand sqlCmd = new SqlCommand("Select * from userregistrationtb where UserName ='" + username + "'", sqlCon);
                SqlDataReader r;
                r = sqlCmd.ExecuteReader();
                if (r.Read())
                {
                    ProfileNameText.Text = (r["FirstName"].ToString() + "  " + r["LastName"].ToString());
                    TextBoxContactProfile.Text=(r["Contact"].ToString());
                    TextBoxEmail.Text = (r["Email"].ToString());
                    TextBoxAdress.Text = (r["Address"].ToString());

                    r.Close();
                    sqlCon.Close();

                }
                else
                {
                    r.Close();
                    sqlCon.Close();

                }

            }
        }

        protected void BtnUpdateprofile_Click(object sender, EventArgs e)
        {
            

            Response.Redirect("Update.aspx");
        }

        protected void BtnPrescription_Click(object sender, EventArgs e)
        {
            Response.Redirect("Myprescription.aspx");
        }

        protected void Btncomplain_Click(object sender, EventArgs e)
        {
            Response.Redirect("complaint.aspx");
        }
    }
}