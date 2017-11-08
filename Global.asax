﻿ <%@ Application Language="C#" %>
<%@ Import Namespace="System.Security.Principal" %>
<%@ Import Namespace="System.ServiceModel.Activation" %>
<%@ Import Namespace="System.Web.Routing" %>

<script runat="server">
    
    protected void Application_AuthenticateRequest(Object sender, EventArgs e)
    {
        string cookieName = FormsAuthentication.FormsCookieName;
        HttpCookie authCookie = Context.Request.Cookies[cookieName];

        if (null == authCookie)
        {
            // There is no authentication cookie.
            //Server.Transfer("login.aspx");
            return;
        }
        FormsAuthenticationTicket authTicket = null;
        try
        {
            authTicket = FormsAuthentication.Decrypt(authCookie.Value);
        }
        catch (Exception ex)
        {
            // Log exception details (omitted for simplicity)
            return;
        }

        if (null == authTicket)
        {
            // Cookie failed to decrypt.
            return;
        }

        // When the ticket was created, the UserData property was assigned a
        // pipe delimited string of role names.
        string[] roles = authTicket.UserData.Split(new char[] {'|'});
        // Create an Identity object
        FormsIdentity id = new FormsIdentity(authTicket);

        // This principal will flow throughout the request.
        GenericPrincipal principal = new GenericPrincipal(id, roles);
        // Attach the new principal object to the current HttpContext object
        Context.User = principal;
    }

    void Application_Start(object sender, EventArgs e) 
    {
     //    RouteTable.Routes.MapHubs();
        // Code that runs on application startup
        RegisterRoutes(RouteTable.Routes);

    }
    private void RegisterRoutes(RouteCollection routes)
    {
        // Edit the base address of QRS by replacing the "QRS" string below
        routes.Add(new ServiceRoute("SVC", new WebServiceHostFactory(), typeof(SVC)));
         routes.MapPageRoute("Survey", "survey", "~/Survey.aspx");
         routes.MapPageRoute("qa", "qa", "~/QASession.aspx");
 
        




    }
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       

</script>
