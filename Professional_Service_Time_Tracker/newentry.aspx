<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="newentry.aspx.cs" Inherits="Professional_Service_Time_Tracker.time_entry" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <p>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/default.aspx">Back to Main Page</asp:HyperLink>
        </p>
        <p>
            Sales Order Number:</p>
        <p>
            <asp:TextBox ID="SalesOrder" runat="server" Width="150px"></asp:TextBox>
        </p>
        <p>
            Sold To (Reseller if applicable, or end customer):</p>
        <p>
            <asp:TextBox ID="SoldTo" runat="server" Width="175px"></asp:TextBox>
        </p>
        <p>
            End Customer:</p>
        <p>
            <asp:TextBox ID="EndCustomer" runat="server" Width="172px"></asp:TextBox>
        </p>
        <p>
            End User (Individual, eg: Bob Smith):</p>
        <p>
            <asp:TextBox ID="EndUser" runat="server" Width="170px"></asp:TextBox>
        </p>
        <p>
            P201 Days Purchased</p>
        <p>
            <asp:TextBox ID="P201" runat="server">0</asp:TextBox>
        </p>
        <p>
            P202 Days Purchased</p>
        <p>
            <asp:TextBox ID="P202" runat="server">0</asp:TextBox>
        </p>
        <p>
            P205 Hours Purchased</p>
        <p>
            <asp:TextBox ID="P205" runat="server">0</asp:TextBox>
        </p>
        <p>
            P206 Engagements Purchased</p>
        <p>
            <asp:TextBox ID="P206" runat="server">0</asp:TextBox>
        </p>
        <p>
            Sales Rep</p>
        <p>
            <asp:TextBox ID="SalesRep" runat="server" Width="180px"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" Width="72px" />
        </p>
        <p>
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommand="INSERT INTO Backlog (sales_order, sold_to, end_user, end_user_auth, p201_days, p202_days, p205_hours, p206_engagement, sales_rep, P201_days_purchased, P202_days_purchased, P205_days_purchased, P206_engagement_purchased) VALUES (@SalesOrder, @SoldTo, @EndCustomer, @EndUser, @P201, @P202, @P205, @P206, @SalesRep, @P201p, @P202p, @P205p, @P206p)" SelectCommand="SELECT * FROM [Backlog]" OnSelecting="SqlDataSource1_Selecting" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>">
            <InsertParameters>
                <asp:ControlParameter ControlID="SalesOrder" Name="SalesOrder" PropertyName="Text" />
                <asp:ControlParameter ControlID="SoldTo" Name="SoldTo" PropertyName="Text" />
                <asp:ControlParameter ControlID="EndCustomer" Name="EndCustomer" PropertyName="Text" />
                <asp:ControlParameter ControlID="EndUser" Name="EndUser" PropertyName="Text" />
                <asp:ControlParameter ControlID="P201" Name="P201" PropertyName="Text" />
                <asp:ControlParameter ControlID="P202" Name="P202" PropertyName="Text" />
                <asp:ControlParameter ControlID="P205" Name="P205" PropertyName="Text" />
                <asp:ControlParameter ControlID="P206" Name="P206" PropertyName="Text" />
                <asp:ControlParameter ControlID="SalesRep" Name="SalesRep" PropertyName="Text" />
                <asp:ControlParameter ControlID="P201" Name="P201p" PropertyName="Text" />
                <asp:ControlParameter ControlID="P202" Name="P202p" PropertyName="Text" />
                <asp:ControlParameter ControlID="P205" Name="P205p" PropertyName="Text" />
                <asp:ControlParameter ControlID="P206" Name="p206p" PropertyName="Text" />
            </InsertParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
