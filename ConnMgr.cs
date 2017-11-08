using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ConnMgr
/// </summary>
public class ConnMgr
{
    //sessionConnectionMap, key sessionId, value a list of all connection ID in this qa session
    Dictionary<string, List<string>> sessionConnectionMap = new Dictionary<string, List<string>>();
    //OwnerConnectionMap , key connecionID, value uid of owner 
    Dictionary<string, string> ownerConnectionMap = new Dictionary<string, string>();
    private static ConnMgr instance=new ConnMgr();
    private ConnMgr()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static ConnMgr Instance
    {
        get
        {
            return instance;
            
        }
    }
    public void RegisterSession(string qaid, string connID)
    {
        
        List<String> connIds = null;
        if (sessionConnectionMap.TryGetValue(qaid, out connIds))
        {
            if (!connIds.Contains(connID))
            {
                connIds.Add(connID);
            }
        }

    }

    public List<string> GetConnections(string qaid)
    {
        List < string > connIds= new List<string>();
        sessionConnectionMap.TryGetValue(qaid, out connIds);
        return connIds;
    }
    public void StartSession(string qaid, string uid, string connID)
    {
       
        List<String> connIds = null;
        if (sessionConnectionMap.TryGetValue(qaid, out connIds))
        {
            if (!connIds.Contains(connID))
            {
                connIds.Add(connID);
            }
        }
        else
        {
            connIds = new List<string>();
            connIds.Add(connID );
            sessionConnectionMap.Add(qaid, connIds);

        }
        if (ownerConnectionMap.ContainsKey(connID))
        {
            ownerConnectionMap[connID] = uid;
        }
        else
        {
            ownerConnectionMap.Add(connID, uid);
        }
    
    }

    public void StopSession(string qaid, string connID)
    {
        sessionConnectionMap.Remove(qaid);
        ownerConnectionMap.Remove(connID);


    }


}