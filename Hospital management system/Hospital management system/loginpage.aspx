<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loginpage.aspx.cs" Inherits="Hospital_management_system.WebForm4" %>

<!DOCTYPE html>
<style type="text/css">
	body{
	 background-image: url("img/2.jpg");
	}
	</style>

<link href="login_admin.css" rel="stylesheet" type="text/css" />
 <script src="js/jquery.min.js"></script>
        <script src="js/index.js"></script>
 
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
   
<body>
    <form id="form1" runat="server">
    <div>
    
    <div class="login-form">
     <h1>Login</h1>
   
    <div class="error_msg" " >
        <asp:Label runat="server" style="color:red" ID="error_msg"></asp:Label>
<br />
    </div>
        <br />
                    
     <div class="form-group ">
         <asp:DropDownList ID="selection" CssClass="form-control"  Title="no item selected"  runat  ="server">
             <asp:ListItem>doctor</asp:ListItem>
             <asp:ListItem>Resepsenist</asp:ListItem>
             <asp:ListItem>admin</asp:ListItem>
             <asp:ListItem>staff</asp:ListItem>      
         </asp:DropDownList>
       <i class="fa fa-user"></i>
       <br />
         <br />
           <asp:TextBox CssClass="form-control"  runat="server" placeholder="username"  ID="username" required></asp:TextBox>
       
     </div>
     <div class="form-group log-status">
         
       <asp:TextBox CssClass="form-control"  runat="server" placeholder="Password"  ID="Password" required></asp:TextBox>
       <i class="fa fa-lock"></i>
     
     </div>
      <span class="alert">Invalid Credentials</span>
      <a class="link" href="#">Lost your password?</a>
     <asp:Button CssClass="log-btn" runat="server"  ID="submit_btn" Text="Log In"  OnClick="submit_btn_Click"></asp:Button>
   </div>

        <br />
    
    </div>

        
    </form>
</body></html>
