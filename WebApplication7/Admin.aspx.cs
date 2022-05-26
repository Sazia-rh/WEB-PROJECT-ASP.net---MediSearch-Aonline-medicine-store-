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
    public partial class Admin : System.Web.UI.Page
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
                drp_productCategory();
                populatedgridview();
            }
        }
        public void drp_productCategory()
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                SqlCommand sqlcom = new SqlCommand("Select * from MedCategory", sqlCon);
                DropDownList2.DataSource = sqlcom.ExecuteReader();
                DropDownList2.DataTextField = "MedCName";
                DropDownList2.DataValueField = "MedCID";
                DropDownList2.DataBind();
               
                labeltablename.Text = "OTC";
                sqlCon.Close();

            }
        }
        void populatedgridview()
        {
            
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                int cid = -1;
                string selectedmed = DropDownList2.SelectedItem.Text;



                cid = Convert.ToInt32(DropDownList2.SelectedItem.Value);
           
                labeltablename.Text = selectedmed;
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("select * from Medicine where MedCID = '" + cid + "'", sqlCon);
                sqlDa.Fill(dtbl);

                if (dtbl.Rows.Count > 0)
                {
                    gvMedicine.DataSource = dtbl;
                    gvMedicine.DataBind();
                    

                }
                else
                {
                    dtbl.Rows.Add(dtbl.NewRow());
                    gvMedicine.DataSource = dtbl;
                    gvMedicine.DataBind();
                    gvMedicine.Rows[0].Cells.Clear();
                    gvMedicine.Rows[0].Cells.Add(new TableCell());
                    gvMedicine.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                    gvMedicine.Rows[0].Cells[0].Text = "No Data Found..!";
                    gvMedicine.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                }
            }

        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string q = "";
           // TextBox2.Text = "";
            int cid = -1;
            string selectedmed = DropDownList2.SelectedItem.Text;

           
            
                cid = Convert.ToInt32(DropDownList2.SelectedItem.Value);
                q = "where MedCID = '" + cid + "' ";
                labeltablename.Text = selectedmed;
            
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {

                SqlDataAdapter sda = new SqlDataAdapter("select * from Medicine " + q + " ", sqlCon);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                try
                {
                    if (cid == Convert.ToInt32(dt.Rows[0][1]))
                    {

                    }

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('N0 Medicine Found')</script>");


                }
                gvMedicine.DataSourceID = null;
                gvMedicine.DataSource = dt;
                gvMedicine.DataBind();

            }


        }

        protected void gvMedicine_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string selectedmed = DropDownList2.SelectedItem.Text;

           
            
               int cid = Convert.ToInt32(DropDownList2.SelectedItem.Value);
               string q = "where MedCID = '" + cid + "' ";
                labeltablename.Text = selectedmed;

            try
            {
                if (e.CommandName.Equals("Addnew"))
                {
                    
                   // HttpPostedFile postedFile =gvMedicine.FindControl(FileUpload2).PostedFile;
                    FileUpload fu = gvMedicine.FooterRow.FindControl("FileUpload2") as FileUpload;
                    String filename = Path.GetFileName(fu.PostedFile.FileName);
                    String fileExtension = Path.GetExtension(filename);
                    int fileSize = fu.PostedFile.ContentLength;
                    Stream stream = fu.PostedFile.InputStream;
                    BinaryReader binaryReader = new BinaryReader(stream);
                    Byte[] bytes = binaryReader.ReadBytes((int)stream.Length);

                   
                    using (SqlConnection sqlCon = new SqlConnection(connectionString))
                    {

                        sqlCon.Open();
                        string query = "insert into medicine (MedCID , MedName, Price, Type,Med_Quantity,Med_img) values(@medcid,@medname,@price,@type,@quantity,@medimg)";
                        SqlCommand sqlCmd = new SqlCommand(query, sqlCon);

                        sqlCmd.Parameters.Add("@medcid", SqlDbType.Int);
                        sqlCmd.Parameters["@medcid"].Value = cid;
                        sqlCmd.Parameters.Add("@medimg", SqlDbType.VarBinary);
                        sqlCmd.Parameters["@medimg"].Value = bytes;


                        sqlCmd.Parameters.AddWithValue("@medname", (gvMedicine.FooterRow.FindControl("TextBoxmedicinenamefooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@price", (gvMedicine.FooterRow.FindControl("TextBoxpricefooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@type", (gvMedicine.FooterRow.FindControl("TextBoxmedicinetypefooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@quantity", (gvMedicine.FooterRow.FindControl("TextBoxquantityfooter") as TextBox).Text.Trim());
                        sqlCmd.ExecuteNonQuery();
                        populatedgridview();
                        LabelSccs.Text = "New Record Added";
                        Labelfail.Text = "";
                        sqlCon.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                LabelSccs.Text = "";
                  Labelfail.Text =ex.Message;
               
            }
             
        }

        protected void gvMedicine_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvMedicine.EditIndex = e.NewEditIndex;
            populatedgridview(); 
        }

        protected void gvMedicine_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvMedicine.EditIndex = -1;
            populatedgridview();
        }

        protected void gvMedicine_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            
            try
            {
                
                FileUpload fu = gvMedicine.Rows[e.RowIndex].FindControl("FileUpload1") as FileUpload;
                String filename = Path.GetFileName(fu.PostedFile.FileName);
                String fileExtension = Path.GetExtension(filename);
                int fileSize = fu.PostedFile.ContentLength;
                Stream stream = fu.PostedFile.InputStream;
                BinaryReader binaryReader = new BinaryReader(stream);
                Byte[] bytes = binaryReader.ReadBytes((int)stream.Length);
                
                
                    using (SqlConnection sqlCon = new SqlConnection(connectionString))
                    {
                        if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".gif" || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".bmp" || fileExtension.ToLower() == ".jpeg")
                        {
                            sqlCon.Open();
                            string query1 = "update medicine set Med_img=@medimg where MedID = @medid";
                            SqlCommand sqlCmdd = new SqlCommand(query1, sqlCon);
                            sqlCmdd.Parameters.Add("@medimg", SqlDbType.VarBinary);
                            sqlCmdd.Parameters["@medimg"].Value = bytes;
                            sqlCmdd.Parameters.AddWithValue("@medid", Convert.ToInt32(gvMedicine.DataKeys[e.RowIndex].Value.ToString()));
                            sqlCmdd.ExecuteNonQuery();
                            sqlCon.Close();
                        }
                        
                        sqlCon.Open();
                        string query = "update medicine set Price = @price,Type = @type,Med_Quantity = @quantity,MedName = @medname  where MedID = @medid";
                        SqlCommand sqlCmd = new SqlCommand(query, sqlCon);

                        sqlCmd.Parameters.AddWithValue("@medname", (gvMedicine.Rows[e.RowIndex].FindControl("TextBoxmedicinename") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@price", (gvMedicine.Rows[e.RowIndex].FindControl("TextBoxprice") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@type", (gvMedicine.Rows[e.RowIndex].FindControl("TextBoxmedicinetype") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@quantity", (gvMedicine.Rows[e.RowIndex].FindControl("TextBoxquantity") as TextBox).Text.Trim());
                       
                        sqlCmd.Parameters.AddWithValue("@medid", Convert.ToInt32(gvMedicine.DataKeys[e.RowIndex].Value.ToString()));
                        sqlCmd.ExecuteNonQuery();
                        gvMedicine.EditIndex = -1;
                        populatedgridview();
                        LabelSccs.Text = "Row updated";
                        Labelfail.Text = "";
                        sqlCon.Close();
                    
                }
            }
            catch (Exception ex)
            {
                LabelSccs.Text = "";
                Labelfail.Text = ex.Message;

            }
        }

        protected void gvMedicine_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {

                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {

                    sqlCon.Open();
                    string query = "delete from medicine where MedID = @medid";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@medid", Convert.ToInt32(gvMedicine.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();

                    gvMedicine.EditIndex = -1;
                    populatedgridview();
                    LabelSccs.Text = "Selected Row Deleted";
                    Labelfail.Text = "";
                    sqlCon.Close();

                }
            }
            catch (Exception ex)
            {
                LabelSccs.Text = "";
                Labelfail.Text =ex.Message ;

            }
        }

        protected void gvMedicine_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            /*if (e.Row.RowType == DataControlRowType.DataRow )
            {
                DataRowView dr = (DataRowView)e.Row.DataItem;
                string imageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["Med_img"]);
                if (imageUrl.Equals(""))
                {
                    Image imageField = (Image)e.Row.FindControl("Image1") as Image;
                    imageField.Visible = false;

                }
                else {
                    (e.Row.FindControl("Image1") as Image).ImageUrl = imageUrl;
                }

                //(e.Row.FindControl("Image1") as Image).ImageUrl = imageUrl;
            }*/
        }

        
    }
}