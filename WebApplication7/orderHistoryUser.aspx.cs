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
    public partial class orderHistoryUser : System.Web.UI.Page
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
                populatedgridview();
            }

        }
        void populatedgridview()
        {
           // Session["UserName"] = "sazia_rh";
            string username = Session["UserName"].ToString();

            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {

                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("select * from orders where UserName='"+username+"'", sqlCon);
                sqlDa.Fill(dtbl);


                if (dtbl.Rows.Count > 0)
                {



                    ordergv.DataSource = dtbl;
                    ordergv.DataBind();



                }
                else
                {
                    dtbl.Rows.Add(dtbl.NewRow());
                    ordergv.DataSource = dtbl;
                    ordergv.DataBind();
                    ordergv.Rows[0].Cells.Clear();
                    ordergv.Rows[0].Cells.Add(new TableCell());
                    ordergv.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                    ordergv.Rows[0].Cells[0].Text = "No Order History..!";
                    ordergv.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                }

            }
        }

        protected void ordergv_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "view")
            {
               //string id = ordergv.DataKeys[e.RowIndex].Value.ToString();
               int rowIndex = int.Parse(e.CommandArgument.ToString());
               string id = (string)this.ordergv.DataKeys[rowIndex].Value.ToString();
                //Convert.ToInt32(gvMedicine.DataKeys[e.RowIndex].Value.ToString()));
              //  string id = l.Text;
                popup.Style.Add("display", "block");
                nonpop.Style.Add("opacity", "0.2");
                DataTable dtbl = new DataTable();
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {

                    sqlCon.Open();
                    //SqlDataAdapter sqlDa = new SqlDataAdapter("select  OrderTable.ordersid, OrderTable.MedID, OrderTable.Quantity_pc, OrderTable.Quantity_strip ,  OrderTable.Amount,  Medicine.MedName, Medicine.Med_img from OrderTable join Medicine on OrderTable.MedID= Medicine.MedID where OrderTable.ordersid = @id", sqlCon);
                    //sqlcom.Parameters.AddWithValue("@id", Convert.ToInt32(ordergv.DataKeys[e.RowIndex].Value.ToString()));
                    SqlDataAdapter sqlDa = new SqlDataAdapter("select  OrderTable.ordersid, OrderTable.MedID, OrderTable.Quantity_pc, OrderTable.Quantity_strip ,  OrderTable.Amount,  Medicine.MedName, Medicine.Med_img from OrderTable join Medicine on OrderTable.MedID= Medicine.MedID where OrderTable.ordersid = '" + id + "'", sqlCon);
                   // sqlDa.Parameters.AddWithValue("@id", Convert.ToInt32(ordergv.DataKeys[e.RowIndex].Value.ToString()));
                    sqlDa.Fill(dtbl);

                }
                GridView1.DataSource = dtbl;
                GridView1.DataBind();
                // view(id);
            }
            
        }

        protected void ordergv_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //Label l = ordergv.Rows[0].Cells[0].FindControl("Label2") as Label;
            //string id = l.Text;
            popup.Style.Add("display", "block");
            nonpop.Style.Add("opacity", "0.2");
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {

                sqlCon.Open();
                SqlCommand sqlcom = new SqlCommand("delete from OrderTable where ordersid = @id", sqlCon);
                sqlcom.Parameters.AddWithValue("@id", Convert.ToInt32(ordergv.DataKeys[e.RowIndex].Value.ToString()));
                sqlcom.ExecuteNonQuery();

                sqlCon.Close();
                sqlCon.Open();
                SqlCommand sqlcomm = new SqlCommand("delete from orders where ordersid = @id", sqlCon);
                sqlcom.Parameters.AddWithValue("@id", Convert.ToInt32(ordergv.DataKeys[e.RowIndex].Value.ToString()));
                sqlcomm.ExecuteNonQuery();
                sqlCon.Close();

            }
            populatedgridview();
        }
    }
}