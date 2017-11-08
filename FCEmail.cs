using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Xml;

/// <summary>
/// Summary description for HaloEmail
/// </summary>
  public enum EmailType

    {
         QuoteSent ,
         QuoteChanged, 
         ReservationCreated, 
         ReservationChanged, 
         ReservationConfirmed,
         ReservationConcelled,
         UserCreated,
         PasswordReset,
         PasswordRetrieved,
         HaloNotification,
         VehicleDispatched,
         InvoiceProduced,
         TripCompleted ,
         CreditCardCharged ,
         CreditCardFailed ,

    }
public class HaloEmail
{
     XmlDocument  xmlDocument =new XmlDocument();
    private string templateContent = null;
   private static HaloEmail instance=new HaloEmail();    

	private HaloEmail()
	{
        string root = HttpContext.Current.Server.MapPath("~/");
        xmlDocument.Load(root + "\\EmailContent.xml");
         using (FileStream fs = new FileStream(root+@"\Email-template.htm", FileMode.Open))
        {
            StreamReader sr = new StreamReader(fs);
            
            templateContent=  sr.ReadToEnd();
          

        }

	}

    public static HaloEmail Instance
    {
        get { return instance; }
    }
    public string GetTemplate(EmailType EmailType,out string subject )
    {
         
        return GetTemplate(EmailType, "en",out subject);
    }
    public string GetTemplate(string EmailType,out string subject)
    {
 
        return GetTemplate(EmailType, "en",out subject);
    }
    public string GetTemplate(EmailType EmailType, string language,out string subject)
    { 
        
        return GetTemplate(EmailType.ToString(), language,out subject );

    }
    public string GetTemplate(string EmailType, string language,out string subject)
    {
        string result = null;
        subject = null;
        XmlNode node = xmlDocument.SelectSingleNode("//Language[@value='" + language + "']");

        if (node == null)
            return result;

        XmlNode tempNode = node.SelectSingleNode("EmailType[@type='" + EmailType  + "']");

        if (tempNode == null)
            return result;

        var xmlAttribute = tempNode.Attributes["subject"];
        if(xmlAttribute!=null)
        {
             
            subject = xmlAttribute.Value;
        }
      
        return tempNode.InnerXml;

    }
 public string GetSubject(string EmailType, string language)
    {
        string result = null;
        XmlNode node = xmlDocument.SelectSingleNode("//Language[@value='" + language + "']");

        if (node == null)
            return result;

        XmlNode tempNode = node.SelectSingleNode("EmailType[@type='" + EmailType  + "']");

        if (tempNode == null)
            return result;

        return tempNode.Attributes["subject"].Value;

    }
 public string GetSubject(string EmailType )
 {


     return GetSubject(EmailType, "en");

 }

    public void SendForgotPasswordEmail()
    {
        
    }

    public void SendNewUserCreationEmail(string email, string userName,string password)
    {
        string subject = null;
        string content = GetTemplate(EmailType.UserCreated,out subject );

        content = string.Format(content, userName, password);

        string emailContent = string.Format(templateContent, userName, email, content);
        MsgMgr.GetInstance().SendMsg(email,  subject,emailContent);

    }


}