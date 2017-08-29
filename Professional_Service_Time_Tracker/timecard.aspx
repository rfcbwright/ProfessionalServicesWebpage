<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="timecard.aspx.cs" Inherits="Professional_Service_Time_Tracker.newcustomer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [sales_order], [end_user] FROM [Backlog] WHERE (([project_complete] = @project_complete) OR ([sales_order] = @sales_order))">
            <SelectParameters>
                <asp:Parameter DefaultValue="False" Name="project_complete" Type="Boolean" />
                <asp:Parameter DefaultValue="------" Name="sales_order" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <br />
    
    </div>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/default.aspx">Back Main Page</asp:HyperLink>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Select Sales Order Number"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Text="End Customer"></asp:Label>
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="sales_order" DataValueField="sales_order" Height="21px" Width="109px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="EndCustomer" runat="server" DataSourceID="SqlDataSource2" DataTextField="end_user" DataValueField="end_user" Height="22px" Width="154px">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [end_user] FROM [Backlog] WHERE ([sales_order] = @sales_order)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="sales_order" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        Sold to:
        <br />
        <asp:DropDownList ID="SoldTo" runat="server" DataSourceID="SqlDataSource9" DataTextField="sold_to" DataValueField="sold_to">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [sold_to] FROM [Backlog] WHERE ([sales_order] = @sales_order)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="sales_order" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT MAX(timecard_entry) AS Expr1 FROM timecard"></asp:SqlDataSource>
        <br />
        <asp:Label ID="Label3" runat="server" Text="RFC Engineer"></asp:Label>
        :<br />
        <asp:DropDownList ID="RFCEngineerDropdown" runat="server" DataSourceID="SqlDataSource7" DataTextField="engineer" DataValueField="engineer" Height="22px" Width="135px" AutoPostBack="True">
        </asp:DropDownList>
        <br />
        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [engineer] FROM [engineers]"></asp:SqlDataSource>
        <br />
        Department<br />
        <asp:DropDownList ID="DepartmentDropDown" runat="server" DataSourceID="SqlDataSource8" DataTextField="department" DataValueField="department">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [department] FROM [engineers] WHERE ([engineer] = @engineer)">
            <SelectParameters>
                <asp:ControlParameter ControlID="RFCEngineerDropdown" Name="engineer" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        Customer Authorization<br />
        <asp:TextBox ID="EndUser" runat="server"></asp:TextBox>
        <br />
        <br />
        <div style="height: 208px; width: 229px">
        <asp:Label ID="Label4" runat="server" Text="Begin Date:"></asp:Label>
        <asp:Calendar ID="BeginDate" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px">
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
        <div id="EndDate" style="position: relative; left: 238px; margin-top: -163px; top: -43px;">
            <asp:Label ID="Label5" runat="server" Text="End Date:"></asp:Label>
        <asp:Calendar ID="EndDate" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px">
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

        <asp:Label ID="Label6" runat="server" Text="Location Delivered (For example: Remote, Austin, TX, Chicago, IL, etc.):"></asp:Label>
        <br />
        <asp:TextBox ID="Location" runat="server" Width="225px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label7" runat="server" Text="P201 Days Delivered"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox TextMode="Number" min="0" max="100" step="1" ID="P201" runat="server" Width="49px" AutoPostBack="True" OnTextChanged="P201_TextChanged">0</asp:TextBox>
        &nbsp;P201 Days Previous:
        <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource5" DataTextField="p201_days" DataValueField="p201_days" Height="23px" Width="50px"></asp:ListBox>
&nbsp;P201 Days Remaining:
        <asp:TextBox ID="TextBox1" runat="server" Width="46px"></asp:TextBox>
        <br />
        P202 Days Delivered&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="P202" runat="server" Width="48px" TextMode="Number" min="0" max="100" step="1" OnTextChanged="P202_TextChanged" AutoPostBack="True">0</asp:TextBox>
        &nbsp;P202 Days Previous:
        <asp:ListBox ID="ListBox2" runat="server" DataSourceID="SqlDataSource5" DataTextField="p202_days" DataValueField="p202_days" Height="23px" Width="48px"></asp:ListBox>
        &nbsp;P202 Days Remaining:
        <asp:TextBox ID="TextBox2" runat="server" Width="47px"></asp:TextBox>
        <br />
        P205 Hours Delivered&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="P205" TextMode="Number" min="0" max="100" step="1" runat="server" Width="42px" AutoPostBack="True" OnTextChanged="P205_TextChanged">0</asp:TextBox>
        &nbsp; P205 Hours Previous:
        <asp:ListBox ID="ListBox3" runat="server" DataSourceID="SqlDataSource5" DataTextField="p205_hours" DataValueField="p205_hours" Height="20px" Width="46px"></asp:ListBox>
        &nbsp;P205 Hours Remaining:<asp:TextBox ID="TextBox3" runat="server" Width="45px"></asp:TextBox>
        <br />
        P206 Project Delivered&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="P206" TextMode="Number" min="0" max="100" step="1" runat="server" Width="41px" AutoPostBack="True" OnTextChanged="P206_TextChanged">0</asp:TextBox>
        &nbsp;&nbsp; P206 Project Previous:
        <asp:ListBox ID="ListBox4" runat="server" DataSourceID="SqlDataSource5" DataTextField="p206_engagement" DataValueField="p206_engagement" Height="22px" Width="42px"></asp:ListBox>
