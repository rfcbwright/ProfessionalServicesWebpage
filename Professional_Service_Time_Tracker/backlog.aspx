<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="backlog.aspx.cs" Inherits="Professional_Service_Time_Tracker.WebForm2" EnableEventValidation="false"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 904px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/default.aspx">Back to Main Page</asp:HyperLink>
        <br />
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="2" DataSourceID="SqlDataSource1" HorizontalAlign="Left" ForeColor="#333333" AutoGenerateEditButton="True" Font-Size="Medium" Height="800px" Width="1420px" PageSize="15">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="sold_to" HeaderText="Customer" SortExpression="sold_to" />
                <asp:BoundField DataField="sales_order" HeaderText="Invoice #" SortExpression="sales_order" />
                <asp:BoundField DataField="date" DataFormatString="{0:MM/dd/yyyy}" HeaderText="Ship Date" SortExpression="date" />
                <asp:BoundField DataField="sales_rep" HeaderText="Sales Rep" SortExpression="sales_rep" />
                <asp:BoundField DataField="end_user" HeaderText="End Customer" SortExpression="end_user" />
                <asp:BoundField DataField="P201_days_purchased" HeaderText="P201 Days Purchased" SortExpression="P201_days_purchased" >
                <ItemStyle Font-Bold="True" Font-Size="Large" HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="p201_days" HeaderText="P201 Days Remaining" SortExpression="p201_days" >
                <ItemStyle Font-Bold="True" Font-Size="Large" HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="P202_days_purchased" HeaderText="P202 Days Purchased" SortExpression="P202_days_purchased" >
                <ItemStyle Font-Bold="True" Font-Size="Large" HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="p202_days" HeaderText="P202 Days Remaining" SortExpression="p202_days" >
                <ItemStyle Font-Bold="True" Font-Size="Large" HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="P205_days_purchased" HeaderText="P205 Hours Purchased" SortExpression="P205_days_purchased" >
                <ItemStyle Font-Bold="True" Font-Size="Large" HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="p205_hours" HeaderText="P205 Hours Remaining" SortExpression="p205_hours" >
                <ItemStyle Font-Bold="True" Font-Size="Large" HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="P206_engagement_purchased" HeaderText="P206 Engagements Purchased" SortExpression="P206_engagement_purchased" >
                <ItemStyle Font-Bold="True" Font-Size="Large" HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="p206_engagement" HeaderText="P206 Engagements Remaining" SortExpression="p206_engagement" >
                <ItemStyle Font-Bold="True" Font-Size="Large" HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:CheckBoxField DataField="project_complete" HeaderText="Project Complete?" SortExpression="project_complete" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" HorizontalAlign="Center" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerSettings Mode="NextPreviousFirstLast" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [sales_order], [sold_to], [end_user], [project_complete], [p201_days], [p202_days], [p205_hours], [p206_engagement], [sales_rep], [P201_days_purchased], [P202_days_purchased], [P206_engagement_purchased], [P205_days_purchased], [date] FROM [Backlog] WHERE ([project_complete] = @project_complete) ORDER BY [date] DESC">
            <SelectParameters>
                <asp:Parameter DefaultValue="False" Name="project_complete" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
        
       
    
        <div style="height: 120px; width: 154px">
        <br />
        <br />
        <asp:CheckBox ID="Show_Completed" runat="server" AutoPostBack="True" OnCheckedChanged="Show_Completed_CheckedChanged" Text="Show Completed" Font-Bold="True" Font-Size="Large" />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Export to Excel" />
        <br />
        <br />
        </div>
        
    <p>
        &nbsp;</p>
        <p>
            &nbsp;</p>
        
    </form>
    </body>
</html>
