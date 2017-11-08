using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MessageBox : System.Web.UI.UserControl
{

    public bool ShowCloseButton { get; set; }
    public int AutoCloseTimeout { get; set; }
    public string WrapperElementID { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (String.IsNullOrEmpty(WrapperElementID))
            WrapperElementID = "MessageBoxWrapper";

        if (ShowCloseButton)
            CloseButton.Attributes.Add("onclick",
                                       "document.getElementById('" + MessageBoxInterface.ClientID +
                                       "').style.display = 'none'");
    }

    public void ShowError(string message)
    {
        ShowError(message, AutoCloseTimeout);
    }

    public void ShowError(string message, int timeout)
    {
        Show(MessageType.Error, message, timeout);
    }

    public void ShowInfo(string message)
    {
        ShowInfo(message, AutoCloseTimeout);
    }

    public void ShowInfo(string message, int timeout)
    {
        Show(MessageType.Info, message, timeout);
    }

    public void ShowSuccess(string message)
    {
        ShowSuccess(message, AutoCloseTimeout);
    }

    public void ShowSuccess(string message, int timeout)
    {
        Show(MessageType.Success, message, timeout);
    }

    public void ShowWarning(string message)
    {
        ShowWarning(message, AutoCloseTimeout);
    }

    public void ShowWarning(string message, int timeout)
    {
        Show(MessageType.Warning, message, timeout);
    }

    private void Show(MessageType messageType, string message, int timeout)
    {
        AutoCloseTimeout = timeout;
        CloseImage.Visible = ShowCloseButton;
        CloseButton.Visible = ShowCloseButton;
        AlertMessage.Text = message;

        MessageBoxInterface.CssClass = MessageBoxInterface.CssClass + " " + messageType.ToString().ToLower() + "Msg";
        MessageBoxInterface.Visible = true;
    }

    private enum MessageType
    {
        Error = 1,
        Info = 2,
        Success = 3,
        Warning = 4
    }
}