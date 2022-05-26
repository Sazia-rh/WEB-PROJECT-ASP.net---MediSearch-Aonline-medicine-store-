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
    public partial class Myprescription : System.Web.UI.Page
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
                populatedview();

            }
        }

        void populatedview()
        {
            popUp.Style.Add("display", "none");
            nonpopup.Style.Add("opacity", "1");
            String username;
           // Session["username"] = "sazia_rh";
            username = Session["username"].ToString();
           
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("select * from Prescription where UserName = '" + username + "'", sqlCon);
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);

                if (dtbl.Rows.Count > 0)
                {
                    DataList2.DataSourceID = null;
                    DataList2.DataSource = dtbl;
                    DataList2.DataBind();


                }
            }

        }

        protected void BtnUpdateprofile_Click(object sender, EventArgs e)
        {


            Response.Redirect("Update.aspx");
        }
        protected void Btnshowprofile_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }


        protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "ViewDetails")
             {
                 popUp.Style.Add("display", "block");
                 nonpopup.Style.Add("opacity", "0.2");
                 Label id = e.Item.FindControl("Label7") as Label;
                 ////DataTable dtbl = new DataTable();
                 //Response.Write(id.Text);
                 int pid = Convert.ToInt32(id.Text);

                 Image im = e.Item.FindControl("Image1") as Image;
                 Label l3 = e.Item.FindControl("Label3") as Label;
                 Label l5 = e.Item.FindControl("Label5") as Label;

                     Image3.ImageUrl = im.ImageUrl;
                     Label9.Text = l3.Text.ToString();
                     Label11.Text = l5.Text.ToString();
                     
                
             }
             if (e.CommandName == "Delete")
             {
                 popUp.Style.Add("display", "none");
                 //nonpopup.Style.Add("opacity", "1");
                 //int rowIndex = int.Parse(e.CommandArgument.ToString());
                 Label id = e.Item.FindControl("Label7") as Label;
                 using (SqlConnection sqlCon = new SqlConnection(connectionString))
                 {
                     sqlCon.Open();
                     SqlCommand com = new SqlCommand("delete  from Prescription where PrescriptionID= '"+ id.Text +"' ", sqlCon);
                    // com.Parameters.AddWithValue("@id", Convert.ToInt32(DataList2.DataKeyField[rowIndex].));
                     com.ExecuteNonQuery();
                     sqlCon.Close();
                 }
                 populatedview();

             }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            popUp.Style.Add("display", "none");
            nonpopup.Style.Add("opacity", "1");
            String username;
            //Session["username"] = "sazia_rh";
            username = Session["username"].ToString();
           // FileUpload f = e.Item.FindControl("FileUPload1") as FileUpload;

            // FileUpload f = DataList1.FooterTemplate. ("FileUPload1") as FileUpload;
            
            HttpPostedFile postedFile = FileUpload1.PostedFile;
            String filename = Path.GetFileName(postedFile.FileName);
            String fileExtension = Path.GetExtension(filename);
            int fileSize = postedFile.ContentLength;
            DateTime now = DateTime.Today;
            string strDate = now.ToString("yyyy-MM-dd");
           
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".gif" || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".bmp" || fileExtension.ToLower() == ".jpeg")
                {
                    Stream stream = postedFile.InputStream;
                    BinaryReader binaryReader = new BinaryReader(stream);
                    Byte[] bytes = binaryReader.ReadBytes((int)stream.Length);

                    sqlCon.Open();
                    SqlCommand cmd = new SqlCommand("insert into Prescription (UserName,Date,Doctor,prescription_img) values ('" + username + "','" + strDate + "','" + TextBox1.Text + "',@img)", sqlCon);
                    cmd.Parameters.Add("@img", SqlDbType.VarBinary);
                    cmd.Parameters["@img"].Value = bytes;
                    cmd.ExecuteNonQuery();
                    sqlCon.Close();
                }
            }
            TextBox1.Text = "";
            populatedview();

        }

        protected void BtnPrescription_Click(object sender, EventArgs e)
        {
            populatedview();
        }

        protected void Btncomplain_Click(object sender, EventArgs e)
        {
            Response.Redirect("complaint.aspx");
        }

       
    }
}