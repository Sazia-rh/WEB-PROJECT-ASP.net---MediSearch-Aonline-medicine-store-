<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="WebApplication7.Update" %>

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
        .profileImage {}
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
                <asp:Button ID="BtnUpdateprofile" runat="server" Text="Update Profile" CssClass="activebtn" OnClick="BtnUpdateprofile_Click" />
                <asp:Button ID="Btncomplain" runat="server" Text="Submit Complain" CssClass="Button" OnClick="Btncomplain_Click" />
            </div>


        </div>

        <div class="split right">
            <div class="centered">
                <div class="tag">
                    <asp:Label ID="Label2" runat="server" Text="Update Profile"></asp:Label>
                </div>

                <div id="updateProfile" class="updateprofile">

                    <div class="img" id="img">
                        <asp:Image ID="Image1" runat="server" CssClass="profileImage"  alt="" Height ="240px" Width="290px" ImageUrl=""  />   
 
                    </div>
                    <div class="Update" id="Update">
                        <asp:FileUpload ID="FileUploadpp" runat="server" onchange="showimagepreview(this)" />
                       

                        <br />
                        <br/>

                        <asp:Label ID="Labelfname" runat="server" Text="First Name " CssClass="profile-fieldlabel"></asp:Label>
                        <asp:TextBox ID="TxtFirstnameUpdate" runat="server" CssClass="input-field" />

                        <asp:Label ID="Labellname" runat="server" Text="Last Name" CssClass="profile-fieldlabel"></asp:Label>
                        <asp:TextBox ID="TxtLastnameUpdate" runat="server"  CssClass="input-field" />

                        <asp:Label ID="Labelemail" runat="server" Text="Email" CssClass="profile-fieldlabel"></asp:Label>
                        <asp:TextBox ID="TxtemailUpdate" runat="server" TextMode="Email"  CssClass="input-field" />

                        <asp:Label ID="Labelcontact" runat="server" Text="Contact No" CssClass="profile-fieldlabel"></asp:Label>
                        <asp:TextBox ID="TxtcontactUpdate" runat="server" TextMode="Phone"  CssClass="input-field" />

                        <asp:Label ID="Labelgender" runat="server" Text="Gender" CssClass="profile-fieldlabel"></asp:Label>
                        <asp:DropDownList ID="DropDownListGenderUpdate" runat="server" CssClass="input-field">
                            <asp:ListItem>Gender</asp:ListItem>
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                            <asp:ListItem>Others</asp:ListItem>
                        </asp:DropDownList>

                        <asp:Label ID="Labeladdress" runat="server" Text="Address" CssClass="profile-fieldlabel"></asp:Label>
                        <asp:TextBox ID="TextaddressUpdate" runat="server" TextMode="MultiLine"  CssClass="input-field" />

                        <asp:Button ID="ButtonUpdate" runat="server" Text="Update" CssClass="btn-cart" OnClick="ButtonUpdate_Click"  />
                        <asp:Label ID="LabelUpdate" runat="server" Text="" ForeColor="Green"></asp:Label>
                        <br />
                        <br />

                        <asp:Label ID="LabelnewPassword" runat="server" Text="New Password" CssClass="profile-fieldlabel"></asp:Label>
                        <asp:TextBox ID="TextpasswordUpdate" runat="server" TextMode="Password"  CssClass="input-field" />

                        <asp:Label ID="Labelnewpasscomnfirm" runat="server" Text="Confirm New Password" CssClass="profile-fieldlabel"></asp:Label>
                        <asp:TextBox ID="TextconfirmedpasswordUpdate" runat="server" TextMode="Password" CssClass="input-field" />
                        <asp:Button ID="ButtonUpdatePass" runat="server" Text="Change Password" CssClass="btn-cart" OnClick="ButtonUpdatePass_Click"  />
                        <asp:Label ID="Labelpassupdatesucess" runat="server" Text="" ForeColor="Green"></asp:Label>
                        <asp:Label ID="Labelpassupdatefailed" runat="server" Text="" ForeColor="Red"></asp:Label>

                        
                    </div>

                </div>

            </div>
        </div>
        <div>
        </div>

    </form>
    <script type="text/javascript">

        function showimagepreview(input) {

            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {

                    document.getElementsByTagName("img")[0].setAttribute("src", e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

    </script>  
    
</body>
</html>

