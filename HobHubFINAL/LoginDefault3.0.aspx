<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginDefault3.0.aspx.cs" Inherits="HobHubFINAL.LoginDefault3__0" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Style.css" rel="stylesheet" />
    <meta charset="utf-8"/> 
    
    <meta name="viewport" content="width=device-width, initial-scale=1"/>  

    <title>Login 3.0</title>
</head>
<body style = "background-color: #3e4166">
    <div class = "container-h100">
        <form id="form1" runat="server">
            <div class ="row justify-content-center align-items-center">
                <div class ="col-12">
                    <asp:Image ID="imgLogo" runat="server" ImageUrl="~/Images/logo_transparent.png" Height="300" />
                </div>
            </div>
            <div class ="row justify-content-center align-items-center">
                <div class ="col-12">
                    <asp:TextBox ID="txtUserame" placeholder ="Username" class ="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class ="row justify-content-center align-items-center">
                <div class ="col-12">
                    <asp:TextBox ID="txtPassword" placeholder ="password" type="password" class ="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class ="row justify-content-center align-items-center">
                <div class ="col-12">
                    <asp:Button ID="btnLogin" CssClass="btn-lg" runat="server" Text="Login" />
                </div>

            </div>
            <div class ="row justify-content-center align-items-center">
                <div class ="col-12">
                    <asp:HyperLink ID="hpRegister" runat="server" Font-Size="Small">Don't have an account?</asp:HyperLink>
                </div>

            </div>
        
        </form>
    </div>
</body>
</html>
