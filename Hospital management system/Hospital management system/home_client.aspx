<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home_client.aspx.cs" Inherits="Hospital_management_system.home_client" %>


<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">


<!-- Google fonts -->
<link href='http://fonts.googleapis.com/css?family=Roboto:400,300,700' rel='stylesheet' type='text/css'>

<!-- font awesome -->
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

<!-- bootstrap -->
<link rel="stylesheet" href="/clientcss/assets/bootstrap/css/bootstrap.min.css" />

<!-- animate.css -->
<link rel="stylesheet" href="/clientcss/assets/animate/animate.css" />
<link rel="stylesheet" href="/clientcss/assets/animate/set.css" />

<!-- gallery -->
<link rel="stylesheet" href="/clientcss/assets/gallery/blueimp-gallery.min.css">

<!-- favicon -->
<link rel="shortcut icon" href="/clientcss/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="/clientcss/images/favicon.ico" type="image/x-icon">


<link rel="stylesheet" href="/clientcss/assets/style.css">
<script type="text/javascript" src="/clientcss/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="/clientcss/js/cycle2.js"></script>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>Hospital Management System</title>

   <style type="text/css">
    * {
        margin: 0;
        padding: 0;
    }
       
    #container {
        width: 100%;
        height: 650px;
        position: relative;
        overflow: hidden;
        background: #ff00ff;
    }
    #slideshow {
        height: 100%;
        width: 100%;
    }
    #slideshow img {
        height: 100%;
        width: 100%;
    }
    #pager {
	text-align:center;
        height: 120px;
        width: 100%;
        position: absolute;
        bottom: 5%;
        background: rgba(0,0,0,.5);
        z-index: 1000;
        opacity: 0;
        transition: all 0.3s ease-in-out 0s;
    }

    #pager:hover {
       opacity: 1;
    }    
    
    #prev {
        height: 120px;
        width: 120px;
        position: absolute;
        top: 0;
        bottom: 0;
        left:0;
        margin: auto 10px;
		z-index:1000;
	}
     #next {
        height: 120px;
        width: 120px;
        position: absolute;
        top: 0;
        bottom: 0;
        right:0;
        margin: auto 10px;
			z-index:1000;
	}
       .navbar
       {
            
	        padding-right:30px;
	        padding-left:30px;
	        background-color:#2980b9 ;
	        width:100%;
	        border-bottom: outset;
	        position:fixed;
	        z-index:1000;
            height:75px;
       }
	
       ul{
	margin:18px -10px 10px 1000px;
	list-style:none;
	padding:0px;
	position:relative;
	}
	
	
ul li{
	display:inline-block;
	text-decoration:none;
	}
ul li a{
	display:block;
	text-align:center;
	height:50px;
	width:120px;
	text-decoration:none;
	color:white;
	line-height:50px;
    font-family:'Times New Roman', Times, serif;
    font-size:36px;
}
    

	#pager img {
		margin: 10px 5px;
		opacity:0.3;
		transition:all .3s ease-in-out 0s;
		}
	#pager img:hover {
		opacity:1;
		transform:scale(1.05);
		z-index:100;
		}
    </style>


</head>
  <body>
      <form>
        <div class="navbar"> 
            <ul>
                <li>
                    <a href="loginpage.aspx" runat="server">LOGIN</a>
                </li>
            </ul>
        </div>
    <div>
<!-- Header Starts -->
      



<!-- #Header Starts -->

<div id="container">
    <div id="slideshow" class="cycle-slideshow"
       data-cycle-fx = "fade"
       data-cycle-speed = "400"
       data-cycle-timeout = "3000"
       data-cycle-pager = "#pager"
       data-cycle-pager-template ="<a herf='#'><img src='{{src}}' height=100 width=150/>"
       data-cycle-next = "#next"
       data-cycle-prev = "#prev"
       data-cycle-manual-fx = "scrollHorz"
       data-cycle-manual-speed = "400"
       data-cycle-pager-fx = "fade">
        <img src="/clientcss/img/1.jpg" alt="">
        <img src="/clientcss/img/2.jpg" alt="">
        <img src="/clientcss/img/3.jpg" alt="">
        <img src="/clientcss/img/1.jpg" alt="">
    </div>
    <div id="pager"></div>
    <img id="prev" src="/clientcss/img/prev1.svg"/>
    <img id="next" src="/clientcss/img/next1.svg"/>
</div>

