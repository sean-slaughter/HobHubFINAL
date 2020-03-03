<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HubDefault.aspx.cs" Inherits="HobHubFINAL.HubDefault" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 335px;
            height: 680px;
            background-color: #000066
        }
        .auto-style2 {
            width: 100%;
            height: 63px;
            background-color: #000066
        }
        .auto-style3 {
            width: 138px;
            height: 150px;
            background-color: #000066;
            text-align: center;
            font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
            font-size: xx-large;
            color: #FF9900;
        }
        .auto-style4 {
            width: 100%;
            height: 46px;
            background-color: #000066
        }
        .auto-style5 {
            width: 98%;
            height: 41px;
            background-color: #000066
        }

        .auto-style6 {
            height: 30px;
            text-align: center;
            background-color: #000066;
            font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
            font-size: x-large;
            color: #FF9900;
        }

        .auto-style8 {
            height: 77px;
            text-align: center;
        }

        .auto-style9 {
            height: 73px;
        }
        .auto-style10 {
            height: 69px;
            text-align: center;
        }
        .auto-style11 {
            width: 161px;
        }
        .auto-style12 {
            text-align: right;
        }
        .auto-style13 {
            text-align: center;
        }
        .auto-style14 {
            font-size: x-small;
        }
        .auto-style15 {
            height: 29px;
            text-align: center;
            font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
            font-size: x-large;
            color: #FF9900;
        }
        .auto-style16 {
            font-size: small;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <table class="auto-style2">
                <tr>
                    <td class="auto-style11">
                        <asp:Image ID="imgProfile" runat="server" Height="50px" ImageUrl="~/Images/profileicon.png" Width="50px" />
                    </td>
                    <td class="auto-style12">
                        <asp:Image ID="imgSettings" runat="server" Height="50px" ImageUrl="~/Images/gear.png" Width="50px" />
                    </td>
                </tr>
            </table>
            <table class="auto-style4">
                <tr>
                    <td class="auto-style3">theHub</td>
                </tr>
            </table>
            <table class="auto-style5">
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style13">
                        <asp:Image ID="imgIcon1" runat="server" Height="50px" ImageUrl="~/Images/basketball.png" />
                    </td>
                    <td class="auto-style13">
                        <asp:Image ID="imgIcon2" runat="server" Height="50px" ImageUrl="~/Images/fishing.png" />
                    </td>
                    <td class="auto-style13">
                        <asp:Image ID="imgIcon3" runat="server" Height="50px" ImageUrl="~/Images/roller-skate.png" />
                    </td>
                    <td>
                        <asp:Image ID="imgIcon4" runat="server" Height="50px" ImageUrl="~/Images/skateboard.png" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <table style="width:100%;">
                <tr>
                    <td class="auto-style6">Explore</td>
                </tr>
                <tr>
                    <td class="auto-style10">
                        <asp:TextBox ID="txtExplore" runat="server" BackColor="#FFFFCC" CssClass="auto-style14" ForeColor="#999999" Height="27px" OnTextChanged="TextBox1_TextChanged" Width="215px">Search by hobby, username, or item</asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style15">Post</td>
                </tr>
                <tr>
                    <td class="auto-style8">
                        <asp:TextBox ID="txtPost" runat="server" BackColor="#FFFFCC" CssClass="auto-style16" ForeColor="#999999" Height="27px" Width="215px">Post a new thread</asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:Image ID="imgCrafts" runat="server" Height="250px" ImageUrl="~/Images/crafts.jpg" />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
