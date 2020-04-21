<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterDefault.aspx.cs" Inherits="HobHubFINAL.RegisterDefault" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .registerButton{
            border-radius : 12px;
        }
        .auto-style1 {
            width: 30%;
            height: 527px;
            background-color: #000066;
        }
        .auto-style2 {
            text-align: center;
            height: 258px;
            background-color: #000066;
            width: 318px;
        }
        .auto-style3 {
            text-align: center;
            background-color: #000066;
            width: 318px;
        }

        .auto-style4 {
            background-color: #000066;
        }
        .auto-style9 {
            height: 106px;
            text-align: center;
            width: 318px;
        }
        .auto-style10 {
            font-size: medium;
        }
        .auto-style12 {
            text-align: center;
            background-color: #000066;
            height: 45px;
            width: 318px;
        }
        .auto-style13 {
            text-align: center;
            height: 45px;
            width: 318px;
        }
        .auto-style14 {
            font-size: large;
        }
        .auto-style15 {
            border-radius : 12px;
            font-size: x-large;
        }
        .auto-style16 {
            width: 326px;
            margin-top: 71px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="auto-style16">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Image ID="imgLogo" runat="server" Height="266px" ImageUrl="~/Images/logo_transparent.png" Width="277px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Image ID="imgRegisterPage" runat="server" CssClass="auto-style4" Height="170px" ImageUrl="~/Images/RegisterPage.jpg" Width="318px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style13">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style13">
                        <asp:TextBox ID="txtUserName" runat="server" OnTextChanged="TextBox3_TextChanged" BackColor="#FFFFCC" ForeColor="Gray" CssClass="auto-style14" Height="27px" Width="215px">Username</asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style12">
                        <asp:TextBox ID="txtPassword" runat="server" BackColor="#FFFFCC" ForeColor="Gray" CssClass="auto-style14" Height="27px" Width="215px">Password</asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:Button ID="btnRegister" runat="server" Text="REGISTER" BackColor="#FF9900" BorderColor="#000066" BorderStyle="Ridge" CssClass="auto-style15" ForeColor="White" Height="64px" Width="202px" OnClick="btnRegister_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:HyperLink ID="hpAccount" runat="server" CssClass="auto-style10" ForeColor="#FF6600">I already have an account</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        &nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
