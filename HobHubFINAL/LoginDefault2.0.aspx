﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginDefault2.0.aspx.cs" Inherits="HobHubFINAL.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Style.css" rel="stylesheet" />
    <meta charset="utf-8"/> 
    
    <meta name="viewport" content="width=device-width, initial-scale=1"/>  
    <title>Login 2.0</title>
    
    <style type="text/css">
        .auto-style1 {
            color: #CC0000;
        }
    </style>
    
</head>
<body style ="background-color: #1B2631">
    <form id="form1" runat="server">
        <div class ="container-fluid align-items-center">
            <div class ="row text-center">
                <div class ="col-12">
                    <asp:Image ID="Image1" runat="server" Height="463px" ImageUrl="~/Images/logo_transparent.png" />
                </div>
            </div>
            <div class ="row" style="margin-left: auto; margin-right: auto; text-align: center;">
                <div class ="col-12">
                    <asp:TextBox ID="txtUsername" placeholder ="Username" CssClass="form-control" Width= "500px" runat="server" ></asp:TextBox>
                    <br />
                </div>
            </div>
            <div class ="row" style="margin-left: auto; margin-right: auto; text-align: center;">
                <div class ="col-12">
                    <asp:TextBox ID="txtPassword" type="password" placeholder="Password" CssClass="form-control" Width= "500px" runat="server"></asp:TextBox>
                    <br />
                </div>
            </div>
           
            <div class ="row text-center">
                <div class ="col-12">
                    <asp:Button ID="btnLogin" CssClass="btn-lg" runat="server" Text="Login" ForeColor="White" BackColor="#FF9900" OnClick="btnLogin_Click" />
                    <br />
                    <asp:Label ID="lblErrorMessage" runat="server" CssClass="auto-style1" Font-Size="Larger"></asp:Label>
                    <br />
                </div>
            </div>
            <div class ="row text-center">
                <div class ="col-12">
                    <asp:HyperLink ID="hpRegister" CssClass="hplink" runat="server" NavigateUrl="~/RegisterDefault2.0.aspx" Font-Size="Medium" >Don't have an account?</asp:HyperLink>
                    <br />
                    <br />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
