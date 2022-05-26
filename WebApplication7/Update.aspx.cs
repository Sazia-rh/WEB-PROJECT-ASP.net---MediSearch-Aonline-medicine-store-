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
    public partial class Update : System.Web.UI.Page
    {
        string connectionString = @"Data Source=(localdb)\Projects;Initial Catalog=UserRegistrationDB;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("login.aspx");
            }
            Labelpassupdatefailed.Visible = false;
            Labelpassupdatesucess.Visible = false;
            LabelUpdate.Visible = false;

            if (!IsPostBack)
            {
                update();
            }
           
            
        }

        protected void BtnUpdateprofile_Click(object sender, EventArgs e)
        {
            update();
        }
        void update()
        {
            int uid;

            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                string username;
                //Session["username"] = "sazia_rh";
                username = Session["username"].ToString();
                uid = Convert.ToInt32(Session["userid"]);

                sqlCon.Open();

                SqlCommand cmd = new SqlCommand("select profile_img from userregistrationtb where UserName ='" + username + "'", sqlCon);
                // cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.AddWithValue("@UserName", username);
                SqlDataReader rr;
                rr = cmd.ExecuteReader();
                rr.Read();
                if (rr["profile_img"] != DBNull.Value)
                {
                    byte[] bytes = (byte[])rr["profile_img"];


                    //byte[] bytes = (byte[])cmd.ExecuteScalar();
                    string strBase64 = Convert.ToBase64String(bytes);
                    this.Image1.ImageUrl = "data:image/jpeg;base64," + strBase64;
                }
                sqlCon.Close(); ;



                sqlCon.Open();
                SqlCommand sqlCmd = new SqlCommand("Select * from userregistrationtb where UserName ='" + username + "'", sqlCon);
                SqlDataReader r;
                r = sqlCmd.ExecuteReader();


                if (r.Read())
                {
                    TxtFirstnameUpdate.Text = (r["FirstName"].ToString());
                    TxtLastnameUpdate.Text = (r["LastName"].ToString());
                    TxtcontactUpdate.Text = (r["Contact"].ToString());
                    TxtemailUpdate.Text = (r["Email"].ToString());
                    TextaddressUpdate.Text = (r["Address"].ToString());
                    DropDownListGenderUpdate.SelectedValue = (r["Gender"].ToString());
                    TextpasswordUpdate.Text = (r["Password"].ToString());
                    TextconfirmedpasswordUpdate.Text = (r["Password"].ToString());


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
            Response.Redirect("Profile.aspx");

        }

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            String username;
            username = Session["username"].ToString();
            HttpPostedFile postedFile = FileUploadpp.PostedFile;
            String filename = Path.GetFileName(postedFile.FileName);
            String fileExtension = Path.GetExtension(filename);
            int fileSize = postedFile.ContentLength;
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
            if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".gif" || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".bmp"   || fileExtension.ToLower() == ".jpeg")
            {
                Stream stream = postedFile.InputStream;
                BinaryReader binaryReader = new BinaryReader(stream);
                Byte[] bytes = binaryReader.ReadBytes((int)stream.Length);

                
                    sqlCon.Open();
                    SqlCommand cmd = new SqlCommand("UserImageupload", sqlCon);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UserName", username);
                    cmd.Parameters.AddWithValue("@profile_img", bytes);

                    cmd.ExecuteNonQuery();
                    sqlCon.Close();



                   /* SqlCommand Cmd = new SqlCommand("profileimgshow", sqlCon);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@UserName", username);

                    sqlCon.Open();

                    byte[] bytes2 = (byte[])Cmd.ExecuteScalar();
                    string strBase64 = Convert.ToBase64String(bytes2);
                    this.Image1.ImageUrl = "data:image/jpeg;base64," + strBase64;

                    //Response.Write("data:image/jpeg;base64," + strBase64);

                    sqlCon.Close();
                */
                   // update();

            }


           
                username = Session["username"].ToString();
                sqlCon.Open();

                SqlCommand sqlcomm = new SqlCommand("Update userregistrationtb set FirstName= '" + TxtFirstnameUpdate.Text + "',LastName= '" + TxtLastnameUpdate.Text + "', Email= '" + TxtemailUpdate.Text + "', Contact= '" + TxtcontactUpdate.Text + "',Address= '" + TextaddressUpdate.Text + "',Gender= '" + DropDownListGenderUpdate.SelectedItem.Text + "'  where UserName = '" + username + "'", sqlCon);
                sqlcomm.ExecuteNonQuery();
                update();
                LabelUpdate.Text = "Sucessfully Updated";
                Labelpassupdatefailed.Visible = false;
                Labelpassupdatesucess.Visible = false;
                LabelUpdate.Visible = true;
                // sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
                //sqlDa.SelectCommand.Parameters.AddWithValue("@UserName", Username);

                sqlCon.Close();


            }


        }
        protected void ButtonUpdatePass_Click(object sender, EventArgs e)
        {
            Labelpassupdatefailed.Visible = false;
            Labelpassupdatesucess.Visible = false;
            LabelUpdate.Visible = false;
            String Username;
            String gender;

            if (TextpasswordUpdate.Text == TextconfirmedpasswordUpdate.Text && TextpasswordUpdate.Text != "")
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    Username = Session["username"].ToString();
                    sqlCon.Open();
                    gender = DropDownListGenderUpdate.SelectedItem.Text;
                    SqlCommand sqlcom = new SqlCommand("Update userregistrationtb set Password= '" + TextpasswordUpdate.Text + "'  where UserName = '" + Username + "'", sqlCon);
                    sqlcom.ExecuteNonQuery();
                    Labelpassupdatesucess.Text = "Password Changed";
                    Labelpassupdatefailed.Visible = false;
                    Labelpassupdatesucess.Visible = true;
                    TextpasswordUpdate.Text = TextconfirmedpasswordUpdate.Text = "";

                }
            }
            else
            {
                Labelpassupdatefailed.Text = "Password do not match";
                TextpasswordUpdate.Text = TextconfirmedpasswordUpdate.Text = "";
                Labelpassupdatesucess.Visible = false;
                Labelpassupdatefailed.Visible = true;


            }
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