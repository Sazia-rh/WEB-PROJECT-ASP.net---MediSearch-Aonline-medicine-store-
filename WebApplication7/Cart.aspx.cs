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
    public partial class Cart : System.Web.UI.Page
    {
        double subtotal,subtotal_original;
        string connectionString = @"Data Source=(localdb)\Projects;Initial Catalog=UserRegistrationDB;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        //string username;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserName"] == null)
                {
                    Response.Redirect("login.aspx");
                }
                populateCartView();
            }
        }
       

        
       public void populateCartView()
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                subtotal = 0;
              // Session["username"] = "sazia_rh";
                string username = Session["UserName"].ToString();
               
                SqlDataAdapter sda = new SqlDataAdapter("SELECT CartID, Date, Quantity_pc, Quantity_strip, MedName, Type, Price, Med_img FROM Cart , Medicine where Cart.MedID = Medicine.MedID and Cart.UserName = '" + username + "'", sqlCon);

                DataTable dtbl = new DataTable();
              
                sda.Fill(dtbl);
                if (dtbl.Rows.Count == 0)
                {
                    Label23.Visible = true;
                    left.Visible = false;
                    right.Visible = false;
                    
                }
                else
                {
                    Label23.Visible = false;
                    left.Visible = true;
                    right.Visible = true;
                   // TextBox p = DataList1.Items[0].FindControl("TextBox1") as TextBox;
                   // string q = p.Text.Trim();
                   // double pr = Convert.ToDouble(q);
                    //subtotal = subtotal + pr;
                    //subtotal_original = subtotal + pr;
                    //Label16.Text = Convert.ToString(subtotal);
                    //Label18.Text = "120";
                    //Label20.Text = Convert.ToString(subtotal - 120);
                }
                DataList1.DataSourceID = null;
                DataList1.DataSource = dtbl;
                DataList1.DataBind();

                for (int i = 0; i < DataList1.Items.Count; i++)
                {
                    TextBox p = DataList1.Items[i].FindControl("TextBox1") as TextBox;
                    string q = p.Text.Trim();
                    double pr = Convert.ToDouble(q);
                    subtotal=subtotal+pr;

                    }
                    Label16.Text = Convert.ToString(subtotal);
                    Label18.Text = "120";
                    Label20.Text = Convert.ToString(subtotal + 120);
                }
            
        }

       

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            Label cartid = e.Item.FindControl("Label12") as Label;
            Label Q_p_o = e.Item.FindControl("Label13") as Label;
            Label Q_s_o = e.Item.FindControl("Label14") as Label;
            TextBox tb1 = e.Item.FindControl("TextBoxquantity_pc") as TextBox;
            string Quantity_pc_original = Q_p_o.Text.Trim().ToString();
            TextBox tb2 = e.Item.FindControl("TextBoxquantity_strip") as TextBox;
            string Quantity_strip_original = Q_s_o.Text.Trim().ToString();
            TextBox tb3 = e.Item.FindControl("TextBox1") as TextBox;
            Label pc = e.Item.FindControl("Label8") as Label;
            Label s = e.Item.FindControl("Label9") as Label;
            Label price_pc = e.Item.FindControl("Label10") as Label;
            Label price_strip = e.Item.FindControl("Label11") as Label;
            Button cancelbtn = e.Item.FindControl("Button3") as Button;

            if (e.CommandName == "Show")
            {
                string Quantity_pc = tb1.Text.Trim().ToString();
               
                string Quantity_strip = tb2.Text.Trim().ToString();
                
                
                string Price_pc = price_pc.Text.Trim().ToString(); 
                string Price_strip = price_strip.Text.Trim().ToString();
                double total_pc = Convert.ToDouble(price_pc.Text) * Convert.ToDouble(tb1.Text);
                string Total_pc = Convert.ToString(total_pc);
                double total_strip = Convert.ToDouble(price_strip.Text) * Convert.ToDouble(tb2.Text);
                string Total_strip = Convert.ToString(total_strip);
       

                pc.Text = "1pcX" + Quantity_pc + "(৳" + Price_pc + "X" + Quantity_pc + ")=৳" + Total_pc;

                s.Text = "1stripX" + Quantity_strip + "(৳" + Price_strip + "X" + Quantity_strip + ")=৳" + Total_strip;

                tb3.Text = Convert.ToString(total_pc + total_strip);
               
                cancelbtn.Visible = true;
            }
            if(e.CommandName == "Update")
            {
                
                string Quantity_pc = tb1.Text.Trim().ToString();
                
                string Quantity_strip = tb2.Text.Trim().ToString();
                
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {

                    sqlCon.Open();
                    string query = "update Cart set Quantity_pc ='" + Quantity_pc + "',Quantity_strip = '" + Quantity_strip + "' where CartID = '" + cartid.Text + "' ";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.ExecuteNonQuery();
                    cancelbtn.Visible = false;
                    sqlCon.Close();

                }
                populateCartView();
                

            }
               if(e.CommandName == "Cancel")
            {
                tb1.Text =Convert.ToString(Quantity_pc_original);
                tb2.Text = Quantity_strip_original;
                double total_pc = Convert.ToDouble(price_pc.Text) * Convert.ToDouble(tb1.Text);
                string Total_pc = Convert.ToString(total_pc);
                double total_strip = Convert.ToDouble(price_strip.Text) * Convert.ToDouble(tb2.Text);
                string Total_strip = Convert.ToString(total_strip);

                pc.Text = "1pcX" + Quantity_pc_original + "(৳" + price_pc.Text + "X" + Quantity_pc_original + ")=৳" + Total_pc;

                s.Text = "1stripX" + Quantity_strip_original + "(৳" + price_strip.Text + "X" + Quantity_strip_original + ")=৳" + Total_strip;
                tb3.Text = Convert.ToString(total_pc + total_strip);
                cancelbtn.Visible = false;
            }
              if (e.CommandName == "Deletee")
               {

                   using (SqlConnection sqlCon = new SqlConnection(connectionString))
                   {

                       sqlCon.Open();

                       string query = "delete from Cart where CartID = '" + cartid.Text + "'";
                       SqlCommand sqlCmd = new SqlCommand(query, sqlCon);

                       sqlCmd.ExecuteNonQuery();

                       cancelbtn.Visible = false;
                       sqlCon.Close();

                   }


                   populateCartView();
               }
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            //Session["username"] = "sazia_rh";
            string username = Session["UserName"].ToString();
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {

                
                 DateTime now = DateTime.Today;
                string strDate = now.ToString("yyyy-MM-dd");
                DateTime localDate = DateTime.Now;
                string ordersid = username +"_"+ localDate.ToString("dd/MM/yyyy_h:mm tt");
                double s =Convert.ToDouble(Label20.Text);
                sqlCon.Open();
               string query2 = "insert into orders (ordersid,UserName , Amount ,TransactionID ,Status,Date) values( '" + ordersid + "','" + username + "',  '" + s + "','" + TextBox2.Text + "', '" + "Pending" + "','" + strDate + "') ";
               SqlCommand sqlcomm = new SqlCommand(query2, sqlCon);
               sqlcomm.ExecuteNonQuery();
               sqlCon.Close();
               sqlCon.Open();
               string query = "insert into OrderTable ( MedID ,Quantity_pc , Quantity_strip ,Amount,ordersid) select   MedID , Quantity_pc , Quantity_strip , total ,'" + ordersid + "' from Cart where UserName='" + username + "' ";
               
                SqlCommand sqlcomd = new SqlCommand(query, sqlCon);
              
                sqlcomd.ExecuteNonQuery();
                sqlCon.Close();
                sqlCon.Open();
                string query1 = " delete from Cart where UserName = '" + username + "'  ";
                SqlCommand sqlcom = new SqlCommand(query1, sqlCon);
                sqlcom.ExecuteNonQuery();
                sqlCon.Close();
                 Button6.Text = "Order Confirmed";
                
                
            }
            
             populateCartView(); 
            
        }

        

      

       

    }
}