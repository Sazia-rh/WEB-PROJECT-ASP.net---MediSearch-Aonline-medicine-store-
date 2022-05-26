<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication7.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link rel="stylesheet" href="register_style.css" />
    
</head>
<body>
    <form id="form1" runat="server">
    <div class="hero">
      <div class="form-box">
          <div class="title">
          <asp:Label ID="Label1" runat="server" Text="MediSearch"></asp:Label>
              </div>
          <div class="button-box">
              <div id="btn"> </div>
              <asp:Button ID="Buttonlogin" runat="server" Text="Login" CssClass="toggle-btn" OnClientClick="login();return false;" />
              <asp:Button ID="Buttonregister" runat="server" Text="Register" CssClass="toggle-btn" OnClientClick="register();return false;" />
          </div>
           <div class="input-group" id="login">
              <asp:TextBox ID="TextUserNamelogin" runat="server" placeholder="User Name" CssClass="input-field" ></asp:TextBox>
              <asp:TextBox ID="TextPasswordlogin" runat="server" TextMode ="Password" placeholder="Password" CssClass="input-field"></asp:TextBox>
              <br/>
              <br/>
             
              <asp:CheckBox ID="CheckBox1" runat="server" Text="Remember Me" Style="font-weight:300;text-align:center;margin-left:35%;"/>
              <br/>
              
              <br/>
              
              <asp:Button ID="Btnlogin" runat="server" Text="Login" class="submit-btn"  OnClick="Btnlogin_Click" />
               <asp:Label ID="LabelErrormessagelogin" runat="server" Text="Incorrect user credentials" ForeColor="Red"/>
               <asp:Label ID="Label2" runat="server" Text="" ForeColor="Red"/>

          </div>
          <div class="input-group" id="register">
              
               <asp:HiddenField ID="Hiddenuserid" runat="server" />
                    <asp:TextBox ID="TxtFirstname" runat="server" placeholder="First Name  *" CssClass="input-field" />
                   

                    <asp:TextBox ID="txtLastname" runat="server" placeholder="Last Name  *" CssClass="input-field" />
                   
               
                    <asp:TextBox ID="Txtemail" runat="server" TextMode="Email" placeholder="Email  *" CssClass="input-field"/>
                   
            
                    <asp:TextBox ID="Txtcontact" runat="server" TextMode="Phone" placeholder="Contact No  *" CssClass="input-field"/>
                  

                   <asp:DropDownList ID="DropDownListGender" runat="server" CssClass="input-field">
                       <asp:ListItem>Gender</asp:ListItem>
                       <asp:ListItem>Male</asp:ListItem>
                       <asp:ListItem>Female</asp:ListItem>
                       <asp:ListItem>Others</asp:ListItem>
                   </asp:DropDownList>

                    <asp:TextBox ID="Textaddress" runat="server" TextMode="MultiLine" placeholder="Address" CssClass="input-field" />
              
                    <asp:TextBox ID="Textusername" runat="server" placeholder="User Name  *" CssClass="input-field"/>
                   
              
                    <asp:TextBox ID="Textpassword" runat="server" TextMode="Password" placeholder="Password   *" CssClass="input-field"/>
                   
           
                    <asp:TextBox ID="Textconfirmedpassword" runat="server" TextMode="Password" placeholder="Confirm Password" CssClass="input-field" />
            
                  <asp:Button ID="Buttonsubmit"  runat="server" Text="Submit" CssClass="submit-btn" OnClick="Buttonsubmit_Click" />
                <asp:Label ID="Labelsuccessmssg" runat="server" Text="" ForeColor="Green"/>
                  <asp:Label ID="Labelerroemssg" runat="server" Text="" ForeColor="Red"/>
 
          </div>
      </div>
    </div>
    </form>
     <script>
         var x = document.getElementById("login");
         var y = document.getElementById("register");
         var z = document.getElementById("btn");
         var s = document.getElementById("Label2");
         x.style.left = "50px";
         y.style.left = "450px";
         z.style.left = "0";
         function login() {
             x.style.left = "50px";
             y.style.left = "450px";
             z.style.left = "0";
             s.innerHTML = "";
         }
         function register() {
             x.style.left = "-400px";
             y.style.left = "50px";
             z.style.left = "110px";
         }

    </script>
   
</body>
</html>