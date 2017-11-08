<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
        
         <main>
        <div class="map">
            <div id="google-map" class="map_model"></div>
            <ul class="map_locations">
                <li data-x="-73.9874068" data-y="40.643180">
                    <p> 9870 St Vincent Place, Glasgow, DC 45 Fr 45. <span>800 2345-6789</span></p>
                </li>
            </ul>
        </div>
        </main>
        <section class="well-1__off well-1__off-1 well-media-1">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-sm-12">
                        <h4>Our address</h4>

                        <p class="off">You can contact us any way that is convenient for you. We are available 24/7 via fax, email or telephone. You can also use a quick contact form on the right or visit our office personally.</p>
                        <address><p>9870 St Vincent Place,<br>
                                    Glasgow, DC 45 Fr 45.</p>
                            <dl>
                                <dt>
                                    Freephone:
                                </dt>
                                <dd>
                                    <a href="callto:#">+1 800 559 6580</a>
                                </dd>
                                <dt>Telephone:</dt>
                                <dd>
                                    <a href="callto:#">+1 800 603 6035</a>
                                </dd>
                                <dt>FAX:</dt>
                                <dd>
                                    <a href="callto:#">+1 800 889 9898</a>
                                </dd>
                            </dl>
                        </address>
                        <p>E-mail:
                            <a href="mailto:#" class="mail">mail@demolink.org</a>
                        </p>
                    </div>
                    <div class="col-md-8 col-sm-12">
                        <h4>Contact form</h4>

                        <form class='mailform' method="post" action="bat/rd-mailform.php">
                            <input type="hidden" name="form-type" value="contact"/>
                            <fieldset>
                                <label data-add-placeholder>
                                    <input type="text"
                                           name="name"
                                           placeholder="Name*:"
                                           data-constraints="@LettersOnly @NotEmpty"/>
                                </label>


                                <label data-add-placeholder>
                                    <input type="text"
                                           name="email"
                                           placeholder="Email*:"
                                           data-constraints="@Email @NotEmpty"/>
                                </label>
                                <label data-add-placeholder>
                                    <input type="text"
                                           name="phone"
                                           placeholder="Phone*:"
                                           data-constraints="@Phone @NotEmpty"/>
                                </label>

                                <label data-add-placeholder>
                                    <textarea name="message" placeholder="Comment*:"
                                              data-constraints="@NotEmpty"></textarea>
                                </label>

                                <div class="mfControls">
                                    <button class="btn-primary btn-primary__md btn-primary__md-1" type="submit">Submit comment</button>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </section>
</asp:Content>

