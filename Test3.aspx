﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Test3.aspx.cs" Inherits="Test3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <style >
           
 #timeline .timeline-item:after, header:before, #timeline .timeline-item:before {
    content: '';
    display: block;
    width: 100%;
    clear: both
}

*, *:before, *:after {
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box
}



img { max-width: 100% }

a { text-decoration: none }






.project-name {
    text-align: center;
    padding: 10px 0
}


#timeline {
    width: 90%;
    margin: 30px auto;
    position: relative;
    -webkit-transition: all 0.4s ease;
    -moz-transition: all 0.4s ease;
    -ms-transition: all 0.4s ease;
    transition: all 0.4s ease
}

#timeline:before {
    content: "";
    width: 3px;
    height: 100%;
    background: #ee4d4d;
    left: 50%;
    top: 0;
    position: absolute
}

#timeline:after {
    content: "";
    clear: both;
    display: table;
    width: 100%
}

#timeline .timeline-item {
    margin-bottom: 50px;
    position: relative
}

#timeline .timeline-item .timeline-icon {
    background: #ee4d4d;
    width: 50px;
    height: 50px;
    position: absolute;
    top: 0;
    left: 50%;
    overflow: hidden;
    margin-left: -23px;
    -webkit-border-radius: 50%;
    -moz-border-radius: 50%;
    -ms-border-radius: 50%;
    border-radius: 50%
}

#timeline .timeline-item .timeline-icon img {
    position: relative;
    top: 14px;
    left: 14px
}

#timeline .timeline-item .timeline-content {
    width: 45%;
    background: #fff;
    padding: 20px;
    -webkit-box-shadow: 0 3px 0 rgba(0, 0, 0, 0.1);
    -moz-box-shadow: 0 3px 0 rgba(0, 0, 0, 0.1);
    -ms-box-shadow: 0 3px 0 rgba(0, 0, 0, 0.1);
    box-shadow: 0 3px 0 rgba(0, 0, 0, 0.1);
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    -ms-border-radius: 5px;
    border-radius: 5px;
    -webkit-transition: all 0.3s ease;
    -moz-transition: all 0.3s ease;
    -ms-transition: all 0.3s ease;
    transition: all 0.3s ease
}

#timeline .timeline-item .timeline-content h2 {
    padding: 15px;
    background: #ee4d4d;
    color: #fff;
    margin: -20px -20px 0 -20px;
    font-weight: 500;
    -webkit-border-radius: 3px 3px 0 0;
    -moz-border-radius: 3px 3px 0 0;
    -ms-border-radius: 3px 3px 0 0;
    border-radius: 3px 3px 0 0
}

#timeline .timeline-item .timeline-content:before {
    content: '';
    position: absolute;
    left: 45%;
    top: 20px;
    width: 0;
    height: 0;
    border-top: 7px solid transparent;
    border-bottom: 7px solid transparent;
    border-left: 7px solid #ee4d4d
}

#timeline .timeline-item .timeline-content.right { float: right }

#timeline .timeline-item .timeline-content.right:before {
    content: '';
    right: 45%;
    left: inherit;
    border-left: 0;
    border-right: 7px solid #ee4d4d
}

.btn {
    padding: 5px 15px;
    text-decoration: none;
    background: transparent;
    border: 2px solid #f27c7c;
    color: #f27c7c;
    display: inline-block;
    position: relative;
    text-transform: uppercase;
    font-size: 12px;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    -ms-border-radius: 5px;
    border-radius: 5px;
    -webkit-transition: background 0.3s ease;
    -moz-transition: background 0.3s ease;
    -ms-transition: background 0.3s ease;
    transition: background 0.3s ease;
    -webkit-box-shadow: 2px 2px 0 #f27c7c;
    -moz-box-shadow: 2px 2px 0 #f27c7c;
    -ms-box-shadow: 2px 2px 0 #f27c7c;
    box-shadow: 2px 2px 0 #f27c7c
}

.btn:hover {
    box-shadow: none;
    top: 2px;
    left: 2px;
    -webkit-box-shadow: 2px 2px 0 transparent;
    -moz-box-shadow: 2px 2px 0 transparent;
    -ms-box-shadow: 2px 2px 0 transparent;
    box-shadow: 2px 2px 0 transparent
}

@media screen and (max-width: 768px) {
    #timeline {
        margin: 30px;
        padding: 0
    }

    #timeline:before { left: 0 }

    #timeline .timeline-item .timeline-content {
        width: 90%;
        float: right
    }

    #timeline .timeline-item .timeline-content:before, #timeline .timeline-item .timeline-content.right:before {
        left: 10%;
        margin-left: -6px;
        border-left: 0;
        border-right: 7px solid #ee4d4d
    }

    #timeline .timeline-item .timeline-icon { left: 0 }
}
           
           
           
       </style>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1 class="project-name">RESPONSIVE TIMELINE</h1>
		<div id="timeline">
			<div class="timeline-item">
				<div class="timeline-icon">
					<img src="images/star.svg" alt="">
				</div>
				<div class="timeline-content">
					<h2>LOREM IPSUM DOLOR</h2>
					<p>
						Lorem ipsum dolor sit amet, consectetur adipisicing elit. 
						Atque, facilis quo maiores magnam modi ab libero praesentium blanditiis.
					</p>
					<a href="#" class="btn">button</a>
				</div>
			</div>

			<div class="timeline-item">
				<div class="timeline-icon">
					<img src="images/book.svg" alt="">
				</div>
				<div class="timeline-content right">
					<h2>LOREM IPSUM DOLOR</h2>
					<p>
						Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque, facilis quo. Maiores magnam modi ab libero praesentium blanditiis consequatur aspernatur accusantium maxime molestiae sunt ipsa.
					</p>
					<a href="#" class="btn">button</a>
				</div>
			</div>

			<div class="timeline-item">
				<div class="timeline-icon">
					<img src="images/star.svg" alt="">
				</div>
				<div class="timeline-content">
					<h2>LOREM IPSUM DOLOR</h2>
					<p>
						Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque, facilis quo. Maiores magnam modi ab libero praesentium blanditiis consequatur aspernatur accusantium maxime molestiae sunt ipsa.
					</p>
					<a href="#" class="btn">button</a>
				</div>
			</div>
		</div>
    </div>
    </form>
</body>
</html>
