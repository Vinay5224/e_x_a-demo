<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ExaHealth-Login</title>
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  
   <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
</head>
<style>
.bgGradient
{
  position: relative;
    color: #666;
    
    text-align: center;
    height: 100%;
    background: -moz-linear-gradient(270deg, rgba(34,46,64,1) 0%, rgba(81,195,184,1) 100%);
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, rgba(34,46,64,1)), color-stop(100%, rgba(81,195,184,1)));
    background: -webkit-linear-gradient(270deg, rgba(34,46,64,1) 0%, rgba(81,195,184,1) 100%);
    background: linear-gradient(180deg, rgba(34,46,64,1) 0%, rgba(81,195,184,1) 100%);
    overflow:hidden;
}
.darkGradient
{
 position: relative;
    z-index: 0;
    float: none;
    margin: 0 auto;
    padding-top: 40px;
    width: 100%;
    height: 55vh;
    overflow: auto;
    background: -moz-linear-gradient(48deg, rgba(42,46,54,1) 0%, rgba(97,107,125,1) 100%);
    background: -webkit-gradient(linear, left bottom, right top, color-stop(0%, rgba(42,46,54,1)), color-stop(100%, rgba(97,107,125,1)));
    background: -webkit-linear-gradient(48deg, rgba(42,46,54,1) 0%, rgba(97,107,125,1) 100%);
    background: linear-gradient(42deg, rgba(42,46,54,1) 0%, rgba(97,107,125,1) 100%);
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
    box-shadow: none;
    border-radius: 0;
    border-top: 1px solid #4FC1B7;
}

.btn.outline {
	background: none;
	padding: 8px 20px;
}
.btn-dark.outline {
	border: 2px solid #3cb3ad;
	color: #3cb3ad;
}
.btn-sm
{
  border-radius:6px;
 
}

.btn-dark.outline:hover, .btn-dark.outline:focus, .btn-dark.outline:active, .btn-dark.outline.active, .open > .dropdown-toggle.btn-dark {
	color: #ffffff;
	background:#3cb3ad;
	border-color:#3cb3ad;
	
}
.btn-dark.outline:active, .btn-dark.outline.active {
	border-color: #3cb3ad;
	color: #3cb3ad;
	box-shadow: none;
}
.form-class
{  margin: 0 0 .8em 0;
    padding: .8em 2em 10px 0;
    width: 80%;
    display: inline-block;
    background: transparent;
    border: 0;
    border-bottom: 1px solid #3cb3ad;
    outline: 0;
    box-sizing: border-box;
    -moz-box-sizing: border-box;
    color: inherit;
    font-family: inherit;
    color: #666;
    
}
.carousel-caption {
    position: relative;
    left: auto;
    right: auto;
}
</style>
<body >

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand -->
<!--  <a class="navbar-brand" href="#" style="font-style: oblique;">HOME</a> -->
 <img src="img/exalogo.jpg"  style="width:80px;height:30px;cursor:pointer;" > 

  <!-- Links -->
  <ul class="nav navbar-nav ml-auto">
  
 
  
    <li class="nav-item">
     <img src="img/exfname.jpg"  style="width:80px;height:30px;cursor:pointer;margin:right;" > 
    </li>
    <!-- 
    <li class="nav-item" >
       <img src="img/footlogo.png"   style="width:120px;cursor:pointer;" onclick="javascript:location.href='http://www.exafluence.com'">
    </li>-->
  
     
  </ul>
   
</nav>

<div class="bgGradient" style="height:100%;width:100%;">

<br><BR><BR><BR><BR><BR>

<div class="container">

 <div class="card text-white" style="background-color:rgba(81,195,184,0.8);width:85%; border-radius:10px;" >
    <div class="card-body" >
        <div class="row">
               <div class="col">
                   
<div id="demo"class="carousel slide" data-ride="carousel">
 <!-- <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  
  </ul>
  -->
  <div class="carousel-inner">
    <div class="carousel-item active" >
      <img class="img-fluid" src="img/carousal/member.gif" alt="Member"  width="150" height="75" style="margin:auto;">
      <div class="carousel-caption">
        <h3 style="color:white;">Members</h3>
         
      </div>   
    </div>
    <div class="carousel-item" > 
      <img class="img-fluid" src="img/carousal/claim.png" alt="claims"   width="150" height="350" style="margin:auto;">
      <div class="carousel-caption"><br><br>
        <h3 style="color:white">Claims</h3>
       <p>With Exahealth platform , you can visualise relationship among various 
       attributes in claims with Members, Providers</p>
      </div>   
    </div>
    <div class="carousel-item" style="height:90%">
      <img class="img-fluid" src="img/carousal/doc.png" alt="Providers"   width="150" height="350"  style="margin:auto;background:transparent">
      <div class="carousel-caption"><br>
        <h3 style="color:white">Providers</h3>
       <p> Exahealth platform offers provider MDM,notifies Provider status updates.</p> 
      </div>   
    </div>
     
  </div>
  <!-- 
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
  -->
</div>
               </div>
               <div class="col">
               <div class="darkGradient"  style="border-radius:7px;">
               <img src="img/user.png" width="35" height="35">
                  <h3>Sign In</h3>
                   
                   <div class="col">
                    <input  class="form-class" type="text"  style="color:white;" placeholder="Email or Username"/><br><br>
                    <input  class="form-class" type="password" style="color:white;" placeholder="password"/><br><br>
                     <a  class="btn btn-dark btn-sm outline" id="login_user" onclick="login()">
                        Login
                     </a>
                     
                    </div>
               </div>
               </div>
        </div>
    </div>
  </div>

<br><BR>
</div>

<div class="footer" style="color:white;">

 2017 © Exafluence, Inc. All rights Reserved

</div>
<br><br>
</div>
</body>
</html>