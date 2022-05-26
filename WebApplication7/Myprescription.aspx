<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Myprescription.aspx.cs" Inherits="WebApplication7.Myprescription" %>

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
            <li><a href="aboutpage">About Us</a></li>
        </ul>
    
    </div> 
</head>
<body class="body1">
    <form id="form1" runat="server">
        <div class="nonpopup" id="nonpopup" runat="server">
        <div class="split left">

            <div class="btngrp">
                <asp:Button ID="Btnshowprofile" runat="server" Text="Profile" CssClass="Button" OnClick="Btnshowprofile_Click"  />
                <asp:Button ID="BtnPrescription" runat="server" Text="My Prescription" CssClass="activebtn" OnClick="BtnPrescription_Click" />
                <asp:Button ID="BtnUpdateprofile" runat="server" Text="Update Profile" CssClass="Button" OnClick="BtnUpdateprofile_Click" />
                <asp:Button ID="Btncomplain" runat="server" Text="Submit Complain" CssClass="Button" OnClick="Btncomplain_Click" />
            </div>


        </div>

        <div class="split right">
            <div class="centered">
                <div class="tag">
                    <asp:Label ID="Label2" runat="server" Text="My Prescriptions"></asp:Label>
                </div>
           

                <div id="prescription" class="updateprofile">
                    <div class="middle">
                     <table>
                                <tr>
                                    <td style="text-align:center;">
                                        <asp:Image ID="Image2" runat="server" Height="200px" Width="250px" ImageUrl="~/Images/upload.png"  />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align:center;">
                                         <asp:FileUpload ID="FileUpload1" runat="server" onchange="showimagepreview(this)"/>
                                       
                                    </td>
                                </tr>
                                 <tr>
                                    <td style="text-align:center;">
                                        <asp:Label ID="Label6" runat="server" Text="Doctor "></asp:Label>
                                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                        </td>
                                </tr>
                                <tr>
                                    <td style="text-align:center">
                                    <asp:Button ID="Button3" runat="server" Text="Upload" CommandName="Add" Width="250px" OnClick="Button3_Click" CssClass="btn-cart" />
                                        </td>
                                </tr>
                            </table>
                </div>
                   
                    <asp:DataList ID="DataList2" runat="server" RepeatDirection="Horizontal"  RepeatColumns="3"  OnItemCommand="DataList2_ItemCommand" DataSourceID="SqlDataSource2" DataKeyField="PrescriptionID"   >
                       <ItemTemplate>
                           <table style="margin-bottom:20px; margin-top:20px;margin-left:10px;margin-right:10px;background-color:white;">
                               <tr>
                                   <td>
                                       <asp:Image ID="Image1" runat="server" Height="200px" Width="250px" ImageUrl='<%#"data:image/jpg;base64,"+Convert.ToBase64String((byte[])Eval("prescription_img"))%>' />
                                   </td>
                               </tr>
                               <tr>
                                   <td style="background-color:white;font-weight:700;">
                                       <asp:Label ID="Label1" runat="server" Text="Date: "></asp:Label>
                                       <asp:Label ID="Label3" runat="server" Text='<%#Eval("Date") %>'></asp:Label>
                                   </td>
                               </tr>
                               <tr>
                                   <td style="background-color:white;font-weight:700;">
                                       <asp:Label ID="Label4" runat="server" Text="Prescribed By: "></asp:Label>
                                       <asp:Label ID="Label5" runat="server" Text='<%#Eval("Doctor") %>'></asp:Label>
                                       <asp:Label ID="Label7" runat="server" Text='<%#Eval("PrescriptionID") %>' Visible="false"></asp:Label>
                                   </td>
                               </tr>
                               <tr>
                                   <td>
                                       <asp:Button ID="Button1" runat="server" Text="View"  CommandName="ViewDetails" Width="125px" Height="50px" BackColor="Red" ForeColor="White" Font-Bold="true" />
                                       <asp:Button ID="Button2" runat="server" Text="Delete"  CommandName="Delete" Width="125px" Height="50px" BackColor="Red" ForeColor="White" Font-Bold="true" />
                                   </td>
                               </tr>
                           </table>


                       </ItemTemplate>
                      
                    </asp:DataList>
                    

                </div>
                

            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server"
            ConnectionString="<%$ ConnectionStrings:UserRegistrationDB %>" 
            SelectCommand="select PrescriptionID, prescription_img ,Username ,Date ,Doctor from Prescription" ProviderName="System.Data.SqlClient" >
            
        </asp:SqlDataSource>
            </div>
        <div class="popup" id="popUp"  runat="server">
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/Cancel.png" Height="20px" Width="40px" Style="text-align:right;" OnClientClick="popupclose();return false;"/>
            <div class="mypopup" >
                <asp:Image ID="Image3" runat="server" ImageUrl=""  Height="400px" Width="400px" />
                <div>
                    <asp:Label ID="Label8" runat="server" Text="Date: " Font-Bold="true" Font-Size="X-Large" ForeColor="White" ></asp:Label>
                    <asp:Label ID="Label9" runat="server" Text="" Font-Bold="true" Font-Size="X-Large" ForeColor="White" ></asp:Label>
                </div>
                <div>
                    <asp:Label ID="Label10" runat="server" Text="Prescribed By: " Font-Bold="true" Font-Size="X-Large" ForeColor="White"></asp:Label>
                    <asp:Label ID="Label11" runat="server" Text="" Font-Bold="true" Font-Size="X-Large" ForeColor="White"></asp:Label>
                    <asp:Label ID="Label12" runat="server"  Font-Bold="true" Font-Size="X-Large" ForeColor="White"></asp:Label>
                </div>
                
               </div>
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
        function popupfunction() {
            var pop = document.getElementById("popUp");
            var nonpop = document.getElementById("nonpopup");
            pop.style.display = "block";
            nonpop.style.opacity = "0.2";


        }
        function popupclose() {
            var pop = document.getElementById("popUp");
            var nonpop = document.getElementById("nonpopup");
            //var flag = document.getElementById("Label24");
            //flag.innerText = "1";
            pop.style.display = "none";
            nonpop.style.opacity = "1";

        }

    </script>
      
</body>
</html>
