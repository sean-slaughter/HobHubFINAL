<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterDefault2.0.aspx.cs" Inherits="HobHubFINAL.RegisterDefault2__0" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Style.css" rel="stylesheet" />
    <meta charset="utf-8"/> 
    <meta name="viewport" content="width=device-width, initial-scale=1"/>  
    <title></title>
    
</head>
<body>
    <form id="form1" runat="server">
        <div class ="container-fluid">
            <div class="row text-center">
                <div class="col-12">
                    <asp:Image ID="imgLogo" runat="server" Height="375px" ImageUrl="~/Images/logo_transparent.png" />
                </div>
            </div>
            <div class="row text-center">
                    <div class="col-12">
                    <asp:Label ID="lblRegister" CssClass ="label" runat="server" Text="Register"  ForeColor="White"></asp:Label>
                    </div>
                </div>
            <div class="form-group">
                <div class="row text-center">
                    <div class="col-12">
                    </div>
                </div>
                <div class="row text-center">
                    <div class="col-12">
                        <asp:TextBox ID="txtUserName" CssClass ="form-control" placeholder ="Username" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="row text-center">
                     <div class="col-12">
                         <asp:TextBox ID="txtPassword" type="password" CssClass="form-control" placeholder ="Password" runat="server"></asp:TextBox>
                     </div>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-12">
                    <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                    <br />
                    <asp:Button ID="btnRegister" CssClass="btn-lg" runat="server" Text="Create Account" BackColor="#FF9900" Font-Size="Larger" ForeColor="White" OnClick="btnRegister_Click" />
                </div>
            </div>
            <div class="row text-center">
                <div class="col-12">
                    <asp:HyperLink ID="hpLogin" CssClass="hplink" runat="server" NavigateUrl="~/LoginDefault2.0.aspx" Font-Size="Medium">Already have an account?</asp:HyperLink>
                </div>
            </div>
       
        </div>
    </form>
</body>
</html>
