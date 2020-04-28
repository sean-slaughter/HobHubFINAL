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
            display: inline-block;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-dark navbar-expand-sm" style="background-color: #1B2631">
        <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarMenu">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse text-right" id="navbarMenu">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a href="UserProfileDefault.aspx" class="nav-link">myHub</a></li>
                <li class="nav-item"><a href="InboxDefault.aspx" class="nav-link">Inbox</a></li>
                <li class="nav-item"><a href="#" class="nav-link">theHub</a></li>
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
                    <asp:Button ID="btnPost" CssClass="btn-md" runat="server" Text="Submit Post" Style="margin-bottom: 50px;" ForeColor="White" BackColor="#FF9900" OnClick="btnPost_Click" />
                </div>
            </div>
            <div class="row text-center">
                <div class="col-12">
                    <asp:GridView ID="gvHubPosts" runat="server" AllowPaging="True" AllowSorting="True" CssClass="auto-style1" AutoGenerateColumns="False" DataSourceID="SqlDataSourceHubPosts" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:TemplateField>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("Photo") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# "data:Image/png;base64,"
                    + Convert.ToBase64String((byte[])Eval("Photo")) %>' Height="100" Width="100" />
                                </ItemTemplate>
                                <ControlStyle Height="200px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Posted Date" SortExpression="PostedDate">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PostedDate") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("PostedDate") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Caption" HeaderText="Caption" SortExpression="Caption" />
                            <asp:HyperLinkField DataTextField="Username" DataNavigateUrlFields="Username" DataNavigateUrlFormatString="UserProfileDefault.aspx?Username={0}" />
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceHubPosts" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Posting]"></asp:SqlDataSource>
                </div>
            </div>
        </div>
    </form>
    <script src="Scripts/jquery-3.0.0.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
</body>
</html>
