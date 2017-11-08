<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="QASession.aspx.cs" Inherits="QASession" %>
<%@ Import Namespace="QzDB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 
     <script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/knockout/3.4.0/knockout-min.js'></script>
     <script type='text/javascript' src='http://knockoutjs.com/examples/resources/knockout.simpleGrid.3.0.js'></script>
     <script type='text/javascript' src='js/Knockout_mapping.js'></script>
  
   <style type="text/css">
       .qaDivider {
            border-bottom: solid 1px #e1e1e1;
           padding-bottom: 2px;
          
           padding-left: 10px;
           padding-right: 10px;
       }
        .sideTicker {
            list-style: none;
  
            width: 100%;
            height: 100%;
            position: fixed;
            top: 130px;
            right: 0;
            bottom: 0;
            left: 0;
            z-index: 0;
        }
       .site-wrap {
           min-width: 100%;
           min-height: 100%;
           background-color: #fff;
           position: relative;
           top: 0;
           bottom: 100%;
           left: 0;
           z-index: 1;
           padding-top: 2em;
           margin-top: 1em;
         /*  padding: 4em;*/
   
       }
       .nav-trigger {
           position: absolute;
           clip: rect(0, 0, 0, 0);
       }
       label[for="nav-trigger"] {
           position: fixed;
           top: 100px;
           left: 15px;
           z-index: 2;
           width: 30px;
           height: 30px;
           cursor: pointer;
           background-image: url("/images/qrcode-icon.jpg");
           background-size: contain;
       }

       .new-trigger {
           position: absolute;
           clip: rect(0, 0, 0, 0);
       }
       label[for="new-trigger"] {
           position: fixed;
           top: 60px;
           right: 165px;
           z-index: 899999;
           width: 32px;
           height: 32px;
           cursor: pointer;
           background-image: url("/images/icon-question.png");
           background-size: contain;
       }


       .refreshTrigger {
           position: absolute;
           clip: rect(0, 0, 0, 0);
       }
       label[for="refreshTrigger"] {
           position: fixed;
           top: 60px;
            z-index: 899999;
           right: 125px;
           z-index: 2;
           width: 32px;
           height: 32px;
           cursor: pointer;
           background-image: url("/images/refresh-icon.png");
           background-size: contain;
       }
       .incSizeTrigger {
           position: absolute;
           clip: rect(0, 0, 0, 0);
       }
       label[for="incTrigger"] {
           position: fixed;
           top: 60px;
           z-index: 899999;
           right: 85px;
           z-index: 2;
           width: 32px;
           height: 32px;
           cursor: pointer;
           background-image: url("/images/icon-zoom-in.png");
           background-size: contain;
       }

       .decSizeTrigger {
           position: absolute;
           clip: rect(0, 0, 0, 0);
       }
       label[for="decTrigger"] {
           position: fixed;
          top: 60px;
            z-index: 899999;
           right: 45px;
           z-index: 2;
           width: 32px;
           height: 32px;
           cursor: pointer;
           background-image: url("/images/icon-zoom-out.png");
           background-size: contain;
       }


       .nav-trigger:checked + label {
           left: 615px;
       }

       .nav-trigger:checked ~ .site-wrap {
           left: 600px;
           box-shadow: 0 0 5px 5px rgba(0,0,0,0.5);

       }
       .nav-trigger + label, .site-wrap {
           transition: left 0.2s;
       }
       .voteLike {
           width: 40px;
           height: 40px;
           max-width: 40px;
           padding-right: 30px;
           display: inline;
           
           background-image: url(images/yes.png);
        
           vertical-align: text-top  ; 
           font-size: 22px;
           font-weight: bold;
          
       }

  
       .voteDislike {
           width: 40px;
           height: 40px;
           max-width: 40px;
           padding-left: 30px;
           
           background-image: url(images/no.png);
   
           text-align: center; 
           font-size: 22px;
           font-weight: bold;
           
       }
   </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <asp:HiddenField runat="server" ClientIDMode="Static" ID="s_i_d"/>
    <asp:HiddenField runat="server" ClientIDMode="Static" ID="isOwner"/>
    <asp:HiddenField runat="server" ClientIDMode="Static" ID="hfStart"/>
      <asp:Panel ID="msgPanel" Visible="False" runat="server">

            <section class="divider well-5">
            <div class="container wow fadeInRight" data-wow-delay="0.2s">
                <h4>  That Requesting Session is closed or not existing.  </h4>
 
            </div>
        </section>

      </asp:Panel>
    <asp:Panel ID="mainContent" Visible="true" runat="server">
    <asp:Panel ID="plSliding" runat="server" Visible="true">
    <div      id="sidePanel"> 
         
      <ul class="sideTicker">
      <li class="nav-item"> 
          <div data-bind="if: isSessionOwner()">
                <asp:Image ID="qrImg"    border="0" alt="" runat="server"/> 
          </div>
         
          

      </li>
 
    </ul> 
         <!-- ko if: isSessionOwner() -->
          <input type="checkbox" id="nav-trigger"   checked="checked" class="nav-trigger">
        <label title="Toggle the QR Code to scan"   ID="navLabel"  for="nav-trigger"></label>
    <!-- /ko -->
        
          

       

