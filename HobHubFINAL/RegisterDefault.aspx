<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterDefault.aspx.cs" Inherits="HobHubFINAL.RegisterDefault" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 43%;
            height: 527px;
            background-color: #000066;
        }
        .auto-style2 {
            text-align: center;
            height: 258px;
            background-color: #000066;
        }
        .auto-style3 {
            text-align: center;
            background-color: #000066;
        }

        .auto-style4 {
            background-color: #000066;
        }
        .auto-style7 {
            text-align: center;
            height: 33px;

        }
        .auto-style8 {
            text-align: center;
            height: 37px;
        }
        .auto-style9 {
            height: 98px;
            text-align: center;
        }
        .auto-style10 {
            font-size: small;
        }
        .auto-style11 {
            text-align: center;
            height: 36px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Image ID="imgLogo" runat="server" Height="218px" ImageUrl="~/Images/HobHubLogo.jpeg" Width="208px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Image ID="imgRegisterPage" runat="server" CssClass="auto-style4" Height="170px" ImageUrl="~/Images/RegisterPage.jpg" Width="300px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">
                        <asp:TextBox ID="txtFirstName" runat="server">First name</asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <asp:TextBox ID="txtLastName" runat="server">Last name</asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11">
                        <asp:TextBox ID="txtUserName" runat="server" OnTextChanged="TextBox3_TextChanged">Username</asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtPassword" runat="server">Password</asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:Button ID="btnRegister" runat="server" Text="REGISTER" BackColor="#FF6600" ForeColor="Black" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:HyperLink ID="hpAccount" runat="server" CssClass="auto-style10" ForeColor="#FF6600">I already have an account</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
