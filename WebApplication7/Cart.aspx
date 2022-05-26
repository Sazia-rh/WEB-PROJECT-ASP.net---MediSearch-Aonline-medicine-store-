<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="WebApplication7.Cart" %>

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
                 <li class="active1">
            <div id="Div1" class="fas fa-shopping-cart" >
                <ul class="sub-menu1">
                    <li class="active1"> <a href="Cart.aspx">Cart</a></li>
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
            <li><a href="DoctorView.aspx">Online Doctors</a>
            </li>
            <li><a href="aboutpage.aspx">About Us</a></li>
        </ul>
    
    </div> 
</head>
<body class="body1">
    <form id="form2" runat="server">
        <div class="nonpopup" id="nonpopup">
           
            <div class="label">
                <asp:Label ID="Label23" runat="server" Text="NO ITEM IN CART" Visible="false" Style="text-align: center; font-size: xx-large; font-weight: 800; color: red;"></asp:Label>
            </div>
            <div class="split1" id="split">
                <div class="left1" id="left" runat="server">
                    <div class="tag1">
                        <asp:Label ID="Label25" runat="server" Text="ITEMS"></asp:Label>
                    </div>
                    <div class="cart">
                        <asp:DataList ID="DataList1" runat="server" RepeatDirection="Vertical" DataSourceID="SqlDataSource1" DataKeyField="CartID" OnItemCommand="DataList1_ItemCommand">
                            <ItemTemplate>
                                <table style="width: 40%; height: 100%; margin-bottom: 30px; margin-top: 20px; margin-left: 30px; background-color: #588ed0;">
                                    <tr>
                                        <td colspan="5" style="text-align: right;">
                                           
                                            <asp:Button ID="Button7" runat="server" Text="X" Height="20px" Width="40px" CommandName="Deletee" />
                                        </td>
                                    </tr>

                                    <tr style="text-align: center; margin-left: 5px;">
                                        <td colspan="3" rowspan="5">
                                            <asp:Image ID="Image1" runat="server" Height="150px" Width="200px" ImageUrl='<%#"data:image/jpg;base64,"+Convert.ToBase64String((byte[])Eval("Med_img"))%>' BorderStyle="Double" ImageAlign="Middle" />
                                        </td>
                                        <td colspan="2" style="margin-bottom: 20px;">
                                            <div class="alignment">
                                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("MedName")%>' Font-Bold="true" Font-Names="Arial"
                                                    ForeColor="Red" Font-Size="XX-Large"></asp:Label>
                                                <asp:Label ID="Label6" runat="server" Text='<%#Eval("Type")%>' Font-Bold="false" Font-Names="Arial"
                                                    ForeColor="Black" Font-Size="Medium"></asp:Label>
                                            </div>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center; vertical-align: bottom;">
                                            <div class="alignment">
                                                <asp:Label ID="Label2" runat="server" Text="1 pc" Font-Bold="true" Font-Names="Arial"
                                                    ForeColor="Red"></asp:Label>
                                                <asp:Label ID="Label3" runat="server" Text='<%#"৳ "+ Eval("Price")%>' Font-Bold="false" Font-Names="Arial"
                                                    ForeColor="Red"></asp:Label>
                                            </div>
                                        </td>
                                        <td style="text-align: center;">
                                            <asp:TextBox ID="TextBoxquantity_pc" CssClass="textinput" Width="50px" BackColor="Transparent" runat="server" Text='<%#Eval("Quantity_pc") %>' Height="40px"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: center; vertical-align: bottom;">
                                            <div class="alignment">
                                                <asp:Label ID="Label4" runat="server" Text="1 Strip = 10 pc" Font-Bold="true" Font-Names="Arial"
                                                    ForeColor="Red"></asp:Label>
                                                <asp:Label ID="Label5" runat="server" Text='<%#"৳ "+ (Convert.ToInt32(Eval("Price"))*10) %>' Font-Bold="false" Font-Names="Arial"
                                                    ForeColor="Red"></asp:Label>
                                            </div>
                                        </td>
                                        <td style="text-align: center;">
                                            <asp:TextBox ID="TextBoxquantity_strip" runat="server" CssClass="textinput" Width="50px" BackColor="Transparent" Text='<%#Eval("Quantity_strip") %>' Height="40px"></asp:TextBox>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center; vertical-align: bottom;">
                                            <div class="alignment">
                                                <asp:Label ID="Label7" runat="server" Text="Total" Font-Bold="true" Font-Names="Arial"
                                                    ForeColor="Red"></asp:Label>
                                                <asp:Label ID="Label8" runat="server" Style="font-size: small" Text='<%#"1pcX" + Eval("Quantity_pc") + "(৳" + Eval("Price") + "X" + Eval("Quantity_pc") + ")=৳" +((Convert.ToInt32(Eval("Price"))*(Convert.ToInt32(Eval("Quantity_pc"))))) %>' Font-Bold="true" Font-Names="Arial"
                                                    ForeColor="Red"></asp:Label>
                                                <asp:Label ID="Label10" runat="server" Style="font-size: small" Font-Bold="true" Font-Names="Arial" Visible="false" Text='<%# Eval("Price")%>' ForeColor="Red"></asp:Label>
                                                <asp:Label ID="Label9" runat="server" Style="font-size: small" Text='<%#"1stripX"+Eval("Quantity_strip")+"(৳"+(Convert.ToInt32(Eval("Price"))*10)+"X"+ Eval("Quantity_strip")+")=৳"+( (Convert.ToInt32(Eval("Price"))*10)*(Convert.ToInt32(Eval("Quantity_strip")))) %>' Font-Bold="true" Font-Names="Arial"
                                                    ForeColor="Red"></asp:Label>
                                                <asp:Label ID="Label11" runat="server" Style="font-size: small" Font-Bold="true" Font-Names="Arial" Visible="false" Text='<%# Convert.ToInt32(Eval("Price"))*10 %>' ForeColor="Red"></asp:Label>
                                                <asp:Label ID="Label12" runat="server" Text='<%#Eval("CartID") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="Label13" runat="server" Text='<%#Eval("Quantity_pc") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="Label14" runat="server" Text='<%#Eval("Quantity_strip") %>' Visible="false"></asp:Label>
                                            </div>
                                        </td>
                                        <td style="text-align: center;">
                                            <asp:TextBox ID="TextBox1" CssClass="textinput" BackColor="Transparent" runat="server" Text='<%#( ((Convert.ToInt32(Eval("Price")))*(Convert.ToInt32(Eval("Quantity_pc")))) + ( (Convert.ToInt32(Eval("Price"))*10)*(Convert.ToInt32(Eval("Quantity_strip"))) ) )  %>' Height="40px"></asp:TextBox>

                                        </td>
                                    </tr>

                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <asp:Button ID="Button3" CssClass="btn-cart" runat="server" Text="Cancel" CommandName="Cancel" Visible="false" />
                                        </td>
                                        <td>
                                            <asp:Button ID="Button2" CssClass="btn-cart" runat="server" Text="Show Total" CommandName="Show" />
                                        </td>
                                        <td>
                                            <asp:Button ID="Button1" CssClass="btn-cart" runat="server" Text="Update" CommandName="Update" />
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                            ConnectionString="<%$ ConnectionStrings:UserRegistrationDB %>"
                            SelectCommand="SELECT  Cart.CartID, Cart.Date, Cart.userName, Cart.Quantity_pc,Cart.Quantity_strip, Medicine.MedName, Medicine.Type, Medicine.Price, Medicine.Med_img FROM Cart  JOIN Medicine ON Cart.MedID=Medicine.MedID  "
                            ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
                    </div>
                </div>
                <div class="right1" id="right" runat="server">
                    <div class="tag1">
                        <asp:Label ID="Label26" runat="server" Text="TOTAL AMOUNT"></asp:Label>
                    </div>

                    <div class="centered1">
                        <table style="width: 80%; height: 100%; margin-bottom: 30px; margin-top: 20px; margin-left: 20px;">
                            <tr>
                                <td colspan="2" style="text-align: center; font-size: large; font-weight: 600; color: red; margin-bottom: 10px;">
                                    <asp:Label ID="Label21" runat="server" Text="View Total Amount"></asp:Label>
                                </td>
                            </tr>
                            <tr class="tr">
                                <td>
                                    <asp:Label ID="Label15" runat="server" Text="Sub Total"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label16" runat="server" Text=""></asp:Label>

                                </td>
                            </tr>
                            <tr class="tr">
                                <td>
                                    <asp:Label ID="Label17" runat="server" Text="Delivery Fee"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label18" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="border-bottom-color: red; visibility: initial;"></td>
                            </tr>
                            <tr class="tr">
                                <td>
                                    <asp:Label ID="Label19" runat="server" Text="Total"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label20" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr class="tr">
                                <td>
                                    <asp:Button ID="Button4" runat="server" CssClass="btn-cart" Text="Buy More" />
                                </td>
                                <td>

                                    <asp:Button ID="Button5" CssClass="btn-cart" runat="server" Text="Check Out" OnClientClick="popupfunction();return false;" />



                                </td>
                            </tr>

                        </table>


                    </div>

                </div>

            </div>
        </div>
        <div class="popup" id="popUp" runat="server">
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/Cancel.png" Height="20px" Width="40px" Style="text-align: right;" OnClientClick="popupclose();return false;" />
            <div class="mypopup">
                <asp:Label ID="Label22" runat="server" Text="Enter Transaction Id" CssClass="input" Style="color: white;"></asp:Label>
                <br />
                <br />

                <asp:TextBox ID="TextBox2" runat="server" CssClass="input" Style="color: black;" EnableViewState="false"></asp:TextBox>
                <asp:Button ID="Button6" runat="server" Text="Order Confirm" class="btn-cart" OnClick="Button6_Click" />
                <asp:Label ID="Label24" runat="server" Text="Order Confirmed" CssClass="input" Style="color: white;" Visible="false"></asp:Label>


            </div>
        </div>

    </form>


    <script>
        function popupfunction() {
            var pop = document.getElementById("popUp");
            var nonpop = document.getElementById("nonpopup");
            pop.style.display = "block";
            nonpop.style.opacity = "0.2";


        }
        function popupclose() {
            var pop = document.getElementById("popUp");
            var nonpop = document.getElementById("nonpopup");
            var flag = document.getElementById("Label24");
            flag.innerText = "1";
            pop.style.display = "none";
            nonpop.style.opacity = "1";

        }

    </script>

</body>
</html>
