using QzDB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utils;
using QRLib;
using System.Diagnostics;

public partial class QASession : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
      //  string qaid = Request["qaid"] as string;// from owner
       
        string code = Request["code"];// from public , this is actually qaid
       
      //  nav_trigger.InputAttributes.Add("class", "nav-trigger");
        if (code == null)
        {
            msgPanel.Visible = true;
            mainContent.Visible = false;
            return;
        }

        s_i_d.Value =  code ;
        if (!Page.IsPostBack)
        {
            //check if the qaid is for loggin user

             string uid = PWCacheMgr.Instance.Get("qa_id+" + code) as string;

                //if uid is null , get from db then put back to cache

                if (uid == null)
                {
                    try
                    {
                        uid = DBHelper.GetUserID(code);
                        if (uid == DBHelper.UserID)
                        {
                            PWCacheMgr.Instance.AddLongTerm("qa_id+" + uid, DBHelper.UserID);
                        }
                    }
                    catch (Exception ex)
                    {
                        
                    }

                }



            bool fromOwner = uid == DBHelper.UserID;
             
           string isExpired = PWCacheMgr.Instance.Get("qa_status_" + code) as string;

            if (isExpired == null)
            {

                //try to get from DB
                if (DBHelper.GetSessionStarted(code))
                {
                    isExpired = "1";
                    // active
                 
                }
                else
                {
                    isExpired = "0";
                    //not active
                   
                }
                PWCacheMgr.Instance.AddLongTerm("qa_status_" + code, isExpired);

            }
          
            if ( isExpired != "1")
            {
                //expired qa
                msgPanel.Visible = true;
                mainContent.Visible = false;
            }
            else
            {
                msgPanel.Visible = false;
                mainContent.Visible = true;
            }



            //  nav_trigger.Checked = true;
            if (fromOwner  )
            {
                //this request from session owner, showing side bar
                isOwner.Value =  "1";
              //   navLabel.Visible = true;
             //   nav_trigger.Checked = true;
                //if the request is from owner, set start identifer
                string qStart = Request["start"]; 
              hfStart.Value = qStart;   
            }
            else
            {
                isOwner.Value = "0";
           //       nav_trigger.Checked = false;
          //    navLabel.Visible = false;

              
            }
           
            Debug.WriteLine("code="+ code);
            string appPath = Request.Url.Scheme + System.Uri.SchemeDelimiter + Request.Url.Host + (Request.Url.IsDefaultPort ? "" : ":" + Request.Url.Port) + "/" + code;
            string pngImg = null;
            using (QREncoder qrEncoder = new QREncoder())
            {
                qrEncoder.Size = 600;
 qrEncoder.Encode(appPath, QRCodeType.URI); 

                var img = qrEncoder.GetImage();
                
                 pngImg = ImageUtil.ImageToBase64(img);

            }


            if (pngImg != null)
            {
                qrImg.ImageUrl = String.Format("data:image/png;base64,{0}", pngImg);
            }

        }
        else
        {

        }
       
    }
 public void Test_Click(object sender, EventArgs e)
    {
        int uid=DBHelper.UserIDInt;
        string content = newQuestion.Text;

    }
    public void  Submit_Clicked(object sender, EventArgs e)
    {
        int uid=DBHelper.UserIDInt;
        string content = newQuestion.Text;
      //  plAuthoring.Style.Add("display","none");

    }
}