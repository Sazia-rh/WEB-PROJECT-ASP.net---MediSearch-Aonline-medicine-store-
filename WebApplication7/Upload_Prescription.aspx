<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Upload_Prescription.aspx.cs" Inherits="WebApplication7.Upload_Prescription" %>

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
     <div class="icons" >
             <ul>
                 <li>
            <div id="Div1" class="fas fa-shopping-cart" >
                <ul class="sub-menu1">
                    <li> <a href="Cart.aspx">Cart</a></li>
                    <li class="active"><a href="orderHistoryUser.aspx">Order History</a></li>
                </ul>
                </div>
                </li>
                 <li>
            <a href="Profile.aspx"> <div id="Div2" class="far fa-user"> </div></a>
                </li>
                 <li>
             <div id="Div3" class="fas fa-sign-out-alt" > </div>
                 </li>
            </ul>
        </div>
</head>
<body class="body1">
    <form id="form1" runat="server">

        <div class="menu-bar">
            <ul>
                <li class="active"><a href="HomePage.aspx">Home</a></li>
                <li><a href="#">Medicines</a>
                    <div class="sub-menu1">
                        <ul>
                            <li><a href="#">OTC</a></li>
                            <li><a href="#">Prescription Medicines</a></li>
                            <li><a href="#">Rehabilitation Aids</a></li>
                            <li><a href="#">All Medicines</a></li>

                        </ul>
                    </div>

                </li>
                <li><a href="#">Medical Devices</a>
                    <div class="sub-menu1">
                        <link href="home1.css" rel="stylesheet" />
                        <ul>
                            <li><a href="#">Blood Pressure Kit</a></li>
                            <li><a href="#">Glucosemeter</a></li>
                            <li><a href="#">Oximeter</a></li>
                            <li><a href="#">Thermometer</a></li>
                            <li><a href="#">Weight Scale</a></li>
                        </ul>
                    </div>
                </li>
                <li><a href="#">Online Doctors</a>
                    <div class="sub-menu1">
                        <ul>
                            <li><a href="#">Dermatologists</a></li>
                            <li><a href="#">Emergency Medicine Specialists</a></li>
                            <li><a href="#">Family Physicians</a></li>
                            <li><a href="#">Endrocrinologists</a></li>
                            <li><a href="#">Gastroenterologists</a></li>

                        </ul>
                    </div>
                </li>
                <li><a href="#">About Us</a></li>
            </ul>

        </div>
        <div class="split left">

            <div class="btngrp">
                <asp:Button ID="Btnshowprofile" runat="server" Text="Profile" CssClass="Button" OnClick="Btnshowprofile_Click" />
                <asp:Button ID="BtnPrescription" runat="server" Text="My Prescription" CssClass="Button" />
                <asp:Button ID="BtnUpdateprofile" runat="server" Text="Update Profile" CssClass="Button" OnClick="BtnUpdateprofile_Click" />
                <asp:Button ID="Btncomplain" runat="server" Text="Submit Complain" CssClass="Button" />
            </div>


        </div>

        <div class="split right">
            <div class="centered">
                <div class="tag">
                    <asp:Label ID="Label2" runat="server" Text="Prescriptions"></asp:Label>
                </div>



                <div id="prescription" class="prescription">
                    <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" RepeatColumns="4" ShowFooter="true">
                       <ItemTemplate>
                           <table>
                               <tr>
                                   <td>
                                       <asp:Image ID="Image1" runat="server" Height="200px" Width="250px" ImageUrl='<%#"data:image/jpg;base64,"+Convert.ToBase64String((byte[])Eval("prescription_img"))%>' />
                                   </td>
                               </tr>
                               <tr>
                                   <td>
                                       <asp:Label ID="Label1" runat="server" Text="Date: "></asp:Label>
                                       <asp:Label ID="Label3" runat="server" Text='<%#Eval("Date") %>'></asp:Label>
                                   </td>
                               </tr>
                               <tr>
                                   <td>
                                       <asp:Label ID="Label4" runat="server" Text="Doctor: "></asp:Label>
                                       <asp:Label ID="Label5" runat="server" Text='<%#Eval("Doctor") %>'></asp:Label>
                                       <asp:Label ID="Label7" runat="server" Text='<%#Eval("PrescriptionID") %>' Visible="false"></asp:Label>
                                   </td>
                               </tr>
                               <tr>
                                   <td>
                                       <asp:Button ID="Button1" runat="server" Text="View" />
                                       <asp:Button ID="Button2" runat="server" Text="Delete" />
                                   </td>
                               </tr>
                           </table>

                       </ItemTemplate>
                        <FooterTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Image ID="Image2" runat="server" Height="200px" Width="250px"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                         <asp:FileUpload ID="FileUpload1" runat="server" />
                                       
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    <asp:Button ID="Button3" runat="server" Text="Upload" />
                                        </td>
                                </tr>
                            </table>
                           
                        </FooterTemplate>


                    </asp:DataList>
                    

                </div>
                

            </div>
        </div>
        <div>
        </div>

    </form>
</body>
</html>
