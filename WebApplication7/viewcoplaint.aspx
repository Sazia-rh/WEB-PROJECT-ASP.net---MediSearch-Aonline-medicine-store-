<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewcoplaint.aspx.cs" Inherits="WebApplication7.viewcoplaint" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" href="home1.css" />
    <link rel="stylesheet" href="Profile.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css" />
    <script src="https://kit.fontawesome.com/01f22be397.js" crossorigin="anonymous"></script>
     <div class="title1">
        <div class="title">
            <asp:Label runat="server" Text="MediSearch"></asp:Label>
        </div>
      <div class="icons" >
            <a href="login.aspx"><div id="Div3" class="fas fa-sign-out-alt" > </div></a>
          </div>
        </div>
    <div class="menu-bar">
        <ul>
           
            
            <li ><a href="Admin.aspx">Update Stock</a> </li>
           
            <li ><a href="Order.aspx">View Order</a>
            </li>
            <li><a href="orderHistory.aspx">Order History</a></li>
            <li><a href="Doctors.aspx">Doctors</a></li>
            <li class="active"><a href="viewcoplaint.aspx">View Compliant</a></li>

        </ul>
          
    </div>
</head>
<body class="body2">
    <form id="form1" runat="server">
        <div id="nonpop" runat="server">
        <div class="label">
            <asp:Label ID="labeltablename" runat="server" Text="Complaints" ></asp:Label>
            
        </div>
        
      
        <div class="grid">
           

            <asp:GridView ID="datalist1" runat="server" AutoGenerateColumns="false" ShowFooter="true" DataKeyNames="id" ShowHeaderWhenEmpty="true"
               
                 
                 BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" ViewStateMode="Enabled" OnRowCommand="datalist1_RowCommand" OnRowDeleting="datalist1_RowDeleting" >

                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
                <Columns>

                      <asp:TemplateField HeaderText="Date">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("Date") %>'></asp:Label>
                             <asp:Label ID="Labelid" runat="server" Text='<%#Eval("id") %>' Visible="false"></asp:Label>
                        </ItemTemplate>

                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="User Name">
                        <ItemTemplate>
                            <asp:Label ID="Usernamelabel" runat="server" Text='<%#Eval("UserName")%>' ></asp:Label>
                        </ItemTemplate>
                        
                    </asp:TemplateField>
                    
                     <asp:TemplateField HeaderText="About">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%#Eval("About")%>' ></asp:Label>
                            <asp:Label ID="Label3" runat="server" Text='<%#Eval("Complaints")%>' Visible="false"  ></asp:Label>
                        </ItemTemplate>
                        
                    </asp:TemplateField>


                     <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:Button ID="Button2" runat="server" Text="View"  width="60px" Height="40px" CommandName="Viewdetails"/>
                            <asp:Button ID="Button3" runat="server" Text="Delete" width="60px" Height="40px" CommandName="Delete" ToolTip="Delete"/>
                           
                        </ItemTemplate>
                       
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
           

            

        </div>
            </div>
        <div class="popup" id="popup" runat="server">
            <div class="middle">
             <table>
                                <tr>
                                    <td style="text-align:right">
                                         <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/Cancel.png" Height="20px" Width="40px" Style="text-align:right;" OnClientClick="popupclose();return false;"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align:center;">
                                        <asp:Label ID="Label1" runat="server" Text="About" Font-Bold="true" Font-Size="X-Large" ForeColor="Black"></asp:Label>
                                        <asp:TextBox ID="TextBox2" runat="server" Text="" Font-Bold="true"></asp:TextBox>
                                    </td>
                                </tr>
                             <tr>
                                 <td>
                                     <br />
                                 </td>
                             </tr>
                                 <tr>
                                    <td style="text-align:center;">
                                        <asp:Label ID="Label6" runat="server" Text="Description"  Font-Bold="true" Font-Size="X-Large" ForeColor="Black"></asp:Label>
                                        
                                        </td>
                                </tr>
                             <tr>
                                 <td style="text-align:center;">
                                     <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Height="300px" Width="500px" Text="" Font-Bold="true"></asp:TextBox>
                                 </td>
                             </tr>
                                
                            </table>
                </div>

        </div>
        <script>


            function popupclose() {
                var pop = document.getElementById("popup");
                var non = document.getElementById("nonpop");
                //var flag = document.getElementById("Label24");
                //flag.innerText = "1";
                pop.style.display = "none";
                non.style.opacity = "1";

            }

        </script>
    </form>
     
   
     
</body>
</html>
