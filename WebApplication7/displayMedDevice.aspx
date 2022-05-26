<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="displayMedDevice.aspx.cs" Inherits="WebApplication7.displayMedDevice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" href="home1.css" />
    <link rel="stylesheet" href="style2.css" />
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
            <li ><a href="DisplayProduct.aspx">Medicines</a>
      
            </li>
            <li class="active"><a href="displayMedDevice.aspx">Medical Devices</a>
                 
            </li>
            <li><a href="DoctorView.aspx">Online Doctors</a>
            </li>
            <li><a href="aboutpage.aspx">About Us</a></li>
        </ul>
    
    </div> 
</head>
<body class="body1">

    <form id="form1" runat="server">
        <div class="search"> 
         
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" style="text-align:center;"></asp:DropDownList>
        <asp:TextBox ID="TextBox2" runat="server"  Height="21px" Width="174px" style="text-align:center;"></asp:TextBox>
            <asp:ImageButton ID="ImageButton1" runat="server"  ImageUrl="~/images/search.png"  Height="21px" Width="20px" OnClick="ImageButton1_Click" />
            </div>
        <div class="tag1">
               <asp:Label ID="Label6" runat="server" Text="" Style="margin-top:10px;"></asp:Label>
           </div>
        
       <div class="displayview1" id="display" runat="server">
           
   <asp:DataList ID="DataList1" class="displayview" runat="server" DataKeyField="MedID" DataSourceID="SqlDataSource1"
       OnItemCommand="DataList1_ItemCommand" OnItemDataBound="DataList1_ItemDataBound"
       Height="250px" Width="300px"  RepeatDirection="Horizontal" RepeatColumns="4">
       <ItemTemplate>
           <table Style="margin-left:20px;margin-right:20px;margin-bottom:20px;" >
               <tr>
                   <td style="text-align:center; background-color:#fff">
                       <asp:Label ID="Label1" runat="server" Text = '<%# Eval("MedName")%>' Font-Bold="true"
                      Font-Names="Open Sans Extrabold" ForeColor="Red" Height="30px" Font-Size="XX-Large"></asp:Label>
                   </td>
               </tr>
               <tr>
                   <td style="text-align:center; background-color:white" >
                       <div class="img">
                       <asp:Image ID="Image1" runat="server" CssClass="All" Height="200px" Width="250px" ImageUrl='<%#"data:image/jpg;base64,"+Convert.ToBase64String((byte[])Eval("Med_img"))%>' BorderColor="#000000" BorderWidth="1px"/>
                           </div>
                       <div class="all">
                           &nbsp;Stock:&nbsp;
                           <asp:Label ID="Label2" runat="server" Text='<%#Eval("Med_Quantity")%>'
                               BackColor='<%# (int)Eval("Med_Quantity") < 4 ? System.Drawing.Color.Red : System.Drawing.Color.Green %>' ForeColor="White" Font-Bold="false" ></asp:Label>
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       </div>  
                       <asp:Label ID="Label3" runat="server" Text='<%# Eval("MedID")%>' Visible="false"></asp:Label>
                   </td>
               </tr>
               <tr>
                   <td style="text-align:center; background-color: #fff">
                       <asp:Label ID="Label4" runat="server" Text="Price:" Font-Bold="true" Font-Names="Arial" Style="text-align:center" 
                       ForeColor="Red" Height="30px" Font-Size="XX-Large"></asp:Label>
                       <asp:Label ID="Label5" runat="server" Text='<%#Eval("Price") %>'  Font-Bold="true" Font-Names="Arial" Style="text-align:center" 
                       ForeColor="Red" Height="30px" Font-Size="XX-Large"></asp:Label>
                   </td>
               </tr>
               <tr>
                   <td>
                       <asp:Button ID="Button1" runat="server" Text="Add To Cart" Height="50px" Width="260px" CssClass="btn-cart" CommandArgument='<%#Eval("MedID") %>' CommandName="AddToCart"  />
                       <asp:Label ID="Label7" runat="server" Text="Stock Out" CssClass="btn-cart" Visible="false" Height="50px" Width="260px"></asp:Label>
                   </td>
               </tr>
           </table>
       </ItemTemplate>

   </asp:DataList>
           </div>




        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:UserRegistrationDB %>" 
            SelectCommand="select MedID, MedCID,MedName,Price, Type,Med_img,Med_Quantity from Medicine" ProviderName="System.Data.SqlClient" >
        </asp:SqlDataSource>

    </form>
</body>
</html>