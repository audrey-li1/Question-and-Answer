using Microsoft.AspNet.SignalR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utils;
public partial class Test1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Button1.Text =   Util.CreateShortUniqueString() ;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        var hubContext = GlobalHost.ConnectionManager.GetHubContext<QAHub>();
        hubContext.Clients.  All.broadcastMessage("tt", DateTime.Now.ToString());


    }
}