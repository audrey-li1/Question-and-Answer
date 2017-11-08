using System;
using System.Threading.Tasks;
using Microsoft.Owin;
using Owin;
using Microsoft.AspNet.SignalR;

[assembly: OwinStartup(typeof(Startup))]

public class Startup
{
    public void Configuration(IAppBuilder app)
    {
        // For more information on how to configure your application, visit http://go.microsoft.com/fwlink/?LinkID=316888
        //   app.MapSignalR("/~/signalr/js",new Microsoft.AspNet.SignalR.HubConfiguration());
        var conf = new Microsoft.AspNet.SignalR.HubConfiguration();
            conf.EnableDetailedErrors = true;
        GlobalHost.HubPipeline.AddModule(new ErrorHandlingPipelineModule());
        app.MapSignalR(conf );
    }
}
