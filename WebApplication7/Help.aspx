<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Help.aspx.cs" Inherits="WebApplication7.Help" %>

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
            <li class="active"><a href="HomePage.aspx">Home</a></li>
            <li><a href="DisplayProduct.aspx">Medicines</a>
      
            </li>
            <li ><a href="displayMedDevice.aspx">Medical Devices</a>
                 
            </li>
            <li><a href="DoctorView.aspx">Online Doctors</a>
            </li>
            <li ><a href="aboutpage.aspx">About Us</a></li>
        </ul>
    
    </div> 

</head>
<body class="body1">
    <form id="form2" runat="server">
    <div class="middle">
        <p style="font-size:xx-large;font-weight:700; text-align:center;margin-top:10%;">
            Phone Number : +8809610-00-11-22
            <br />
            <br />
             Email : support@medisearch.com
        </p>
    
    </div>
    </form>
</body>
</html>
