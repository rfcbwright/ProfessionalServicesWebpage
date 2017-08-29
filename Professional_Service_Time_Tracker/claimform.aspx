<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="claimform.aspx.cs" Inherits="Professional_Service_Time_Tracker.claimform" EnableEventValidation="false"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 227px; width: 614px">
    
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/default.aspx">Back to Main Page</asp:HyperLink>
        <br />
    
        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px">
            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
            <NextPrevStyle VerticalAlign="Bottom" />
            <OtherMonthDayStyle ForeColor="#808080" />
            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
            <SelectorStyle BackColor="#CCCCCC" />
            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
            <WeekendDayStyle BackColor="#FFFFCC" />
        </asp:Calendar>
           
    </div>
    <div id=" date2" style="position: relative; left: 282px; margin-top: -163px; top: -50px;">


        <asp:Calendar ID="Calendar2" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="183px" Width="204px">
            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
            <NextPrevStyle VerticalAlign="Bottom" />
            <OtherMonthDayStyle ForeColor="#808080" />
            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
            <SelectorStyle BackColor="#CCCCCC" />
            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
            <WeekendDayStyle BackColor="#FFFFCC" />
        </asp:Calendar>


    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="engineer" HeaderText="RFC Employee" SortExpression="engineer" />
                <asp:BoundField DataField="department" HeaderText="Department" SortExpression="department" />
                <asp:BoundField DataField="begin_date" DataFormatString="{0:d}" HeaderText="Start Date" SortExpression="begin_date" />
                <asp:BoundField DataField="end_date" DataFormatString="{0:d}" HeaderText="End Date" SortExpression="end_date" />
                <asp:BoundField DataField="sales_order" HeaderText="Sales Order" SortExpression="sales_order" />
                <asp:BoundField DataField="sold_to" HeaderText="Sold To" SortExpression="sold_to" />
                <asp:BoundField DataField="end_customer" HeaderText="End Customer" SortExpression="end_customer" />
                <asp:BoundField DataField="end_user_auth" HeaderText="End User Authorization" SortExpression="end_user_auth" />
                <asp:BoundField DataField="location" HeaderText="Location" SortExpression="location" />
                <asp:BoundField DataField="p201_days" HeaderText="P201" SortExpression="p201_days" />
                <asp:BoundField DataField="p202_days" HeaderText="P202" SortExpression="p202_days" />
                <asp:BoundField DataField="p205_hours" HeaderText="P205" SortExpression="p205_hours" />
                <asp:BoundField DataField="p206_engagement" HeaderText="P206" SortExpression="p206_engagement" />
                <asp:BoundField DataField="comments" HeaderText="Comments" SortExpression="comments" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT timecard.sales_order, timecard.end_user_auth, timecard.begin_date, timecard.end_date, timecard.location, timecard.p201_days, timecard.p202_days, timecard.p205_hours, timecard.p206_engagement, timecard.comments, timecard.engineer, timecard.timecard_entry, timecard.department, timecard.sold_to, timecard.end_customer, Backlog.sales_order AS Expr1, Backlog.sold_to AS Expr2, Backlog.end_user FROM timecard INNER JOIN Backlog ON timecard.sales_order = Backlog.sales_order WHERE (timecard.end_date &gt;= @end_date) AND (timecard.end_date &lt;= @end_date2)">
            <SelectParameters>
                <asp:ControlParameter ControlID="Calendar1" DbType="Date" Name="end_date" PropertyName="SelectedDate" />
                <asp:ControlParameter ControlID="Calendar2" DbType="Date" Name="end_date2" PropertyName="SelectedDate" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Export to Excel" />
    </form>
</body>
</html>
