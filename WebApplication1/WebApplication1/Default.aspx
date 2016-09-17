<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1.Default" %>
<%@ Register src="ctlSelectionPane.ascx" tagname="ctlSelectionPane" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <uc1:ctlSelectionPane ID="ctlSelectionPane1" runat="server" />
        <asp:Button ID="btnRun" runat="server" Text="Run Report" OnClick="btnRun_Click" />
    </div>
    <div>
        <asp:Label ID="Label1" runat="server" Text="Upload excel file here"></asp:Label>
        <asp:FileUpload ID="FileUpload1" runat="server" />
    </div>
</asp:Content>
