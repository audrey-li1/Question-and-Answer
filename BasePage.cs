using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Globalization;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for BasePage
/// </summary>
public class BasePage : Page
{
    protected bool needRandomLimoImage = false;
    protected bool needRandomContentImage = false;
    protected override void InitializeCulture()
    {
        string lang = string.Empty;
        HttpCookie cookie = Request.Cookies["CurrentLanguage"];
        string qstrLang = Request.QueryString["lang"];

       

        if(qstrLang == "zh-CN")
        {
            CultureInfo Cul = CultureInfo.CreateSpecificCulture(qstrLang);

            System.Threading.Thread.CurrentThread.CurrentUICulture = Cul;
            System.Threading.Thread.CurrentThread.CurrentCulture = Cul;

        }else
        {
             if (   cookie != null && cookie.Value != null) 
        {
            lang = cookie.Value;
            CultureInfo Cul = CultureInfo.CreateSpecificCulture(lang);

            System.Threading.Thread.CurrentThread.CurrentUICulture = Cul;
            System.Threading.Thread.CurrentThread.CurrentCulture = Cul;
        }
        else
        {
            if (string.IsNullOrEmpty(lang)) lang = "en-US";
            CultureInfo Cul = CultureInfo.CreateSpecificCulture(lang);

            System.Threading.Thread.CurrentThread.CurrentUICulture = Cul;
            System.Threading.Thread.CurrentThread.CurrentCulture = Cul;

            HttpCookie cookie_new = new HttpCookie("CurrentLanguage");
            cookie_new.Value = lang;
            Response.SetCookie(cookie_new);
        }
        }


       
  

        base.InitializeCulture();
    }

    protected void SetSlogan(string slogan)
    {
        Label sLable = Master.FindControl("lbSlogan") as Label;
        if (sLable != null)
        {
            sLable.Text = slogan ;
        }
    }
    protected override void OnLoadComplete(EventArgs e)
    {
         
        base.OnLoadComplete(e);
    }

    private Control FindAnyControl(string controlId)
    {
        return FindControlReqursive(controlId, this);
    }
    private Control FindControlReqursive(string controlId, Control parent)
    {
        foreach (Control control in parent.Controls)
        {
            Control result = FindControlReqursive(controlId, control);
            if (result != null)
            {
                return result;
            }
        }
        return parent.FindControl(controlId);
    }

    
}