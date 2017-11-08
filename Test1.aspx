<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Test1.aspx.cs" Inherits="Test1" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slidebars/0.10.2/slidebars.css">
      <script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/slidebars/0.10.2/slidebars.js'></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
     <asp:Button ID="Button1" runat="server" Text="Send from Code" OnClick="Button1_Click" />
    <br />
    <div class="btn-default">Basic Well</div>
    
        <div id="sb-site">
        <!-- Your main site content. -->

        <div class="container">
            <!-- Static navbar -->
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button id="mobileMenu" type="button" class="navbar-toggle collapsed sb-toggle-right" data-toggle="~collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div id="navbar" class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="#">Home</a></li>
                            <li><a href="#">About</a></li>
                            <li><a href="#">Contact</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="#">Action</a></li>
                                    <li><a href="#">Another action</a></li>
                                    <li><a href="#">Something else here</a></li>
                                    <li class="divider"></li>
                                    <li class="dropdown-header">Nav header</li>
                                    <li><a href="#">Separated link</a></li>
                                    <li><a href="#">One more separated link</a></li>
                                </ul>
                            </li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
                            <li><a href="#">Link</a></li>
                            <li><a href="#">Link</a></li>
                        </ul>
                    </div><!--/.nav-collapse -->
                </div><!--/.container-fluid -->
            </nav>
        </div> <!-- /container -->

        <button class="btn btn-success pull-left sb-toggle-left" id="mybtn">Toggle Slide Menu</button>
        
    </div>

    <div class="sb-slidebar sb-left">
        <!-- Your left Slidebar content. -->
        <div>
            <div class="list-group">
                <a href="#" class="list-group-item active">Left Side Menu</a>
                <a href="#" class="list-group-item">Link</a>
                <a href="#" class="list-group-item">Link</a>

            </div>
        </div>
    </div>

    <div class="sb-slidebar sb-right">
        <!-- Your right Slidebar content. -->
        <div class="sb-slidebar sb-right">
        <!-- Your right Slidebar content. -->
        <div>
            <div class="list-group">
                <a href="#" class="list-group-item active">Right Side Menu</a>
                <a href="#" class="list-group-item">Link</a>
                <a href="#" class="list-group-item">Link</a>

            </div>
        </div>
    </div>
    </div>
    
<FTB:FreeTextbox runat="server"  EnableHtmlMode="False" toolbarlayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu,FontForeColorPicker,FontBackColorsMenu,FontBackColorPicker|Bold,Italic,Underline,Strikethrough,Superscript,Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,JustifyFull;BulletedList,NumberedList,Indent,Outdent;CreateLink,Unlink,InsertImage|Cut,Copy,Paste,Delete;Undo,Redo|WordClean," ID="ftb" ></FTB:FreeTextbox>  

<script>
    (function ($) {
        $(document).ready(function () {
            $.slidebars();
        });
    })(jQuery);
      </script>
</asp:Content>

