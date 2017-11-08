using System;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class PopupCalendar : System.Web.UI.UserControl
{
  
    private void Page_Load(object sender, System.EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            this.TextBox1.Text = System.DateTime.Now.ToShortDateString();
            this.pnlCalendar.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
        }
        else
        {
            string para = Page.Request.Form["__EVENTTARGET"];
            string id=para;
            if (para.IndexOf(":") > -1)
            {
                id = para.Substring(0, para.IndexOf(":"));

            }
 
            if (id != this.ID)
            {
                this.pnlCalendar.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
            }
            else
            {
                this.pnlCalendar.Attributes.Add("style", "POSITION: absolute");
            }

        }
        var did = this.ID;
        var clid = this.ClientID;
      UpdatePanel up=  Page.Master.FindControl("updatePanel") as UpdatePanel;
        ScriptManager.RegisterStartupScript(up, up.GetType(), "Script_Panel" + this.ClientID, "<script> function On" + this.ID + "Click() {  if(" +  "pnlCalendar.style.display == \"none\")     " +  "pnlCalendar.style.display = \"\";   else    " +  "pnlCalendar.style.display = \"none\"; } </script>", false);
 
        this.Button1.Attributes.Add("OnClick", "On" + this.ID + "Click()");

    }

    #region Web Form Designer generated code
    override protected void OnInit(EventArgs e)
    {
        //
        // CODEGEN: This call is required by the ASP.NET Web Form Designer.
        //
        InitializeComponent();
        base.OnInit(e);
    }

    /// <summary>
    ///		Required method for Designer support - do not modify
    ///		the contents of this method with the code editor.
    /// </summary>
    private void InitializeComponent()
    {
        this.Calendar1.SelectionChanged += new System.EventHandler(this.Calendar1_SelectionChanged);
        this.Load += new System.EventHandler(this.Page_Load);

    }
    #endregion

    private void Calendar1_SelectionChanged(object sender, System.EventArgs e)
    {
        this.TextBox1.Text = Calendar1.SelectedDate.ToShortDateString();
        this.pnlCalendar.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
    }

    public DateTime SelectedDate
    {
        get { return Calendar1.SelectedDate; }
        set { Calendar1.SelectedDate = value;
            Calendar1_SelectionChanged(null, null);
        }
    }
}