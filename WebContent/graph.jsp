<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.Mongo"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page import="com.mongodb.MongoCredential"%>
<%@page import="com.mongodb.ServerAddress"%>
<%@page import="java.util.*"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
<%@page import="com.mongodb.client.MongoCollection"%>
<%@page import="com.mongodb.client.FindIterable"%>
<%@page import="org.bson.Document"%>


<%@page import="Utils.Configs.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>payer</title>
</head>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.7.5/css/bootstrap-select.min.css">
  
  <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
  
  
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.7.5/js/bootstrap-select.min.js"></script>
  <link rel="stylesheet" href="admin.css">
<script src="admin.js"></script>  
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vis/4.16.1/vis.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/vis/4.16.1/vis.js"></script>

        <link href="https://cdnjs.cloudflare.com/ajax/libs/vis/4.16.1/vis.min.css" rel="stylesheet" type="text/css" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/vis/4.16.1/vis.css" rel="stylesheet" type="text/css" />
  
<style>

.dropdown-submenu {
    position: relative;
}

.dropdown-submenu>.dropdown-menu {
    top: 0;
    right: 100%;
    margin-top: -6px;
    margin-left: -165px;
    -webkit-border-radius: 0 6px 6px 6px;
    -moz-border-radius: 0 6px 6px;
    border-radius: 0 6px 6px 6px;
}
.dropdown-submenu:hover>.dropdown-menu {
    display: block;
}

.tt-dropdown-menu {
    background-color: antiquewhite !important;
    padding: 10px !important ;
    width:850px !important; 
    
}
.caret {
    display: inline-block;
    width: 0;
    height: 0;
    margin-left: 5px;
    vertical-align: middle;
    border-top: 8px solid;
    border-right: 6px solid transparent;
    border-left: 6px solid transparent;
    -webkit-transition: border-color 0.25s, color 0.25s;
    transition: border-color 0.25s, color 0.25s;
}
.m{ 
opacity: .9;left: 0px;
    top: 0px;
    z-index: -1;}

