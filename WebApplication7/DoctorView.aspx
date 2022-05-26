<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoctorView.aspx.cs" Inherits="WebApplication7.DoctorView" %>

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
                 <li>
            <div id="Div1" class="fas fa-shopping-cart" >
                <ul class="sub-menu1">
                    <li> <a href="Cart.aspx">Cart</a></li>
                    <li ><a href="orderHistoryUser.aspx">Order History</a></li>
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
             <li class="active"><a href="DoctorView.aspx">Online Doctors</a>
            </li>
            <li ><a href="aboutpage.aspx">About Us</a></li>
        </ul>
    
    </div> 

</head>
<body class="body1">
    <form id="form2" runat="server">
        <div id="nonpop" runat="server">
        <div class="label">
            <asp:Label ID="labeltablename" runat="server" Text="Doctors List" ></asp:Label>
            
        </div>
        
      
        <div class="grid">
           

            <asp:GridView ID="ordergv" runat="server" AutoGenerateColumns="false" ShowFooter="true" DataKeyNames="Id" ShowHeaderWhenEmpty="true"
               
                 
                 BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" ViewStateMode="Enabled"  >

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

                   

                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label ID="Usernamelabel" runat="server" Text='<%#Eval("Name")%>' Height="50px" Width="200px"></asp:Label>
                        </ItemTemplate>
                        
                    </asp:TemplateField>

                  

                     <asp:TemplateField HeaderText="Specialist">
                        <ItemTemplate>
                            <asp:Label ID="amountlabel" runat="server" Text='<%#Eval("Specialist")%>' Height="50px" Width="200px"></asp:Label>
                        </ItemTemplate>

                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Contact">
                        <ItemTemplate>
                            <asp:Label ID="tidlabel" runat="server" Text='<%#Eval("Contact")%>' Height="50px" Width="200px"></asp:Label>
                        </ItemTemplate>

                    </asp:TemplateField>

                    

                </Columns>
            </asp:GridView>
            

            </div>
        </div>
        
    </form>
     
</body>
</html>

