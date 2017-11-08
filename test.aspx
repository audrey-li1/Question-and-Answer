<%@ Page Language="C#" AutoEventWireup="false" CodeFile="test.aspx.cs" Inherits="test" %>
     <%@ Register TagPrefix="uc1" TagName="ctlCalendar" Src="~/PopupCalendar.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Home</title>
    <meta charset="utf-8">
     
 
</head>
<body>
    

 

 <form runat="server">
  
 	<uc1:ctlCalendar id="CtlCalendar3" runat="server"></uc1:ctlCalendar>
 
 <asp:Button ID="btn1" OnClick="BtnClicked"  runat="server"/>
 </form>
</body>
</html>