<!-- works -->
<div id="works"  class=" clearfix grid"> 
    <figure class="effect-oscar  wowload fadeIn">
        <img src="/clientcss/images/portfolio/1.jpg" alt="img01"/>
        <figcaption>
            <h2>APPOINMENT</h2>
            <p>TO QUICK BOOK AN APPOINMENT <br>
            <a href="C:\Users\Darshan\Desktop\New folder (2)\thebootstrapthemes-portfolio\img\images.jpg" title="1" data-gallery>View more</a></p>            
        </figcaption>
    </figure>
     
     <figure class="effect-oscar  wowload fadeInUp">
        <img src="/clientcss/images/portfolio/3.jpg" alt="img01"/>
        <figcaption>
            <h2>LABORATORY</h2>
            <p>ALL TYPES OF REPORTS TESTING<br>
            <a href="/clientcss/images/portfolio/3.jpg" title="1" data-gallery>View more</a></p>            
        </figcaption>
    </figure>
     <figure class="effect-oscar  wowload fadeInUp">
        <img src="/clientcss/images/portfolio/4.jpg" alt="img01"/>
        <figcaption>
            <h2>MEDICAL COUNSELLING</h2>
            <p>COUNSELLING FOR ALL PEOPLE<br>
            <a href="/clientcss/images/portfolio/4.jpg" title="1" data-gallery>View more</a></p>            
        </figcaption>
    </figure>
     <figure class="effect-oscar  wowload fadeInUp">
        <img src="/clientcss/images/portfolio/5.jpg" alt="img01"/>
        <figcaption>
            <h2>STAFF</h2>
            <p>WELL SKILLED STAFF  <br>
            <a href="/clientcss/images/portfolio/5.jpg" title="1" data-gallery>View more</a></p>            
        </figcaption>
    </figure>
     
     
    
    
    
    <figure class="effect-oscar  wowload fadeInUp">
        <img src="/clientcss/images/portfolio/10.jpg" alt="img01"/>
        <figcaption>
            <h2>AVAILABLE DOCTORS</h2>
            <p>TIMINGS OF THE DOCTORS<br>
            <a href="/clientcss/images/portfolio/10.jpg" title="1" data-gallery>View more</a></p>            
        </figcaption>
    </figure>
    

     
</div>
<!-- works -->

   <!-- Indicators -->
   	<ol class="carousel-indicators">
    <li data-target="#carousel-testimonials" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-testimonials" data-slide-to="1"></li>
    <li data-target="#carousel-testimonials" data-slide-to="2"></li>
  	</ol>
  	<!-- Indicators -->
  </div>

<!-- team -->
<h3 class="text-center  wowload fadeInUp">Our team</h3>
<p class="text-center  wowload fadeInLeft">SPECIALIZED DOCTORS</p>
<div class="row grid team  wowload fadeInUpBig">	
	<div class=" col-sm-3 col-xs-6">
	<figure class="effect-chico">
        <img src="/clientcss/images/team/8.jpg" alt="img01" class="img-responsive" />
        <figcaption>
            <p><b></b><br><br><br><a href="#"><i class="fa fa-dribbble"></i></a> <a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-twitter"></i></a></p>            
        </figcaption>
    </figure>
    </div>

    <div class=" col-sm-3 col-xs-6">
	<figure class="effect-chico">
        <img src="/clientcss/images/team/10.jpg" alt="img01"/>
        <figcaption>            
            <p><b>KARAN</b><br><br><br><a href="#"><i class="fa fa-dribbble"></i></a> <a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-twitter"></i></a></p>            
        </figcaption>
    </figure>
    </div>

    <div class=" col-sm-3 col-xs-6">
	<figure class="effect-chico">
        <img src="/clientcss/images/team/12.jpg" alt="img01"/>
        <figcaption>
            <p><b>DARSHAN</b><br><br><br><a href="#"><i class="fa fa-dribbble"></i></a> <a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-twitter"></i></a></p>          
        </figcaption>
    </figure>
    </div>

    <div class=" col-sm-3 col-xs-6">
	<figure class="effect-chico">
        <img src="/clientcss/images/team/17.jpg" alt="img01"/>
        <figcaption>
            <p><b>ANTHONY</b><br><br><br><a href="#"><i class="fa fa-dribbble"></i></a> <a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-twitter"></i></a></p>
        </figcaption>
    </figure>
    </div>

 
</div>


<!-- Footer Starts -->
<div class="footer text-center spacer">
<p class="wowload flipInX"><a href="#"><i class="fa fa-facebook fa-2x"></i></a> <a href="#"><i class="fa fa-instagram fa-2x"></i></a> <a href="#"><i class="fa fa-twitter fa-2x"></i></a> <a href="#"><i class="fa fa-flickr fa-2x"></i></a> </p>
Hospital Management System. All rights reserved.
</div>
<!-- # Footer Ends -->


<!-- The Bootstrap Image Gallery lightbox, should be a child element of the document body -->
<div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls">
    <!-- The container for the modal slides -->
    <div class="slides"></div>
    <!-- Controls for the borderless lightbox -->
    <h3 class="title">Title</h3>
    <a class="prev">‹</a>
    <a class="next">›</a>
    <a class="close">×</a>
    <!-- The modal dialog, which will be used to wrap the lightbox content -->    
</div>



<!-- jquery -->
<script src="/clientcss/assets/jquery.js"></script>

<!-- wow script -->
<script src="/clientcss/assets/wow/wow.min.js"></script>


<!-- boostrap -->
<script src="/clientcss/assets/bootstrap/js/bootstrap.js" type="text/javascript" ></script>

<!-- jquery mobile -->
<script src="/clientcss/assets/mobile/touchSwipe.min.js"></script>
<script src="/clientcss/assets/respond/respond.js"></script>

<!-- gallery -->
<script src="/clientcss/assets/gallery/jquery.blueimp-gallery.min.js"></script>

<!-- custom script -->
<script src="/clientcss/assets/script.js"></script>
  
   </form> 
</body>
</html>
