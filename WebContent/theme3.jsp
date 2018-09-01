<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style>

.badge {
    margin-left: 151px;
}
.navbar-default{
	background-color: black; 
}
.navbar-default .navbar-header > a {
	color: white ; 
}
 .navbar-default .navbar-nav > li > a{
	color:white;
}
.navbar-default .navbar-nav > .active > a,
.navbar-default .navbar-nav > .active > a:hover,
.navbar-default .navbar-nav > .active > a:focus {
	border-bottom: 2px solid #ecf0f1;
	background-color: transparent;

}

.tembus{
	background-color: #337ab7 !important;
}
.hvrcenter {
  display: inline-block;
  vertical-align: middle;
  -webkit-transform: perspective(1px) translateZ(0);
  transform: perspective(1px) translateZ(0);
  box-shadow: 0 0 1px transparent;
  position: relative;
  overflow: hidden;
}
.hvrcenter:before {
  content: "";
  position: absolute;
  z-index: -1;
  left: 50%;
  right: 50%;
  bottom: 0;
  background: #f211b4;
  height: 4px;
  -webkit-transition-property: left, right;
  transition-property: left, right;
  -webkit-transition-duration: 0.3s;
  transition-duration: 0.3s;
  -webkit-transition-timing-function: ease-out;
  transition-timing-function: ease-out;
}
.hvrcenter:hover:before, .hvrcenter:focus:before, .hvrcenter:active:before {
  left: 0;
  right: 0;
}

</style>

<body>
<div style="height:900px; background-color:white;
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-position: center;
    background-size:2508px 1672px; ">
	<header style="">
		<nav class="navbar navbar-default tembus">
	
		  <div class="container">
		  
		    <div class="collapse navbar-collapse" id="myNavbar">
		      <ul class="nav navbar-nav navbar-left">
		      
		        <li><a href="#" class="hvrcenter" style="margin-left: 127px">METADATA</a></li>
		        <li><a href="#" class="hvrcenter">MEMBER</a></li>
		        <li><a href="#" class="hvrcenter">PROVIDER</a></li>
		       <li><a href="#" class="hvrcenter">POPULATION HEALTH</a></li>
<!-- 		        <li><a href="#" class="hvrcenter" style="margin-left: -71px"><span class="badge badge-notify">(3)</span></a></li> -->
		        </li><li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle"  href="#" style="margin-left: 217px;   background-color:#34ccdb"  " id="navbardrop" data-toggle="dropdown">
       ADMIN
      </a>
      <div class="dropdown-menu" style=" margin-left: 248px;background:#34ccdb; color:#282828;"  >
        <a class="dropdown-item" href="#" class="hvrcenter"  style=" color: #eee;" >ADD USER</a>
        <a class="dropdown-item" href="#" class="hvrcenter" style=" color: #eee;" >CONFIGURATION</a>
        <a class="dropdown-item" href="#"  class="hvrcenter" style=" color: #eee;">LOGOUT</a>
      </div>
    </li>
          </ul>
		    </div>
		  </div>
		</nav>
	</header>
	<div class="row">
  <div class="col-sm-3" style="overflow-y: scroll; height: 621px;  overflow-y: hidden"          ">
  <div >
<span class="label success" style="color: #009fff ; margin-left: 80px; font-style:inherit; font-size:x-large;">Reports</span>
   <p><b><a   class="x z" id="meta" style="color: black ; margin-left: 95px;  font-size:medium;  " > Membership</a> </b></p>
   <p><b><a   class="x z"  id="memb" style="color: black; margin-left: 95px; font-size:medium;">Top Place of Service</a></b></p>
   <p><b><a   class="x z"   style="color: black; margin-left: 95px;   font-size:medium;">Recent ER Visit Analysis</a></b></p>
   <p><b><a   class="x z" style="color: black; margin-left: 95px;    font-size:medium;">Membership Distribution</a></b></p>
   <p><b><a   class="x z"  style="color: black; margin-left: 95px;    font-size:medium;">Potentially Avoidable ERs</a></b></p>
   <hr  style="border-color:#007bff"   >
       <span class="label success" style="color: #009fff ; margin-left: 80px;;font-style:inherit; font-size:x-large;;">Dashboards</span>
      <p><b><a   class="x z"  id="das1" style="color: black; margin-left: 95px; font-style: inherit;  font-size:medium;">Member Dashboard</a></b></p>
 </div> 
  </div>
  <div class="col-sm-9">
  <iframe id="memb2" src="https://app.powerbi.com/view?r=eyJrIjoiMTQyY2NhNzktNzEwYi00Y2QxLTk4Y2MtZjVlODk0YjZhM2JlIiwidCI6IjAzYWEzNmMzLWY2ZjctNDczYi05YzBiLWEwYTljNGRiODVmYiJ9" height="580" width="950"></iframe>
 <iframe id="dash1" src="https://app.powerbi.com/view?r=eyJrIjoiZmJiZjExZTUtZmNjOC00YjVhLTk0OTktMjM1ZmVmYThlNDJiIiwidCI6IjAzYWEzNmMzLWY2ZjctNDczYi05YzBiLWEwYTljNGRiODVmYiJ9" height="580" width="950"></iframe> 
</div>
  </div>
  <div class="footer">
  <p align="center" style=" background-color: rgba(52, 204, 219, 0);   color:blue" > 2017 © Exafluence. All rights Reserved</p>	
</div>
</div>
</div>
</body>
<script>
$(document).ready(function(){
	$("#dash1").hide();
	$("#meta1").hide();
	$("#memb2").hide();
$("#meta").on('click',function(){
	$("#dash1").hide();
	$("#meta1").show();
	$("#memb2").hide();
});
$("#das1").on('click',function(){
	$("#meta1").hide();
	$("#dash1").show();
	$("#memb2").hide();
});
$("#memb").on('click',function(){
	$("#dash1").hide();
	$("#memb2").show();
	$("#meta1").hide();
});
});
$('.z').click(function(){
	$(".z").css('font-style','inherit');	
	$(".z").css('color','black');	 
 $(this).css('color', 'skyblue');
 $(this).css('font-style', 'oblique');
  });
$('.y').click(function(){
	$(".y").css( 'color','black');	
 $(this).css( 'color','	skyblue ');
  });
$(document).ready(function(){
    $(".x").mouseover(function(){
        $(this).css("color", "skyblue");
        
        $(this).css("cursor", "pointer");
    });
    $(".x").mouseout(function(){
        $(".x").css("color", "black");
    });
});
 $('.x').click(function(){ 
 //var s= $('.x').empty();
	$(this).append(' ');
	/* $("#attribVal").empty(); */
});
 

</script>


</html>
