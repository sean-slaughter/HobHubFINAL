﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginDefault.aspx.cs" Inherits="HobHubFINAL.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
    
        .auto-style1 {
            width: 30%;
            background-color: #000066
        }
        .auto-style2 {
            text-align: center;
            height: 251px;
            background-color: #000066
        }
        .auto-style3 {
            text-align: center;
            background-color: #000066
        }
        .auto-style4 {
            text-align: center;
            height: 47px;
            background-color: #000066
        }
        .auto-style5 {
            text-align: center;
            height: 49px;
            background-color: #000066
        }

        .auto-style6 {
            font-size: small;
            background-color: #000066
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Image ID="imgLogo" runat="server" Height="250px" ImageUrl="~/Images/logo_transparent.png" Width="250px" />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Image ID="imgLoginPage" runat="server" Height="170px" ImageUrl="~/Images/RegisterPage.jpg" Width="320px" />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtUserName" runat="server" BackColor="#FFFFCC" ForeColor="Gray">Username</asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:TextBox ID="txtPassword" runat="server" BackColor="#FFFFCC" ForeColor="Gray">Password</asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Button ID="btnLogin" runat="server" Height="46px" Text="LOGIN" Width="138px" BackColor="#FF9900" ForeColor="White" OnClick="btnLogin_Click" />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:HyperLink ID="hpRegister" runat="server" CssClass="auto-style6" ForeColor="#FF6600">Don&#39;t have an account?</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
