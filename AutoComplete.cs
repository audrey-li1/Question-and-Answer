using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// Summary description for AutoComplete
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
  [System.Web.Script.Services.ScriptService]
public class AutoComplete : System.Web.Services.WebService {

    public AutoComplete () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

//[System.Web.Script.Services.ScriptMethod()]
//[System.Web.Services.WebMethod]
// public string[] GetCollegeList(string prefixText, int count)
 
//    {
 
//        if (count == 0)
 
//        {
 
//            count = 10;
 
//        }

//       var list = PWCacheMgr.Instance.CollegeList;
//    string lowerTxt = prefixText.ToLower();
//    return list.Where(c => c.ToLower().Contains(lowerTxt )).Take(count).ToArray();

      
 
//    }
    
}
