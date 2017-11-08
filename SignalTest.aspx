﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="SignalTest.aspx.cs" Inherits="SignalTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <style type="text/css">
        .theContainer {
            background-color: #99CCFF;
            border: thick solid #808080;
            padding: 20px;
            margin: 20px;
            color:red!important;
        }
    </style> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
     <div class="theContainer">
         <asp:TextBox ID="message"  onkeydown = "return (event.keyCode!=13);" AutoPostBack ="false" runat="server" ClientIDMode="Static" BackColor="LightYellow"></asp:TextBox>
        
        <input type="button" id="sendmessage" value="Send" />
        <input type="hidden" id="displayname" />
        <ul id="discussion">
        </ul>
    </div>
    <!--Script references. -->
    <!--Reference the jQuery library. -->
  <%--  <script src="Scripts/jquery-1.6.4.js" ></script>--%>
    <!--Reference the SignalR library. -->

    <!--Add script to update the page and send messages.--> 
    <script type="text/javascript">
        $(function () {
          
            // Declare a proxy to reference the hub. 
            var chat = $.connection.qAHub;
            // Create a function that the hub can call to broadcast messages.
            chat.client.broadcastMessage = function (name, message) {
                // Html encode display name and message. 
                var encodedName = $('<div />').text(name).html();
                var encodedMsg = $('<div />').text(message).html();
                // Add the message to the page. 
                $('#discussion').append('<li><strong>' + encodedName
                    + '</strong>:&nbsp;&nbsp;' + encodedMsg + '</li>');
            };
            // Get the user name and store it to prepend to messages.
            $('#displayname').val(prompt('Enter your name:', ''));
            // Set initial focus to message input box.  
            $('#message').focus();
            // Start the connection.
            $.connection.hub.start().done(function () {
              
                $('#sendmessage').click(function () {
                    // Call the Send method on the hub. 
                    chat.server.send($('#displayname').val(), $('#message').val());
                    // Clear text box and reset focus for next comment. 
                    $('#message').val('').focus();
                });
            });
        });
    </script>
   

</asp:Content>

