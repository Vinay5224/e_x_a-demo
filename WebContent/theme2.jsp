<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
</head>
<style>
body { 
    background-image: url('https://www.google.co.in/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwjYm4iQ5prYAhVJsY8KHTBUCJkQjRwIBw&url=https%3A%2F%2Fmultifuel-stoves.info%2Fnewomok-off-white-background-tumblr.new&psig=AOvVaw3Dw5DKmxLhwcrIwLKhdU_S&ust=1513934975133862 ');
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-position: center;
    background-size:2508px 1672px;
    
}

.footer {
   position: fixed;
   left: 0;
   bottom: 0;
   width: 100%;
   background-color: white;
   color: #007bff;
   text-align: center;


/* .label {
     top: -158px;
    color: white;
    padding: -8px;
    font-family: Arial;
}
.success {background-color: #4c98af;} /* Green */ */



.red{

color: grey ;	

}
a:link {
    color: #1e7e34;
}

/* visited link */
/* a:visited {
    color: green;
} */

/* /* /* mouse over link */
.x:hover {
    color: skyblue;
}  */ 
 
/* selected link */
a{
    color: black;
}



</style>


<body>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand -->
<!--  <a class="navbar-brand" href="#" style="font-style: oblique;">HOME</a> -->
 <img src="img/exalogo.jpg"  style="width:80px;height:30px;cursor:pointer;" > 

  <!-- Links -->
  <ul class="navbar-nav">
  
    <li class="nav-item">
   <!--  <a class="navbar-brand" href="#">
    <img src="/img/NWEEXA.png" alt="Logo" style="width:20px;">
  </a>  -->
      <a class="nav-link y" href="#" style="font-style: oblique; margin-left: 140px; ">METADATA</a>
    </li>
    <li class="nav-item">
      <a class="nav-link y" href="#" style="font-style: oblique;  ">MEMBERS</a>
    </li>
  <li class="nav-item">
      <a class="nav-link y" href="#" style="font-style: oblique; ">PROVIDER</a>
    </li>
      <li class="nav-item">
      <a class="nav-link y" href="#" style="font-style: oblique; ">CLAIMS</a>
    </li>
         <li class="nav-item" >
      <a class="nav-link y" href="#" style="font-style: oblique; ">PROVIDER HEALTH</a>
    </li>
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" style="margin-left: 252px; margin-left: 340px; " id="navbardrop" data-toggle="dropdown">
       ADMIN
      </a>
      <div class="dropdown-menu" style="background: skyblue; margin-left: 264px;  color:black";	>
        <a class="dropdown-item" href="#" style="font-style: oblique;">ADD USER</a>
        <a class="dropdown-item" href="#" style="font-style: oblique;">CONFIGURATION</a>
        <a class="dropdown-item" href="#" style="font-style: oblique;">LOGOUT</a>
      </div>
    </li>
  </ul>
   <img src="img/exfname.jpg"  style="width:80px;height:30px;cursor:pointer;"> 
</nav>
<br>
 
 <!--  
<div class="container">
	later..to find whether its really useful to include container class
</div>
-->
 <div class="row">
    <div class="col-sm-2.5" style="overflow-y: scroll; height: 621px; overflow-y: hidden"   >
<div >

<span class="label success" style="color: #009fff ; margin-left: 95px; font-style:inherit; font-size:x-large;">Reports</span>
   <p><b><a   class="x z" id="meta" style="color: black ; margin-left: 95px;  font-size:smaller;  " ><span class="glyphicon glyphicon-search"></span> Membership</a> </b></p>
   <p><b><a   class="x z"  id="memb" style="color: black; margin-left: 95px; font-size:smaller;">Top Place of Service</a></b></p>
   <p><b><a   class="x z"   style="color: black; margin-left: 95px;   font-size:smaller;">Recent ER Visit Analysis</a></b></p>
   <p><b><a   class="x z" style="color: black; margin-left: 95px;    font-size:smaller;">Membership Distribution</a></b></p>
   <p><b><a   class="x z"  style="color: black; margin-left: 95px;    font-size:smaller;">Potentially Avoidable ERs</a></b></p>
   <hr  style="border-color:#007bff"   >
       <span class="label success" style="color: #009fff ; margin-left: 95px;;font-style:inherit; font-size:x-large;;">Dashboards</span>
      <p><b><a   class="x z"  id="das1" style="color: black; margin-left: 95px; font-style: inherit;  font-size:smaller;">Member Dashboard</a></b></p>
 
 
 
 </div> 
   
    </div>	
    <div class="col-sm-9">
    
      <iframe id="memb2" src="https://app.powerbi.com/view?r=eyJrIjoiMTQyY2NhNzktNzEwYi00Y2QxLTk4Y2MtZjVlODk0YjZhM2JlIiwidCI6IjAzYWEzNmMzLWY2ZjctNDczYi05YzBiLWEwYTljNGRiODVmYiJ9" height="580" width="950"></iframe>
      
     <iframe id="dash1" src="https://app.powerbi.com/view?r=eyJrIjoiZmJiZjExZTUtZmNjOC00YjVhLTk0OTktMjM1ZmVmYThlNDJiIiwidCI6IjAzYWEzNmMzLWY2ZjctNDczYi05YzBiLWEwYTljNGRiODVmYiJ9" height="580" width="950"></iframe> 
    </div>
  </div>
<div class="footer">
  <p > 2017 © Exafluence. All rights Reserved </p>	
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
 $(this).css('color', '#007bff');
 $(this).css('font-style', 'oblique');

  });

$('.y').click(function(){
	$(".y").css( 'color','white');	
	$(".y").css( 'text-decoration','none');	 
	 $(this).css( 'text-decoration',' underline');
 $(this).css( 'color','	skyblue ');

  });

$(document).ready(function(){
    $(".x").mouseover(function(){
        $(this).css("color", "#007bff");
        
        $(this).css("cursor", "pointer");
    });
    $(".x").mouseout(function(){
        $(".x").css("color", "black");
    });
});


</script>
	
</html>



