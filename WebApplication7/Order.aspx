<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="WebApplication7.Order" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" href="home1.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css" />
    <script src="https://kit.fontawesome.com/01f22be397.js" crossorigin="anonymous"></script>
     <div class="title1">
        <div class="title">
            <asp:Label runat="server" Text="MediSearch"></asp:Label>
        </div>
      <div class="icons" >
            <a href="login.aspx"><div id="Div3" class="fas fa-sign-out-alt" > </div></a>
          </div>
        </div>
    <div class="menu-bar">
        <ul>
            
            
            <li ><a href="Admin.aspx">Update Stock</a> </li>
           
            <li class="active"><a href="Order.aspx">View Order</a>
            </li>
            <li><a href="orderHistory.aspx">Order History</a></li>
            <li ><a href="Doctors.aspx">Doctors</a></li>
            <li ><a href="viewcoplaint.aspx">View Compliant</a></li>

        </ul>
          
    </div>
</head>
<body class="body2">
    <form id="form1" runat="server">
        <div class="nonpopup" id="nonpop" runat="server">
        <div class="label">
            <asp:Label ID="labeltablename" runat="server" Text="Order" ></asp:Label>
            
        </div>
        
      
        <div class="grid">
           

            <asp:GridView ID="ordergv" runat="server" AutoGenerateColumns="false" ShowFooter="true" DataKeyNames="ordersid" ShowHeaderWhenEmpty="true"
               
                 
                 BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" ViewStateMode="Enabled"  OnRowCommand="ordergv_RowCommand"  >

                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
                <Columns>
                    <asp:TemplateField HeaderText="Order ID">
                        <ItemTemplate>
                          <asp:Label ID="Label3" runat="server" Text='<%#Eval("ordersid") %>' ></asp:Label>
                        </ItemTemplate>
                        
                    </asp:TemplateField>

                      <asp:TemplateField HeaderText="Date">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("Date") %>'></asp:Label>
                           
                            
                        </ItemTemplate>

                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="User Name">
                        <ItemTemplate>
                            <asp:Label ID="Usernamelabel" runat="server" Text='<%#Eval("UserName")%>' ></asp:Label>
                        </ItemTemplate>
                        
                    </asp:TemplateField>

                 

                     <asp:TemplateField HeaderText="Amount">
                        <ItemTemplate>
                            <asp:Label ID="amountlabel" runat="server" Text='<%#Eval("Amount")%>' ></asp:Label>
                        </ItemTemplate>

                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Transaction ID">
                        <ItemTemplate>
                            <asp:Label ID="tidlabel" runat="server" Text='<%#Eval("TransactionID")%>' ></asp:Label>
                        </ItemTemplate>

                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:Label ID="statuslabel" runat="server" Text='<%#Eval("Status")%>' ></asp:Label>
                        </ItemTemplate>

                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="Delivery Completed">
                        <ItemTemplate>
                            
                            <asp:CheckBox ID="CheckBox1" runat="server"  Text="Completed"/>
                           
                        </ItemTemplate>
                       
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText=" View Details">
                        <ItemTemplate>
                            
                            <asp:Button ID="Button2" runat="server" Text="View Details"  CommandName="view" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'/>
                           
                        </ItemTemplate>
                       
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
            <asp:Button ID="Button1" runat="server" Text="Update" CssClass="btn-cart" OnClick="Button1_Click"  />

            <br/>
            <asp:Label ID="LabelSccs" runat="server" Text="" ForeColor="Green"></asp:Label>
            <br />
            <asp:Label ID="Labelfail" runat="server" Text="" ForeColor="Red"></asp:Label>

        </div>
        </div>
        <div  id="popup" runat="server" class="popup">
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/Cancel.png" Height="20px" Width="40px" Style="text-align:right;" OnClientClick="popupclose();return false;"/>
            <div class="middle">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" ShowFooter="true" DataKeyNames="ordersid"
                
                 ShowHeaderWhenEmpty="true"  BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" ViewStateMode="Enabled">
                 <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
                 <Columns>
               

                     <asp:TemplateField HeaderText="MedID">
                        <ItemTemplate>
                            <asp:Label ID="medidabel" runat="server" Text='<%#Eval("MedID")%>' ></asp:Label>
                            
                        </ItemTemplate>
                        
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%#"data:image/jpg;base64,"+Convert.ToBase64String((byte[])Eval("Med_img"))%>'  Height="100px" Width="150px"/>
                        </ItemTemplate>
                        
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="Medicine Name">
                        <ItemTemplate>
                            <asp:Label ID="medicinenamelabel" runat="server" Text='<%#Eval("MedName")%>' ></asp:Label>
                        </ItemTemplate>

                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:Label ID="quantitylabel" runat="server" Text='<%# Convert.ToInt32( Eval("Quantity_pc"))+Convert.ToInt32( Eval("Quantity_strip"))%>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                      <asp:TemplateField HeaderText="Amount">
                        <ItemTemplate>
                            <asp:Label ID="amountlabel" runat="server" Text='<%#Eval("Amount")%>' ></asp:Label>
                        </ItemTemplate>

                    </asp:TemplateField>
                     </Columns>
            </asp:GridView>
                </div>
        </div>
        <script>


            function popupclose() {
                var pop = document.getElementById("popup");
                var nonpop = document.getElementById("nonpop");
                //var flag = document.getElementById("Label24");
                //flag.innerText = "1";
                pop.style.display = "none";
                nonpop.style.opacity = "1";

            }

        </script>
    </form>
     
   
     
</body>
</html>
