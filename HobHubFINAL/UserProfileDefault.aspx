<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProfileDefault.aspx.cs" Inherits="HobHubFINAL.UserProfileDefault" %>

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
            color: #FAEBD7
        }
    </style>
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
                    <h1>myHub</h1>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-12">
                    <div class="row text-center">
                        <div class="col-6">
                            <div class="row text-center">
                                <div class="col-12">
                                    <asp:Image ID="imgProfile" runat="server" ImageUrl="~/Images/profiledefault.png" Height="200px" />
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
                                
                            </div>
                        </div>
                        
                    </div>
                    <div class="row text-center">
                        <div class="col-12">
                                    <asp:Button ID="btnEditInformation" CssClass="btn-lg" runat="server" Text="Edit my information" ForeColor="antiquewhite" BackColor="#FF9900" OnClick="BtnEditInformation_Click" BorderColor="#FF9900" />
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
                    <asp:GridView ID="gridItems" Style="display: inline-block" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="auto-style1" DataSourceID="SqlDataSourceItems" OnSelectedIndexChanged="gvItems_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="ItemID" HeaderText="Item" />
                            <asp:TemplateField HeaderText="Image">
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" Height="100px" Width="100px"
                                        ImageUrl='<%# "data:Image/png;base64,"
                    + Convert.ToBase64String((byte[])Eval("Image1")) %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:Button ID="btnShowMoreInfo" runat="server" CommandArgument="<%# Container.DataItemIndex %>" CausesValidation="False" CommandName="Select" Text="See More Info" OnCommand="btnShowMoreInfo_Click" BackColor="#FF9900" BorderColor="#FF9900" ForeColor="AntiqueWhite"></asp:Button>
                                </ItemTemplate>
                                <ControlStyle BackColor="#FF9900" CssClass="btn-md" ForeColor="AntiqueWhite" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceItems" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * 
FROM Item i, Users u
WHERE u.Username = @Username AND i.UserID = u.UserID">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="Username" QueryStringField="Username" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-12">
                    <asp:Button ID="btnAddNewItem" CssClass="btn-lg" runat="server" Text="Add New Item" ForeColor="AntiqueWhite" BackColor="#FF9900" BorderColor="#FF9900" OnClick="btnAddNewItem_Click" />
                </div>
            </div>
            <div class="row text-center">
                <div class="col-12">
                    <asp:Label ID="lblAddItems" style="margin-bottom : 30px;" runat="server" Text="Add up to 4 photos" ForeColor="AntiqueWhite"></asp:Label>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-6">
                    <asp:FileUpload ID="fileUploadAddNewItem" runat="server" ForeColor="AntiqueWhite" Height="30px" />
                </div>
                <div class="col-6">
                    <asp:FileUpload ID="fileUploadAddNewItem2" runat="server" ForeColor="AntiqueWhite" />
                </div>
            </div>
            <div class="row text-center">
                <div class="col-6">
                    <asp:FileUpload ID="fileUploadAddNewItem3" runat="server" ForeColor="AntiqueWhite" />
                </div>
                <div class="col-6">
                    <asp:FileUpload ID="fileUploadAddNewItem4" Style="margin-bottom: 20px;" runat="server" ForeColor="AntiqueWhite" />
                </div>
            </div>
            <div class="row text-center">
                <div class="col-12">
                    <asp:TextBox ID="txtAddItemName" placeholder="Item name" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-12">
                    <asp:TextBox ID="txtAddItemDescription" CssClass="form-control" placeholder="Item description" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-12">
                    <asp:Button ID="btnAddItem" CssClass="btn-sm" runat="server" Text="Add To My Items" ForeColor="AntiqueWhite" BackColor="#FF9900" BorderColor="#FF9900" OnClick="btnAddItem_Click" />
                </div>
            </div>
        </div>
    </form>
    <script src="Scripts/jquery-3.0.0.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
</body>
</html>
