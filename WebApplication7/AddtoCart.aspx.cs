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
    public partial class AddtoCart : System.Web.UI.Page
    {
        string connectionString = @"Data Source=(localdb)\Projects;Initial Catalog=UserRegistrationDB;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        string username;
        double total;
        double price_pc;
        double price_strip;
        
       // username = Session["username"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserName"] == null)
                {
                    Response.Redirect("login.aspx");
                }
                showcart();
            }
        }
        void showcart()
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                //Session["username"] = "sazia_rh";
                //Session["productid"] = 2022;
                username = Session["username"].ToString();
                int medid=Convert.ToInt32(Session["productid"]);
                SqlCommand cmd = new SqlCommand("select Med_img from Medicine where MedID = '" + medid + "'", sqlCon);
                cmd.Parameters.AddWithValue("@MedID", medid);
                sqlCon.Open();
                byte[] bytes = (byte[])cmd.ExecuteScalar();
                string strBase64 = Convert.ToBase64String(bytes);
                this.Image1.ImageUrl = "data:image/jpeg;base64," + strBase64;
                sqlCon.Close();
                SqlCommand sqlcmd = new SqlCommand("select * from Medicine where MedID = '" + medid + "'", sqlCon);
                sqlCon.Open();
                SqlDataReader r;
                r = sqlcmd.ExecuteReader();
                r.Read();
                double price = Convert.ToDouble(r["Price"]);
                price_pc = price;
                Label7.Text = price.ToString(); 
                price = 10 * price;
                price_strip = 10.0 * price_pc;
                
                Label1.Text = r["MedName"].ToString();
                Label6.Text = r["Type"].ToString();
                Label3.Text = "৳"+r["Price"].ToString();
                Label5.Text = "৳"+ price.ToString();
                //Response.Write(price_pc);
                sqlCon.Close();

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("DisplayProduct.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
               
                username = Session["username"].ToString();
                int medid = Convert.ToInt32(Session["productid"]);
                DateTime now = DateTime.Today;
                string strDate = now.ToString("yyyy-MM-dd");
                price_pc = Convert.ToDouble(Label7.Text);
                price_strip = Convert.ToDouble(Label7.Text) * 10;
                total = (Convert.ToInt32(TextBoxquantity_pc.Text) * price_pc) + (Convert.ToInt32(TextBoxquantity_strip.Text) * price_strip);
               
                sqlCon.Open();


                SqlCommand sqlcomm = new SqlCommand("insert into Cart (UserName, Date ,MedID,Quantity_pc,Quantity_strip,total) values( '" + username + "' , '" + strDate + "', '" + medid + "', '" + TextBoxquantity_pc.Text + "', '" + TextBoxquantity_strip.Text + "','" + total + "') ", sqlCon);
                sqlcomm.ExecuteNonQuery();
                Response.Redirect("DisplayProduct.aspx");
               // Response.Write(total);
                //Response.Write(price_strip);
                
            }
           // Response.Write(price_pc);
        }

    }
}