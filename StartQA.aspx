<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="StartQA.aspx.cs" Inherits="member_StartQA" %>
 <%@ MasterType virtualpath="~/Main.master" %>
<%@ Register Src="~/MessageBox.ascx" TagName="MessageBox" TagPrefix="mb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <script>

        function pageLoad(sender, args) {

            $('#click').click(function () {
                $("#createNewSession").show();
                $("#sessionList").hide();
            });
            $('#clickNew').click(function () {
                $("#createNewSession").show();
                $("#sessionList").hide();
            });

        }
        //$(function () {
        //    $('#click').click(function () {
        //        $("#createNewSession").show();
        //        $("#sessionList").hide();
        //    });
        //    $('#close').click(function () {
        //        $("#createNewSession").hide();
        //        $("#sessionList").show();
        //    });
        //});
        function hideNewSession() {
            $("#createNewSession").hide();
            $("#sessionList").show();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">

     <div id="createNewSession" style="position:fixed;top: 20px;right: 0;left: 0;display:none;">
         <a id="boxclose" href="#" class="close-icon" ></a>
      <section class="well-2 well-2__off">
    <div class="container"  >
           
         <div class="row row__off wow fadeIn">
                    <div class="col-md-1">  </div>       
                       
                    <div class="col-md-10">        
        <div   id="sky-form" class="sky-form" >
				 
            <h4> Create a QA Session</h4>
				
            <fieldset>					
                <section>
                    <div class="row">
                        <label class="label col col-2">Session Topic</label>
                        <div class="col col-6">
                            <label class="input">
                                <i class="icon-append icon-bell"></i>
									 
                                <asp:TextBox ID="tbTopic" class="userName"  name="topic"  minlength="2"  maxlength="200" required placeholder="Topic" runat="server"></asp:TextBox>
                                <b class="tooltip tooltip-top-right">Input Topic</b>
                            </label>
                        </div>
                          <label class="label col col-2">City of Session</label>
                        <div class="col col-2">
                            <label class="input">
                                <i class="icon-append icon-globe"></i>
									 
                                <asp:TextBox ID="tbCity" class="userName"  name="city"  minlength="2"  maxlength="30" required placeholder="City" runat="server"></asp:TextBox>
                                <b class="tooltip tooltip-top-right">Input city</b>
                            </label>
                        </div>
                    </div>
                </section>
					<section>
                    <div class="row">
                        <label class="label col col-12">Session Description</label>
                       
                    </div>
                </section>
               <section>
                    <div class="row">
                         
                          <div class="col col-12">
                            <label class="input">
                                <i class="icon-append icon-file"></i>
									 
                                <asp:TextBox ID="tbDesc" class="userName"  name="desciption" minlength="2"  maxlength="500" required   placeholder="Short Description" runat="server"></asp:TextBox>
                                <b class="tooltip tooltip-top-right">Input description</b>
                            </label>
                        </div>
                    </div>
                </section>
                
					
                <section>
                    <div class="row">
                        <div class="col col-8"></div>
                       
                        <div class="col col-4">
                            <label class="checkbox state-success"><asp:CheckBox   id="chkNeedApprove"   runat="server"/><i></i>Need Approving before published </label>
							 
                        </div>
                    </div>
                </section>
            </fieldset>
            <footer>
				     <asp:Button ID="close"     class="button"   runat="server" Text="Cancel" OnClientClick="hideNewSession();return false;"  />	 
                <asp:Button ID="submitFormButton" class="button"  ClientIDMode="Static"  runat="server" Text="Creat Session" onclick="btnCreationClick" />
           
             <%--   <a runat="server" href="~/Register.aspx"   class="button button-secondary">Register</a>--%>
            </footer>
        </div>
		
		
		
        

        </div>
        <div class="col-md-1">    </div> 
   
    </div>
     </section>
 
     </div>
    <div id="sessionList">
       <section class="well-2 well-2__off">
                <div class="container">
                      <h4> My QA Session List </h4> 
		 	<asp:ListView runat="server" ID="lv" DataKeyNames="QASessionID"  OnPagePropertiesChanging="OnPagePropertiesChanging" OnItemDataBound="Item_DataBound"    >
		 	     <ItemSeparatorTemplate>
            <div class="row divider"  >
                
            </div>
        </ItemSeparatorTemplate>
                 <EmptyDataTemplate>
                  <div class="row">
                      No data available. <input type="button" id='clickNew'  value="Create a New QA Session &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" style="color:#f78f20; font-size: large;"  />
                    </div>
                </EmptyDataTemplate>
                <LayoutTemplate>
                <div  style="color:#f78f20; font-size: large;text-align: right;padding-top: 10px; padding-bottom: 15px;">
                    <input type="button" id='click'  value="Create a New QA Session &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" style="color:#f78f20; font-size: large;"  />
                       
            <asp:DataPager ID="DataPager1" runat="server" PagedControlID="lv"   PageSize="10">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Link"  PreviousPageImageUrl="~/images/checked.png" NextPageImageUrl="~/images/unchecked.png" ShowFirstPageButton="false" ShowPreviousPageButton="true"
                            ShowNextPageButton="false" />
                        <asp:NumericPagerField ButtonType="Link" />
                        <asp:NextPreviousPagerField ButtonType="Link"  ShowNextPageButton="true" ShowLastPageButton="false" ShowPreviousPageButton = "false" />
                    </Fields>
                </asp:DataPager>
                </div>   
                 <div   id="sky-form" class="sky-form">
                     
                        
                              <fieldset>	
                            <div runat="server" id="itemPlaceholder"  >
                                 
                            </div>
                            </fieldset>
                   
                     
                </div>
            
              </LayoutTemplate>
              <ItemTemplate>
                 <section>
                    <div class="row" style="padding-top: 15px;padding-bottom: 15px;">
                        
                        <div class="col col-8" style="padding-right: 30px">
                            
                               <div class="row">
                           <label class="label"><h5>   <asp:LinkButton runat="server" ID="lbEdit"    style="padding-top:  15px"  CommandArgument='<%#Eval("QASessionID")%>' OnClick="Edit_Click"  >
                                                                                  <img runat="server" width ="24"   src="~/images/show.png"/>
                                                                              </asp:LinkButton>
                       <%#Eval("Topic") %></h5>

                           </label>

                                   </div>
                                   <div class="row  "  >
                             
<div  style="padding-left:20px;" >
<asp:TextBox runat="server" ID="lbDesc" Mode="PassThrough" Text='<%#Eval("Description") %>' Enabled="false" style="resize:none" Wrap="true" Rows="3" ReadOnly="true" TextMode="MultiLine"  Width ="100%" BackColor="white" BorderStyle ="None" BorderWidth="0" ></asp:TextBox>
            </div>                       </div>
                                   

                            
                        </div>
                          <div class="col col-4">
                             
                                        <div class="row  ">
                                          
                                      <label class="col col-4 rating"> City: </label>  
                                       <label class="col col-6 sptxt">  <b> <%#Eval("City")%> </b> </label>
                                        <label class="col col-2">  

                             <h5>   <asp:LinkButton runat="server" ID="LinkButton2"    style="padding-top:  15px"  CommandArgument='<%#Eval("QASessionID")%>' OnClick="StartSession_Click"  ToolTip="Start This Session"  >
                                                                                                              <img runat="server" width ="24"   src="~/images/start.png"/>
                                                                                                          </asp:LinkButton>
                                                   </h5>
                                  </label> 
                                  

                   
                        
                        </div> 
                                <div class="row  ">
                                          
                                      <label class="col col-4  "> Creation Time: </label>  
                                       <label class="col col-6  ">  <b> <%#Eval("CreationDT")%> </b> </label>
                                      
                                   <label class="col col-2">  
                                        <h5>   <asp:LinkButton runat="server" ID="LinkButton1"    style="padding-top:  15px"  CommandArgument='<%#Eval("QASessionID")%>' OnClick="Edit_Click"  ToolTip="Edit This Session" >
                                                                                                                          <img runat="server" width ="24"   src="~/images/show.png"/>
                                                                                                                      </asp:LinkButton>
                                          
                                                               </h5> 

                                  </label>  

                   
                        
                        </div> 
                                
                                    
                                    
              	  
                    </div>
                  

                 </section>
                 
           
  </ItemTemplate>
 
		 	</asp:ListView>
				 
						
						    
                    </div>
           
           
        </section>
</div>
</asp:Content>

