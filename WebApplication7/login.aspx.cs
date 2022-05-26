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
    public partial class login : System.Web.UI.Page
    {
        string connectionString = @"Data Source=(localdb)\Projects;Initial Catalog=UserRegistrationDB;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";

        protected void Page_Load(object sender, EventArgs e)
        {
            LabelErrormessagelogin.Visible = false;
            if (!IsPostBack)
            {
                Session.Abandon();
                Session.Clear();
                HttpCookie cookies = Request.Cookies["Userinfo"];
               
                if (cookies != null )
                {
                    

                    TextUserNamelogin.Text = cookies["UserName"];
                    TextPasswordlogin.Attributes["value"] = cookies["Password"];
                    CheckBox1.Checked = true;
                   

                }
                Clear();
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    int userID = Convert.ToInt32(Request.QueryString["id"]);
                    using (SqlConnection sqlCon = new SqlConnection(connectionString))
                    {
                        sqlCon.Open();
                        SqlDataAdapter sqlDa = new SqlDataAdapter("userViewbyID", sqlCon);
                        sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
                        sqlDa.SelectCommand.Parameters.AddWithValue("@UserID", userID);
                        DataTable dtbl = new DataTable();
                        sqlDa.Fill(dtbl);
                        Hiddenuserid.Value = userID.ToString();
                        TxtFirstname.Text = dtbl.Rows[0][1].ToString();
                        txtLastname.Text = dtbl.Rows[0][2].ToString();
                        Txtemail.Text = dtbl.Rows[0][3].ToString();
                        Txtcontact.Text = dtbl.Rows[0][4].ToString();
                        DropDownListGender.Items.FindByValue(dtbl.Rows[0][5].ToString()).Selected = true;
                        Textaddress.Text = dtbl.Rows[0][6].ToString();
                        Textusername.Text = dtbl.Rows[0][7].ToString();
                        Textpassword.Text = dtbl.Rows[0][8].ToString();
                        Textpassword.Attributes.Add("value", dtbl.Rows[0][8].ToString());
                        Textconfirmedpassword.Text = dtbl.Rows[0][8].ToString();
                        Textconfirmedpassword.Attributes.Add("value", dtbl.Rows[0][8].ToString());

                    }
                }
            }

        }

        protected void Btnlogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                SqlCommand sqlCmd = new SqlCommand("userlogin", sqlCon);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.AddWithValue("@UserName",TextUserNamelogin.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@Password",TextPasswordlogin.Text.Trim());
                int count = Convert.ToInt32(sqlCmd.ExecuteScalar());
                if (TextUserNamelogin.Text == "Admin" && TextPasswordlogin.Text == "admin")
                {
                    Session["username"] = TextUserNamelogin.Text.Trim();
                    Response.Redirect("Admin.aspx");
                }
                else if (count == 1)
                {
                    HttpCookie cookies = new HttpCookie("Userinfo");
                    if (CheckBox1.Checked)
                    {
                       
                        cookies["UserName"] = TextUserNamelogin.Text;
                        cookies["Password"] = TextPasswordlogin.Text.Trim();

                         cookies.Expires = DateTime.Now.AddMonths(1);
                        Response.Cookies.Add(cookies);
                    }
                    else
                    {
                        cookies.Expires = DateTime.Now.AddMonths(-1);
                        //Response.Cookies["Password"].Expires = DateTime.Now.AddMonths(-1);
                    }

                    Session["username"] = TextUserNamelogin.Text.Trim();
                    //Session["userid"] = Convert.ToInt32(Hiddenuserid.Value); 
                    Response.Redirect("HomePage.aspx");
                }
                else
                {
                    LabelErrormessagelogin.Visible = true;
                }

            }
        }
        protected void Buttonsubmit_Click(object sender, EventArgs e)
        {
            if (TxtFirstname.Text == "" || txtLastname.Text == "" || Txtemail.Text == "" || Txtcontact.Text == "" || Textusername.Text == "" || Textpassword.Text == "")
            { Labelerroemssg.Text = "Please Fill All Mandatory Fields";
              
            }
            else if (Textpassword.Text != Textconfirmedpassword.Text)
                Labelerroemssg.Text = "Password do not match";
            else
            {
                try
                {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();

                    SqlCommand sqlCmd = new SqlCommand("UserAddorEdit", sqlCon);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.AddWithValue("@UserID", Convert.ToInt32(Hiddenuserid.Value == "" ? "0" : Hiddenuserid.Value));
                    sqlCmd.Parameters.AddWithValue("@FirstName", TxtFirstname.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@LastName", txtLastname.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Email", Txtemail.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Contact", Txtcontact.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Gender", DropDownListGender.SelectedValue);
                    sqlCmd.Parameters.AddWithValue("@Address", Textaddress.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@UserName", Textusername.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Password", Textpassword.Text.Trim());
                    sqlCmd.ExecuteNonQuery();
                    Session["username"] = TextUserNamelogin.Text.Trim();
                   // Session["userid"] = Convert.ToInt32(Hiddenuserid.Value); 
                    Clear();
                    Labelsuccessmssg.Text = "Registration Complete";
                   
                    Response.Redirect("HomePage.aspx");

                } 

                }
                catch (Exception )
                {

                    Label2.Text = "Need Unique UserName";
                }
            }

        }

        void Clear()
        {
            TxtFirstname.Text = txtLastname.Text = Txtemail.Text = Txtcontact.Text = Textaddress.Text = Textusername.Text = Textpassword.Text = Textconfirmedpassword.Text = "";
            Hiddenuserid.Value = "";
            Labelsuccessmssg.Text = Labelerroemssg.Text = "";

        }

    }
}