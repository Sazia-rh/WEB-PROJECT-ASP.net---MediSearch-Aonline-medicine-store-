<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Doctors.aspx.cs" Inherits="WebApplication7.Doctors" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" href="home1.css" />
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
            <li class="active"><a href="Doctors.aspx">Doctors</a></li>
            <li ><a href="viewcoplaint.aspx">View Compliant</a></li>

        </ul>
          
    </div>
</head>
<body class="body2">
    <form id="form1" runat="server">
        
        <div class="label">
            <asp:Label ID="labeltablename" runat="server" Text="Doctors' List" ></asp:Label>
            
        </div>
        
      
        <div class="grid">
           

            <asp:GridView ID="gvMedicine" runat="server" AutoGenerateColumns="false" ShowFooter="true" DataKeyNames="Id" ShowHeaderWhenEmpty="true"
                OnRowCommand="gvMedicine_RowCommand" OnRowEditing="gvMedicine_RowEditing" 
                 OnRowCancelingEdit="gvMedicine_RowCancelingEdit" OnRowUpdating="gvMedicine_RowUpdating"
                 OnRowDeleting="gvMedicine_RowDeleting" OnRowDataBound="gvMedicine_RowDataBound"
                 BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" ViewStateMode="Enabled" >

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

                

                    <asp:TemplateField HeaderText="Doctor Name">
                        <ItemTemplate >
                            <asp:Label ID="medicinenamelabel" runat="server" Text='<%#Eval("Name")%>' Height="50px" Width="200px"  ></asp:Label>
                             <asp:Label ID="Label1" runat="server" Text='<%#Eval("Id")%>' visible="false"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxmedicinename" runat="server" Text='<%#Eval("Name")%>' ></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="TextBoxmedicinenamefooter" runat="server"  ></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="Specialist">
                        <ItemTemplate>
                            <asp:Label ID="pricelabel" runat="server" Text='<%#Eval("Specialist")%>' Height="50px" Width="200px"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxprice" runat="server" Text='<%#Eval("Specialist")%>' ></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="TextBoxpricefooter" runat="server"  ></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="Contact No">
                        <ItemTemplate>
                            <asp:Label ID="medicinetypelabel" runat="server" Text='<%#Eval("Contact")%>' Height="50px" Width="200px" ></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxmedicinetype" runat="server" Text='<%#Eval("Contact")%>' ></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="TextBoxmedicinetypefooter" runat="server"  ></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField >
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/edit.png" CommandName="Edit" ToolTip="Edit" width="40px" Height="40px"/>
                            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Images/delete.png" CommandName="Delete" ToolTip="Delete" width="40px" Height="40px"/>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/save.png" CommandName="Update" ToolTip="Update" width="40px" Height="40px"/>
                            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Images/Cancel.png" CommandName="Cancel" ToolTip="Cancel" width="40px" Height="40px"/>
                        </EditItemTemplate>
                        <FooterTemplate>
                             <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/Add.png" CommandName="Addnew" ToolTip="Add new" width="20px" Height="20px"/>
                          
                        </FooterTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>

            <br/>
            <asp:Label ID="LabelSccs" runat="server" Text="" ForeColor="Green"></asp:Label>
            <br />
            <asp:Label ID="Labelfail" runat="server" Text="" ForeColor="Red"></asp:Label>

        </div>
        
    </form>
     
   <script>
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