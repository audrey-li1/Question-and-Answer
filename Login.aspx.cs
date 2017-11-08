using QzDB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = "Sign in";
    }

    protected void btnSignIn_Click(object sender, EventArgs e)
    {
        var tt = Request.Form["chkRemember"];
        string userName = tbUserName.Text.Trim();
        string password = tbPassword.Text.Trim();
        //if (userName.Length == 0)
        //{
        //    Master.masterMB.ShowError("User Name required", 5000);

        //    return;
        //}
        //if (password.Length == 0)
        //{
        //    Master.masterMB.ShowError(" Password required", 5000);
        //    return;
        //}

        ////  User haloUser = DataHelper.Instance.GetUser(userName, password);
        UserEntity haloUser = null;
       haloUser= DBHelper.Instance.GetUserEntity(userName, password);
        //if (haloUser == null)
        //{
        //    Master.masterMB.ShowError("User name and password does not match.", 5000);
        //    return;
        //}
        ////cache the user
        //PWCacheMgr.Instance.Add(haloUser.UserID.ToString(), haloUser);
        //Master.masterMB.ShowSuccess("Signed in successfully.", 5000);

        if (haloUser.RoleName == FCConstant.Role_User)
        {
            Session[FCConstant.Targeted_User] = haloUser.UserID.ToString();
            Session[FCConstant.Targeted_UserName] = haloUser.UserName ;
        }

        if (tt != null)
        {
            Response.Cookies.Clear();
        }

        DateTime expiryDate = DateTime.Now.AddDays(30);

        //create a new forms auth ticket
        FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, haloUser.UserID + "|" + haloUser.UserName, DateTime.Now, expiryDate, true, haloUser.RoleName);

        //encrypt the ticket
        string encryptedTicket = FormsAuthentication.Encrypt(ticket);

        //create a new authentication cookie - and set its expiration date
        HttpCookie authenticationCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);
        authenticationCookie.Expires = ticket.Expiration;

        //add the cookie to the response.
        Response.Cookies.Add(authenticationCookie);

        string returnUrl = FormsAuthentication.GetRedirectUrl(userName, true);
        if (string.IsNullOrEmpty(returnUrl)) returnUrl = "Default.aspx";
        Response.Redirect(returnUrl);


        //FormsAuthenticationTicket authTicket = new
        //FormsAuthenticationTicket(1, haloUser. UserID + "|" + haloUser.UserName, DateTime.Now, DateTime.Now.AddMinutes(60), false, haloUser.RoleName);

        //// Now encrypt the ticket.
        //string encryptedTicket = FormsAuthentication.Encrypt(authTicket);
        //// Create a cookie and add the encrypted ticket to the
        //// cookie as data.
        //HttpCookie authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);

        //// btnLogin.Focus();
        ////win.Visible = false;

        //Response.Cookies.Add(authCookie);

        //Response.Redirect(FormsAuthentication.GetRedirectUrl(haloUser. UserID + "|" + haloUser.UserName, false));
    }

    //protected void btnForgotPassword_Click(object sender, EventArgs e)
    //{
    //    fpPanel.Visible = true;
    //}

    //protected void btnSendPassowrd_Click(object sender, EventArgs e)
    //{
    //    string email = tbEmail.Text;


    //}
}