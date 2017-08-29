<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Professional_Service_Time_Tracker.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:HyperLink ID="HyperLink1" runat="server" ImageHeight="200px" ImageUrl="~/Images/business-cat-wants-to-know-hows-the-backlog.jpg" NavigateUrl="~/backlog.aspx">Backlog</asp:HyperLink>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="HyperLink2" runat="server" ImageHeight="200px" ImageUrl="~/Images/time-cards-are-due-get-on-it.jpg" NavigateUrl="~/timecard.aspx">Time Entry</asp:HyperLink>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <asp:HyperLink ID="HyperLink4" runat="server" ImageHeight="200px" ImageUrl="~/Images/TJTOiGc.png" NavigateUrl="~/newentry.aspx">HyperLink</asp:HyperLink>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="HyperLink3" runat="server" ImageHeight="200px" ImageUrl="~/Images/cK2fewh.png" NavigateUrl="~/claimform.aspx">Claims Form</asp:HyperLink>
&nbsp;
    </form>
</body>
</html>
