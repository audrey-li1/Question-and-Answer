<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MessageBox.ascx.cs" Inherits="MessageBox" %>
 <div id="<%= WrapperElementID %>" class="MessageBoxWrapper">
        <asp:Panel ID="MessageBoxInterface" runat="server" CssClass="MessageBoxInterface" onclick="$(this).hide();" Visible="false" EnableViewState="false">
            <script type="text/javascript">
                $(document).ready(function() {
                    if(<%= AutoCloseTimeout %> > 0)
                        $('#<%= MessageBoxInterface.ClientID %>').delay(<%= AutoCloseTimeout %>).slideUp(300);
                });
            </script>
            <div align="right">

                <asp:HyperLink ID="CloseButton" runat="server" Visible="false">
                    <asp:Image ID="CloseImage" Visible="false" runat="server" AlternateText="Hide Alert Message" ImageUrl="~/Images/MessageBox_close.png" />
                </asp:HyperLink>
            </div>
            <p>
                <asp:Literal ID="AlertMessage" runat="server"></asp:Literal>
            </p>
        </asp:Panel>
    </div>
