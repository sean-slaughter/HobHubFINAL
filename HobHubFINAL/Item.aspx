<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Item.aspx.cs" Inherits="HobHubFINAL.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Style.css" rel="stylesheet" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://fonts.googleapis.com/css?family=Palanquin+Dark&display=swap" rel="stylesheet" />
    <title>Item</title>
</head>
<body>
    <nav class="navbar navbar-dark navbar-expand-sm" style="background-color: #1B2631">
        <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarMenu">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse text-left" id="navbarMenu">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a href="UserProfileDefault.aspx" class="nav-link">myHub</a></li>
                <li class="nav-item"><a href="InboxDefault.aspx" class="nav-link">Inbox</a></li>
                <li class="nav-item"><a href="HubDefault2.0.aspx" class="nav-link">theHub</a></li>
                <li class="nav-item"><a href="LoginDefault2.0.aspx" class="nav-link">Logout</a></li>
            </ul>
        </div>
    </nav>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row text-center">
                <div class="col-12">
                    <asp:Label ID="lblItemName" runat="server" Text="Name" Font-Size="75px" ForeColor="AntiqueWhite"></asp:Label>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-12">
                    <h2>Description: </h2>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-12">
                    <asp:Label ID="lblDescription" runat="server" Text="Label" ForeColor="#99FFCC"></asp:Label>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-12">
                    <h2>Hobby associated with this item:</h2>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-12">
                    <asp:Label ID="lblHobbies" runat="server" Text="Label" ForeColor="#99FFCC"></asp:Label>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-6">
                    <asp:Image ID="imgItem1" CssClass="imgItem" runat="server" Height="250" ImageUrl="~/Images/photo.png" />
                </div>
                <div class="col-6">
                    <asp:Image ID="imgItem2" CssClass="imgItem" runat="server" Height="250" ImageUrl="~/Images/photo.png" />
                </div>
            </div>
            <div class="row text-center">
                <div class="col-6">
                    <asp:Image ID="imgItem3" CssClass="imgItem" runat="server" Height="250" ImageUrl="~/Images/photo.png" />
                </div>
                <div class="col-6">
                    <asp:Image ID="imgItem4" CssClass="imgItem" runat="server" Height="250" ImageUrl="~/Images/photo.png" />
                </div>
            </div>

        </div>
        <div class="row text-center">
            <div class="col-12">
                <h2>Availability</h2>
            </div>
        </div>
        <div class="row text-center">
            <div class="col-12">
                <asp:Calendar ID="cldAvailability" OnDayRender="calAvailability_DayRender" CssClass="calendar" runat="server" BackColor="AntiqueWhite" SelectionMode="None"></asp:Calendar>
            </div>
        </div>
        <div class="row text-center">
            <div class="col-12">
                <asp:Button ID="btnEditItem" runat="server" Text="Edit Item" CssClass="btn-lg" ForeColor="AntiqueWhite" BackColor="#FF9900" OnClick="btnEditItem_Click" />
            </div>
        </div>
        <div class="row text-center">
            <div class="col-12">
                <asp:TextBox ID="txtEditName" placeholder="Edit item name" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="row text-center">
            <div class="col-12">
                <asp:TextBox ID="txtEditDescription" placeholder="Edit item description" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="row text-center">
            <div class="col-12">
                <asp:TextBox ID="txtEditHobby" placeholder="Change associated hobby" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="row text-center">
            <div class="col-12">
                <asp:Label ID="lblEditAvail" runat="server" Text="Edit Availability" ForeColor="AntiqueWhite" Font-Size="Larger"></asp:Label>
            </div>
        </div>
        <div class="row text-center">
            <div class="col-6">
                <asp:Calendar ID="calStartDate" runat="server" SelectedDate="04/25/2020 22:12:50" CssClass="calendar" BackColor="AntiqueWhite" OnSelectionChanged="calStartDate_SelectionChanged"></asp:Calendar>
            </div>
            <div class="col-6">
                <asp:Calendar ID="calEndDate" runat="server" CssClass="calendar" OnSelectionChanged="calEndDate_SelectionChanged" SelectedDate="2020-04-30" BackColor="AntiqueWhite"></asp:Calendar>
            </div>
        </div>

        <div class="row text-center">
            <div class="col-6">
                <asp:Button ID="btnSubmit" CssClass="btn-md" runat="server" Text="Submit" BackColor="#FF9900" BorderColor="#FF9900" ForeColor="AntiqueWhite" OnClick="btnSubmit_Click" />
            </div>
            <div class="col-6">
                <asp:Button ID="btnDelete" CssClass="btn-md" runat="server" Text="DELETE ITEM" BackColor="#FF9900" BorderColor="#FF9900" ForeColor="AntiqueWhite" OnClick="btnDelete_Click" />
            </div>
        </div>
    </form>
    <script src="Scripts/jquery-3.0.0.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
</body>
</html>
