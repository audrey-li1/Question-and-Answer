<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PopupCalendar.ascx.cs" Inherits="PopupCalendar" %>
<asp:textbox id="TextBox1" runat="server" ReadOnly="True" Width="100px" CssClass="text"></asp:textbox>
<%-- <asp:ImageButton id="Button1" ClientIDMode="Static" Width="50px" ImageUrl="~/images/calendar.gif" OnClientClick="" runat="server"/><br> --%>
  <img  id="Button1" ClientIDMode="Static"   src="~/images/calendar.gif"  runat="server"/><br> 
<%--<input type="button" id="Button1"  runat="server" Width="50px" value="..." class="text"></input><br>--%>
<asp:Panel id="pnlCalendar" runat="server">
	<asp:calendar id="Calendar1" runat="server" BackColor="White" Width="200px" DayNameFormat="FirstLetter"
		ForeColor="Black" Height="180px" Font-Size="8pt" Font-Names="Verdana" BorderColor="#999999"
		CellPadding="4">
		<TodayDayStyle ForeColor="Black" BackColor="#CCCCCC"></TodayDayStyle>
		<SelectorStyle BackColor="#CCCCCC"></SelectorStyle>
		<NextPrevStyle VerticalAlign="Bottom"></NextPrevStyle>
		<DayHeaderStyle Font-Size="7pt" Font-Bold="True" BackColor="#CCCCCC"></DayHeaderStyle>
		<SelectedDayStyle Font-Bold="True" ForeColor="White" BackColor="#666666"></SelectedDayStyle>
		<TitleStyle Font-Bold="True" BorderColor="Black" BackColor="#999999"></TitleStyle>
		<WeekendDayStyle BackColor="LightSteelBlue"></WeekendDayStyle>
		<OtherMonthDayStyle ForeColor="#808080"></OtherMonthDayStyle>
	</asp:calendar>
</asp:Panel><BR>
<script>

</script>