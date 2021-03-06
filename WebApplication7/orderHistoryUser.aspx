<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="orderHistoryUser.aspx.cs" Inherits="WebApplication7.orderHistoryUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" href="home1.css" />
    <link rel="stylesheet" href="home2.css" />
   
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css" />
    <script src="https://kit.fontawesome.com/01f22be397.js" crossorigin="anonymous"></script>
    
       <div class="title1">
     <div class="title">
    <asp:Label ID="Label4" runat="server" Text="MediSearch"></asp:Label>
        </div>
         <div class="icons" >
            
             <ul>
                 <li class="active1">
            <div id="Div1" class="fas fa-shopping-cart" >
                <ul class="sub-menu1">
                    <li> <a href="Cart.aspx">Cart</a></li>
                    <li class="active1"><a href="orderHistoryUser.aspx">Order History</a></li>
                </ul>
                </div>
                </li>
                 <li>
            <a href="Profile.aspx"> <div id="Div2" class="far fa-user"> </div></a>
                </li>
                 <li><a href="login.aspx">
             <div id="Div3" class="fas fa-sign-out-alt" > </div></a>
                 </li>
            </ul>
        </div>
        </div>
     <div class="menu-bar">
        <ul>
            <li ><a href="HomePage.aspx">Home</a></li>
            <li><a href="DisplayProduct.aspx">Medicines</a>
      
            </li>
            <li ><a href="displayMedDevice.aspx">Medical Devices</a>
                 
            </li>
            <li><a href="DoctorView.aspx">Online Doctors</a>
            </li>
            <li><a href="aboutpage.aspx">About Us</a></li>
        </ul>
    
    </div> 

</head>
<body class="body1">
    <form id="form2" runat="server">
        <div id="nonpop" runat="server">
        <div class="label">
            <asp:Label ID="labeltablename" runat="server" Text="Order History" ></asp:Label>
            
        </div>
        
      
        <div class="grid">
           

            <asp:GridView ID="ordergv" runat="server" AutoGenerateColumns="false" ShowFooter="true" DataKeyNames="ordersid" ShowHeaderWhenEmpty="true"
               
                 
                 BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" ViewStateMode="Enabled"  OnRowCommand="ordergv_RowCommand" OnRowDeleting="ordergv_RowDeleting">

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
                            
                             <asp:Label ID="Label2" runat="server" Text='<%#Eval("ordersid") %>' ></asp:Label>
                        </ItemTemplate>

                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="Order Date">
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

                    

                     <asp:TemplateField HeaderText="Delivery Date">
                        <ItemTemplate>
                            <asp:Label ID="deliverydatelabel" runat="server" Text='<%#Eval("CompleteDate")%>' ></asp:Label>

                        </ItemTemplate>
                      </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:Label ID="statuslabel" runat="server" Text='<%#"  "+Eval("Status")+"  "%>'  ForeColor= '<%#Eval("Status").ToString() == "Pending" ? System.Drawing.Color.Red : System.Drawing.Color.Green %> '></asp:Label>
                            
                        </ItemTemplate>
                    </asp:TemplateField>
            
                    <asp:TemplateField HeaderText=" View Details">
                        <ItemTemplate>
                            
                            <asp:Button ID="Button2" runat="server" Text="View"  CommandName="view" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'/>
                            <asp:Button ID="Button1" runat="server" Text="Delete"  CommandName="delete"/>
                           
                        </ItemTemplate>
                        </asp:TemplateField>

                </Columns>
            </asp:GridView>
            

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
        
    </form>
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
   
     
</body>
</html>