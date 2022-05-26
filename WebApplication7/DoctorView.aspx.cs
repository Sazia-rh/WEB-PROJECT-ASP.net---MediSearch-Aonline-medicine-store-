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
    public partial class DoctorView : System.Web.UI.Page
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
        public void populatedgridview()
        {
            //string username = Session["UserName"].ToString();

            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {

                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("select * from Doctors", sqlCon);
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
    }
}