<%--       <asp:CheckBox   ID="nav_trigger" runat="server" Checked="true"  ClientIDMode="Static"  /> 
        <asp:Label ID="navLabel" runat="server" AssociatedControlID="nav_trigger" ClientIDMode="Static" ToolTip="Toggle the QR Code to scan" > </asp:Label>--%>



        <input type="button" id="new-trigger"    class ="new-trigger" onclick='$("#plAuthoring").show(); $("#newQuestion").focus();'  />
<label title="Create New Question" id="new-label" for="new-trigger"></label>
        
        <input type="button" id="refreshTrigger"    class ="refreshTrigger" onclick='bindGrid() '  />
<label title="Refresh" id="new-label" for="refreshTrigger"></label>

              <input type="button" id="incTrigger"    class ="incSizeTrigger" data-bind="click: increaseFont"  />
<label title="Increase Font" id="inclabel" for="incTrigger"></label> 
        


        <input type="button" id="decTrigger"    class ="decSizeTrigger"  data-bind="click: decreaseFont"    />
<label title="Descrease Font" id="decLabel" for="decTrigger"></label>
        


        <div class="site-wrap">
 <div style="min-height: 800px;"   >
 <%--    <label title="tttttt Font" id="dectttLabel" data-bind="text:curSize(),style: { fontSize: curSize() +'px'  }"></label> 
  
      
      --%>
 
   <%--  <div data-bind='simpleGrid: gridViewModel'> </div>--%>
     <div  class="sky-form" data-bind='foreach: items' style="width: 100%!important" >
         

    
     
         
            				
                <section>
                    <div  class="row " style="min-height: 80px;margin-left: 20px" >
                        
                       
                        <div title="Click if you like this question."  data-bind="click: function () { upThis(QestionId); }, attr: { id: 'up_' + QestionId },text: UpVote ,css :'col col-2 voteLike' ">
                          
                        </div>
                         
                        
                        <div class="col col-8">
                          
                            <label class="fa-question-circle" style="color: #f78f20; font-size: 15px;padding-left: 10px;padding-right: 10px"></label>   <span  data-bind="text: Content,style: { fontSize: $root.curSize() + 'px' }">   </span> 
                     
                       
                          
                        </div>

                        <div title="Click if you dislike this question."  data-bind="click: function () { downThis(QestionId); }, attr: { id: 'down_' + QestionId }, text: DownVote, css: 'col col-2 voteDislike' ">
                            
                        </div> 
                    </div>
                    
                      <div  class="row qaDivider" style="min-height:  60px" >
                          
                           <div class="col col-1" style="max-width: 80px >
                                
                                <!-- ko if: $root.isSessionOwner() -->
                                    <label title="Edit  and click to save the answer."  class="fa-comments-o"  style="color: #f78f20; padding-left: 20px; font-size: 35px "
                                         data-bind="click: function () { saveAnswer(QestionId,   Guid); } ">  

                                    </label> 
                                   <!-- /ko -->
                                
                                  <!-- ko ifnot: $root.isSessionOwner() -->
                               
                              
                                    <label title="Answer for this question." class="fa-comments-o"  style="color: #f78f20; font-size: 35px; ">
                                            </label> 
                                <!-- /ko -->

                            </div>
                            <div class="col col-11" >
                                
                                 <!-- ko if: $root.isSessionOwner() -->
                                <div contentEditable="true"     style="background-color:#E3ECF2"  title="Input answer here"
                                       data-bind="text: Answer, attr: { id: 'answer_' + QestionId }, style: { fontSize: $root.curSize() + 'px',minHeight:'40px', border: 'none', width: '100%' }"
                                      
                                      >
                                </div>
                                   <!-- /ko -->
                                
                                  <!-- ko ifnot: $root.isSessionOwner() -->

                                 <div    style="background-color:#E3ECF2" 
                                       data-bind="text: Answer, attr: { id: 'answer_' + QestionId }, style: { fontSize: $root.curSize() + 'px', minHeight: '40px', border: 'none', width: '100%' }"
                                      
                                      >

                                    </div> 
                                  <!-- /ko -->

                                </div>
                          </div>
                          
                </section>
     </div>
 
        
      
 
     <br />
    </div>


        </div>


    </div>
