<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ajaxPartialPostback.aspx.cs" Inherits="WebApplication1.ajaxPartialPostback" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductID" DataSourceID="SqlDataSource1" OnPageIndexChanged="GridView1_PageIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="ProductID" HeaderText="ProductID" InsertVisible="False" ReadOnly="True" SortExpression="ProductID" />
                        <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
                        <asp:BoundField DataField="SupplierID" HeaderText="SupplierID" SortExpression="SupplierID" />
                        <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID" />
                        <asp:BoundField DataField="QuantityPerUnit" HeaderText="QuantityPerUnit" SortExpression="QuantityPerUnit" />
                        <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" />
                        <asp:BoundField DataField="UnitsInStock" HeaderText="UnitsInStock" SortExpression="UnitsInStock" />
                        <asp:BoundField DataField="UnitsOnOrder" HeaderText="UnitsOnOrder" SortExpression="UnitsOnOrder" />
                        <asp:BoundField DataField="ReorderLevel" HeaderText="ReorderLevel" SortExpression="ReorderLevel" />
                        <asp:CheckBoxField DataField="Discontinued" HeaderText="Discontinued" SortExpression="Discontinued" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString %>" SelectCommand="/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [ProductID]
      ,[ProductName]
      ,[SupplierID]
      ,[CategoryID]
      ,[QuantityPerUnit]
      ,[UnitPrice]
      ,[UnitsInStock]
      ,[UnitsOnOrder]
      ,[ReorderLevel]
      ,[Discontinued]
  FROM [NORTHWND].[dbo].[Products]"></asp:SqlDataSource>
                <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                    <ProgressTemplate>
                        retrieving product list...
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </ContentTemplate>
        </asp:UpdatePanel>
    
    </div>
    </form>
</body>
</html>
