using QzDB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Main : System.Web.UI.MasterPage
{
    public UpdatePanel MainUpdatePanel
    {
        get { return updatePanel; }
    }
    public MessageBox masterMB
    {
        get { return messageBox; }
    }



    protected void Page_Load(object sender, EventArgs e)
    {


        u_i_d.Value = DBHelper.UserID;

        if (!IsPostBack)
        {
            if (Request.IsAuthenticated)
            {

                    liLogOut.Visible = true;
                    liName.Visible = true;
                   
                liRegister.Visible = false;
                liSignIn.Visible = false;



            }
            else
            {
                    liLogOut.Visible = false;
                    liName.Visible = false;
                    liRegister.Visible = true;
                    liSignIn.Visible = true;
                }

        }
       

            //if (btnStick.UniqueID != Page.Request.Params["__EVENTTARGET"])
            //{
            //     if (Session["timelineShowed"] == "1")
            //            {
            //                CollapseSticky();
            //            }
            //            else
            //            {
            //               ExpandSticky();

            //                Session["timelineShowed"] = "1";
            //            }
            //}
            
       
    }

    

    

 
}
