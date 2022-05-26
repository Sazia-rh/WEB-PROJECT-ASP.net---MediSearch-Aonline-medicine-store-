<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="complaint.aspx.cs" Inherits="WebApplication7.complaint" %>

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
                <asp:Button ID="Btnshowprofile" runat="server" Text="Profile" CssClass="Button" OnClick="Btnshowprofile_Click" />
                <asp:Button ID="BtnPrescription" runat="server" Text="My Prescription" CssClass="Button" OnClick="BtnPrescription_Click" />
                <asp:Button ID="BtnUpdateprofile" runat="server" Text="Update Profile" CssClass="Button" OnClick="BtnUpdateprofile_Click" />
                <asp:Button ID="Btncomplain" runat="server" Text="Submit Complain" CssClass="activebtn" OnClick="Btncomplain_Click" />
            </div>


        </div>

        <div class="split right">
            <div class="centered">
                <div class="tag">
                    <asp:Label ID="Label2" runat="server" Text="Complaints"></asp:Label>
                </div>



                <div id="Myprofile" class="Myprofile">
                    
                    <div class="profile" id="profile">
                        <div class="middle">
                         <table>
                                
                                <tr>
                                    <td style="text-align:center;">
                                        <asp:Label ID="Label1" runat="server" Text="About" CssClass="profile-fieldlabel"></asp:Label>
                                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                             <tr>
                                 <td>
                                     <br />
                                 </td>
                             </tr>
                                 <tr>
                                    <td style="text-align:center;">
                                        <asp:Label ID="Label6" runat="server" Text="Description"  CssClass="profile-fieldlabel"></asp:Label>
                                        
                                        </td>
                                </tr>
                             <tr>
                                 <td style="text-align:center;">
                                     <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Height="300px" Width="500px"></asp:TextBox>
                                 </td>
                             </tr>
                                <tr>
                                    <td style="text-align:center">
                                    <asp:Button ID="Button3" runat="server" Text="Submit" CommandName="Add" Width="250px" CssClass="btn-cart" OnClick="Button3_Click" />

                                        </td>
                                </tr>
                             <tr>
                                    <td style="text-align:center;">
                                        <asp:Label ID="Label3" runat="server" Text="Successfully Submitted"  CssClass="profile-fieldlabel" Visible="false"></asp:Label>
                                        
                                        </td>
                                </tr>
                            </table>
                            </div>
                </div>

                    </div>

                    

                </div>
                

            </div>
        </div>
        <div>
        </div>

    </form>
</body>
</html>