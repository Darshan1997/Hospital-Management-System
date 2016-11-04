<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ava_appointment.aspx.cs" Inherits="Hospital_management_system.ava_appointment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

           <asp:Label ID="errormsg" runat="server"></asp:Label>

        <table>
            <tr>
                <td>
                    <asp:Label ID="docname" runat="server" Text="Doctor name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="dname" runat="server" ReadOnly="true"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="deplabel" runat="server" Text="Department name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="depname" runat="server" ReadOnly="true"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="pnamelabel" runat="server" Text="patientname"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="pname" runat="server" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="contactno" runat="server" Text="Contactno"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="conno" runat="server" TextMode="Phone"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="email_label" runat="server" Text="patient email"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="email" runat="server" TextMode="Email"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="pdatelabel" runat="server"   Text="date"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="date" runat="server" TextMode="Date"></asp:TextBox>     
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="timelabel" runat="server" Text="Time"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="time" runat="server" >
                        <asp:ListItem>9:00pm</asp:ListItem>
                        <asp:ListItem>10:00pm</asp:ListItem>
                        <asp:ListItem>5:00pm</asp:ListItem>
                        <asp:ListItem>6:00pm</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>

        <asp:Button ID="submit_btn" runat="server" OnClick="submit_btn_Click" Text="Book Appointment" />
    
    </div>
    </form>
</body>
</html>
