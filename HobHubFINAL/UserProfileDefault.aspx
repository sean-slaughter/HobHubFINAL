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
    <style type="text/css">
        .auto-style1 {
            color: #FAEBD7
        }
        .auto-style2 {
            position: relative;
            width: 100%;
            -ms-flex: 0 0 100%;
            flex: 0 0 100%;
            max-width: 100%;
            left: 354px;
            top: -158px;
            padding-left: 15px;
            padding-right: 15px;
        }
    </style>
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
                       <div class="row text-center">
                <div class="col-6">
                    <div class="row text-center">
                        <div class="col-12">
                            <asp:Image ID="imgProfile" runat="server" ImageUrl="~/Images/profiledefault.png" Height="200px"/>
                        </div>
                        <div class="col-12">
                            <asp:Label ID="lblUsername" CssClass="profileLabel" runat="server" Text="[User's] myHub"></asp:Label>
                        </div>
                    </div>
                </div>
                <div class="col-6">
                    <div class="row text-center">
                        <div class="col-12">
                            <asp:Label ID="lblLocation" CssClass="profileSideLabel" runat="server" Text="My location: []"></asp:Label>
                        </div>
                        <div class="col-12">
                            <asp:Label ID="lblHobbies" CssClass="profileSideLabel" runat="server" Text="My hobbies: []"></asp:Label>
                        </div>
                        <div class="col-12">
                            <asp:Label ID="lblRating" CssClass="profileSideLabel" runat="server" Text="My rating: []"></asp:Label>
                        </div>
                        <div class="col-12">
                            <asp:Button ID="Button1" CssClass="btn-lg" runat="server" Text="Edit my information" ForeColor="antiquewhite" BackColor="#FF9900" OnClick="Button1_Click" />
                        </div>
                    </div>
                </div>
            </div>
                    <asp:SqlDataSource ID="SqlDataSourceProfile" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [UserName], [Password], [Location], [ProfileImageURL], [Rating], [UserID] FROM [Users]"></asp:SqlDataSource>
                </div>
            </div>
           
            <div class="row text-center">
                <div class="col-12">
                    <h1>myItems</h1>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-12">
                    <asp:GridView ID="gvItems" style="display : inline-block" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="auto-style1" DataSourceID="SqlDataSourceItems" OnSelectedIndexChanged="gvItems_SelectedIndexChanged">
                        <Columns>
                            <asp:ImageField>
                            </asp:ImageField>
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                            <asp:HyperLinkField Text="See More Info" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceItems" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Name], [Description], [ImageURL1], [ImageURL2], [ImageURL3], [ImageURL4], [StartAvailableDate], [EndAvailableDate] FROM [Item]"></asp:SqlDataSource>
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
