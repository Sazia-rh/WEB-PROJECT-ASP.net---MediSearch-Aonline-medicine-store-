﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="WebApplication7.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
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
            <li ><a href="DisplayProduct.aspx">Medicines</a>
      
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
    <form id="form1" runat="server">
      
        <div class="options">
        <div class="options_item">
          <asp:Label ID="Label1" runat="server" Text="Upload Prescription"></asp:Label>
            <asp:Image ID="Image1" runat="server" src="prescription.jpg"  CssClass="img_option"/>
            <asp:Button ID="Button1" runat="server" Text="Upload" CssClass="btn_option" OnClick="Button1_Click" />
            </div>

        
            <div class="options_item">
                <asp:Label ID="Label2" runat="server" Text="Doctor's Appointment"></asp:Label>
            <asp:Image ID="Image2" runat="server" src="doctor_appointment.jpg" CssClass="img_option" />
            <asp:Button ID="Button2" runat="server" Text="Book Now" CssClass="btn_option" OnClick="Button2_Click" />
                </div>
           
            <div class="options_item">
                <asp:Label ID="Label3" runat="server" Text="Helpline"></asp:Label>
            <asp:Image ID="Image3" runat="server" src="helpline.jpg" CssClass="img_option" />
            <asp:Button ID="Button3" runat="server" Text="Call Now" CssClass="btn_option" OnClick="Button3_Click"/>

            </div>
                </div>
    </form>
</body>
</html>