body{background: linear-gradient(to bottom, #33ccff 0%, #0099cc 0%);
 background-position: center center;
			background-repeat:  no-repeat;
			background-attachment: fixed;
			background-size:  cover;
			background-color: #999;

 
}
.navbar, .dropdown-menu{
background:rgba(51, 122, 183, 0.88);
border: none;

}

.nav>li>a, .dropdown-menu>li>a:focus, .dropdown-menu>li>a:hover, .dropdown-menu>li>a, .dropdown-menu>li{
  border-bottom: 3px solid transparent;
}
.nav>li>a:focus, .nav>li>a:hover,.nav .open>a, .nav .open>a:focus, .nav .open>a:hover, .dropdown-menu>li>a:focus, .dropdown-menu>li>a:hover{
  border-bottom: 3px solid transparent;
  background: none;
}
.navbar a, .dropdown-menu>li>a, .dropdown-menu>li>a:focus, .dropdown-menu>li>a:hover, .navbar-toggle{
 color: #fff;
}
.dropdown-menu{
      -webkit-box-shadow: none;
    box-shadow:none;
}

.nav li:hover:nth-child(8n+1), .nav li.active:nth-child(8n+1){
  border-bottom: #C4E17F 3px solid;
}
.nav li:hover:nth-child(8n+2), .nav li.active:nth-child(8n+2){
  border-bottom: #F7FDCA 3px solid;
}
.nav li:hover:nth-child(8n+3), .nav li.active:nth-child(8n+3){
  border-bottom: #FECF71 3px solid;
}
.nav li:hover:nth-child(8n+4), .nav li.active:nth-child(8n+4){
  border-bottom: #F0776C 3px solid;
}
.nav li:hover:nth-child(8n+5), .nav li.active:nth-child(8n+5){
  border-bottom: #DB9DBE 3px solid;
}
.nav li:hover:nth-child(8n+6), .nav li.active:nth-child(8n+6){
  border-bottom: #C49CDE 3px solid;
}
.nav li:hover:nth-child(8n+7), .nav li.active:nth-child(8n+7){
  border-bottom: #669AE1 3px solid;
}
.nav li:hover:nth-child(8n+8), .nav li.active:nth-child(8n+8){
  border-bottom: #62C2E4 3px solid;
}

.navbar-toggle .icon-bar{
    color: #fff;
    background: #fff;
}





.modal-dialog {
       
        top: 175px;
        right: 100px;
        bottom: 0;
        left: 0;
        z-index: 10040;
       
       
}
.modal-header {
    background-color: rgba(79, 188, 206, 0.85);
}
.checkmark {
  position: absolute;
    top: 4px;
    left: 8px;
    height: 25px;
    width: 25px;
    background-color: white;
} 

/* 
.modal-body {
 background-image: url("http://www.techandall.com/wp-content/uploads/2013/08/bg7.jpg")
}
.modal-footer{

}
.modal-header{
 background-image: url("http://www.techandall.com/wp-content/uploads/2013/08/bg7.jpg")
} */
</style>

<body>
<%-- <%
String ip= Utils.Configs.ip;

Configs.Credential = MongoCredential.createCredential(Configs.username, Configs.db1, Configs.password.toCharArray());

Configs.mongoClient = new MongoClient(new ServerAddress(Configs.ip, 27234), Arrays.asList(Configs.Credential));

//MongoClient admin_client = new MongoClient ("localhost", 27234); 
DB ARUJ_DB = Configs.mongoClient.getDB("ARUJ");

String name = (String) session.getAttribute("email_id"); 
if(name ==null){
   
   response.sendRedirect ("index.jsp");
   }

else{
	%> --%>
	<!-- <div>
	<a href="index.jsp" class="btn btn-info" style="margin-left: 1180px" role="button">BACK</a>
	</div> -->
<div class="navbar-wrapper">
    <div class="container-fluid">
        <nav class="navbar navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    </button>
                   <!--  <a class="navbar-brand" href="#" style="background-image:url(); "></a> -->
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <!-- <li class="test" data-attr="user"><a href="#" class="dropdown-toggle " data-toggle="tab" role="button" aria-haspopup="true" aria-expanded="false"style="font-style: italic;font-weight: 900;" >HOME</a></li> -->
                        
                        <li class="METADATA " data-attr="user"><a href="#" class="dropdown-toggle " data-toggle="tab" role="button" aria-haspopup="true" aria-expanded="false" style="font-style: italic;font-weight: 900;">METADATA</a>
                            
                        </li>
                        <!-- <li class="PROVIDER" data-attr="user"><a href="#" class="dropdown-toggle " data-toggle="tab" role="button" aria-haspopup="true" aria-expanded="false" style="font-style: italic;font-weight: 900; margin-left: 900px ;">BACK</a>
                                       
                                                    
                        </li> -->
                        <!--  <li class="MEMBER active" data-attr="user"><a href="#" class="dropdown-toggle " data-toggle="tab" role="button" aria-haspopup="true" aria-expanded="false" style="font-style: italic;font-weight: 900;">MEMBERS</a>
                            
                        </li> -->
                       <!--  
                        <li class="PROVIDER" data-attr="user"><a href="#" class="dropdown-toggle " data-toggle="tab" role="button" aria-haspopup="true" aria-expanded="false" style="font-style: italic;font-weight: 900;">PROVIDER</a>
                                       
                                                    
                        </li> -->
                        <!--  </li>
                        
                        <li class="CLAIM" data-attr="user"><a href="#" class="dropdown-toggle " data-toggle="tab" role="button" aria-haspopup="true" aria-expanded="false" style="font-style: italic;font-weight: 900;">CLAIMS</a>
                                       
                                                    
                        </li>
                        <li class="POPULATION_HEALTH" data-attr="pop" ><a href="#" class="dropdown-toggle active" data-toggle="tab" role="button" aria-haspopup="true" aria-expanded="false" style="font-style: italic;font-weight: 900;">POPULATION-HEALTH</a>
                           
                        </li> -->
                         
                    </ul>
                    <!-- <ul class="nav navbar-nav pull-right">
                         <li class=" down">	
							<a href="#" class="dropdown-toggle active" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"style="font-style: italic;font-weight: 900;" >
							ADMIN	
							<span class="glyphicon glyphicon-user"></span> <span	class="caret"></span>
                           
							</a>
                            <ul class="dropdown-menu">
                                <li><a href="#"  id="AddUserTab"  style="font-style: italic;font-weight: 900;"          >ADD USER</a></li>
                                 <li><a href="#" id="configTab"  style="font-style: italic;font-weight: 900;"         >CONFIGURATION</a></li> 
                               
                               
                               
<li class="dropdown-submenu"><a href="#"  class="dropdown-toggle submenu" data-toggle="dropdown"  style="font-style: italic;font-weight: 900;"> <b class="caret-right"></b>
                                
 CONFIGURATION</a>  
       
       
       <ul class="dropdown-menu">
          <li><a  href="#" id="premission">USER PREMISSION</a></li>
          <li><a  href="#" id="Neo4jd" >Neo4j DB</a></li>
        
        </ul>
       </li>                
                                <li><a href="logout" style="font-style: italic;font-weight: 900;"      >LOGOUT</a></li>
                            </ul>
                        </li>
                       
                    </ul> -->
                </div>
            </div>
            
            <!-- <a href="index.jsp" ><img alt=""  width="100px"  src="img/logo.png" style="margin-top: -52px; margin-left: 1127px;"></a> -->
            <a href="index.jsp" class="btn btn-info" style="margin-left: 1180px;margin-top: -49px;" role="button">BACK</a>
        </nav>
    </div>
    <div>
	<a href="index.jsp" class="btn btn-info" style="margin-left: 1180px" role="button">BACK</a>
	</div>
</div>

<div>

</div>

<div class="container"><br><br><br><br>
 
  <!-- Trigger the modal with a button -->
 
 
  
</div>
  
<%-- <div id="addUser" class="act" style="margin-top: 35px;"><%@include file="adduser.jsp" %></div>  

<div id="config" class="act"><%@include file="config.jsp" %></div>
<div id="test" class="act"><%@include file="test.jsp" %></div>
<div id="neo4j" class="act"><%@include file="Filereader.jsp" %></div> --%> 
<div id="UserDb" class="act"><%@include file="UserDb.jsp" %></div> 
<%-- <div id="adminReports" style="overflow-x:hidden;margin-top: -25px;" class="act">
<%@include file="adminReports.jsp" %>
</div> --%>

<%-- <div id="provider" style="overflow-x:hidden;margin-top: -25px;" class="act">
<%@include file="provider.jsp" %>
</div>



<div id="claims" style="overflow-x:hidden;margin-top: -25px;" class="act">
<%@include file="Claims.jsp" %>
</div>
 --%>


<%-- <div id="population" style="overflow-x:hidden;margin-top: -25px;" class="act">
<%@include file="Popultion_Health.jsp" %>
</div> --%>
 <input  type="text"   id="Act_Tab"> 
   
 

<%-- 	<% 
	
	
}
 
 %> --%>


<script type="text/javascript">
$(document).ready(function(){
	
	$("#Ifrm").hide();
	$("#Ifrm1").hide();
	
	$("#addUser").hide();
	$("#config").hide();
	$("#UserDb").hide();
	$(".act").hide();
	$("#adminReports").show();
	
	$(".alert").hide();
	 $(".call").hide();
	 $(".calluser").hide();
	 $("#Act_Tab").hide();
	 $("#Config_Tab").hide();
	 $(".callMeta").hide();
	
});


</script>



<script type="text/javascript">

///////////////////////////accordian

var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].onclick = function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight){
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
    } 
  }
}


///////////////FUNCTIONS//////////////
function validateEmail($email) {
		  var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
		  return emailReg.test( $email );
		}
	  

	  function checkPassword(str)
	  {
	      var re = /^(?=.*\d)(?=.*[!@#$%^&*])(?=.*[a-z])(?=.*[A-Z]).{8,}$/;
	      return re.test(str);
	  }
	  if(!!window.performance && window.performance.navigation.type == 2)
      {
          window.location.reload();
      } 

///////////////////////FUNCTION////////////////
</script>
<script src="https://www.jqueryscript.net/demo/Minimal-jQuery-Table-Pagination-Plugin-SimplePagination/jquery.simplePagination.js"></script>
</body>
</html>