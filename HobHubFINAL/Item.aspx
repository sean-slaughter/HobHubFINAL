<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Item.aspx.cs" Inherits="HobHubFINAL.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Style.css" rel="stylesheet" />
    <meta charset="utf-8"/> 
    <meta name="viewport" content="width=device-width, initial-scale=1"/> 
    <link href="https://fonts.googleapis.com/css?family=Palanquin+Dark&display=swap" rel="stylesheet" />
    <title>Item</title>
</head>
<body>
    <nav class="navbar navbar-dark navbar-expand-sm" style="background-color: #1B2631">
        <asp:HyperLink class="navbar-brand" runat="server" ImageUrl="~/Images/profiledefault.png" NavigateUrl="UserProfileDefault.aspx" ImageHeight="50" ImageWidth="50" ID="hpUserProfileNav"></asp:HyperLink>
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
                    <h1>[ITEM NAME]</h1>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-12"><h2>Description</h2></div>           
            </div>
            <div class="row text-center">
                <div class="col-12">
                    <asp:Image ID="imgItem" CssClass="imgItem" runat="server" Height="300" ImageUrl="~/Images/photo.png" />
                </div>
            </div>
            <div class="row text-center">
                <div class="col-12">
                    <asp:Button ID="btnEditItem" runat="server" Text="Edit Item" CssClass="btn-lg" ForeColor="AntiqueWhite" BackColor="#FF9900" />
                </div>
            </div>
            <div class="row text-center">
                <div class="col-12"><h2>Availability</h2></div>
            </div>
            <div class="row text-center">
                <div class="col-12">
                    <asp:Calendar ID="cldAvailability" CssClass="calandar" runat="server" BackColor="AntiqueWhite"></asp:Calendar>
                </div>
            </div>
              <div class="row text-center">
                <div class="col-12">
                    <asp:Button ID="btnEditAvailability" runat="server" Text="Edit Availability" CssClass="btn-lg" ForeColor="AntiqueWhite" BackColor="#FF9900" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
