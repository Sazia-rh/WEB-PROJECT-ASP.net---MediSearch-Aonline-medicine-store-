<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="WebApplication7.Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" href="home1.css" />
    <link rel="stylesheet" href="Profile.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css" />
    <script src="https://kit.fontawesome.com/01f22be397.js" crossorigin="anonymous"></script>

    <style type="text/css">
        .Button {
        }
    </style>
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
                 <li class="active1">
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
    <form id="form1" runat="server">

        
        <div class="split left">

            <div class="btngrp">
                <asp:Button ID="Btnshowprofile" runat="server" Text="Profile" CssClass="activebtn" OnClick="Btnshowprofile_Click" />
                <asp:Button ID="BtnPrescription" runat="server" Text="My Prescription" CssClass="Button" OnClick="BtnPrescription_Click" />
                <asp:Button ID="BtnUpdateprofile" runat="server" Text="Update Profile" CssClass="Button" OnClick="BtnUpdateprofile_Click" />
                <asp:Button ID="Btncomplain" runat="server" Text="Submit Complain" CssClass="Button" OnClick="Btncomplain_Click" />
            </div>


        </div>

        <div class="split right">
            <div class="centered">
                <div class="tag">
                    <asp:Label ID="Label2" runat="server" Text="Profile"></asp:Label>
                </div>



                <div id="Myprofile" class="Myprofile">
                    <div class="img" id="imgpp">
                        <asp:Image ID="profilePicture" runat="server" CssClass="profileImage" Height ="240px" Width="290px" ImageUrl="" />
                    </div>
                    <div class="profile" id="profile">
                        <asp:Label ID="ProfileName" runat="server" Text="Name" CssClass="profile-fieldlabel"></asp:Label>
                    <asp:TextBox ID="ProfileNameText" runat="server" CssClass="profile-field"></asp:TextBox>
                    <asp:Label ID="profileContact" runat="server" Text="Contact" CssClass="profile-fieldlabel"></asp:Label>
                    <asp:TextBox ID="TextBoxContactProfile" runat="server" CssClass="profile-field"></asp:TextBox>
                    <asp:Label ID="ProfileEmail" runat="server" Text="Email" CssClass="profile-fieldlabel"></asp:Label>
                    <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="profile-field"></asp:TextBox>
                    <asp:Label ID="ProfileAddress" runat="server" Text="Adress" CssClass="profile-fieldlabel"></asp:Label>
                    <asp:TextBox ID="TextBoxAdress" runat="server" CssClass="profile-field"></asp:TextBox>

                    </div>

                    

                </div>
                

            </div>
        </div>
        <div>
        </div>

    </form>
</body>
</html>
