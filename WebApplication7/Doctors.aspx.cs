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
    public partial class Doctors : System.Web.UI.Page
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
                // drp_productCategory();
                populatedgridview();
            }

        }

        public void populatedgridview()
        {

            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {

                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("select * from Doctors", sqlCon);
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
        protected void gvMedicine_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            

            try
            {
                if (e.CommandName.Equals("Addnew"))
                {

                   
                    using (SqlConnection sqlCon = new SqlConnection(connectionString))
                    {
                       
                        sqlCon.Open();
                        string query = "insert into Doctors ( Name, Specialist, contact) values(@name,@specialist,@contact)";
                        SqlCommand sqlCmd = new SqlCommand(query, sqlCon);





                        sqlCmd.Parameters.AddWithValue("@name", (gvMedicine.FooterRow.FindControl("TextBoxmedicinenamefooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@specialist", (gvMedicine.FooterRow.FindControl("TextBoxpricefooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@contact", (gvMedicine.FooterRow.FindControl("TextBoxmedicinetypefooter") as TextBox).Text.Trim());

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
                Labelfail.Text = ex.Message;

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

                
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {

                    //int id = Convert.ToInt32((gvMedicine.Rows[e.RowIndex].FindControl("Label1") as Label).Text);
                    Label l = gvMedicine.Rows[e.RowIndex].FindControl("Label1") as Label;
                    //int id = Convert.ToInt32(l.Text);
                    sqlCon.Open();
                    string query = "update Doctors set Name = @name, Specialist = @specialist, Contact = @contact where Id = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);

                    sqlCmd.Parameters.AddWithValue("@name", (gvMedicine.Rows[e.RowIndex].FindControl("TextBoxmedicinename") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@specialist", (gvMedicine.Rows[e.RowIndex].FindControl("TextBoxprice") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@contact", (gvMedicine.Rows[e.RowIndex].FindControl("TextBoxmedicinetype") as TextBox).Text.Trim());
                    //sqlCmd.Parameters.AddWithValue("@id", id);

                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvMedicine.DataKeys[e.RowIndex].Value.ToString()));
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
                    string query = "delete from medicine where Id = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    //sqlCmd.Parameters.AddWithValue("@id", (gvMedicine.Rows[e.RowIndex].FindControl("Label1") as Label).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvMedicine.DataKeys[e.RowIndex].Value.ToString()));
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
                Labelfail.Text = ex.Message;

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