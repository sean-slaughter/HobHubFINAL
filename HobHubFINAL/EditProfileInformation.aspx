<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditProfileInformation.aspx.cs" Inherits="HobHubFINAL.EditProfileInformation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Style.css" rel="stylesheet" />
    <meta charset="utf-8"/> 
    <meta name="viewport" content="width=device-width, initial-scale=1"/> 
    <link href="https://fonts.googleapis.com/css?family=Palanquin+Dark&display=swap" rel="stylesheet" />
    <title>Edit My Profile</title>
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
                    <h1 id="editprofileh1">Edit my information</h1>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-6">
                    <div class="row text-center">
                        <div class ="col-12">
                            <asp:Image ID="imgProfile" runat="server" ImageUrl="~/Images/profiledefault.png" Height="200px" />
                        </div>
                    </div>
                    <div class="row text-center">
                        <div class="col-12">
                            <asp:FileUpload ID="fuChangePhoto" runat="server" />
                        </div>
                    </div>
                    <div class="row text-center">
                        <div class="col-12">
                            <asp:Button ID="btnChangePhoto" runat="server" Text="Change Photo" CssClass="btn-sm" BackColor="#FF9900" ForeColor="AntiqueWhite" />
                        </div>
                    </div>
                </div>
                <div class="col-6">
                    <div class="row text-center">
                        <div class ="col-12">
                            <asp:TextBox ID="txtLocation" CssClass="form-control" placeholder="My location" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row text-center">
                        <div class ="col-12">
                            <asp:TextBox ID="txtHobbies" CssClass="form-control" placeholder="My hobbies" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row text-center">
                        <div class ="col-12">
                            <asp:Button ID="btnEditInfo" runat="server" Text="Update my information"  CssClass="btn-lg" ForeColor="AntiqueWhite" BackColor="#FF9900" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
