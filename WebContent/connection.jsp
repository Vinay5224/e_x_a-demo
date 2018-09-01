<!DOCTYPE html>
<html lang="en">
<%@page import="templates.theme1"%>
<%@page import="org.bson.Document" %>
<%@page import="com.mongodb.MongoClient"%>
<%@page import="com.mongodb.client.FindIterable"%>
<%@page import=" com.mongodb.async.client.MongoCollection"%>
<%@page import="com.mongodb.async.client.MongoDatabase"%>
<%@page import="java.util.Iterator"%>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
  <script src="https://bootsnipp.com/user/snippets/1BXv3#"></script>
</head>
<style>

.glyphicon-bell {
   
    font-size:1.5rem;
  }

.notifications {
   min-width:320px; 
  }
  
  .notifications-wrapper {
     overflow:auto;
      max-height:250px;
    }
.menu-title {
    color: #ffffff;
    font-size: 13px;
    display: inline-block;
    font-weight: bold;
}
.glyphicon-circle-arrow-right {
      margin-left:10px;     
   }
 .notification-heading, .notification-footer  {
  padding:2px 10px;
       }
.dropdown-menu.divider {
  margin:5px 0;          
  }
.item-title {
    font-size: 1.3rem;
    color: #000;
    font-weight: bold;
    margin: 5px 0px;
}

.notifications a.content {
    text-decoration: none;
    display: block;
    color:#000;
}
.notification-item {
    position: relative;
    padding: 10px;
    padding-left: 70px;
    padding-bottom: 0px;
}
.notification-item img {
    position: absolute;
    top: 7px;
    left: 10px;
    width: 50px;
    height: 50px;
    border-radius: 50px;
}
.dropdown-menu .divider {
    height: 1px;
    margin: 5px 0;
    overflow: hidden;
    background-color: #e5e5e5;
}
ul.dropdown-menu.notifications .notifications-wrapper a.content {
    padding: 0px !important;
    background: rgba(0, 0, 0, 0.04);
    border-bottom: 1px solid #d1d1d1;
}
ul.dropdown-menu.notifications .notifications-wrapper a.content:hover {
    color: #000;
    background: rgba(0, 0, 0, 0.1);
}
.login-nav ul.nav.navbar-nav.navbar-right li a {
    display: block;
}
.notification-heading {
    background: #000;.notifications a.content {
    text-decoration: none;
    display: block;
}
    padding: 3px 10px;
}
ul.dropdown-menu.notifications {
    padding: 0px;
}
.dropdown .glyphicon-bell {  
    vertical-align: middle;
}
.dropdown{
    list-style:none;
}
body { 

    background-image: url('img/images.jpg ');
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-position: center;
    background-size:2508px 1672px;
    
}
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

</style>


<body>
<script type="text/javascript">
 

window.addEventListener( "pageshow", function ( event ) {
	  var historyTraversal = event.persisted || ( typeof window.performance != "undefined" && window.performance.navigation.type === 2 );
	  if ( historyTraversal ) {
	    // Handle page restore.
	    window.location.reload();
	  }
	});

 
</script>
<%
    String name = (String) session.getAttribute("email_id");  
 
   if(name ==null){
	   response.sendRedirect("login.jsp"); 
	   }
   else
   {
	   out.println(" ");
   }

   %>

 <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
 <img src="img/exalogo.jpg"  style="width:80px;height:30px;cursor:pointer;" > 
  <ul class="navbar-nav">
    <li class="nav-item">
  <a  id="bar5"  class="nav-link y" href="#" style="font-style: oblique; margin-left: 55px; ">METADATA</a>
    </li>
    <li class="nav-item">
      <a   id="bar4"  class="nav-link y" href="#" style="font-style: oblique;  ">MEMBERS</a>
    </li>
  <li class="nav-item">
      <a   id="bar3"  class="nav-link y" href="#" style="font-style: oblique; ">PROVIDER</a>
    </li>
      <li class="nav-item">
      <a  id="bar2"  class="nav-link y" href="#" style="font-style: oblique; ">CLAIMS</a>
    </li>
         <li class="nav-item" >
      <a  id="bar1" class="nav-link y" href="#" style="font-style: oblique; ">POPULATION HEALTH</a>
    </li>
        <li class="nav-item dropdown" >
      <a  id="bar"   class="nav-link y" href="#" style="font-style: oblique; ">NOTIFICATION</a>
      
    </li>
    
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" style="margin-left: 252px;  " id="navbardrop" data-toggle="dropdown">
       ADMIN
      </a>
      <div class="dropdown-menu" style="background: skyblue; margin-left: 264px";	>
        <a class="dropdown-item" href="#" style="font-style: oblique;">ADD USER</a>
        <a class="dropdown-item" href="#" style="font-style: oblique;">CONFIGURATION</a>
        <a class="dropdown-item" href="#" style="font-style: oblique;">LOGOUT</a>
      </div>
    </li>
	
  </ul>
   <img src="img/exfname.jpg"  style="width:80px;height:30px;cursor:pointer;" > 
