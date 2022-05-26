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
    public partial class viewcoplaint : System.Web.UI.Page
    {
        string connectionString = @"Data Source=(localdb)\Projects;Initial Catalog=UserRegistrationDB;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
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
            
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {

                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("select * from complaintsTable", sqlCon);
                sqlDa.Fill(dtbl);

            }
            if (dtbl.Rows.Count > 0)
            {
                datalist1.DataSource = dtbl;
                datalist1.DataBind();



            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                datalist1.DataSource = dtbl;
                datalist1.DataBind();
                datalist1.Rows[0].Cells.Clear();
                datalist1.Rows[0].Cells.Add(new TableCell());
                datalist1.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                datalist1.Rows[0].Cells[0].Text = "No Compalint..!";
                datalist1.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
        }

        protected void datalist1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Viewdetails")
            {
                popup.Style.Add("display", "block");
                nonpop.Style.Add("opacity", "0.2");
                //Label l = (Label)datalist1.Rows[0].Cells[2].FindControl("label1");
               // TextBox t1= datalist1.SelectedRow.FindControl("TextBox1") as TextBox;
                Label l2 = datalist1.Rows[0].Cells[2].FindControl("Label2") as Label;
                Label l3 = datalist1.Rows[0].Cells[2].FindControl("Label3") as Label;
               // TextBox t2 = datalist1.SelectedRow.FindControl("TextBox2") as TextBox;
                TextBox1.Text = l3.Text;
                TextBox2.Text = l2.Text;

            }
            
        }

        protected void datalist1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            popup.Style.Add("display", "none");
            nonpop.Style.Add("opacity", "1");
            Label lid = datalist1.Rows[0].Cells[0].FindControl("Labelid") as Label;
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {

                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("select * from complaintsTable", sqlCon);
                SqlCommand com = new SqlCommand("delete from complaintsTable where id = '" + lid.Text + "'", sqlCon);
                com.ExecuteNonQuery();
                sqlCon.Close();

            }
            populatedgridview();

        }
    }
}