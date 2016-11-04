<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="temp.aspx.cs" Inherits="Hospital_management_system.temp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:TextBox ID="name" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:TextBox ID="password" runat="server"></asp:TextBox>
    
    </div>
        <asp:Button ID="btn" runat="server" OnClick="btn_Click" Text="Button" />
    </form>
</body>
</html>
