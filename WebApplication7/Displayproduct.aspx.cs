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
    public partial class Displayproduct : System.Web.UI.Page
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
            }
            Session["addproduct"] = false;

        }
        public void drp_productCategory()
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                SqlCommand sqlcom = new SqlCommand("Select * from MedCategory where Type='"+ "Medicine"+"'", sqlCon);
                DropDownList2.DataSource = sqlcom.ExecuteReader();
                DropDownList2.DataTextField = "MedCName";
                DropDownList2.DataValueField = "MedCID";
                DropDownList2.DataBind();
                DropDownList2.Items.Insert(0, "All Medicines and Devices");
                Label6.Text = "All Medicines and Devices";
                sqlCon.Close();

            }

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            Session["addproduct"] = true;
            if (e.CommandName == "AddToCart")
            {
                Label productId = e.Item.FindControl("Label3") as Label;
                Session["productid"] = productId.Text;
                Response.Redirect("AddtoCart.aspx");

            }
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {


            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {

                Label productId = e.Item.FindControl("Label3") as Label;
                Label stock = e.Item.FindControl("Label2") as Label;
                Label stockout = e.Item.FindControl("Label7") as Label;
                Button btn = e.Item.FindControl("Button1") as Button;
                SqlDataAdapter sda = new SqlDataAdapter("select * from Medicine where MedID='" + productId.Text + "'", sqlCon);

                DataTable dtbl = new DataTable();
                sda.Fill(dtbl);

                string stockdata = "";

                if (dtbl.Rows.Count > 0)
                {
                    stockdata = dtbl.Rows[0]["Med_Quantity"].ToString();
                }
                sqlCon.Close();
                if (stockdata == "0")
                {
                    stock.Text = "Out of Stock";
                    btn.Enabled = false;
                    btn.Visible = false;

                    //btn.ImageUrl = "Images/soldout1.jpg";
                    stockout.Visible = true;
                }
                else
                {
                    stockout.Visible = false;
                    stock.Text = stockdata;
                }

            }

        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string q = "";
            TextBox2.Text = "";
            int cid = -1;
            string selectedmed = DropDownList2.SelectedItem.Text;

            if (selectedmed == "All Medicines and Devices")
            {
                q = "";
                Label6.Text = "All Medicines and Devices";
            }
            else
            {
                cid = Convert.ToInt32(DropDownList2.SelectedItem.Value);
                q = " where Medicine.MedCID = '" + cid + "' ";
                Label6.Text =selectedmed;
            }
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {

                SqlDataAdapter sda = new SqlDataAdapter("select * from Medicine  " + q + " ", sqlCon);
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
                DataList1.DataSourceID = null;
                DataList1.DataSource = dt;
                DataList1.DataBind();

            }


        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {


            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                SqlDataAdapter sda = new SqlDataAdapter("Select* from Medicine where (MedName like '%" + TextBox2.Text + "%')", sqlCon);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                DataList1.DataSourceID = null;
                DataList1.DataSource = dt;
                DataList1.DataBind();

                sqlCon.Close();
                sqlCon.Open();
                SqlCommand sqlcom = new SqlCommand("Select MedCName ,MedCID from MedCategory where MedCid = (select MedCID from Medicine where (MedName like '%" + TextBox2.Text + "%'))", sqlCon);
                SqlDataReader r;
                r = sqlcom.ExecuteReader();
                if (r.Read())
                {
                    Label6.Text = r["MedCName"].ToString();
                    //DropDownList2.SelectedItem.Value = r["MedCID"].ToString();
                }
                else
                {
                    Label6.Text = "";
                }
                sqlCon.Close();
                //drp_productCategory();

               
              
            }



        }

    }
}