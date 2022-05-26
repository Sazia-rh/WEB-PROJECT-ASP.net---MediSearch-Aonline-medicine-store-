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
using System.Collections.Generic;

namespace WebApplication7
{
    public partial class Order : System.Web.UI.Page
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
            popup.Style.Add("display", "none");
            nonpop.Style.Add("opacity", "1");
            LabelSccs.Text = "";
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {

                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("select orders.Date, orders.ordersid, orders.UserName,  orders.Status, orders.Amount, orders.TransactionID from orders  where orders.Status = '" + "Pending" + "' order by orders.Date", sqlCon);
                //SqlDataAdapter sqlDa = new SqlDataAdapter("select orders.Date, orders.ordersid, orders.UserName,  orders.Status, orders.Amount, orders.TransactionID from orders  where orders.status
               // SqlDataAdapter sqlDa = new SqlDataAdapter("select OrderTable.Date,OrderTable.OrderID, OrderTable.UserName,OrderTable.ordersid, OrderTable.MedID, OrderTable.Quantity_pc, OrderTable.Quantity_strip , OrderTable.Status, OrderTable.Amount, OrderTable.TransactionID, Medicine.MedName from OrderTable join Medicine on OrderTable.MedID= Medicine.MedID where OrderTable.status = '" + "Pending" + "'", sqlCon);
                sqlDa.Fill(dtbl);
                
            }
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
                ordergv.Rows[0].Cells[0].Text = "No Order Pending..!";
                ordergv.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            popup.Style.Add("display", "none");
            nonpop.Style.Add("opacity", "1");
            string status;
            SqlConnection sqlCon = new SqlConnection(connectionString);
            

                sqlCon.Open();

                for (int i = 0; i < ordergv.Rows.Count; i++)
                {
                    CheckBox chk = (CheckBox)ordergv.Rows[i].Cells[6].FindControl("CheckBox1");

                    if (chk.Checked == true)
                    {
                        DateTime now = DateTime.Today;
                        string strDate = now.ToString("yyyy-MM-dd");
                        status = "Completed";
                        Label oid = ordergv.Rows[0].Cells[0].FindControl("Label3") as Label;

                        string query = "update orders set Status = '" + status + "', CompleteDate='" + strDate + "'  where ordersid = '" + oid.Text + "'";
                        SqlCommand sqlcomm = new SqlCommand(query, sqlCon);
                        sqlcomm.ExecuteNonQuery();

                    }
                }

                sqlCon.Close();

                LabelSccs.Text = "Successfully Updated";
             populatedgridview();
          
            //Label s = ordergv.Rows[0].Cells[7]
        }

       
       
        protected void ordergv_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "view")
            {
                //Label l = ordergv.Rows[0].Cells[0].FindControl("Label3") as Label;
                int rowIndex = int.Parse(e.CommandArgument.ToString());
                string id = (string)this.ordergv.DataKeys[rowIndex].Value.ToString();
                //string id = l.Text;
                popup.Style.Add("display", "block");
                nonpop.Style.Add("opacity", "0.2");
                DataTable dtbl = new DataTable();
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {

                    sqlCon.Open();
                    SqlDataAdapter sqlDa = new SqlDataAdapter("select  OrderTable.ordersid, OrderTable.MedID, OrderTable.Quantity_pc, OrderTable.Quantity_strip ,  OrderTable.Amount,  Medicine.MedName, Medicine.Med_img from OrderTable join Medicine on OrderTable.MedID= Medicine.MedID where OrderTable.ordersid = '" + id + "'", sqlCon);
                    sqlDa.Fill(dtbl);

                }
                GridView1.DataSource = dtbl;
                GridView1.DataBind();
               // view(id);
            }

        }

        

      
    }
}