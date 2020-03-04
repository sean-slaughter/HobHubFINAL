﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginDefault2.0.aspx.cs" Inherits="HobHubFINAL.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Style.css" rel="stylesheet" />
    <meta charset="utf-8"/>  
    <meta name="viewport" content="width=device-width, initial-scale=1"/>  
    <title>Login 2.0</title>
    
</head>
<body>
    <form id="form1" runat="server">
        <div class ="container-fluid">
            <div class ="row mx-auto d-block">
            <div class ="col">
                <asp:Image ID="Image1" runat="server" Height="463px" ImageUrl="~/Images/logo_transparent.png" />
            </div>
            </div>
  
        <div class ="row justify-content-center">
            <div class ="col" >
                <asp:TextBox ID="txtUserName" placeholder="Username" CssClass ="form-control form-group" runat="server"></asp:TextBox>
                <br />
                <asp:TextBox ID="txtPassword" type ="password" placeholder="Password" CssClass ="form-control form-group" runat ="server"></asp:TextBox>
                <br />
        

            </div>
        </div>
            <div class ="row justify-content-center">
                <div class ="auto-style1">
                    <asp:Button ID="btnLogin" CssClass="btn-lg" runat="server" Text="Login" ForeColor="White" />
                    <br />
                    <asp:HyperLink ID="hpRegister" runat="server" NavigateUrl="~/RegisterDefault.aspx" Font-Size="Small">Don't have an account?</asp:HyperLink>
                    <br />
                    <br />
                </div>
            </div>
        </div>
    </form>
</body>
</html>