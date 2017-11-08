using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;
using System.Diagnostics;
using System.Threading.Tasks;

public class QAHub : Hub
{

    #region overrided methods
    public Task JoinSession(string qaid)
    {
        return Groups.Add(Context.ConnectionId, qaid);
    }

    public Task LeaveSession(string qaid)
    {
        return Groups.Remove(Context.ConnectionId, qaid);
    }
    public override Task OnConnected()

    {
        var name = Context.User.Identity.Name;
        return base.OnConnected();

    }

    public override Task OnReconnected()

    {

        var name = Context.User.Identity.Name;
        return base.OnReconnected();

    }

    public override Task OnDisconnected(bool stopCalled)

    {

        if (stopCalled)
        {
            
        }
        return base.OnDisconnected(stopCalled);


    }
    #endregion
    public void Hello()
    {
        Clients.All.hello();
    }

    public void Send(string name, string message)
    {
        // Call the broadcastMessage method to update clients.
        Clients.All. broadcastMessage(name, message);
      //  Clients.Others. broadcastMessage(name, message);
    }

    public void AppendNewQuestion(string json,string qaid)
    {
        // only append to certain qa session
      //  List<string> conns = ConnMgr.Instance.GetConnections(qaid);
      Clients.Group(qaid).appendNewQuestion(json);

       // Clients.All.appendNewQuestion(json);
    }

    public void RegisterSession(string qaid)
    {


        JoinSession(qaid);
        string connID = Context.ConnectionId;

        ConnMgr.Instance.RegisterSession(qaid,connID);
       
        
    }
    public void StartSession(string qaid, string uid)
    {
        JoinSession(qaid);
        string connID = Context.ConnectionId;
        
 ConnMgr.Instance.StartSession(qaid,uid,connID);
    }

    public void StopSession(string qaid)
    {
        LeaveSession (qaid); 
         ConnMgr.Instance. StopSession(qaid,Context.ConnectionId );
    }


}

public class ErrorHandlingPipelineModule : HubPipelineModule
{
    protected override void OnIncomingError(ExceptionContext exceptionContext, IHubIncomingInvokerContext invokerContext)
    {
        Debug.WriteLine("=> Exception " + exceptionContext.Error.Message);
        if (exceptionContext.Error.InnerException != null)
        {
            Debug.WriteLine("=> Inner Exception " + exceptionContext.Error.InnerException.Message);
        }
        base.OnIncomingError(exceptionContext, invokerContext);

    }
}
