<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HubDefault2.0.aspx.cs" Inherits="HobHubFINAL.HubDefault2__0" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Style.css" rel="stylesheet" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://fonts.googleapis.com/css?family=Palanquin+Dark&display=swap" rel="stylesheet" />

    <title></title>
    <style type="text/css">
        .auto-style1 {
            color: #FAEBD7;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-dark navbar-expand-sm" style="background-color: #1B2631">
        <asp:HyperLink class="navbar-brand" runat="server" ImageUrl="~/Images/profiledefault.png" NavigateUrl="~/UserProfileDefault.aspx" ImageHeight="50" ImageWidth="50" ID="hpUserProfileNav"></asp:HyperLink>
        <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarMenu">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse text-right" id="navbarMenu">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a href="MyItemsDefault.aspx" class="nav-link">My Items</a></li>
                <li class="nav-item"><a href="InboxDefault.aspx" class="nav-link">Inbox</a></li>
                <li class="nav-item"><a href="#" class="nav-link">The Hub</a></li>
                <li class="nav-item"><a href="LoginDefault2.0.aspx" class="nav-link">Logout</a></li>
            </ul>
        </div>
    </nav>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row text-center">
                <div class="col-12">
                    <h1>the Hub</h1>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-12">
                    <h2>Explore</h2>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-12">
                    <asp:TextBox ID="txtExplore" CssClass="form-control" placeholder="Search by hobby, item or username" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-12">
                    <asp:Button ID="btnExplore" CssClass ="btn-md" runat="server" Text="Submit Search" ForeColor="AntiqueWhite" BackColor="#FF9900" OnClick="btnExplore_Click" />
                </div>
            </div>
            <div class="row text-center">
                <div class="col-12">
                    <h2>Post</h2>
                </div>
            </div>
            <div class="row" style="margin-left: auto; margin-right: auto; text-align: center;">
                <div class="col-12">
                    <asp:FileUpload ID="fuPost" runat="server" CssClass="file-field" Style="display: inline-block; padding-bottom: 10px;" ForeColor="antiquewhite" />
                </div>
            </div>
            <div class="row text-center">
                <div class="col-12">
                    <asp:TextBox ID="txtPost" CssClass="form-control" placeholder="Caption" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-12">
                    <asp:Button ID="btnPost" CssClass="btn-md" runat="server" Text="Submit Post" Style="margin-bottom: 50px;" ForeColor="White" BackColor="#FF9900" />
                </div>
            </div>
            <div class="row text-center">
                <div class="col-12">
                    <asp:GridView ID="gvHubPosts" runat="server" AllowPaging="True" AllowSorting="True" CssClass="auto-style1">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceHubPosts" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [PostedDate], [Photo], [Caption] FROM [Posting]"></asp:SqlDataSource>
                </div>
            </div>
        </div>
    </form>
    <script src="Scripts/jquery-3.0.0.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
</body>
</html>
