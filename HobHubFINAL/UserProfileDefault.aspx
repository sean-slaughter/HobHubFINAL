<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProfileDefault.aspx.cs" Inherits="HobHubFINAL.UserProfileDefault" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Style.css" rel="stylesheet" />
    <meta charset="utf-8"/> 
    <meta name="viewport" content="width=device-width, initial-scale=1"/> 
    <link href="https://fonts.googleapis.com/css?family=Palanquin+Dark&display=swap" rel="stylesheet" />
    <title></title>
</head>
<body>
    <nav class="navbar navbar-dark navbar-expand-sm" style="background-color: #1B2631">
        <asp:HyperLink class="navbar-brand" runat="server" ImageUrl="~/Images/profiledefault.png" NavigateUrl="#" ImageHeight="50" ImageWidth="50" ID="hpUserProfileNav"></asp:HyperLink>
        <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarMenu">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse text-right" id="navbarMenu">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a href="MyItemsDefault.aspx" class="nav-link">My Items</a></li>
                <li class="nav-item"><a href="InboxDefault.aspx" class="nav-link">Inbox</a></li>
                <li class="nav-item"><a href="HubDefault2.0.aspx" class="nav-link">The Hub</a></li>
                <li class="nav-item"><a href="LoginDefault2.0.aspx" class="nav-link">Logout</a></li>
            </ul>
        </div>
    </nav>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row text-center">
                <div class="col-12">
                    <h1>myHub</h1>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-12">
                    <asp:GridView ID="gvProfile" style="display : inline-block" runat="server"></asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceProfile" runat="server"></asp:SqlDataSource>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-12">
                    <asp:Button ID="btnEditProfile" CssClass="btn-lg" style="display : inline-block" runat="server" Text="Edit Profile" BackColor="#FF9900" ForeColor="AntiqueWhite"/>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-12">
                    <h1>My Items</h1>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-12">
                    <asp:GridView ID="gvItems" style="display : inline-block" runat="server"></asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceItems" runat="server"></asp:SqlDataSource>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-12">
                    <asp:Button ID="btnEditItems" CssClass="btn-lg" style="display : inline-block" runat="server" Text="Edit Items" ForeColor="AntiqueWhite" BackColor="#FF9900" />
                </div>
            </div>
        </div>
    </form>
    <script src="Scripts/jquery-3.0.0.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
</body>
</html>