&nbsp;P206 Project Remaining:<asp:TextBox ID="TextBox4" runat="server" Width="46px"></asp:TextBox>
        <br />
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [p201_days], [p202_days], [p205_hours], [p206_engagement] FROM [Backlog] WHERE ([sales_order] = @sales_order)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="sales_order" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        Comments:<br />
        <asp:TextBox ID="Comments" runat="server" Height="85px" TextMode="MultiLine" Width="426px"></asp:TextBox>
        <p>
            <asp:Button ID="EntrySubmit" runat="server" OnClick="EntrySubmit_Click" Text="Submit" />
        </p>
        <p>
            <asp:Label ID="Label8" runat="server"></asp:Label>
        </p>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommand="INSERT INTO timecard(engineer,begin_date, end_date, location, p201_days, p202_days, p205_hours, p206_engagement, comments, sales_order, end_user_auth, timecard_entry,department,end_customer,sold_to) VALUES (@Engineer,@BeginDate,@EndDate,@Location,@P201,@P202,@P205,@P206,@Comments,@SalesOrder,@EndUser,@timeentry,@department,@end_customer,@sold_to)" SelectCommand="SELECT * FROM [timecard]" UpdateCommand="UPDATE Backlog SET p201_days = @p201, p202_days = @p202, p205_hours = @p205, p206_engagement = @p206, project_complete = @project_complete WHERE (sales_order = @sales_order)">
            <InsertParameters>
                <asp:ControlParameter ControlID="RFCEngineerDropdown" Name="Engineer" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="BeginDate" Name="BeginDate" PropertyName="SelectedDate" />
                <asp:ControlParameter ControlID="EndDate" Name="EndDate" PropertyName="SelectedDate" />
                <asp:ControlParameter ControlID="Location" Name="Location" PropertyName="Text" />
                <asp:ControlParameter ControlID="P201" Name="P201" PropertyName="Text" />
                <asp:ControlParameter ControlID="P202" Name="P202" PropertyName="Text" />
                <asp:ControlParameter ControlID="P205" Name="P205" PropertyName="Text" />
                <asp:ControlParameter ControlID="P206" Name="P206" PropertyName="Text" />
                <asp:ControlParameter ControlID="Comments" Name="Comments" PropertyName="Text" />
                <asp:ControlParameter ControlID="DropDownList1" Name="SalesOrder" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="EndUser" Name="EndUser" PropertyName="Text" />
                <asp:ControlParameter ControlID="TextBox5" Name="timeentry" PropertyName="Text" />
                <asp:ControlParameter ControlID="DepartmentDropDown" Name="department" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="EndCustomer" Name="end_customer" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="SoldTo" Name="sold_to" PropertyName="SelectedValue" />
            </InsertParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="p201" PropertyName="Text" />
                <asp:ControlParameter ControlID="TextBox2" Name="p202" PropertyName="Text" />
                <asp:ControlParameter ControlID="TextBox3" Name="p205" PropertyName="Text" />
                <asp:ControlParameter ControlID="TextBox4" Name="p206" PropertyName="Text" />
                <asp:ControlParameter ControlID="DropDownList1" Name="sales_order" PropertyName="SelectedValue" />
                <asp:Parameter DefaultValue="True" Name="project_complete" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [p201_days] FROM [Backlog] WHERE ([sales_order] = @sales_order)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="sales_order" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:ListBox ID="ListBox5" runat="server" DataSourceID="SqlDataSource6" DataTextField="Expr1" DataValueField="Expr1" EnableViewState="False" Height="16px" Width="35px"></asp:ListBox>
&nbsp;
        <asp:TextBox ID="TextBox5" runat="server" AutoPostBack="True" EnableViewState="False" Height="16px" Width="16px"></asp:TextBox>
    </form>
</body>
</html>
