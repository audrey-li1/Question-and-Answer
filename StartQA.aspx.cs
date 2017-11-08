using QzDB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utils;

public partial class member_StartQA : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            BindListView( );

        }
    }
    private void BindListView( )
    {
        int uid =Int32.Parse( DBHelper.UserID);
        using(QAEntities entities=new QAEntities())
        {
            lv.DataSource = entities.QASessions.Where(p => p.IsActive == true&&p.UserID==uid).OrderByDescending(p=>p.CreationDT) ;
        lv.DataBind();
        }
      
    }
    protected void btnCreationClick(object sender, EventArgs e)
    {
        string topic = tbTopic.Text.Trim();
        string desc = tbDesc.Text.Trim();
        string city = tbCity.Text.Trim();
        //if (topic.Length == 0)
        //{
        //    Master.masterMB.ShowError("Topic can not be empty", 5000);
        //    return;
        //}
        //if (desc.Length == 0)
        //{
        //    Master.masterMB.ShowError("description can not be empty", 5000);
        //    return;
        //}
        //if (city.Length == 0)
        //{
        //    Master.masterMB.ShowError("city can not be empty", 5000);
        //    return;
        //}
        bool needApprove = chkNeedApprove.Checked;

        DBHelper.CreateSession(topic,desc,city,needApprove);
        BindListView();
        Master.masterMB.ShowSuccess("Session created successfully",5000);

    }

    protected void OnPagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        //(lv.FindControl("DataPager1") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        //this.BindListView(hfSort.Value);
    }
    protected void Edit_Click(object sender, EventArgs eventArgs)
    {
        LinkButton lb = sender as LinkButton;
        string id = lb.CommandArgument;

       // Response.Redirect("~/member/SPCreation.aspx?spid=" + id);
    }

  protected void StartSession_Click(object sender, EventArgs eventArgs)
    {
        LinkButton lb = sender as LinkButton;
        string id = lb.CommandArgument;
      //  Context.Items["qaid"] = id;
        // put the qaid to cache with the user id
        PWCacheMgr.Instance.AddLongTerm("qa_id+"+id, DBHelper.UserID);

        //string code = Util.CreateShortUniqueString();
        string code = id;
        DBHelper.ToggleSession(id,true);
      //  Context.Items["qacode"] = code;
        // put code to  start 
       
    PWCacheMgr.Instance.AddLongTerm("qa_status_"+code,"1");
        Response.Redirect("~/QASession.aspx?code="+ code + "&start="+1);
    //    Server.Transfer("~/QASession.aspx");

    }

    protected void Item_DataBound(object sender, ListViewItemEventArgs e)
    {
        DataPager pager = (DataPager)lv.FindControl("DataPager1");
        pager.Visible = (pager.PageSize < pager.TotalRowCount);
        LinkButton lbAdd = (lv.FindControl("lbAdd")) as LinkButton;

        LinkButton lbEdit = null;
        if (e.Item.ItemType == ListViewItemType.DataItem)
        {
            lbEdit = (LinkButton)e.Item.FindControl("lbEdit");
        }

        if (DBHelper.IsUserAdmin())
        {

            if (lbAdd != null)
            {
                lbAdd.Visible = true;
            }
            if (lbEdit != null)
            {
                lbEdit.Visible = true;
            }


        }
        else
        {

            if (lbAdd != null)
            {
                lbAdd.Visible = false;
            }
            if (lbEdit != null)
            {
                lbEdit.Visible = false;
            }

        }
    }

    
}