<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>
 <%@ MasterType virtualpath="~/Main.master" %>
<%@ Register Src="MessageBox.ascx" TagName="MessageBox" TagPrefix="mb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
		 
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
      
      <section class="well-2 well-2__off">
    <div class="container">
           
         <div class="row row__off wow fadeIn">
                    <div class="col-md-3">  </div>       
                       
                    <div class="col-md-6">        
        <div   id="sky-form" class="sky-form">
				 
            <h4> Login Form</h4>
				
            <fieldset>					
                <section>
                    <div class="row">
                        <label class="label col col-6">User Name</label>
                        <div class="col col-6">
                            <label class="input">
                                <i class="icon-append icon-user"></i>
									 
                                <asp:TextBox ID="tbUserName" class="userName"  name="userName"  placeholder="User Name" runat="server"></asp:TextBox>
                                <b class="tooltip tooltip-top-right">Input User Name</b>
                            </label>
                        </div>
                    </div>
                </section>
					
                <section>
                    <div class="row">
                        <label class="label col col-6">Password</label>
                        <div class="col col-6">
                            <label class="input">
                                <i class="icon-append icon-lock"></i>
                                <asp:TextBox ID="tbPassword" TextMode="Password" class="pwd" placeholder="Password" name="password" runat="server"></asp:TextBox>
                                <b class="tooltip tooltip-top-right">Input Password</b>
								 
                            </label>
                            <div class="note"><a href="#sky-form2" class="modal-opener">Forgot password?</a></div>
                        </div>
                    </div>
                </section>
					
                <section>
                    <div class="row">
                        <div class="col col-2"></div>
                        <div class="col col-10">
                            <label class="checkbox state-success"><input type="checkbox" id="chkRemember" name="chkRemember"><i></i>Keep me logged in </label>
							 
                        </div>
                    </div>
                </section>
            </fieldset>
            <footer>
					 
                <asp:Button ID="btnSignIn" class="button"  runat="server" Text="Sign In" onclick="btnSignIn_Click" />
             <%--   <a runat="server" href="~/Register.aspx"   class="button button-secondary">Register</a>--%>
            </footer>
        </div>
		
		
		
        <div action="demo-recovery.php" id="sky-form2" class="sky-form sky-form-modal">
            <header>Password recovery</header>
			
            <fieldset>					
                <section>
                    <label class="label">E-mail</label>
                    <label class="input">
                        <i class="icon-append icon-user"></i>
                        <input type="email" name="email" id="email">
                    </label>
                </section>
            </fieldset>
			
            <footer>
                <button type="submit" name="submit" class="button">Submit</button>
                <a href="#" class="button button-secondary modal-closer">Close</a>
            </footer>
				
            <div class="message">
                <i class="icon-ok"></i>
                <p>Your request successfully sent!<br><a href="#" class="modal-closer">Close window</a></p>
            </div>
        </div>
        </div>
        <div class="col-md-3">    </div> 
        </div>
   
    </div>
     </section>
</asp:Content>

