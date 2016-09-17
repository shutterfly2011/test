<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="WebApplication1.Orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Orders placed between " Font-Size="Larger"></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
            <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" SortExpression="EmployeeID" />
            <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate" />
            <asp:BoundField DataField="RequiredDate" HeaderText="RequiredDate" SortExpression="RequiredDate" />
            <asp:BoundField DataField="ShippedDate" HeaderText="ShippedDate" SortExpression="ShippedDate" />
            <asp:BoundField DataField="ShipVia" HeaderText="ShipVia" SortExpression="ShipVia" />
            <asp:BoundField DataField="Freight" HeaderText="Freight" SortExpression="Freight" />
            <asp:BoundField DataField="ShipName" HeaderText="ShipName" SortExpression="ShipName" />
            <asp:BoundField DataField="ShipAddress" HeaderText="ShipAddress" SortExpression="ShipAddress" />
            <asp:BoundField DataField="ShipCity" HeaderText="ShipCity" SortExpression="ShipCity" />
            <asp:BoundField DataField="ShipRegion" HeaderText="ShipRegion" SortExpression="ShipRegion" />
            <asp:BoundField DataField="ShipPostalCode" HeaderText="ShipPostalCode" SortExpression="ShipPostalCode" />
            <asp:BoundField DataField="ShipCountry" HeaderText="ShipCountry" SortExpression="ShipCountry" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString %>" SelectCommand="SELECT [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry] FROM [Orders] WHERE (([OrderDate] &gt;= @OrderDate) AND ([OrderDate] &lt;= @OrderDate2))">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="1/1/1995" Name="OrderDate" QueryStringField="SDate" Type="DateTime" />
            <asp:QueryStringParameter DefaultValue="12/31/1998" Name="OrderDate2" QueryStringField="EDate" Type="DateTime" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
