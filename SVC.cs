using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Web.Script.Services;
using System.Web.Services;
using Microsoft.AspNet.SignalR;
using Newtonsoft.Json;
using QzDB;

/// <summary>
///     Summary description for SVC
/// </summary>
[ServiceContract]
[AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
[ServiceBehavior(InstanceContextMode = InstanceContextMode.PerCall)]
public class SVC
{
    [WebInvoke(UriTemplate = "GetQAList/{aqid}", Method = "GET")]
    public List<QuestionItem> GetQAList(string aqid)
    {
        var result = new List<QuestionItem>();
        var id = long.Parse(aqid);
        using (var entities = new QAEntities())
        {
            var items = entities.QAItems.Where(q => q.SessionID == id).OrderByDescending(q=>q.UpVoteCount).ThenByDescending( q => q.CreationDT);

            foreach (var qaItem in items)
            {
                result.Add(new QuestionItem
                {
                    Answer = qaItem.Answer,
                    QestionId = qaItem.QAItemID,
                    UpVote = qaItem.UpVoteCount,
                    DownVote = qaItem.DownVoteCount,
                    Content = qaItem.QAContent,
                    Guid = qaItem.QASession.Guid.Replace('-','_'),
                    CreationDateTime = qaItem.CreationDT
                });
            }
        }


        //var entity = new QuestionItem()
        //{
        //    Name = DateTime.Now.Ticks.ToString(),
        //    Row = DateTime.Now.Millisecond
        //};

        return result;
    }

    //[WebInvoke(UriTemplate = "nq", Method = "POST",ResponseFormat = WebMessageFormat.Json,RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Wrapped)]
    //public QAResponse CreateQuestion(QuestionItem qaItem)
    //{
    //    var result = new QAResponse();

    //    string msg = null;
    //    long sid = qaItem.qaid;
    //    //if (!long.TryParse("17", out sid))
    //    //{

    //    //    result.Message = "Invlid QA Session ID";
    //    //   // return result.ToJson();
    //    //    return result ;
    //    //} 

    //    try
    //    {
    //        using (var entities = new QAEntities())
    //        {
    //            var item = new QAItem
    //            {
    //                QAContent = qaItem.content,
    //                SessionID = sid,
    //                Answer = "",
    //                CreationDT = DateTime.Now,
    //                IsActive = true
    //            };
    //            entities.AddToQAItems(item);
    //            entities.SaveChanges();
    //        }
    //          result.IsSuccess = true;
    //    }
    //    catch (Exception ex)
    //    {
    //        result.Message = ex.Message;
    //    }

    //  //  return result.ToJson();
    //    return result ;
    //}
    [WebInvoke(UriTemplate = "VoteQuestion", Method = "POST", ResponseFormat = WebMessageFormat.Json,
        RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Wrapped)]
    public QAResponse VoteQuestion(string qaItemId, string score, string qaId)
    {
        var result = new QAResponse();
        long sessionId = 0;
        if (!long.TryParse(qaId, out sessionId))
        {
            result.Message = "sessionId Id is not found.";

            return result;
        }
        long id = 0;
        if (!long.TryParse(qaItemId, out id))
        {
            result.Message = "Item Id is not found.";
            return result;
        }
        // score: 1 up, -1 for down


        //update database
        using (var entities = new QAEntities())
        {
            var item = entities.QAItems.FirstOrDefault(q => q.QAItemID == id);

            if (item.QASession.QASessionID != sessionId)
            {
                result.Message = "Session and item does not match.";
                return result;
            }
            if (item == null)
            {
                return result;
            }

            if (score == "1")
            {
                item.UpVoteCount += 1;
            }
            else if (score == "-1")
            {
                item.DownVoteCount += 1;
            }
            else
            {
                result.Message = "In valide vote";
                return result;
            }

            entities.SaveChanges();


            //need to broadcast the result
         
            try
            {
                var hubContext = GlobalHost.ConnectionManager.GetHubContext<QAHub>();
                if (score == "1")
                {
                   // hubContext.Clients.Group(qaId).upVoteQuestion(qaItemId, item.UpVoteCount.ToString());
                    hubContext.Clients .All.upVoteQuestion(qaItemId, item.UpVoteCount.ToString());
                }
                else if (score == "-1")
                {
                    //hubContext.Clients.Group(qaId).downVoteQuestion(qaItemId, item.DownVoteCount.ToString());
                    hubContext.Clients .All.downVoteQuestion(qaItemId, item.DownVoteCount.ToString());
                }
            }
            catch (Exception ex)
            {
                result.IsSuccess = false;
                result.Message = ex.Message;
            }
        }
        result.IsSuccess = true;
        result.Message = "";
        return result;
    }


    [WebInvoke(UriTemplate = "SaveAnswer", Method = "POST", ResponseFormat = WebMessageFormat.Json,
        RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Wrapped)]
    public QAResponse SaveAnswer(string qaItemId, string answer, string guid)
    {
        var result = new QAResponse();
        long sessionId = 0;
       
        long id = 0;
        


        if (!long.TryParse(qaItemId, out id))
        {
            result.Message = "Item Id is not found.";
            return result;
        }
        // score: 1 up, -1 for down


        //update database
        using (var entities = new QAEntities())
        {
            var item = entities.QAItems.FirstOrDefault(q => q.QAItemID == id);

            if (!item.IsActive)
            {
                
                result.Message = "QA session is not active.";
                return result;
            }

            if (item.QASession.Guid.Replace('-', '_') != guid)
            {
                result.Message = "Not authorized to save answer.";
                return result;
            }

           
            if (item == null) 
            {
                return result;
            }

            item.Answer = answer;

            entities.SaveChanges();


            //need to broadcast the result

            try
            {
                var hubContext = GlobalHost.ConnectionManager.GetHubContext<QAHub>();
                
                    //hubContext.Clients.Group(qaId).downVoteQuestion(qaItemId, item.DownVoteCount.ToString());
                    hubContext.Clients.All.updateAnswer(qaItemId, answer);
                
            }
            catch (Exception ex)
            {
                result.IsSuccess = false;
                result.Message = ex.Message;
            }
        }
        result.IsSuccess = true;
        result.Message = "";
        return result;
    }
    [WebInvoke(UriTemplate = "newQuestion", Method = "POST", ResponseFormat = WebMessageFormat.Json,
        RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Wrapped)]
    public QAResponse NewQuestion(string content, string qaid)
    {
        //WebOperationContext.Current.OutgoingResponse.Format = WebMessageFormat.Json;
        var result = new QAResponse();

        string msg = null;
        long sid = 0;
        if (!long.TryParse(qaid, out sid))
        {
            result.Message = "Invlid QA Session ID";
            // return result.ToJson();
            return result;
        }
        var now = DateTime.Now;
        long newId = 0;
        try
        {
            using (var entities = new QAEntities())
            {
                var item = new QAItem
                {
                    QAContent = content,
                    SessionID = sid,
                    Answer = "",
                    CreationDT = now,
                    IsActive = true
                };
                entities.QAItems.AddObject( item);
                entities.SaveChanges();
                newId = item.QAItemID;
            }

            result.IsSuccess = true;
        }
        catch (Exception ex)
        {
            result.Message = ex.Message;
        }

        //  return result.ToJson();

        var questionItem = new QuestionItem
        {
            Content = content,
            QestionId = newId,
            Answer = "",
            DownVote = 0,
            UpVote = 0,
            CreationDateTime = now
        };

        var qaHub = new QAHub();
        try
        {
            var hubContext = GlobalHost.ConnectionManager.GetHubContext<QAHub>();
            hubContext.Clients.Group(qaid).appendNewQuestion(questionItem.ToJson());
        }
        catch (Exception ex)
        {
            result.IsSuccess = false;
            result.Message = ex.Message;
        }

        return result;
    }

    [WebInvoke(UriTemplate = "regUser/{userName}/{email}/{password}", Method = "GET")]
    public string RegisterUser(string userName, string email, string password)
    {
        var entity = new RegisterEntity
        {
            CellPhone = "N/A",
            Email = email,
            FirstName = "N/A",
            Password = password,
            LastName = "N/A",
            UserName = userName
        };


        var json = JsonConvert.SerializeObject(entity, Formatting.Indented);


        return json;
    }

    [ScriptMethod]
    [WebMethod]
    [WebInvoke(UriTemplate = "reg", Method = "POST")]
    public string Register(RegisterEntity entity)
    {
        /*    JObject o = JObject.Parse(registerContent);

           
           RegisterEntity entity = new RegisterEntity()
                                        {

                                            CellPhone = (string) o["CellPhone"],
                                            Email = (string) o["Email"],
                                            FirstName = (string) o["FirstName"],
                                            Password = (string) o["Password"],
                                            LastName = (string) o["LastName"],
                                            UserName = (string) o["UserName"],


                                        };*/
        entity.Password = "neeeee";

        var json = JsonConvert.SerializeObject(entity, Formatting.Indented);

        // RegisterEntity entity = JsonConvert.DeserializeObject<RegisterEntity>(registerContent);

        return json;
    }

    //    {
    //    var entity = new QAEntity
    //{
    //public string Test(string input)

    //[WebInvoke(UriTemplate = "upd/{input}", Method = "GET")]
    //        Name = DateTime.Now.Ticks.ToString(),
    //        Row = DateTime.Now.Millisecond
    //    };


    //    var json = JsonConvert.SerializeObject(new[] {entity, entity}, Formatting.Indented);


    //    return json;
    //}
}

public class RegisterEntity
{
    public string UserName { get; set; }
    public string Email { get; set; }
    public string CellPhone { get; set; }
    public string Password { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
}

//public class QuestionEntity
//{
//public string content { get; set; }
//public int qaid { get; set; }


//}
public class QuestionItem
{
    public long QestionId { get; set; }
    public string Content { get; set; }
    public string Answer { get; set; }
    public string Guid { get; set; }
    public int UpVote { get; set; }
    public int DownVote { get; set; }
    public DateTime CreationDateTime { get; set; }

    public string ToJson()
    {
        return JsonConvert.SerializeObject(this, Formatting.Indented);
    }
}

public class PartyEntity
{
    public string UserName { get; set; }
    public string Course { get; set; }
    public string Location { get; set; }
    public DateTime Time { get; set; }
}

public class QAResponse
{
    public bool IsSuccess { get; set; }
    public string Message { get; set; }

    public string ToJson()
    {
        return JsonConvert.SerializeObject(this, Formatting.Indented);
    }
}