</nav>
<br>
 <div class="row">
    <div class="col-sm-2.5" style="overflow-y: scroll; height: 621px;  overflow-y: hidden"   >
<div >



<span class="label success" style="color: #009fff ; margin-left: 95px; font-style:inherit; font-size:x-large;"><b>Reports</b></span>

<%     



MongoClient client = new MongoClient("localhost",27234);
com.mongodb.client.MongoDatabase database = client.getDatabase("ARUJ");
System.out.println("connected to the database successfully");
com.mongodb.client.MongoCollection<Document> collection = database.getCollection("MEMBER");
System.out.println("collection successfully created");
FindIterable<Document> findIterable = collection.find();
Iterator<Document> iter = findIterable.iterator();
while(iter.hasNext()){
	
Document reports = iter.next();
System.out.println(reports);
Object Reports = reports.get("Report_Name");

%>


   <p><b><a  class="x z"  id="meta" style="color: white ; margin-left: 95px; font-style: inherit;font-size:smaller ; " ><% out.println(Reports);  %></a></b></p> 
   
     <%
}
   
   %>
 
  
   <hr  style="border-color:#42ff33">
       <span class="label success" style="color: #009fff ; margin-left:95px;;font-style:inherit; font-size:x-large;;"><b>Dashboards</b></span>
      <p><b><a  class="x z" style="color: white; margin-left:95px; font-size:smaller ">Member Dashboard</a></b></p>
 </div>   
    </div>
    <div class="col-sm-9">
    <div class="panel panel-default" >
    <div  id="noti" class="panel-body" style="height: 200px; 
    background-color:rgba(23, 102, 184, 0.1);
    width: 412px; margin-top: -24px;
    margin-left: 399px;border-style: solid;
    border-width:  3px; color:white "> <span id="close" style="cursor: pointer;  aria-hidden="true">&times;</span>        
    </div>
  </div>
  
   <%
   FindIterable<Document> findIterable1 = collection.find();
   Iterator<Document> iter1 = findIterable.iterator();
   while(iter1.hasNext()){
   	
   Document reports = iter1.next();
   System.out.println(reports);
   Object links = reports.get("url");
   
            %>
  
     <iframe id="meta1" src=" <% out.print(links); %>" height="600" width="1000"></iframe>
   <%
            }
   %>
   
    </div>
  </div>
  
<div class="footer">
  <p align="center" style="color:white" > 2017 © Exafluence. All rights Reserved </p>	
</div>

</body>

<!-- <script>

$(document).ready(function(){
	
    $(".z").click(function(){
    	
 var str = $(this).attr("src");
 

        
    });
});




</script>  -->






<!-- <script>
$(document).ready(function(){
	$("#noti").hide();
	$("#meta1").hide();
	$("#memb2").hide();
    $("#meta").on('click',function(){
	$("#dash1").hide();
	$("#meta1").show();
	$("#memb2").hide();
	$("#noti").hide();
});
$("#das1").on('click',function(){
	 $("#meta1").hide();
	 $("#dash1").show();
	 $("#memb2").hide();
});
 $("#bar").on('click',function(){
	$("#noti").show();
	$("#meta1").hide();
});
 $("#bar1").on('click',function(){
		$("#noti").hide();
	});
	 
 $("#bar2").on('click',function(){
		$("#noti").hide();
	});
 $("#bar3").on('click',function(){
		$("#noti").hide();
	});
 $("#bar4").on('click',function(){
		$("#noti").hide();
	});
 $("#bar5").on('click',function(){
		$("#noti").hide();
	});
 $("#close").on('click',function(){
		$("#noti").hide();
	});
$("#memb").on('click',function(){
	$("#noti").hide();
	$("#dash1").hide();
	$("#memb2").show();
	$("#meta1").hide();
});
});
$('.z').click(function(){
	$(".z").css('font-style','inherit');	
	$(".z").css('color','white');	 
 $(this).css('color', 'skyblue');
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
    	
        $(this).css("color", "skyblue");
        
        $(this).css("cursor", "pointer");
    });
    $(".x").mouseout(function(){
        $(".x").css("color", "white");
    });
});
</script> -->
</html>

