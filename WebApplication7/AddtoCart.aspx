<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddtoCart.aspx.cs" Inherits="WebApplication7.AddtoCart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" href="home1.css" />
    <link rel="stylesheet" href="home2.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css" />
    <script src="https://kit.fontawesome.com/01f22be397.js" crossorigin="anonymous"></script>

   <div class="icons" >
             <ul>
                 <li>
            <div id="Div1" class="fas fa-shopping-cart" >
                <ul class="sub-menu1">
                    <li class="active1"> <a href="Cart.aspx">Cart</a></li>
                    <li ><a href="orderHistoryUser.aspx">Order History</a></li>
                </ul>
                </div>
                </li>
                 <li >
            <a href="Profile.aspx"> <div id="Div2" class="far fa-user"> </div></a>
                </li>
                 <li>
                     <a href="login.aspx">
             <div id="Div3" class="fas fa-sign-out-alt" > </div></a>
                 </li>
            </ul>
        </div>
     <div class="menu-bar">
        <ul>
            <li ><a href="HomePage.aspx">Home</a></li>
            <li><a href="DisplayProduct.aspx">Medicines</a>
      
            </li>
            <li ><a href="displayMedDevice.aspx">Medical Devices</a>
                 
            </li>
            <li><a href="#">Online Doctors</a>
            </li>
            <li><a href="#">About Us</a></li>
        </ul>
    
    </div> 
    <style>
        table, th, td {
            border: none;
            border-collapse: collapse;
            
           
           
        }
    </style>
</head>
<body class="body1">
    <form id="form1" runat="server">
        <div class="table">
           
                    <table style="width: 80%; height:100%;">
                        <tr style="text-align:center;" >
                            <td colspan="3" rowspan="6">
                                <asp:Image ID="Image1" runat="server"  Height="250px" Width="300px" ImageUrl="" BorderStyle="Double" ImageAlign="Middle"/>
                            </td>
                            <td colspan="2">
                                <div class="alignment">
                                    <asp:Label ID="Label1" runat="server" Text="" Font-Bold="true" Font-Names="Arial" 
                       ForeColor="Red"  Font-Size="XX-Large"></asp:Label>
                                     <asp:Label ID="Label6" runat="server" Text="" Font-Bold="false" Font-Names="Arial" 
                       ForeColor="Black"  Font-Size="Medium"></asp:Label>
                                </div>
                                
                            </td>
                        </tr>
                       <tr>
                            <td style="text-align:left;vertical-align:bottom;" >
                                <asp:Label ID="Label2" runat="server" Text="1 pc" Font-Bold="true" Font-Names="Arial" 
                       ForeColor="Red" Height="30px" ></asp:Label>
                                <asp:Label ID="Label7" runat="server" Text="" Visible="false"></asp:Label>
                                
                            </td>
                            <td rowspan="2"> 
                                <asp:TextBox ID="TextBoxquantity_pc"  CssClass="textinput" runat="server" Height="50px" ></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align:left;vertical-align:top;" >
                                <asp:Label ID="Label3" runat="server" Text="" Font-Bold="false" Font-Names="Arial"  
                       ForeColor="Red" Height="30px" ></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align:left;vertical-align:bottom;" >
                                <asp:Label ID="Label4" runat="server" Text="1 Strip = 10 pc" Font-Bold="true" Font-Names="Arial" 
                       ForeColor="Red" Height="30px" ></asp:Label>
                              
                            </td>
                            <td rowspan="2" >
                                <asp:TextBox ID="TextBoxquantity_strip" runat="server"  CssClass="textinput" Height="50px" ></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td style="text-align:left;vertical-align:top;" >
                                 <asp:Label ID="Label5" runat="server" Text="" Font-Bold="false" Font-Names="Arial" 
                       ForeColor="Red" Height="30px" ></asp:Label>
                            </td>
                        </tr>
                        <tr >
                      
                            <td>
                                <asp:Button ID="Button1" CssClass="btn-cart" runat="server" Text="Buy More" OnClick="Button1_Click"  />
                            </td>
                            <td>
                                <asp:Button ID="Button2" CssClass="btn-cart" runat="server" Text="Add To Cart" OnClick="Button2_Click"  />
                            </td>
                        </tr>
                    </table>
                
        </div>
         
    </form>
</body>
</html>