</asp:Panel>


    

    <!--Script references. -->
    <!--Reference the jQuery library. -->
  <%--  <script src="Scripts/jquery-1.6.4.js" ></script>--%>
    <!--Reference the SignalR library. -->

    <!--Add script to update the page and send messages.--> 
    <script type="text/javascript">
        $(function () {

            $(document).on("click", "#btnSubmit", (function () {
            $("#plAuthoring").hide();
            var url = "/svc/newQuestion"; 
            var input =
                {
                    
                            "content": $("#newQuestion").val(),
                            "qaid":$("#s_i_d").val(),
                         
                }
            
                $.ajax({
                    'type': 'POST',
                    'url': url,
                    data:   JSON.stringify(input),
                    dataType: 'json',
                    contentType: "application/json",
                'success': function (response) {
                    processSubmit(response);
                }
            });

                 

           /* $.getJSON(url, "", function (response) {
                processSubmit(response);
            }

                );
*/
           }));


            // Declare a proxy to reference the hub. 
            var chat = $.connection.qAHub;
            // Create a function that the hub can call to broadcast messages.

            //boradcast method
            chat.client.broadcastMessage = function (name, message) {
                // Html encode display name and message. 
                var encodedName = $('<div />').text(name).html();
                var encodedMsg = $('<div />').text(message).html();
                // Add the message to the page. 
                $('#discussion').append('<li><strong>' + encodedName
                    + '</strong>:&nbsp;&nbsp;' + encodedMsg + '</li>');
            };
            // insertNewQuestion
            chat.client.appendNewQuestion = function (json) {
                console.log("appendNewQuestion json=" + json);
             
                var obj = JSON.parse(json); 
                modelData.items.push(obj);
                console.log(obj);

            };


            //upvote a question
            chat.client. upVoteQuestion = function (qaItemId, newCount) {
                console.log("upVoteQuestion qaid=" + qaItemId + " newCount:" + newCount);
             
                $("#up_" + qaItemId).text(newCount);


            };
            //upvote a question
            chat.client.downVoteQuestion = function (qaItemId, newCount) {
                console.log("downVoteQuestion qaid=" + qaItemId);

                $("#down_" + qaItemId).text(newCount);


            };

            chat.client.updateAnswer = function (qaItemId, newAnswer) {
                console.log("updateAnswer  qaid=" + qaItemId +" newAnswer: " +newAnswer );

                $("#answer_" + qaItemId).text(newAnswer);


            };

            // Get the user name and store it to prepend to messages.
          //  $('#displayname').val(prompt('Enter your name:', ''));
            $('#displayname').val('test');
            // Set initial focus to message input box.  
            $('#message').focus();


            // Start the connection.
            $.connection.hub.start().done(function () {
              
                $('#sendmessage').click(function () {
                    // Call the Send method on the hub. 
                    chat.server.send($('#displayname').val(), $('#message').val());
                    // Clear text box and reset focus for next comment. 
                    $('#message').val('').focus();
                });

                var sid = $("#s_i_d").val();
                if (($('#hfStart').val()) == "1") {
                    //start this session
                    chat.server.startSession(sid, "<%= DBHelper.UserID  %>");
                } else {
                    //register to this session
                    chat.server.registerSession(sid );
                }
            });
        });

       
        function processSubmit(response) {
            console.log(response);
            console.log(response.NewQuestionResult.IsSuccess);
            console.log(response.NewQuestionResult.Message);
           
    
          
        }
        function processVoteSubmit(response) {
            console.log(response);
            console.log(response.VoteQuestionResult.IsSuccess);
            console.log(response.VoteQuestionResult.Message);
           
    
          
        }
        function upThis(target) {
            console.log("up qaID:" + target);

            var url = "/svc/VoteQuestion";
            var input =
                {

                    "qaItemId": target,
                    "qaId": $("#s_i_d").val(),
                    "score": "1",

                }

            $.ajax({
                'type': 'POST',
                'url': url,
                data: JSON.stringify(input),
                dataType: 'json',
                contentType: "application/json",
                'success': function (response) {
                    processVoteSubmit(response);
                }
            });

        }
        function downThis(target) {
            console.log("down qaID:" + target);

            var url = "/svc/VoteQuestion";
            var input =
                {

                    "qaItemId": target,
                    "qaId": $("#s_i_d").val(),
                    "score": "-1",

                }

            $.ajax({
                'type': 'POST',
                'url': url,
                data: JSON.stringify(input),
                dataType: 'json',
                contentType: "application/json",
                'success': function (response) {
                    processVoteSubmit(response);
                }
            });
        }
        function saveAnswer(qaid,guid) {
           

            var url = "/svc/SaveAnswer";

           
            
            var input =
                {

                    "qaItemId": qaid,
                    "guid":guid,
                  
                    "answer": $("#answer_" + qaid).text(),

                }
            console.log("save qaID:" + qaid + " input: " + input.answer);
            $.ajax({
                'type': 'POST',
                'url': url,
                data: JSON.stringify(input),
                dataType: 'json',
                contentType: "application/json",
                'success': function (response) {
                  //  processVoteSubmit(response);
                }
            });
        }

        // begin kickout js

        var model = function(items) {

            var self = this;

            self.itemId = ko.observable();
            self.isSessionOwner = ko.observable($("#isOwner").val()=="1");
            self.curSize = ko.observable(15);
            self.imgChecked = ko.observable($("#isOwner").val() == "1");
            self.items = ko.observableArray(items);
            self.increaseFont = function() {
                self.curSize(self.curSize() + 5);
            }
            self.decreaseFont = function() {
                self.curSize(self.curSize() - 5);
            }

            bindGrid();


            //this.gridViewModel = new ko.simpleGrid.viewModel({
            //    data: self.items,
            //    columns: [
            //        { headerText: "Up Votes", rowText: "UpVote" },
            //        { headerText: "Question", rowText: "Content" },
            //        { headerText: "Down Votes", rowText: "DownVote" }
            //    ],
            //    pageSize: 5
            //});

        };
        var modelData = new model();
        ko.applyBindings(modelData);

        function bindGrid( ) {
            var url = "/svc/GetQAList/" + $("#s_i_d").val();
            $.getJSON(url,
                "",
                function (response) {
                    console.log(response);
                    //var nd = JSON.parse(response);
                    modelData.items(response);

                    console.log(self.gridViewModel);
                }
            );
        }

    </script>
   

          <div ID="plAuthoring"  Style=" width:100%;position: fixed;top: 60px;right: 0;left: 0; height:250px; text-align: center; display:none; background-color: whitesmoke; margin:  auto;z-index:8999999" class="wow fadeInUp" >
       
        
           <div   class="sky-form" >
				 
            <h4>Ask a New Question</h4>
				
            <fieldset>					
                <section>
                    <div class="row">
                        
                        
                       <asp:TextBox runat="server" ClientIDMode="Static" CssClass="surveyInput" id="newQuestion" TextMode="MultiLine" required rows="4" style="width:100%">


                       </asp:TextBox>
                            
                            
                         
                      
                    </div>
                </section>
					
                    

                 </fieldset>
                 
                    <footer> 
					 
                <button ID="btnCancel" class="button"  type="button"    onclick='$("#plAuthoring").hide()'  >Cancel</button>
                            <button id="btnSubmit" class="button"     type="button"    >Submit</button>
           <%--     <asp:Button ID="submitFormButton" class="button"   runat="Server"   ClientIDMode="Static" Text="Submit"  OnClick="Submit_Clicked"   >  </asp:Button>--%>
               
            </footer>
                 </div>
        
     
        
        
    </div>
 </asp:Panel>
</asp:Content>

