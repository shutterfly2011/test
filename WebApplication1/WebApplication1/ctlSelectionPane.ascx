<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctlSelectionPane.ascx.cs" Inherits="WebApplication1.ctlSelectionPane" %>

<asp:Label ID="Label1" runat="server" Text="Start date "></asp:Label>
    <asp:TextBox ID="txtStartDate" runat="server" TextMode="Date"></asp:TextBox>
    <asp:ImageButton ID="btnStartDate" runat="server" ImageUrl="~/img/calendar.png" Height="30" OnClick="btnStartDate_Click" /><asp:Calendar ID="clndStartDate" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" OnSelectionChanged="clndStartDate_SelectionChanged" Visible="False" Width="350px" SelectedDate="1995-01-01">
    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
    <OtherMonthDayStyle ForeColor="#999999" />
    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
    <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
    <TodayDayStyle BackColor="#CCCCCC" />
</asp:Calendar>
<asp:Label ID="Label2" runat="server" Text="End date "></asp:Label>
    <asp:TextBox ID="txtEndDate" runat="server" TextMode="Date"></asp:TextBox>
    <asp:ImageButton ID="imbEndDate" runat="server" ImageUrl="~/img/calendar.png" Height="30" OnClick="imbEndDate_Click" />
<asp:Calendar ID="clndEndDate" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth"  Visible="False" Width="350px" OnSelectionChanged="clndEndDate_SelectionChanged" SelectedDate="1998-12-31">
    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
    <OtherMonthDayStyle ForeColor="#999999" />
    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
    <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
    <TodayDayStyle BackColor="#CCCCCC" />
</asp:Calendar>



