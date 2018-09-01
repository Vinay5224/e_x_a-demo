<%@page import="com.mongodb.BasicDBObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- <%@page import="templates.Dummy"%> --%>
<%@page import="org.bson.Document" %>
<%@page import="com.mongodb.MongoClient"%>
<%@page import="com.mongodb.client.FindIterable"%>
<%@page import="com.mongodb.client.MongoCollection"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page import="com.mongodb.MongoCredential"%>
<%@page import="com.mongodb.ServerAddress"%>
<%@page import="java.util.*"%>
    
<!DOCTYPE html>
<head>

 
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">
    <title>Exafluence</title>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css'><script src='https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js'></script>
<style class="cp-pen-styles">a {
  text-decoration: none;
  
}

body {
  font-size: 13px;
  line-height: 20px;
  background-color: #;
}

.clearfix:after {
  content: "";
  display: table;
  clear: both;
}
	
.nav-activity {
  display: block;
  position: absolute;
  z-index: +1;
  top: 0;
  left: 0;
  width: auto;
  max-width: 90px;
  height: auto;
  padding-right: 0;
  padding-left: 0;
  overflow: hidden;
  cursor: pointer;
  transition: 200ms ease-out;
  border-top: none;
 
}
.nav-activity:hover {
  max-width: 250px;
  cursor: pointer;
}
.nav-activity svg {
  float: left;
  margin: 10px 20px 10px 10px;
}
.nav-activity a .activity-title {
  display: block;
  margin-top: 15px;
  font-weight: 600;
  color: #ffffff;
}
.nav-activity a .activity-listings {
  display: block;
  max-width: 100%;
  overflow: hidden;
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
  color: rgba(255, 255, 255, 0.8);
  
}
.nav-activity .icon-wrap {
  position: relative;
  float: left;
}
.nav-activity svg {
  display: block;
  width: 50px;
  height: 50px;
  margin: 0 auto;
  margin: 10px;
  margin-right: 20px;
  
}
.nav-activity svg circle {
  fill: none;
}
.nav-activity .activity-link, .nav-activity a.activity-link {
  display: block;
  min-width: 200px;
  padding: 5px 10px;
  font-size: .9em;
  white-space: nowrap;
  border-top: none;
  background-color: #212429;
  border-color: #212429;
  
}
.nav-activity .activity-link.active, .nav-activity a.activity-link.active {
  background-color: #2077D8;
  border-color: #2077D8;
}
.nav-activity .activity-link.active .activity-listings, .nav-activity a.activity-link.active .activity-listings {
  color: white;
}
.nav-activity .activity-link.active .svg-fill, .nav-activity .activity-link.active svg circle, .nav-activity a.activity-link.active .svg-fill, .nav-activity a.activity-link.active svg circle {
  fill: #1875DC;
}
.nav-activity .activity-link.active .activity-title, .nav-activity a.activity-link.active .activity-title {
  color: #ffffff;
}
.nav-activity .activity-link.active:hover .svg-fill, .nav-activity a.activity-link.active:hover .svg-fill {
  fill: #549cec;
}
.nav-activity .activity-link:hover, .nav-activity a.activity-link:hover {
  border-color: #2077D8;
  background-color: #3184e0;
}
.nav-activity .activity-link .svg-fill, .nav-activity .activity-link .svg-fill *, .nav-activity .activity-link .svg-icon, .nav-activity .activity-link .svg-icon *, .nav-activity a.activity-link .svg-fill, .nav-activity a.activity-link .svg-fill *, .nav-activity a.activity-link .svg-icon, .nav-activity a.activity-link .svg-icon * {
  transition: fill .2s;
}
.nav-activity .activity-link .svg-fill, .nav-activity .activity-link .svg-fill *, .nav-activity a.activity-link .svg-fill, .nav-activity a.activity-link .svg-fill * {
  fill: #0E5099;
  fill: #F3DF32;
}

.nav-activity .svg-icon, .nav-activity .svg-icon * {
  fill: #fff;
}
</style>


<style class="cp-pen-styles">.container {
  width: 100%;
  height: 480px;
}

#learn-more {
  fill-opacity: 0;
  fill: #fff;
  stroke: #fff;
  stroke-width: 2;
  border-radius: 5px;
  stroke-linejoin: round;
  -webkit-transition: all 250ms ease-in;
  transition: all 250ms ease-in;
  cursor: pointer;
}
#learn-more:hover {
  fill-opacity: 1;
}
#learn-more:hover ~ .learn-more-text {
  fill: #005fa4;
}

.learn-more-text {
  font-family: 'Roboto';
  fill: #fff;
  pointer-events: none;
  font-size: 14px;
  -webkit-transition: all 250ms ease-in;
  transition: all 250ms ease-in;
}

.center {
  fill: #005fa4;
}

.pointer {
  fill: #fff;
  stroke: #3b8fc0;
  stroke-width: 2;
}

.nav-copy {
  font-family: 'Roboto';
  fill: #fff;
  fill-opacity: 1;
  -webkit-transition: all 250ms ease-in;
  transition: all 250ms ease-in;
}
.nav-copy.changing {
  fill-opacity: 0;
}

.service {
  cursor: pointer;
}
.service text {
  font-size: 14px;
  font-family: 'Roboto';
  text-anchor: middle;
}
.service .icon-wrapper {
  -webkit-transform-origin: 50% 50%;
          transform-origin: 50% 50%;
}
.service .icon-wrapper, .service .icon-wrapper > * {
  -webkit-transition: all 250ms ease-in;
  transition: all 250ms ease-in;
}
.service circle {
  fill: #005fa4;
}
.service circle.shadow {
  fill-opacity: 0;
  -webkit-filter: url(#service-shadow);
          filter: url(#service-shadow);
}
.service use {
  fill: #fff;
}
.service text {
  fill: #ffff;
}
.service.active .icon-wrapper, .service:hover .icon-wrapper {
  -webkit-transform: scale(1.15) translateY(-5px);
          transform: scale(1.15) translateY(-5px);
}
.service.active .icon-wrapper, .service.active .icon-wrapper > *, .service:hover .icon-wrapper, .service:hover .icon-wrapper > * {
  -webkit-transition: all 250ms ease-out;
  transition: all 250ms ease-out;
}
.service.active .icon-wrapper circle.shadow, .service:hover .icon-wrapper circle.shadow {
  fill-opacity: 0.4;
}
.service.active text, .service:hover text {
  fill: #005fa4;
  font-weight: bold;
}
.dropdown-menu{
top:-70px;
}
</style>
</head>

<body style="background-image:url(img/bcak.jpg); background-repeat:no-repeat;">
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

<%!static long count; %>
   <%
	MongoCredential credential = MongoCredential.createCredential("Exafluencep", "Provider", "$Exafluence@123".toCharArray());
	MongoClient client = new MongoClient(new ServerAddress("34.234.131.180", 27234), Arrays.asList(credential));
//	MongoClient client = new MongoClient("34.225.16.50", 27081);
	MongoDatabase DB = client.getDatabase("Provider");
	MongoCollection notifyColl = DB.getCollection("CMSNotifications"); 
//	BasicDBObject query = new BasicDBObject("NPI", );
/* 	FindIterable<Document> search = notifyColl.find();
	Iterator<Document> Iter = search.iterator(); */
	 count = notifyColl.count();
	
/* 	while(Iter.hasNext()){
		Document doc = Iter.next();
		if(doc.get("isRead").equals(false)){
			count = count+1;
		}else{
			System.out.println("Condition is true");
		}
	} */
	//System.out.println(count);
		 %>
 <!--<div class="hidden-xs col-sm-1 nav-activity" style="margin-top:80px; ">
        <a class="activity-link clearfix water active" data-ua-event=
        "Virb,Click,Activity virb_activities_water,water" href=
        "/en-US/activities/water/"><span class="icon-wrap"><svg viewbox=
        "0 0 46.9 46.9" xmlns="http://www.w3.org/2000/svg">
        <circle cx="349.1" cy="67.1" fill="#FBD236" r="23.4"></circle>
        <g fill="none" stroke="#fff" stroke-linejoin="round" stroke-miterlimit=
        "10" stroke-width="1.5">
            <path d="M340.6 68.8l3.6 1-.6 3.4" stroke-linecap="square"></path>
            <path d="M349.2 77.7l-.1-21.2" stroke-linecap="round"></path>
            <path d="M351.7 58.2l-2.6 2.7-2.7-2.2M346.4 75.3l2.7-2.7 2.6 2.2"
            stroke-linecap="square"></path>
            <path d="M339.8 72.4l18.5-10.5" stroke-linecap="round"></path>
            <path d="M358.1 65l-3.6-1 .6-3.4" stroke-linecap="square"></path>
            <path d="M340 61.2l17.9 11.5" stroke-linecap="round"></path>
            <path d="M354.9 73.9l-.7-3.6 3.3-1.1M343.6 60.2l.7 3.6-3.3 1.1"
            stroke-linecap="square"></path>
        </g>
      
       <p style="width:40px; height:40px; background-image:url(img/payer.png); background-repeat:no-repeat; margin-top:10%;"></p>
        </svg></span><span class=
        "activity-title" style="font-size:11px; margin-top:10%;">Payer</span></a><a class=
        "activity-link clearfix snow" data-ua-event=
        "Virb,Click,Activity virb_activities_water,snow" href=
        "/en-US/activities/snow/"><span class="icon-wrap"><svg viewbox=
        "0 0 46.9 46.9" xmlns="http://www.w3.org/2000/svg">
        <circle cx="349.1" cy="67.1" fill="#FBD236" r="23.4"></circle>
        <g fill="none" stroke="#fff" stroke-linejoin="round" stroke-miterlimit=
        "10" stroke-width="1.5">
            <path d="M340.6 68.8l3.6 1-.6 3.4" stroke-linecap="square"></path>
            <path d="M349.2 77.7l-.1-21.2" stroke-linecap="round"></path>
            <path d="M351.7 58.2l-2.6 2.7-2.7-2.2M346.4 75.3l2.7-2.7 2.6 2.2"
            stroke-linecap="square"></path>
            <path d="M339.8 72.4l18.5-10.5" stroke-linecap="round"></path>
            <path d="M358.1 65l-3.6-1 .6-3.4" stroke-linecap="square"></path>
            <path d="M340 61.2l17.9 11.5" stroke-linecap="round"></path>
            <path d="M354.9 73.9l-.7-3.6 3.3-1.1M343.6 60.2l.7 3.6-3.3 1.1"
            stroke-linecap="square"></path>
        </g>
        <circle cx="23.4" cy="23.4" fill="#FBD236" r="23.4"></circle>
        <g fill="none" stroke="#fff" stroke-linejoin="round" stroke-miterlimit=
        "10" stroke-width="1.5">
             <p style="width:40px; height:40px; background-image:url(img/device.png); background-repeat:no-repeat; margin-top:10%;"></p>
            
          
           
            
       
            
        </g></svg></span><span class="activity-title" style="font-size:11px; margin-top:10%;">Device Manufacturs</span></a><a class=
        "activity-link clearfix sports-+-outdoor" data-ua-event=
        "Virb,Click,Activity virb_activities_water,sports + outdoor" href=
        "/en-US/activities/outdoor/"><span class="icon-wrap">
      <svg id="Layer_1"
        version="1.1" viewbox="0 0 1200 900" x="0px" xmlns=
        "http://www.w3.org/2000/svg" y="0px">
        <circle cx="6849.1" cy="1287.6" fill="#FBD236" r="449"></circle>
        <g>
            <path d=" M6686,1320.3l69.1,19.2l-11.5,65.2" fill="none" stroke=
            "#FFFFFF" stroke-linecap="square" stroke-linejoin="round"
            stroke-miterlimit="10" stroke-width="1.5"></path>
            <path d=" M6851.1,1491l-1.9-406.8" fill="none" stroke="#FFFFFF"
            stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit=
            "10" stroke-width="1.5"></path>
            <path d=
            " M6899,1116.8l-49.9,51.8l-51.8-42.2 M6797.3,1445l51.8-51.8l49.9,42.2"
            fill="none" stroke="#FFFFFF" stroke-linecap="square"
            stroke-linejoin="round" stroke-miterlimit="10" stroke-width="1.5">
            </path>
            <path d=" M6670.7,1389.3l355-201.5" fill="none" stroke="#FFFFFF"
            stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit=
            "10" stroke-width="1.5"></path>
            <path d=" M7021.9,1247.3l-69.1-19.2l11.5-65.2" fill="none" stroke=
            "#FFFFFF" stroke-linecap="square" stroke-linejoin="round"
            stroke-miterlimit="10" stroke-width="1.5"></path>
            <path d=" M6674.5,1174.4l343.5,220.7" fill="none" stroke="#FFFFFF"
            stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit=
            "10" stroke-width="1.5"></path>
            <path d=
            " M6960.4,1418.1L6947,1349l63.3-21.1 M6743.6,1155.2l13.4,69.1l-63.3,21.1"
            fill="none" stroke="#FFFFFF" stroke-linecap="square"
            stroke-linejoin="round" stroke-miterlimit="10" stroke-width="1.5">
            </path>
        </g>
        <circle cx="599" cy="449" fill="#FBD236" r="449"></circle>
        <g>
           <p style="width:40px; height:40px; background-image:url(img/parama.png); background-repeat:no-repeat; margin-top:10%;"></p>
       
       </svg></span><span class="activity-title" style="font-size:11px; margin-top:10%;">Pharma  Commercial</span></a>
        
        <a class="activity-link clearfix sky" data-ua-event=
        "Virb,Click,Activity virb_activities_water,sky" href=
        "/en-US/activities/sky/"><span class="icon-wrap"><svg viewbox=
        "0 0 200 200" xmlns="http://www.w3.org/2000/svg">
        <circle cx="1488.7" cy="286.1" fill="#FBD236" r="99.8"></circle>
        <g fill="none" stroke="#fff" stroke-linejoin="round" stroke-miterlimit=
        "10" stroke-width="1.5">
            <path d="M1452.5 293.4l15.3 4.3-2.6 14.5" stroke-linecap="square">
            </path>
            <path d="M1489.1 331.3l-.4-90.4" stroke-linecap="round"></path>
            <path d=
            "M1499.8 248.2l-11.1 11.5-11.5-9.4M1477.2 321.1l11.5-11.5 11.1 9.4"
            stroke-linecap="square"></path>
            <path d="M1449 308.7l78.9-44.7" stroke-linecap="round"></path>
            <path d="M1527.1 277.2l-15.4-4.3 2.6-14.5" stroke-linecap="square">
            </path>
            <path d="M1449.9 261l76.3 49" stroke-linecap="round"></path>
            <path d="M1513.4 315.1l-3-15.3 14.1-4.7M1465.2 256.7l3 15.4-14 4.7"
            stroke-linecap="square"></path>
        </g>
		
		  <p style="width:40px; height:40px; background-image:url(img/provid.png); background-repeat:no-repeat; margin-top:10%;"></p>
      
        </svg></span><span class=
        "activity-title" style="font-size:11px; margin-top:10%;">Providers</span></a>
        
        <a class=
        "activity-link clearfix motor-sports" data-ua-event=
        "Virb,Click,Activity virb_activities_water,motor sports" href=
        "/en-US/activities/motor/"><span class="icon-wrap"><svg viewbox=
        "0 0 46.9 46.9" xmlns="http://www.w3.org/2000/svg">
        <circle cx="349.1" cy="67.1" fill="#FBD236" r="23.4"></circle>
        <g fill="none" stroke="#fff" stroke-linejoin="round" stroke-miterlimit=
        "10" stroke-width="1.5">
            <path d="M340.6 68.8l3.6 1-.6 3.4" stroke-linecap="square"></path>
            <path d="M349.2 77.7l-.1-21.2" stroke-linecap="round"></path>
            <path d="M351.7 58.2l-2.6 2.7-2.7-2.2M346.4 75.3l2.7-2.7 2.6 2.2"
            stroke-linecap="square"></path>
            <path d="M339.8 72.4l18.5-10.5" stroke-linecap="round"></path>
            <path d="M358.1 65l-3.6-1 .6-3.4" stroke-linecap="square"></path>
            <path d="M340 61.2l17.9 11.5" stroke-linecap="round"></path>
            <path d="M354.9 73.9l-.7-3.6 3.3-1.1M343.6 60.2l.7 3.6-3.3 1.1"
            stroke-linecap="square"></path>
        </g>
      
        
        
          <p style="width:40px; height:40px; background-image:url(img/cro.png); background-repeat:no-repeat; margin-top:10%;"></p>
        
        
        
        </svg></span><span class="activity-title" style="font-size:11px; margin-top:10%;">CRO
        </span></a>
        
        
        <a class=
        "activity-link clearfix motor-sports" data-ua-event=
        "Virb,Click,Activity virb_activities_water,motor sports" href=
        "/en-US/activities/motor/"><span class="icon-wrap"><svg viewbox=
        "0 0 46.9 46.9" xmlns="http://www.w3.org/2000/svg">
       
           
        
        
        </svg></a>  
       
        
           <a class=
        "activity-link clearfix motor-sports" data-ua-event=
        "Virb,Click,Activity virb_activities_water,motor sports" href=
        "/en-US/activities/motor/"><span class="icon-wrap"><svg viewbox=
        "0 0 46.9 46.9" xmlns="http://www.w3.org/2000/svg">
       
   
      
        
        
     
        
        
        
        </svg></a> 
        
        
        
        
    </div>-->

<div class="column col-lg-12 col-md-12 col-sm-12" style="height:auto; background-color:#;">
<div class="row">

<div class="column col-lg-2 col-md-2 col-sm-2" style="height:80px; margin-top:20px; ">
<button id="button" type="button" class="btn btn-default" 
  data-toggle="collapse" data-target="#demo" style="background-color:rgb(204,204,204);">
  <span class="glyphicon glyphicon-th"></span> 
</button>

<div id="demo" class=" collapse" style=>
  <ol class="list-group">
      <div class="col-md-12" style=" height:auto; background-color:rgba(255, 255, 255, 0);">
       <a href="">
    <p  id="demo1" style="width:140px; height:40px; background-image:url(img/payer.png); background-repeat:no-repeat; margin-top:10px;"></p><hr>
   <!--  <img src="img/nav-logo.png"    style="width:140px; height:40px; background-image:url(img/device.png); background-repeat:no-repeat; margin-top:10px;" onclick="javascript:location.href='index.jsp'"> -->
    </a>
   <a href="http://52.38.31.24:8080/LabLinks/">
   <p style="width:140px; height:40px; background-image:url(img/device.png); background-repeat:no-repeat; margin-top:10px; "></p><hr>
   </a>
     
   
        
        <p id="demo1" style="width:140px; height:40px; background-image:url(img/parama.png); background-repeat:no-repeat; margin-top:10px;"></p><hr>
     
<!-- <p id="demo1" style="width:140px; height:40px; background-image:url(img/provid.png); background-repeat:no-repeat; margin-top:10px;"> -->
      
      <p id="demo1" style="width:140px; height:40px; background-image:url(img/cro.png); background-repeat:no-repeat; margin-top:10px;"></p><hr>
       <p style="width:140px; height:40px; background-image:url(img/blockchain.png); background-repeat:no-repeat; margin-top:10px;"></p><hr>
        <p style="width:140px; height:40px; background-image:url(img/empi.png); background-repeat:no-repeat; margin-top:10px;"></p><hr>
        <p style="width:140px; height:40px; background-image:url(img/register.png); background-repeat:no-repeat; margin-top:10px;"></p><hr>
      
      </div>
  </ol>
</div>
</div>
<div class="column col-lg-1 col-md-1 col-sm-1" style="height:80px; ">

<!--  <p style="width:30px; height:30px;background-image:url(img/bell.png); background-repeat:no-repeat; margin-top:22px;"></p>  -->

<%-- <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <img src="img/bell.png"  style="width:30px; height:30px;  background-repeat:no-repeat; margin-top:22px;" >  (<b><%  out.println(count); %><%  count=0; %> </b>)</a> --%>

 <a href="npialerts.jsp"   role="button" > <img src="img/bell.png"  style="width:30px; height:30px;background-repeat:no-repeat; margin-top:22px;" > <span class="badge"><%  out.println(count); %><%  count=0; %></span> </a>  
<!-- <text style= "color:white ; font-size: 15px; font-family: Roboto-Bold, Roboto;font-weight: 700; margin-left: -6px;">NPI </text> -->
 <h6><font color="white" style="font-weight: 700;font-size: 10px;margin-left: -10px;cursor: pointer; color:white" ><a style="color: white;" href="npialerts.jsp">NPI ALERT</a></font></h6> 

   <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      
    <ul class="nav navbar-nav navbar-right" style="margin-right: 130px;">
        <li class="dropdown">
         <%--  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <img src="img1/notification.gif"  style="width:20px;height:20px;cursor:pointer;" >  (<b><%  out.println(count); %><%  count=0; %> </b>)</a> --%>
          <ul class="dropdown-menu notify-drop" >
            <div class="notify-drop-title">
            	<div class="row">

 <!--            		<div class="col-md-6 col-sm-6 col-xs-6 text-right"><a href="" class="rIcon allRead" data-tooltip="tooltip" data-placement="bottom" title="tÃƒÂ¼mÃƒÂ¼ okundu."><i class="fa fa-dot-circle-o"></i></a></div> -->
            	</div>
            </div>
            <div class="drop-content" style="height: 300px;overflow-y: scroll;">
<%--             <%
            FindIterable<Document> drop = Dummy.notifyColl.find().limit(10);
            Iterator<Document> ITER = drop.iterator();
            while(ITER.hasNext()){
            Document doc1 = ITER.next();
            Object present = doc1.keySet();
            %> --%>
            	<li>
            	<!-- <div class="col-md-3 col-sm-3 col-xs-3"><div class="notify-img"> <img src="http://placehold.it/45x45" alt=""> </div></div>  -->
            		<div class="col-md-9 col-sm-9 col-xs-9 pd-l0">
            		<%-- <a  id="npid" href="" style="overflow: x;" ><% out.println(doc1.get("NPI")); %>  </a> --%><%-- <%out.println(doc1.get("Date_&_Time"));%> --%>
            		<%--  <button type="button" data-toggle="modal" data-target="#myModal"><a  href=""><% out.println(doc1.get("NPI")); %></a></button> --%> 
            		
            		
            	<%-- 	<p class="getnpi" data-toggle="modal" data-target="#myModal" attr-npi="<% out.println(doc1.get("NPI")); %>"  style="width:30px; height:30px;background-image:url(img/bell.png); background-repeat:no-repeat; margin-top:22px;"><% out.println(doc1.get("NPI")); %></p>
            		  --%>
            		 
            	
  
            		<%-- <a  id="present" href=""><% out.println("updated Area" + " " +present); %></a> --%>
            		
            		<!-- <p class="time"></p> -->
            		</div>
            	</li>
       <%--      	<%
            	}
            %> --%>
            </div>
           <div id="alert" class="alert alert-success">
  <strong>Success!</strong> Indicates a successful or positive action.
  Milliman Advanced Risk Adjusters (MARA) is a suite of risk adjustment tools for commercial, Medicaid, and Medicare population risk analysis.
</div>
         </ul>
        </li>
      </ul>
    </div>



<script>
 $("#alert").hide(); 
$("#npid").on('click',function(){
	$("#alert").show();
});

    $(function () {
  $('[data-tooltip="tooltip"]').tooltip()
	});
</script>
</div>
<div class="column col-lg-2 col-md-2 col-sm-2" style="height:80px; ">

<p style="width:30px; height:30px;background-image:url(img/tit.png); background-repeat:no-repeat; margin-top:22px;"></p>
<!-- <text style= "color:white ; font-size: 10px; font-family: Roboto-Bold, Roboto;font-weight: 700; margin-left: -36px; ">TWITTER ALERT</text> -->
<h6><font color="white" style="font-weight: bolder;font-size: 10px;margin-left: -36px;cursor: pointer;" >TWITTER ALERT</font></h6>

</div>



<!-- <div class="column col-lg-1 col-md-1 col-sm-1" style="height:80px; ">

<p style="width:30px; height:30px;background-image:url(img/message.png); background-repeat:no-repeat; margin-top:22px;"></p>


</div> -->

<div class="column col-lg-2 col-md-2 col-sm-2" style="height:80px; margin-left:230px; ">

<div class="container" style="margin-top:20px; margin-left:130px;">
    <a href="Logout" class="btn btn-info btn-lg">
          <span class="glyphicon glyphicon-log-out"></span> 
        </a>

</div>

</div>



<div class="column col-lg-2 col-md-2 col-sm-2" style="height:80px; background-image:url(img/logo.png); background-repeat:no-repeat;">


</div>

</div>


</div>


<div class="column col-lg-12 col-md-12 col-sm-12" style="height:auto; margin-top:55px;">

<div class="container">
  <svg id="circle-nav-services" width="100%" height="100%" viewBox="0 0 650 550">
    <defs>
    <filter id="service-shadow" height="2" width="2" y="-.5" x="-.5">
      <feOffset result="offOut" in="SourceGraphic" dx="0" dy="5" />
      <feGaussianBlur result="blurOut" in="offOut" stdDeviation="12" />
      <feBlend in="SourceGraphic" in2="blurOut" mode="normal" />
    </filter>
  </defs>
  
    <symbol id="circle-nav-copy" viewBox="0 0 300 300">
      <defs>
        <style>
          .cls-1 {
            font-size: 28px;
            font-family: Roboto-Bold, Roboto;
            font-weight: 700;
          }

          .cls-2 {
            letter-spacing: -0.02em;
          }

          .cls-3 {
            letter-spacing: -0.01em;
          }

          .cls-4 {
            letter-spacing: -0.01em;
          }

          .cls-5 {
            font-size: 16px;
            font-family: Roboto-Regular, Roboto;
          }

          .cls-6 {
            letter-spacing: -0.01em;
          }

          .cls-7 {
            letter-spacing: -0.01em;
          }

          .cls-8 {
            letter-spacing: -0.02em;
          }

          .cls-9 {
            letter-spacing: -0.01em;
          }

          .cls-10 {
            letter-spacing: 0.01em;
          }

          .cls-11 {
            letter-spacing: -0.01em;
          }

          .cls-12 {
            letter-spacing: -0.04em;
          }
          .cls-13 {
            letter-spacing: -0.02em;
          }
          .cls-14 {
            letter-spacing: 0.01em;
          }
          .cls-15 {
            letter-spacing: -0.01em;
          }

          .cls-16 {
            letter-spacing: -0.06em;
          }
          .cls-17 {
            letter-spacing: -0.02em;
          }
          .cls-18 {
            letter-spacing: 0.01em;
          }
          .cls-19 {
            letter-spacing: 0.02em;
          }

          .cls-20 {
            letter-spacing: -0.01em;
          }
          .cls-21 {
            letter-spacing: -0.03em;
          }
        </style>
      </defs>
     
      <text class="cls-1" transform="translate(99 1865)">
        <tspan class="cls-2" x="3" y="0">Provider</tspan>
  <!--       <tspan x="28" y="0"></tspan>
        <tspan class="cls-3" x="-22" y="28"></tspan>
        <tspan x="-4" y="28"></tspan>
        <tspan class="cls-4" x="12" y="28"></tspan>
        <tspan x="21" y="28"></tspan> -->
      </text>
      <text class="cls-5" X="-8" Y="-45" transform="translate(57 1930)">Healthcare Providers (including 
        <tspan class="cls-5" x="-30" y="28"></tspan>
        <tspan x="43" y="0"></tspan>
        <tspan class="cls-5" x="7" y="-30">hospitals, clinics, rehabilita-</tspan>
        <tspan x="12" y="19"></tspan>
        <tspan class="cls-6" x="21" y="19"></tspan>
        <tspan x="26" y="19"> </tspan>
        <tspan class="cls-7" x="172" y="19"></tspan>
        <tspan x="177" y="19"></tspan>
        <tspan x="12" y="38"></tspan>
        <tspan class="cls-8" x="10" y="-12">tion  centers, and extended care</tspan>
        <tspan x="22" y="38"></tspan>
        <tspan class="cls-6" x="65" y="38"></tspan>
        <tspan x="70" y="38"></tspan>
        <tspan class="cls-9" x="98" y="38"></tspan>
        <tspan x="103" y="38"></tspan>
        <tspan class="cls-6" x="143" y="38"></tspan>
        <tspan x="148" y="38"> </tspan>
        <tspan x="-7" y="5">facilities) are facing a growing</tspan>
        <tspan class="cls-10" x="75" y="58"></tspan>
        <tspan x="81" y="58"></tspan>
        <tspan class="cls-6" x="121" y="58"></tspan>
        <tspan x="126" y="58"></tspan>
        <tspan x="1" y="22">need to manage costs while</tspan>
        <tspan class="cls-6" x="9" y="77"></tspan>
        <tspan x="17" y="38">improving quality of </tspan>
        <tspan class="cls-11" x="55" y="77"></tspan>
        <tspan x="0" y="54">care and focusing on patient </tspan>
        <tspan class="cls-6" x="99" y="77"></tspan>
        <tspan x="48" y="70"> outcomes.</tspan>      
        <tspan x="7"  y="115"> <a  href="provider.jsp" style="font-size: large;fill:white;font-weight: bold; cursor: pointer;">PROVIDER REPORTS</a></tspan>
     
      </text>
	  
	  
	  
      <text class="cls-1" transform="translate(89 1596)">
        <tspan class="cls-2" x="3" y="0">Member</tspan>
        <!-- <tspan x="4" y="0">MEMBER</tspan>
        <tspan x="7" y="28"></tspan>
        <tspan class="cls-10" x="39" y="28"></tspan>
        <tspan x="49" y="28"></tspan> 57 1930 -->
      </text>
     <!--  <text class="cls-5" transform="translate(47 1626)"> -->
      <text class="cls-5" transform="translate(40 1610)">
         <tspan x="-3" y="19">Our Manufacturing Execution systems  </tspan>
        <tspan x="-3" y="39"> comprise applications that connect  </tspan>
        <tspan x="-3" y="59">the real-time data originated at the shop   </tspan>
         <tspan x="-15" y="79"> floor with the enterprise level applications.</tspan>
         <!-- <tspan x="48" y="70"> outcomes.</tspan>    -->
           <tspan x="14" y="115"> <a  href="Member.jsp" style="font-size: large ;fill:white;font-weight: bold ;cursor: pointer" >MEMBER REPORTS</a> </tspan>
      </text>
	  
      <text class="cls-1" transform="translate(105 966)">
        <tspan class="cls-2" x="18" y="0"></tspan>
        <tspan x="12" y="0">Social</tspan>
        <tspan x="-42" y="28">Media Sentiment</tspan>
      </text>
      <text class="cls-5" transform="translate(35 997)">
       <tspan x="-3" y="39">We help your operations complete    </tspan>
       <tspan x="-3" y="59">their project on time ,under budget and    </tspan>
       <tspan x="-3" y="79">meeting 100% of the requirements </tspan>
      <tspan x="14" y="115"> <a  href="sentiment.jsp" style="font-size: large ;fill:white;font-weight: bold ;cursor: pointer;" >Social Media Sentiment</a> </tspan>
      </text>
      <text class="cls-1" transform="translate(75 666)">Segmentation</text>
      <text class="cls-5" transform="translate(33 710)">
               <tspan x="-3" y="19">Cost reduction and productivity </tspan>
        <tspan x="-3" y="39"> enhancement. Principal engineers have </tspan>
        <tspan x="-3" y="59">hands-on experience in driving  </tspan>
         <tspan x="-3" y="79">successful energy  management programs. </tspan>
         
      </text>
      <text class="cls-1" transform="translate(87 65)">CLAIMS</text>
      <text class="cls-5" transform="translate(43 108)"   >Our highly skilled staff is
        <tspan x="-3" y="19">disciplined to work within a range of  </tspan>
        <tspan x="-3" y="39">industries in the dynamic life sciences  </tspan>
        <tspan x="-3" y="59"> sector, to meet demanding and  </tspan>
        <tspan x="-3" y="79"> evolving expectations. </tspan>
     
       <tspan x="20" y="115"> <a  href="Claims.jsp" style="font-size: large;fill:white;font-weight: bold ; cursor: pointer;">CLAIMS REPORTS </a> </tspan>
      </text>
      <text class="cls-1" transform="translate(77 385)">
        <tspan class="cls-17"></tspan>
        <tspan x="18" y="0">Metadata</tspan>
        <tspan x="-32" y="28"></tspan>
        <tspan class="cls-18" x="130" y="28"></tspan>
        <tspan x="149" y="28"></tspan>
      </text>
      <text class="cls-5" transform="translate(46 407)">
        <tspan x="-3" y="19">As part of our wide expertise  </tspan>
        <tspan x="-3" y="39">we provide commissioning and </tspan>
        <tspan x="-3" y="59"> qualification  and computer system</tspan>
        <tspan x="-3" y="79"> Validation Solutions. </tspan>
        <tspan x="40" y="120"> <a  href="graph.jsp" style="font-size: large;fill:white;font-weight: bold ; cursor: pointer;">META DATA </a> </tspan>
      </text>
      <text class="cls-1" transform="translate(138 1266)">
        <tspan class="cls-20">
          <tspan class="cls-21" x="8" y="0"></tspan>
        </tspan>
        <tspan x="-80" y="28">Population Health</tspan>
      </text>
      <text class="cls-5" transform="translate(47 1315)">
       <tspan x="-3" y="19">Our Manufacturing Execution systems  </tspan>
        <tspan x="-3" y="39"> comprise applications that connect  </tspan>
        <tspan x="-3" y="59">the real-time data originated at the shop floor   </tspan>
         <tspan x="-3" y="79">with the enterprise level applications. </tspan>
         <tspan class="cls-18" x="130" y="28"></tspan>
        <tspan x="149" y="28"></tspan>
         <tspan x="-25" y="115"> <a  href="Popultion_Health.jsp" style="font-size: medium;fill:white;font-weight: bold ; cursor: pointer;">POPULATION HEALTH REPORTS</a> </tspan>
      </text>
      
      
      
    </symbol>
    <symbol id="industries" viewBox="0 0 512 512">
      <path d="M17.528 189.7l29.46 5.893c1.875 5.74 4.193 11.33 6.924 16.708l-16.667 25.002c-5.745 8.618-4.6 20.188 2.725 27.51l13.196 13.197c7.32 7.322 18.892 8.47 27.51 2.724l25.002-16.666c5.378 2.732 10.97 5.05 16.708 6.922l5.893 29.46c2.03 10.157 11.022 17.53 21.378 17.53h18.663c10.357 0 19.35-7.373 21.38-17.528l5.893-29.462c5.74-1.874 11.33-4.19 16.708-6.922l25.003 16.666c8.617 5.745 20.188 4.602 27.51-2.724l13.197-13.197c7.323-7.323 8.47-18.893 2.724-27.51L264.067 212.3c2.73-5.377 5.05-10.97 6.923-16.707l29.46-5.892c10.157-2.03 17.53-11.022 17.53-21.378v-1.248h26.946V277.2c0 4.464 3.618 8.083 8.084 8.083 4.466 0 8.084-3.62 8.084-8.084V167.073H478.82c3.464 8.69 6.444 17.646 8.902 26.85 1.153 4.314 5.583 6.876 9.897 5.725 4.313-1.152 6.876-5.584 5.724-9.898C473.492 78.03 371.78 0 256 0c-14.635 0-29.312 1.246-43.626 3.704-4.4.756-7.354 4.936-6.6 9.336s4.928 7.356 9.337 6.6c13.412-2.303 27.17-3.47 40.89-3.47 92.894 0 176.116 53.604 215.667 134.736H361.095v-45.81c0-24.357-8.524-48.1-24.003-66.854-2.84-3.443-7.937-3.93-11.38-1.09-3.444 2.842-3.93 7.938-1.09 11.382 13.094 15.864 20.304 35.952 20.304 56.56v45.812H317.98v-1.247c0-10.357-7.373-19.35-17.53-21.38l-29.46-5.892c-1.874-5.74-4.192-11.33-6.923-16.708l16.668-25c5.745-8.62 4.6-20.19-2.725-27.512l-13.196-13.196c-7.32-7.323-18.89-8.47-27.51-2.725l-25.002 16.667c-5.378-2.732-10.97-5.05-16.708-6.923L189.7 17.53C187.67 7.372 178.68 0 168.32 0H149.66c-10.356 0-19.348 7.372-21.38 17.527l-5.892 29.462c-5.74 1.873-11.33 4.19-16.708 6.922L80.676 37.244c-8.617-5.745-20.188-4.602-27.51 2.724L39.97 53.165c-7.323 7.323-8.47 18.893-2.724 27.51l16.667 25.002c-2.73 5.378-5.048 10.97-6.922 16.708l-29.46 5.892C7.37 130.31 0 139.3 0 149.657v18.664c0 10.358 7.372 19.35 17.528 21.38zm-1.36-40.042c0-2.676 1.906-5 4.53-5.524l34.205-6.84c2.985-.598 5.38-2.82 6.2-5.75 2.18-7.793 5.298-15.315 9.263-22.355 1.494-2.653 1.37-5.92-.318-8.453l-19.35-29.03c-1.485-2.226-1.19-5.216.703-7.11l13.2-13.196c1.89-1.892 4.88-2.188 7.108-.703l29.03 19.353c2.532 1.688 5.8 1.81 8.452.317 7.04-3.966 14.56-7.082 22.353-9.262 2.93-.82 5.152-3.215 5.75-6.2l6.84-34.207c.525-2.625 2.85-4.53 5.525-4.53h18.663c2.676 0 5 1.906 5.525 4.53l6.842 34.208c.597 2.984 2.82 5.38 5.75 6.2 7.792 2.18 15.313 5.296 22.353 9.26 2.652 1.494 5.918 1.373 8.452-.316l29.03-19.353c2.225-1.483 5.215-1.19 7.11.704L266.578 64.6c1.894 1.893 2.19 4.883.705 7.11l-19.353 29.03c-1.688 2.532-1.812 5.798-.318 8.45 3.966 7.04 7.082 14.562 9.263 22.357.82 2.93 3.215 5.15 6.2 5.748l34.206 6.84c2.626.526 4.53 2.85 4.53 5.525v18.663c0 2.677-1.906 5-4.53 5.525l-34.205 6.84c-2.985.598-5.38 2.82-6.2 5.75-2.18 7.793-5.298 15.315-9.263 22.355-1.494 2.652-1.37 5.92.318 8.452l19.353 29.03c1.484 2.226 1.19 5.216-.704 7.11l-13.2 13.196c-1.89 1.892-4.88 2.188-7.108.704l-29.03-19.353c-2.534-1.69-5.8-1.812-8.452-.318-7.04 3.966-14.562 7.082-22.353 9.262-2.93.82-5.152 3.215-5.75 6.2l-6.84 34.207c-.525 2.626-2.85 4.53-5.525 4.53H149.66c-2.676 0-5-1.905-5.525-4.53l-6.842-34.207c-.597-2.984-2.82-5.38-5.75-6.2-7.792-2.18-15.313-5.296-22.353-9.26-1.235-.696-2.602-1.04-3.968-1.04-1.566 0-3.13.454-4.484 1.357l-29.03 19.353c-2.226 1.483-5.215 1.19-7.11-.704l-13.195-13.2c-1.894-1.892-2.19-4.882-.705-7.11l19.353-29.028c1.69-2.533 1.813-5.8.32-8.452-3.967-7.04-7.083-14.56-9.264-22.356-.82-2.93-3.215-5.15-6.2-5.748l-34.206-6.84c-2.625-.525-4.53-2.85-4.53-5.525V149.66z"/>
      <path d="M158.99 212.345c14.046 0 27.31-5.413 37.34-15.244 3.19-3.124 3.24-8.243.115-11.43-3.126-3.193-8.245-3.24-11.43-.117-6.993 6.85-16.236 10.624-26.027 10.624-20.505 0-37.187-16.683-37.187-37.187 0-20.505 16.684-37.187 37.188-37.187 20.505 0 37.187 16.683 37.187 37.187 0 4.465 3.62 8.084 8.084 8.084 4.465 0 8.083-3.62 8.083-8.084 0-29.42-23.936-53.356-53.356-53.356S105.63 129.57 105.63 158.99c.004 29.42 23.94 53.355 53.36 53.355zM353.01 369.718c-20.505 0-37.187 16.683-37.187 37.187 0 20.505 16.683 37.187 37.187 37.187 20.505 0 37.187-16.683 37.187-37.187 0-20.505-16.682-37.187-37.187-37.187zm0 58.206c-11.59 0-21.02-9.43-21.02-21.02s9.43-21.018 21.02-21.018 21.02 9.43 21.02 21.02-9.43 21.018-21.02 21.018z"/>
      <path d="M509.79 222.216c-.584-4.427-4.652-7.538-9.073-6.958-4.426.584-7.542 4.646-6.958 9.073 1.373 10.42 2.07 21.077 2.07 31.67 0 30.53-5.84 60.79-17.047 88.927h-42.726c-.696-2.988-2.206-5.808-4.493-8.093l-8.483-8.483c-5.678-5.677-14.648-6.564-21.327-2.11l-14.686 9.79c-2.61-1.255-5.288-2.365-8.022-3.323l-3.46-17.306c-1.576-7.873-8.547-13.587-16.576-13.587h-12c-8.028 0-15 5.715-16.574 13.588l-3.46 17.307c-2.735.96-5.413 2.068-8.023 3.323l-14.686-9.79c-6.68-4.454-15.65-3.566-21.327 2.11l-8.485 8.485c-5.678 5.678-6.565 14.65-2.11 21.33l9.788 14.684c-1.255 2.61-2.365 5.287-3.323 8.02l-17.308 3.462c-7.873 1.575-13.587 8.546-13.587 16.575v11.998c0 8.03 5.715 15 13.588 16.575l17.307 3.46c.958 2.735 2.068 5.413 3.323 8.023l-9.79 14.684c-4.454 6.68-3.567 15.652 2.113 21.33l8.483 8.484c5.68 5.68 14.65 6.566 21.327 2.113l14.686-9.79c2.61 1.254 5.288 2.364 8.022 3.322l3.46 17.306c1.576 7.875 8.547 13.59 16.576 13.59h12c8.028 0 15-5.716 16.574-13.59l3.46-17.305c2.735-.96 5.413-2.068 8.023-3.323l14.686 9.79c6.682 4.456 15.652 3.566 21.327-2.11l8.485-8.485c5.678-5.678 6.565-14.65 2.11-21.33l-9.788-14.684c1.255-2.61 2.365-5.288 3.323-8.022l17.308-3.46c7.873-1.575 13.587-8.546 13.587-16.575v-11.998c0-8.03-5.715-15-13.587-16.575l-17.308-3.46c-.958-2.735-2.068-5.413-3.323-8.023l7.834-11.754h39.914c-1.742 3.575-3.575 7.11-5.5 10.595-2.156 3.91-.736 8.828 3.173 10.985 3.908 2.158 8.826.737 10.983-3.173 4.11-7.446 7.833-15.09 11.164-22.902.14-.282.264-.575.372-.874C505.076 324.34 512 290.324 512 256c0-11.298-.744-22.665-2.21-33.784zm-68.444 177.97c.342.07.59.372.59.72v11.998c0 .35-.247.652-.59.72l-21.99 4.398c-2.985.597-5.38 2.82-6.2 5.75-1.34 4.787-3.253 9.407-5.69 13.73-1.493 2.653-1.37 5.92.32 8.453l12.44 18.662c.193.29.155.68-.092.926l-8.485 8.484c-.248.246-.638.285-.927.092l-18.662-12.442c-2.533-1.69-5.8-1.81-8.45-.317-4.327 2.437-8.946 4.35-13.733 5.69-2.93.82-5.15 3.216-5.748 6.2l-4.4 21.99c-.067.343-.37.592-.72.592h-11.997c-.348 0-.65-.248-.72-.59l-4.398-21.99c-.597-2.986-2.82-5.38-5.748-6.2-4.787-1.34-9.408-3.255-13.732-5.69-1.235-.696-2.602-1.04-3.968-1.04-1.566 0-3.13.454-4.484 1.357L295.3 474.12c-.29.194-.68.154-.926-.092l-8.483-8.483c-.246-.247-.285-.636-.09-.928l12.44-18.662c1.687-2.533 1.81-5.8.317-8.452-2.437-4.325-4.35-8.944-5.69-13.73-.82-2.932-3.214-5.153-6.2-5.75l-21.988-4.4c-.344-.068-.593-.37-.593-.72v-11.998c0-.35.248-.652.59-.72l21.99-4.398c2.986-.597 5.38-2.82 6.2-5.75 1.34-4.787 3.254-9.407 5.69-13.73 1.494-2.653 1.37-5.92-.318-8.453l-12.44-18.662c-.195-.29-.157-.68.09-.926l8.485-8.484c.245-.247.637-.286.926-.092l18.663 12.44c2.532 1.69 5.8 1.81 8.452.318 4.326-2.436 8.945-4.35 13.732-5.69 2.93-.82 5.15-3.215 5.748-6.2l4.398-21.99c.068-.342.372-.59.72-.59h11.998c.35 0 .652.247.72.59l4.4 21.99c.596 2.985 2.818 5.38 5.747 6.2 4.787 1.34 9.408 3.254 13.732 5.69 2.65 1.493 5.917 1.37 8.45-.317l18.663-12.44c.29-.195.68-.156.927.092l8.483 8.483c.247.247.286.636.092.928l-12.44 18.662c-1.688 2.533-1.812 5.8-.318 8.452 2.437 4.324 4.35 8.944 5.69 13.73.82 2.932 3.214 5.153 6.2 5.75l21.99 4.4zM271.08 495.365c-4.99.31-10.062.467-15.08.467-64.06 0-124.29-24.947-169.586-70.244-3.158-3.158-8.276-3.156-11.433 0s-3.156 8.275 0 11.432C123.334 485.372 187.62 512 256 512c5.35 0 10.76-.167 16.08-.497 4.456-.276 7.845-4.113 7.568-8.57-.275-4.454-4.075-7.85-8.568-7.568z"/>
      <path d="M40.313 361.095h110.592v45.81c0 20.864 6.1 41.026 17.646 58.306 1.558 2.335 4.12 3.596 6.73 3.596 1.542 0 3.103-.442 4.483-1.362 3.712-2.48 4.71-7.5 2.23-11.213-9.76-14.612-14.92-31.67-14.92-49.323v-45.81h80.842c4.466 0 8.084-3.62 8.084-8.085 0-4.465-3.62-8.084-8.085-8.084h-80.842V339c0-4.465-3.618-8.084-8.084-8.084-4.467 0-8.085 3.62-8.085 8.084v5.928H33.137c-11.19-27.992-16.97-58.004-16.97-88.928 0-17.193 1.828-34.352 5.433-50.998.945-4.363-1.826-8.667-6.19-9.612-4.37-.943-8.666 1.827-9.612 6.19C1.95 219.348 0 237.657 0 256c0 55.886 17.686 108.983 51.146 153.554 2.68 3.57 7.748 4.292 11.32 1.61 3.57-2.68 4.29-7.747 1.61-11.318-9.212-12.272-17.15-25.234-23.763-38.75z"/>
    </symbol>
    <symbol id="validation" viewBox="0 0 512 512">
      <path d="M245.221 328.758h21.558c4.465 0 8.084-3.62 8.084-8.084 0-4.465-3.62-8.084-8.084-8.084h-21.558c-4.465 0-8.084 3.62-8.084 8.084 0 4.464 3.619 8.084 8.084 8.084zM299.116 328.758h21.558c4.465 0 8.084-3.62 8.084-8.084 0-4.465-3.62-8.084-8.084-8.084h-21.558c-4.465 0-8.084 3.62-8.084 8.084 0 4.464 3.619 8.084 8.084 8.084zM243.884 206.589c1.505 2.258 4.034 3.6 6.725 3.6.167 0 .335-.005.503-.016 2.876-.179 5.44-1.876 6.728-4.453l32.337-64.674c1.997-3.994.378-8.85-3.615-10.846-3.991-1.996-8.848-.377-10.846 3.615l-26.108 52.213-13.831-20.745c-2.477-3.714-7.496-4.719-11.21-2.242-3.716 2.476-4.719 7.496-2.242 11.21l21.559 32.338zM191.326 328.758h21.558c4.465 0 8.084-3.62 8.084-8.084 0-4.465-3.62-8.084-8.084-8.084h-21.558c-4.465 0-8.084 3.62-8.084 8.084 0 4.464 3.62 8.084 8.084 8.084z"/>
      <path d="M493.137 32.337H361.095V18.863c0-10.4-8.463-18.863-18.863-18.863H169.768c-10.401 0-18.863 8.463-18.863 18.863v13.474H18.863C8.463 32.337 0 40.799 0 51.2v291.032c0 10.401 8.463 18.863 18.863 18.863h175.158v13.474c0 10.401 8.463 18.863 18.863 18.863h13.474v59.284h-35.032c-10.401 0-18.863 8.463-18.863 18.863v24.253H148.21c-4.465 0-8.084 3.62-8.084 8.084 0 4.465 3.62 8.084 8.084 8.084h118.568c4.465 0 8.084-3.62 8.084-8.084 0-4.465-3.62-8.084-8.084-8.084h-78.147v-24.253c0-1.485 1.209-2.695 2.695-2.695h129.347c1.485 0 2.695 1.209 2.695 2.695v24.253h-24.253c-4.465 0-8.084 3.62-8.084 8.084 0 4.465 3.62 8.084 8.084 8.084h64.674c4.465 0 8.084-3.62 8.084-8.084 0-4.465-3.62-8.084-8.084-8.084h-24.253v-24.253c0-10.401-8.463-18.863-18.863-18.863h-35.032v-59.284h13.474c10.401 0 18.863-8.463 18.863-18.863v-13.474h175.158c10.401 0 18.863-8.463 18.863-18.863V51.2c.001-10.401-8.462-18.863-18.862-18.863zM269.474 452.716h-26.947v-59.284h26.947v59.284zm226.358-110.484c0 1.485-1.209 2.695-2.695 2.695h-204.8c-4.465 0-8.084 3.62-8.084 8.084 0 4.465 3.62 8.084 8.084 8.084h13.474v13.474c0 1.485-1.209 2.695-2.695 2.695h-86.232c-1.485 0-2.695-1.209-2.695-2.695v-13.474H256c4.465 0 8.084-3.62 8.084-8.084 0-4.465-3.62-8.084-8.084-8.084H18.863c-1.485 0-2.695-1.209-2.695-2.695v-45.81h479.663v45.81zm0-61.979H16.168v-102.4H78.54l14.504 29.007c2.297 4.594 6.915 7.447 12.051 7.447s9.754-2.854 12.051-7.448l14.504-29.006h41.201c4.08 42.284 39.814 75.453 83.149 75.453s79.069-33.169 83.149-75.453h46.199c3.062 0 5.862-1.73 7.231-4.469l14.327-28.654 14.327 28.654c1.369 2.739 4.168 4.469 7.231 4.469h67.368v102.4zm-307.2-110.485c0-37.146 30.222-67.368 67.368-67.368s67.368 30.222 67.368 67.368-30.222 67.369-67.368 67.369-67.368-30.222-67.368-67.369zm307.2-8.084H433.46l-14.504-29.007c-2.297-4.594-6.915-7.447-12.051-7.447s-9.754 2.854-12.051 7.448l-14.503 29.006h-41.203c-4.08-42.284-39.814-75.453-83.149-75.453S176.93 119.4 172.85 161.684h-46.198c-3.062 0-5.861 1.73-7.231 4.469l-14.327 28.655-14.327-28.655c-1.369-2.739-4.168-4.469-7.231-4.469H16.168V51.2c0-1.485 1.209-2.695 2.695-2.695h269.474c4.465 0 8.084-3.62 8.084-8.084 0-4.465-3.62-8.084-8.084-8.084H167.074V18.863c0-1.485 1.209-2.695 2.695-2.695h172.463c1.485 0 2.695 1.209 2.695 2.695v13.474h-24.253c-4.465 0-8.084 3.62-8.084 8.084 0 4.465 3.62 8.084 8.084 8.084h172.463c1.485 0 2.695 1.209 2.695 2.695v110.484z"/>
</symbol>
    <symbol id="engineering" viewBox="0 0 512 512">
      <path d="M482.358 0H105.095c-4.465 0-8.084 3.619-8.084 8.084s3.62 8.084 8.084 8.084h377.263c7.43 0 13.474 6.044 13.474 13.474v261.389h-45.81c-4.465 0-8.084 3.619-8.084 8.084 0 4.466 3.62 8.084 8.084 8.084h45.81v78.147c0 4.796-2.584 9.271-6.742 11.676-3.864 2.236-5.186 7.181-2.95 11.046 1.498 2.589 4.213 4.037 7.005 4.037 1.373 0 2.766-.35 4.041-1.088 9.137-5.286 14.815-15.123 14.815-25.671V29.642C512 13.298 498.703 0 482.358 0z"/>
      <path d="M420.379 353.01c0 16.344 13.297 29.642 29.642 29.642s29.642-13.298 29.642-29.642-13.297-29.642-29.642-29.642-29.642 13.298-29.642 29.642zm29.642-13.473c7.43 0 13.474 6.044 13.474 13.474s-6.044 13.474-13.474 13.474-13.474-6.044-13.474-13.474 6.044-13.474 13.474-13.474zM177.853 406.905c0-4.466-3.62-8.084-8.084-8.084H29.642c-7.43 0-13.474-6.044-13.474-13.474V307.2h196.716c4.465 0 8.084-3.618 8.084-8.084 0-4.466-3.62-8.084-8.084-8.084H16.168V29.642c0-7.43 6.044-13.474 13.474-13.474h43.116c4.465 0 8.084-3.619 8.084-8.084S77.223 0 72.758 0H29.642C13.297 0 0 13.298 0 29.642v355.705c0 16.344 13.297 29.642 29.642 29.642h140.126c4.465 0 8.085-3.618 8.085-8.084z"/>
      <path d="M453.953 400.724l-71.302-21.391v-25.285c5.782-2.746 11.217-6.263 16.143-10.489 13.183-11.309 21.896-26.992 24.537-44.158l8.985-58.407c8.768-3.359 15.009-11.862 15.009-21.796 0-6.231-2.426-12.089-6.832-16.495v-.001l-15.744-15.743-11.127-33.382c-6.435-19.303-23.528-32.768-43.452-34.755-2.979-6.503-9.551-11.032-17.16-11.032h-43.116c-7.609 0-14.18 4.529-17.16 11.032-19.924 1.987-37.017 15.452-43.452 34.755l-11.127 33.382-15.744 15.743c-4.406 4.406-6.833 10.265-6.833 16.496 0 9.934 6.241 18.438 15.009 21.796l8.985 58.407c2.641 17.167 11.356 32.849 24.537 44.158 4.926 4.225 10.361 7.741 16.143 10.489v25.285l-71.302 21.391c-21.824 6.547-36.488 26.255-36.488 49.041v43.372c0 10.401 8.463 18.863 18.863 18.863h194.021c4.465 0 8.084-3.618 8.084-8.084 0-4.466-3.62-8.084-8.084-8.084H258.695v-24.253c0-4.466-3.62-8.084-8.084-8.084s-8.084 3.618-8.084 8.084v24.253h-51.2c-1.485 0-2.695-1.208-2.695-2.695v-43.372c0-15.59 10.033-29.075 24.965-33.555l75.926-22.778h83.859l75.927 22.778c14.932 4.48 24.965 17.965 24.965 33.555v43.372c0 1.486-1.209 2.695-2.695 2.695h-51.2v-24.253c0-4.466-3.62-8.084-8.084-8.084s-8.084 3.618-8.084 8.084v32.337c0 4.466 3.62 8.084 8.084 8.084h59.284c10.401 0 18.863-8.463 18.863-18.863v-43.372c0-22.786-14.664-42.494-36.489-49.041zM238.908 226.357c-3.948 0-7.159-3.212-7.159-7.16 0-1.912.745-3.71 2.096-5.062l17.093-17.092c.887-.888 1.557-1.97 1.953-3.16l11.731-35.192c4.041-12.123 14.224-20.88 26.411-23.287v34.365c0 4.466 3.62 8.084 8.084 8.084 4.465 0 8.084-3.619 8.084-8.084v-43.116c0-1.486 1.209-2.695 2.695-2.695h43.116c1.485 0 2.695 1.208 2.695 2.695v43.116c0 4.466 3.62 8.084 8.084 8.084s8.084-3.619 8.084-8.084v-34.364c12.187 2.407 22.368 11.164 26.409 23.287l11.731 35.192c.397 1.191 1.066 2.273 1.953 3.16l17.092 17.091c1.333 1.333 2.098 3.179 2.098 5.063 0 3.949-3.211 7.16-7.159 7.16v-.001H238.908zm112.514 134.738c5.093 0 10.142-.536 15.064-1.578v17.746h-70.063v-17.746c4.922 1.042 9.969 1.578 15.064 1.578h9.189c4.465 0 8.084-3.618 8.084-8.084 0-4.466-3.62-8.084-8.084-8.084h-9.189c-28.132 0-51.655-20.181-55.932-47.986l-8.372-54.414h168.542l-8.371 54.414c-4.278 27.804-27.8 47.986-55.932 47.986-4.465 0-8.084 3.618-8.084 8.084-.002 4.465 3.618 8.084 8.084 8.084zM61.979 323.368c-16.345 0-29.642 13.298-29.642 29.642s13.297 29.642 29.642 29.642h75.453c16.345 0 29.642-13.298 29.642-29.642s-13.297-29.642-29.642-29.642H61.979zm88.926 29.642c0 7.43-6.044 13.474-13.474 13.474H61.979c-7.43 0-13.474-6.044-13.474-13.474s6.044-13.474 13.474-13.474h75.453c7.429.001 13.473 6.045 13.473 13.474z"/>
      <path d="M153.6 43.116H78.147c-7.43 0-13.474 6.044-13.474 13.474v32.337c0 7.43 6.044 13.474 13.474 13.474h29.642v19.257l-35.665 17.833c-4.596 2.296-7.45 6.915-7.45 12.052v4.118c0 5.137 2.854 9.756 7.448 12.051l35.668 17.834V204.8H78.147c-7.43 0-13.474 6.044-13.474 13.474v32.337c0 7.43 6.044 13.474 13.474 13.474H153.6c7.43 0 13.474-6.044 13.474-13.474v-8.084h24.253c4.465 0 8.084-3.618 8.084-8.084 0-4.466-3.62-8.084-8.084-8.084h-24.253v-8.084c0-7.43-6.044-13.474-13.474-13.474h-29.642v-19.257l35.665-17.833c4.596-2.296 7.45-6.915 7.45-12.052v-4.118c0-5.137-2.854-9.756-7.448-12.051l-35.668-17.834V102.4H153.6c7.43 0 13.474-6.044 13.474-13.474v-8.084h264.084v78.147c0 4.466 3.62 8.084 8.084 8.084 4.465 0 8.084-3.618 8.084-8.084V72.758c0-4.466-3.62-8.084-8.084-8.084H167.074V56.59c0-7.43-6.044-13.474-13.474-13.474zm-2.695 177.852v26.947H80.842v-26.947h70.063zm0-67.76v.786l-35.032 17.516-35.032-17.516v-.786l35.032-17.516 35.032 17.516zm0-66.976H80.842V59.284h70.063v26.948zM183.242 353.01c0 16.344 13.297 29.642 29.642 29.642s29.642-13.298 29.642-29.642-13.297-29.642-29.642-29.642-29.642 13.298-29.642 29.642zm43.116 0c0 7.43-6.044 13.474-13.474 13.474s-13.474-6.044-13.474-13.474 6.044-13.474 13.474-13.474 13.474 6.045 13.474 13.474z"/>
</symbol>
    <symbol id="management" viewBox="0 0 512 512">
      <path d="M174.91 70.063h97.505c6.268 0 12.107-3.097 15.621-8.287 3.514-5.19 4.222-11.763 1.895-17.582l-12.935-32.337C274.115 4.654 267.24 0 259.482 0h-71.636c-7.76 0-14.635 4.654-17.516 11.858l-12.935 32.337c-2.327 5.82-1.619 12.393 1.895 17.582s9.353 8.286 15.62 8.286zm-2.502-19.864l12.935-32.337c.412-1.028 1.394-1.693 2.502-1.693h71.636c1.108 0 2.09.665 2.502 1.693l12.935 32.337c.462 1.155.028 2.068-.271 2.511-.299.443-.987 1.185-2.231 1.185H174.91c-1.244 0-1.933-.743-2.231-1.185-.299-.442-.732-1.356-.271-2.511zM177.853 115.874c0-4.466-3.619-8.084-8.084-8.084H94.316c-4.466 0-8.084 3.618-8.084 8.084 0 4.466 3.619 8.084 8.084 8.084h75.453c4.465 0 8.084-3.619 8.084-8.084zM496.836 176.277l-22.163-4.432c-1.332-3.935-2.926-7.781-4.765-11.503l12.537-18.806c4.97-7.456 3.98-17.465-2.356-23.802l-10.369-10.369c-5.945-5.945-15.123-7.185-22.393-3.208V61.979c0-16.344-13.298-29.642-29.642-29.642H309.895c-4.466 0-8.084 3.618-8.084 8.084 0 4.466 3.618 8.084 8.084 8.084h67.369v26.981c-8.639.347-16.037 6.592-17.744 15.13l-4.432 22.162c-3.935 1.332-7.78 2.926-11.504 4.766l-18.805-12.537c-7.457-4.97-17.466-3.979-23.802 2.356l-10.369 10.369c-6.336 6.337-7.326 16.346-2.356 23.802l12.537 18.805c-1.84 3.724-3.434 7.57-4.766 11.504l-22.161 4.432c-8.786 1.757-15.164 9.536-15.164 18.497v14.664c0 8.961 6.378 16.74 15.164 18.497l22.161 4.432c1.332 3.935 2.927 7.78 4.766 11.504l-12.537 18.805c-4.97 7.456-3.98 17.465 2.356 23.802l10.369 10.369c6.337 6.335 16.346 7.329 23.802 2.356l18.805-12.537c3.724 1.84 7.57 3.434 11.504 4.766l4.432 22.161c1.757 8.786 9.536 15.164 18.497 15.164h14.664c8.961 0 16.74-6.378 18.497-15.164l4.432-22.161c3.935-1.332 7.78-2.926 11.504-4.766l18.805 12.537c7.458 4.971 17.467 3.98 23.802-2.356l10.369-10.369c6.336-6.337 7.326-16.346 2.356-23.802l-12.537-18.805c1.84-3.724 3.434-7.57 4.766-11.504l22.161-4.432c8.786-1.757 15.164-9.536 15.164-18.497v-14.664c0-8.959-6.378-16.738-15.164-18.495zM393.432 48.505h24.253c7.43 0 13.474 6.044 13.474 13.474v52.869l-4.045 2.697c-3.724-1.84-7.57-3.434-11.504-4.766l-4.432-22.161c-1.707-8.538-9.105-14.783-17.744-15.13V48.505zm102.4 160.932c0 1.279-.911 2.392-2.167 2.642l-26.877 5.375c-2.985.597-5.38 2.819-6.2 5.749-1.674 5.986-4.069 11.767-7.118 17.181-1.494 2.653-1.37 5.919.318 8.452l15.205 22.807c.71 1.065.568 2.495-.337 3.4l-10.369 10.369c-.905.906-2.334 1.048-3.4.337l-22.807-15.205c-2.534-1.69-5.8-1.811-8.452-.318-5.413 3.049-11.194 5.443-17.181 7.118-2.931.82-5.152 3.215-5.75 6.2l-5.375 26.877c-.25 1.256-1.361 2.167-2.642 2.167h-14.664c-1.279 0-2.392-.911-2.642-2.167l-5.375-26.877c-.597-2.985-2.819-5.38-5.75-6.2-5.986-1.674-11.767-4.069-17.181-7.118-1.235-.695-2.602-1.04-3.968-1.04-1.567 0-3.13.455-4.484 1.358l-22.807 15.205c-1.066.71-2.494.569-3.4-.337l-10.369-10.369c-.905-.904-1.048-2.335-.337-3.4l15.205-22.807c1.688-2.533 1.812-5.799.318-8.452-3.049-5.413-5.443-11.194-7.118-17.181-.82-2.931-3.215-5.152-6.2-5.75l-26.877-5.375c-1.256-.25-2.167-1.361-2.167-2.642v-14.664c0-1.279.911-2.392 2.167-2.642l26.877-5.375c2.985-.597 5.38-2.819 6.2-5.75 1.674-5.986 4.069-11.767 7.118-17.181 1.494-2.653 1.37-5.919-.318-8.452l-15.205-22.807c-.71-1.065-.568-2.495.337-3.4l10.369-10.369c.904-.907 2.333-1.049 3.4-.337l22.807 15.205c2.533 1.689 5.799 1.81 8.452.318 5.413-3.049 11.194-5.443 17.181-7.118 2.931-.82 5.152-3.215 5.75-6.2l5.375-26.877c.25-1.256 1.361-2.167 2.642-2.167h14.664c1.279 0 2.392.911 2.642 2.167l5.375 26.877c.597 2.985 2.819 5.38 5.75 6.2 5.986 1.674 11.767 4.069 17.181 7.118 2.653 1.494 5.919 1.372 8.452-.318l22.807-15.205c1.066-.711 2.495-.569 3.4.337l10.369 10.369c.905.904 1.048 2.335.337 3.4l-15.205 22.807c-1.688 2.533-1.812 5.799-.318 8.452 3.047 5.41 5.442 11.191 7.118 17.182.82 2.93 3.215 5.151 6.2 5.748l26.877 5.375c1.256.25 2.167 1.361 2.167 2.642v14.666z"/>
      <path d="M385.347 158.451c-24.072 0-43.655 19.583-43.655 43.655s19.583 43.655 43.655 43.655c4.466 0 8.084-3.618 8.084-8.084 0-4.466-3.618-8.084-8.084-8.084-15.156 0-27.486-12.33-27.486-27.486s12.33-27.486 27.486-27.486 27.486 12.33 27.486 27.486c0 6.079-1.942 11.837-5.617 16.653-2.709 3.549-2.028 8.622 1.522 11.331 3.549 2.71 8.623 2.026 11.331-1.522 5.844-7.657 8.932-16.809 8.932-26.462.001-24.073-19.582-43.656-43.654-43.656zM94.316 140.126c-4.466 0-8.084 3.618-8.084 8.084 0 4.466 3.619 8.084 8.084 8.084h53.895c4.466 0 8.084-3.618 8.084-8.084 0-4.466-3.618-8.084-8.084-8.084H94.316z"/>
      <path d="M439.242 312.589c-4.466 0-8.084 3.618-8.084 8.084v161.684c0 7.43-6.044 13.474-13.474 13.474H29.642c-7.43 0-13.474-6.044-13.474-13.474V61.979c0-7.43 6.044-13.474 13.474-13.474h24.253v390.737c0 10.401 8.463 18.863 18.863 18.863h226.358c4.466 0 8.084-3.619 8.084-8.084 0-4.466-3.618-8.084-8.084-8.084H72.758c-1.486 0-2.695-1.208-2.695-2.695v-24.253h307.2v24.254c0 1.486-1.208 2.695-2.695 2.695h-43.116c-4.466 0-8.084 3.619-8.084 8.084s3.619 8.084 8.084 8.084h43.116c10.401 0 18.863-8.463 18.863-18.863v-86.232c0-4.466-3.618-8.084-8.084-8.084-4.466 0-8.084 3.618-8.084 8.084v45.81h-307.2V317.98h35.449c4.115 0 7.949 1.843 10.521 5.056l30.17 37.712c5.655 7.07 14.092 11.125 23.147 11.125h57.547c8.602 0 16.768-3.728 22.4-10.23l40.263-46.456c2.924-3.374 2.559-8.48-.815-11.404-3.374-2.923-8.479-2.559-11.404.815l-40.263 46.457c-2.56 2.955-6.27 4.649-10.181 4.649h-57.546c-4.117 0-7.951-1.843-10.521-5.056l-30.17-37.713c-5.657-7.069-14.095-11.124-23.147-11.124h-35.45V210.19h158.451c4.466 0 8.084-3.618 8.084-8.084 0-4.466-3.618-8.084-8.084-8.084H70.063V48.505h67.369c4.466 0 8.084-3.618 8.084-8.084 0-4.466-3.618-8.084-8.084-8.084H29.642C13.298 32.337 0 45.635 0 61.979v420.379C0 498.702 13.298 512 29.642 512h388.042c16.344 0 29.642-13.298 29.642-29.642V320.674c0-4.466-3.618-8.085-8.084-8.085z"/>
</symbol>
    <symbol id="manufacturing" viewBox="0 0 512 512">
      <path d="M503.916 495.832h-13.474V299.116c0-4.465-3.62-8.084-8.084-8.084H331.453c-4.465 0-8.084 3.62-8.084 8.084s3.62 8.084 8.084 8.084h142.821v37.726H256c-4.465 0-8.084 3.62-8.084 8.084v75.453c0 4.465 3.62 8.084 8.084 8.084h218.274v59.284h-67.368c-4.465 0-8.084 3.62-8.084 8.084 0 4.465 3.62 8.084 8.084 8.084h97.01c4.465 0 8.084-3.62 8.084-8.084 0-4.464-3.62-8.083-8.084-8.083zm-29.642-75.453H414.99v-35.032c0-4.465-3.62-8.084-8.084-8.084-4.465 0-8.084 3.62-8.084 8.084v35.032h-59.284v-35.032c0-4.465-3.62-8.084-8.084-8.084s-8.084 3.62-8.084 8.084v35.032h-59.284v-59.284h210.189v59.284zM212.884 156.295c22.289 0 40.421-18.132 40.421-40.421s-18.132-40.421-40.421-40.421-40.421 18.132-40.421 40.421c0 22.288 18.133 40.421 40.421 40.421zm0-64.674c13.373 0 24.253 10.879 24.253 24.253 0 13.373-10.879 24.253-24.253 24.253s-24.253-10.879-24.253-24.253c.001-13.374 10.88-24.253 24.253-24.253z"/>
      <path d="M374.568 495.832H206.949c2.931-5.731 3.932-12.305 2.756-18.776l-13.719-75.453c-2.564-14.103-14.829-24.34-29.164-24.34h-7.132c-14.335 0-26.599 10.237-29.164 24.34l-13.719 75.453c-1.177 6.471-.175 13.045 2.756 18.776H37.726V93.456l38.714 7.97c4.372.902 8.648-1.914 9.548-6.287.9-4.373-1.914-8.648-6.287-9.548L31.273 75.62c-2.379-.492-4.854.115-6.738 1.651-1.884 1.535-2.977 3.836-2.977 6.266v412.295H8.084c-4.465 0-8.084 3.62-8.084 8.084C0 508.38 3.62 512 8.084 512h366.484c4.465 0 8.084-3.62 8.084-8.084.001-4.465-3.619-8.084-8.084-8.084zm-183.683-4.841c-2.568 3.076-6.338 4.841-10.345 4.841h-9.201v-45.81c0-4.465-3.62-8.084-8.084-8.084s-8.084 3.62-8.084 8.084v45.81h-9.201c-4.007 0-7.777-1.764-10.345-4.841-2.568-3.076-3.628-7.101-2.912-11.043l13.719-75.453c1.166-6.411 6.74-11.064 13.256-11.064h7.132c6.516 0 12.091 4.652 13.256 11.064l13.719 75.453c.72 3.942-.342 7.966-2.91 11.043zM338.942 155.469l49.1 10.11v101.2c0 4.465 3.62 8.084 8.084 8.084s8.084-3.62 8.084-8.084v-107.79c0-3.836-2.697-7.145-6.454-7.918l-55.555-11.438c-4.372-.903-8.648 1.913-9.548 6.287-.9 4.374 1.916 8.649 6.289 9.549z"/>
      <path d="M111.386 140.076l19.732 3.946c1.148 3.335 2.5 6.598 4.045 9.765L124 170.531c-4.713 7.069-3.773 16.559 2.234 22.566l9.426 9.426c6.007 6.007 15.498 6.947 22.566 2.234l16.745-11.163c3.167 1.547 6.429 2.897 9.765 4.045l3.946 19.733c1.666 8.33 9.041 14.376 17.536 14.376h13.33c8.495 0 15.87-6.046 17.536-14.376l3.946-19.732c3.335-1.148 6.598-2.5 9.765-4.045l16.745 11.163c7.069 4.711 16.559 3.773 22.566-2.234l9.426-9.426c6.007-6.007 6.947-15.497 2.234-22.566l-11.163-16.745c1.547-3.167 2.898-6.43 4.045-9.765l19.733-3.946c8.33-1.666 14.376-9.041 14.376-17.536v-13.33c0-8.495-6.046-15.87-14.376-17.536l-19.732-3.946c-1.148-3.335-2.5-6.598-4.045-9.765l11.163-16.744c4.713-7.069 3.773-16.559-2.234-22.566l-9.426-9.426c-6.006-6.007-15.497-6.946-22.566-2.234l-16.745 11.163c-3.167-1.547-6.429-2.897-9.765-4.045l-3.946-19.733C235.419 6.046 228.044 0 219.55 0h-13.33c-8.495 0-15.87 6.046-17.536 14.376l-3.946 19.732c-3.335 1.148-6.598 2.5-9.765 4.045L158.229 26.99c-7.07-4.713-16.56-3.773-22.566 2.234l-9.426 9.426c-6.007 6.007-6.947 15.497-2.234 22.566l11.163 16.745c-1.547 3.167-2.897 6.429-4.045 9.765l-19.733 3.946c-8.33 1.666-14.376 9.041-14.376 17.535v13.33c-.001 8.496 6.044 15.871 14.374 17.539zm1.793-30.868c0-.815.58-1.522 1.379-1.682l24.433-4.886c2.984-.597 5.38-2.819 6.2-5.748 1.508-5.389 3.663-10.59 6.405-15.457 1.494-2.653 1.371-5.92-.317-8.452l-13.823-20.735c-.452-.677-.361-1.588.214-2.163l9.426-9.426c.577-.577 1.486-.666 2.164-.214l20.734 13.823c2.532 1.688 5.799 1.811 8.452.317 4.867-2.741 10.066-4.896 15.457-6.405 2.93-.82 5.151-3.216 5.748-6.2l4.886-24.433c.16-.799.867-1.379 1.682-1.379h13.33c.815 0 1.522.58 1.682 1.379l4.886 24.433c.597 2.984 2.819 5.38 5.748 6.2 5.389 1.508 10.59 3.663 15.457 6.405 2.653 1.494 5.92 1.371 8.452-.317l20.734-13.823c.677-.453 1.587-.363 2.164.213l9.426 9.426c.576.577.666 1.486.214 2.164l-13.823 20.734c-1.689 2.533-1.812 5.799-.317 8.452 2.741 4.867 4.896 10.066 6.405 15.457.82 2.93 3.216 5.151 6.2 5.748l24.433 4.886c.799.16 1.379.867 1.379 1.682v13.33c0 .815-.58 1.522-1.379 1.682l-24.433 4.886c-2.985.597-5.38 2.819-6.2 5.749-1.507 5.387-3.662 10.587-6.404 15.456-1.494 2.652-1.371 5.919.317 8.452l13.823 20.735c.452.677.361 1.588-.214 2.163l-9.426 9.426c-.577.577-1.486.666-2.164.214l-20.734-13.823c-2.532-1.689-5.799-1.811-8.452-.317-4.867 2.741-10.066 4.896-15.457 6.405-2.93.82-5.151 3.216-5.748 6.2l-4.886 24.433c-.16.799-.867 1.379-1.682 1.379h-13.33c-.815 0-1.522-.58-1.682-1.379l-4.886-24.433c-.597-2.984-2.819-5.38-5.748-6.2-5.389-1.508-10.59-3.663-15.457-6.405-1.235-.695-2.603-1.04-3.968-1.04-1.567 0-3.131.455-4.485 1.358l-20.735 13.823c-.676.453-1.588.362-2.163-.214l-9.426-9.426c-.576-.577-.666-1.486-.215-2.164l13.823-20.734c1.689-2.533 1.812-5.799.317-8.452-2.741-4.867-4.896-10.066-6.405-15.457-.82-2.93-3.216-5.151-6.2-5.748l-24.433-4.886c-.799-.16-1.379-.867-1.379-1.682v-13.33zM158.989 291.032c-4.465 0-8.084 3.62-8.084 8.084v53.895c0 4.465 3.62 8.084 8.084 8.084 4.465 0 8.084-3.62 8.084-8.084V307.2h132.042c4.465 0 8.084-3.62 8.084-8.084s-3.62-8.084-8.084-8.084H158.989z"/>
</symbol>
    <symbol id="technical" viewBox="0 0 512 512">
  <path d="M83.537 350.316h64.674c10.401 0 18.863-8.463 18.863-18.863v-64.674c0-10.401-8.463-18.863-18.863-18.863H83.537c-10.401 0-18.863 8.463-18.863 18.863v10.779c0 4.466 3.62 8.084 8.084 8.084 4.465 0 8.084-3.618 8.084-8.084v-10.779c0-1.486 1.209-2.695 2.695-2.695h64.674c1.485 0 2.695 1.208 2.695 2.695v64.674c0 1.486-1.209 2.695-2.695 2.695H83.537c-1.485 0-2.695-1.208-2.695-2.695v-21.558c0-4.466-3.62-8.084-8.084-8.084-4.465 0-8.084 3.618-8.084 8.084v21.558c0 10.4 8.462 18.863 18.863 18.863zM444.632 377.263h-307.2c-4.465 0-8.084 3.618-8.084 8.084 0 4.466 3.62 8.084 8.084 8.084h307.2c28.231 0 51.2 22.969 51.2 51.2s-22.969 51.2-51.2 51.2H67.368c-28.231 0-51.2-22.969-51.2-51.2s22.969-51.2 51.2-51.2h37.726c4.465 0 8.084-3.618 8.084-8.084 0-4.466-3.62-8.084-8.084-8.084H67.368C30.222 377.263 0 407.484 0 444.632 0 481.779 30.222 512 67.368 512h377.263C481.778 512 512 481.779 512 444.632c0-37.148-30.222-67.369-67.368-67.369z"/>
  <path d="M59.284 443.554v2.156c0 4.466 3.62 8.084 8.084 8.084 4.465 0 8.084-3.619 8.084-8.084v-2.156c0-4.466-3.62-8.084-8.084-8.084-4.464-.001-8.084 3.618-8.084 8.084zM363.789 350.316h64.674c10.401 0 18.863-8.463 18.863-18.863V18.863c0-10.4-8.462-18.863-18.863-18.863h-64.674c-10.401 0-18.863 8.463-18.863 18.863v21.558c0 4.466 3.62 8.084 8.084 8.084 4.465 0 8.084-3.618 8.084-8.084V18.863c0-1.486 1.209-2.695 2.695-2.695h64.674c1.485 0 2.695 1.208 2.695 2.695v312.589c0 1.486-1.209 2.695-2.695 2.695h-64.674c-1.485 0-2.695-1.208-2.695-2.695V72.758c0-4.466-3.62-8.084-8.084-8.084-4.465 0-8.084 3.618-8.084 8.084v258.695c0 10.4 8.463 18.863 18.863 18.863zM223.663 350.316h64.674c10.401 0 18.863-8.463 18.863-18.863V180.547c0-10.401-8.463-18.863-18.863-18.863h-64.674c-10.401 0-18.863 8.463-18.863 18.863v21.558c0 4.466 3.62 8.084 8.084 8.084s8.084-3.618 8.084-8.084v-21.558c0-1.486 1.209-2.695 2.695-2.695h64.674c1.485 0 2.695 1.208 2.695 2.695v150.905c0 1.486-1.209 2.695-2.695 2.695h-64.674c-1.485 0-2.695-1.208-2.695-2.695v-97.011c0-4.466-3.62-8.084-8.084-8.084s-8.084 3.618-8.084 8.084v97.011c0 10.401 8.463 18.864 18.863 18.864zM291.032 444.632c0-19.317-15.716-35.032-35.032-35.032s-35.032 15.715-35.032 35.032c0 19.317 15.716 35.032 35.032 35.032s35.032-15.716 35.032-35.032zm-53.895 0c0-10.401 8.463-18.863 18.863-18.863 10.401 0 18.863 8.463 18.863 18.863 0 10.401-8.463 18.863-18.863 18.863-10.401 0-18.863-8.463-18.863-18.863zM452.716 445.709v-2.156c0-4.466-3.62-8.084-8.084-8.084-4.465 0-8.084 3.618-8.084 8.084v2.156c0 4.466 3.62 8.084 8.084 8.084 4.464.001 8.084-3.618 8.084-8.084z"/>
  <path d="M479.663 444.632c0-19.317-15.716-35.032-35.032-35.032-19.316 0-35.032 15.715-35.032 35.032 0 19.317 15.716 35.032 35.032 35.032 19.316-.001 35.032-15.716 35.032-35.032zm-53.895 0c0-10.401 8.463-18.863 18.863-18.863 10.401 0 18.863 8.463 18.863 18.863 0 10.401-8.463 18.863-18.863 18.863s-18.863-8.463-18.863-18.863zM32.337 444.632c0 19.317 15.716 35.032 35.032 35.032 19.316 0 35.032-15.715 35.032-35.032 0-19.317-15.716-35.032-35.032-35.032-19.316 0-35.032 15.715-35.032 35.032zm53.895 0c0 10.401-8.463 18.863-18.863 18.863-10.401 0-18.863-8.463-18.863-18.863 0-10.401 8.463-18.863 18.863-18.863 10.4-.001 18.863 8.462 18.863 18.863zM264.084 445.709v-2.156c0-4.466-3.62-8.084-8.084-8.084-4.465 0-8.084 3.618-8.084 8.084v2.156c0 4.466 3.62 8.084 8.084 8.084 4.465.001 8.084-3.618 8.084-8.084z"/>
</symbol>
    <symbol id="process" viewBox="0 0 512 512">
      <path d="M153.6 247.916h-10.779c-4.466 0-8.084 3.619-8.084 8.084 0 4.466 3.618 8.084 8.084 8.084H153.6c4.466 0 8.084-3.619 8.084-8.084 0-4.466-3.618-8.084-8.084-8.084zM379.884 142.436c10.442 0 18.936-8.494 18.936-18.936 0-3.431-.932-6.799-2.698-9.742l-36.868-61.445c-3.402-5.672-9.623-9.195-16.238-9.195h-1.568c-6.614 0-12.837 3.523-16.237 9.194l-36.869 61.446c-1.766 2.943-2.698 6.311-2.698 9.742 0 10.442 8.494 18.936 18.936 18.936h75.304zm-78.072-18.937c0-.501.137-.994.395-1.424l36.868-61.448c.497-.828 1.407-1.343 2.373-1.343h1.568c.967 0 1.877.514 2.374 1.344l36.867 61.448c.258.43.395.923.395 1.424 0 1.526-1.242 2.768-2.768 2.768h-75.305c-1.527 0-2.768-1.243-2.767-2.769zM110.484 247.916H99.705c-4.466 0-8.084 3.619-8.084 8.084 0 4.466 3.618 8.084 8.084 8.084h10.779c4.466 0 8.084-3.619 8.084-8.084 0-4.466-3.618-8.084-8.084-8.084zM196.716 264.084c4.466 0 8.084-3.619 8.084-8.084 0-4.466-3.618-8.084-8.084-8.084h-10.779c-4.466 0-8.084 3.619-8.084 8.084 0 4.466 3.618 8.084 8.084 8.084h10.779zM188.632 164.379v-21.558c0-4.466-3.618-8.084-8.084-8.084-4.466 0-8.084 3.618-8.084 8.084v21.558c0 4.466 3.618 8.084 8.084 8.084 4.465 0 8.084-3.618 8.084-8.084z"/>
      <path d="M220.968 191.326v-75.453c0-4.466-3.619-8.084-8.084-8.084h-32.338c-4.466 0-8.084 3.618-8.084 8.084 0 4.466 3.618 8.084 8.084 8.084H204.8v59.284H91.621v-59.284h56.589c4.466 0 8.084-3.618 8.084-8.084 0-4.466-3.618-8.084-8.084-8.084H83.537c-4.466 0-8.084 3.618-8.084 8.084v75.453c0 4.466 3.619 8.084 8.084 8.084h129.347c4.466.001 8.084-3.618 8.084-8.084z"/>
      <path d="M148.211 134.737c-4.466 0-8.084 3.618-8.084 8.084v21.558c0 4.466 3.618 8.084 8.084 8.084 4.466 0 8.084-3.618 8.084-8.084v-21.558c0-4.466-3.619-8.084-8.084-8.084zM107.79 142.821v21.558c0 4.466 3.618 8.084 8.084 8.084 4.466 0 8.084-3.618 8.084-8.084v-21.558c0-4.466-3.618-8.084-8.084-8.084-4.466 0-8.084 3.618-8.084 8.084zM482.358 495.832h-13.474V29.642C468.884 13.298 455.586 0 439.242 0H245.221c-16.344 0-29.642 13.298-29.642 29.642V51.2c0 4.466 3.618 8.084 8.084 8.084 4.466 0 8.084-3.619 8.084-8.084V29.642c0-7.43 6.044-13.474 13.474-13.474h194.021c7.43 0 13.474 6.044 13.474 13.474v142.821H277.558c-4.466 0-8.084 3.619-8.084 8.084 0 4.466 3.618 8.084 8.084 8.084h175.158v199.411H256c-4.466 0-8.084 3.618-8.084 8.084 0 4.466 3.619 8.084 8.084 8.084h196.716v91.621h-45.81c-4.466 0-8.084 3.619-8.084 8.084 0 4.466 3.618 8.084 8.084 8.084h75.453c4.466 0 8.084-3.618 8.084-8.084-.001-4.465-3.619-8.083-8.085-8.083z"/>
      <path d="M396.126 274.863c16.344 0 29.642-13.298 29.642-29.642s-13.298-29.642-29.642-29.642-29.642 13.298-29.642 29.642 13.298 29.642 29.642 29.642zm0-43.116c7.43 0 13.474 6.044 13.474 13.474s-6.044 13.474-13.474 13.474c-7.43 0-13.474-6.044-13.474-13.474s6.044-13.474 13.474-13.474zM374.568 495.832H231.747V320.674c0-4.466-3.618-8.084-8.084-8.084-4.466 0-8.084 3.618-8.084 8.084v35.032h-40.421c-1.486 0-2.695-1.208-2.695-2.695v-24.444c9.13-1.312 16.168-9.185 16.168-18.671v-13.474h45.811c10.401 0 18.863-8.463 18.863-18.863V94.316c0-10.401-8.463-18.863-18.863-18.863H61.979c-10.401 0-18.863 8.463-18.863 18.863v183.242c0 10.401 8.463 18.863 18.863 18.863h45.811v13.474c0 9.487 7.039 17.359 16.168 18.671v24.444c0 28.231 22.969 51.2 51.2 51.2h40.421v91.621H29.642c-4.466 0-8.084 3.619-8.084 8.084 0 4.466 3.618 8.084 8.084 8.084h344.926c4.466 0 8.084-3.618 8.084-8.084.001-4.465-3.618-8.083-8.084-8.083zM61.979 280.253c-1.486 0-2.695-1.208-2.695-2.695v-45.811h13.474c4.466 0 8.084-3.618 8.084-8.084 0-4.466-3.618-8.084-8.084-8.084H59.284V94.316c0-1.486 1.208-2.695 2.695-2.695h172.463c1.486 0 2.695 1.208 2.695 2.695v121.263H105.095c-4.466 0-8.084 3.618-8.084 8.084 0 4.466 3.618 8.084 8.084 8.084h132.042v45.811c0 1.486-1.208 2.695-2.695 2.695H61.979zm64.674 32.336c-1.486 0-2.695-1.208-2.695-2.695V296.42h48.505v13.474c0 1.486-1.208 2.695-2.695 2.695h-43.115zm88.926 75.453h-40.421c-19.317 0-35.032-15.715-35.032-35.032v-24.253h16.168v24.253c0 10.401 8.463 18.863 18.863 18.863h40.421v16.169zM342.232 114.719c4.466 0 8.084-3.619 8.084-8.084v-13.86c0-4.466-3.618-8.084-8.084-8.084-4.466 0-8.084 3.618-8.084 8.084v13.858c-.001 4.467 3.618 8.086 8.084 8.086z"/>
      <path d="M331.453 274.863c10.401 0 18.863-8.463 18.863-18.863v-21.558c0-10.401-8.463-18.863-18.863-18.863h-32.337c-10.401 0-18.863 8.463-18.863 18.863V256c0 10.401 8.463 18.863 18.863 18.863h32.337zM296.421 256v-21.558c0-1.486 1.208-2.695 2.695-2.695h32.337c1.486 0 2.695 1.208 2.695 2.695V256c0 1.486-1.208 2.695-2.695 2.695h-32.337c-1.487 0-2.695-1.209-2.695-2.695zM258.695 320.674v21.558c0 10.401 8.463 18.863 18.863 18.863h53.895c10.401 0 18.863-8.463 18.863-18.863v-21.558c0-10.401-8.463-18.863-18.863-18.863h-53.895c-10.401 0-18.863 8.462-18.863 18.863zm75.452 0v21.558c0 1.486-1.208 2.695-2.695 2.695h-53.895c-1.486 0-2.695-1.208-2.695-2.695v-21.558c0-1.486 1.208-2.695 2.695-2.695h53.895c1.487 0 2.695 1.208 2.695 2.695zM385.347 458.105h-86.232c-4.466 0-8.084 3.618-8.084 8.084 0 4.466 3.619 8.084 8.084 8.084h86.232c4.466 0 8.084-3.618 8.084-8.084.001-4.465-3.618-8.084-8.084-8.084zM385.347 425.768h-86.232c-4.466 0-8.084 3.618-8.084 8.084 0 4.466 3.619 8.084 8.084 8.084h86.232c4.466 0 8.084-3.618 8.084-8.084.001-4.465-3.618-8.084-8.084-8.084zM396.126 361.095c16.344 0 29.642-13.298 29.642-29.642s-13.298-29.642-29.642-29.642-29.642 13.298-29.642 29.642 13.298 29.642 29.642 29.642zm0-43.116c7.43 0 13.474 6.044 13.474 13.474s-6.044 13.474-13.474 13.474c-7.43 0-13.474-6.044-13.474-13.474s6.044-13.474 13.474-13.474z"/>
</symbol>
 <!-- arc travelled by the pointer -->
    <svg x="150" y="0" width="350" height="350" viewBox="0 0 500 500">
      <linearGradient id="a" gradientUnits="userSpaceOnUse" x1="250.2542" y1="496.283" x2="250.2542" y2="-.2102">
        <stop offset="0" stop-color="#0F68A9"/>
        <stop offset="1" stop-color="#3DDEED" stop-opacity="0"/>
      </linearGradient>
      <path fill="url(#a)" d="M250.3 0c137 0 248.1 111.1 248.1 248.1S387.3 496.2 250.3 496.2 2.2 385.1 2.2 248.1 113.2 0 250.3 0C112.5 0 .8 111.7.8 249.5S112.5 499 250.3 499s249.5-111.7 249.5-249.5S388 0 250.3 0z"/>
    </svg>
    
    <g id="service-collection">
      <!-- this gets filled dynamically -->
    </g>
    <circle cx="325" cy="170" r="140" class="center"/>
    <use x="185" y="30" width="280" height="280" xlink:href="#circle-nav-copy" class="nav-copy"/>
  <!--   <rect data-url="/industries" id="learn-more" x="280" y="250" width="90" height="30" /> -->
   <!--  <text x="290" y="270" class="learn-more-text">Learn more</text> -->
  </svg>
</div>


</div>




<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js" integrity="sha384-a5N7Y/aK3qNeh15eJKGWxsqtnX/wWdSZSKp+81YjTmS15nvnvxKHuzaWwXHDli+4" crossorigin="anonymous"></script>
    
    
    <script src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script><script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script><script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/1.20.2/TweenMax.min.js'></script>
<script >"use strict";

var center = { x: 325, y: 175 };
var serv_dist = 250;
var pointer_dist = 172;
var pointer_time = 2;
var icon_size = 42;
var circle_radius = 38;
var text_top_margin = 18;
var tspan_delta = 16;

//name is used as the title for the bubble
//icon is the id of the corresponding svg symbol
var services_data = [{ name: "Claims", icon: "industries" }, { name: "MetaData", icon: "validation" }, { name: "Segmentation", icon: "engineering" }, { name: "Social Media\ Sentiment", icon: "management" }, { name: "Population\ Health", icon: "manufacturing" },{ name: "Member", icon: "manufacturing" }, { name: "\Provider MDM", icon: "technical" }, { name: "\Milliman Mara Risk Score", icon: "process" }];

var services = document.getElementById("service-collection");
var nav_container = document.getElementById("circle-nav-services");
var symbol_copy = document.getElementById("circle-nav-copy");
var use_copy = document.querySelector("use.nav-copy");

//Keeps code DRY avoiding namespace for element creation
function createSVGElement(el) {
  return document.createElementNS("http://www.w3.org/2000/svg", el);
}

//Quick setup for multiple attributes
function setAttributes(el, options) {
  Object.keys(options).forEach(function (attr) {
    el.setAttribute(attr, options[attr]);
  });
}

//Service bubbles are created dynamically
function addService(serv, index) {
  var group = createSVGElement("g");
  group.setAttribute("class", "service serv-" + index);

  /* This group is needed to apply animations in
    the icon and its background at the same time */
  var icon_group = createSVGElement("g");
  icon_group.setAttribute("class", "icon-wrapper");

  var circle = createSVGElement("circle");
  setAttributes(circle, {
    r: circle_radius,
    cx: center.x,
    cy: center.y
  });
  var circle_shadow = circle.cloneNode();
  setAttributes(circle, {
    class: 'shadow'
  });
  icon_group.appendChild(circle_shadow);
  icon_group.appendChild(circle);

  var symbol = createSVGElement("use");
  setAttributes(symbol, {
    'x': center.x - icon_size / 2,
    'y': center.y - icon_size / 2,
    'width': icon_size,
    'height': icon_size
  });
  symbol.setAttributeNS("http://www.w3.org/1999/xlink", "xlink:href", "#" + serv.icon);
  icon_group.appendChild(symbol);

  group.appendChild(icon_group);

  var text = createSVGElement("text");
  setAttributes(text, {
    x: center.x,
    y: center.y + circle_radius + text_top_margin
  });

  var tspan = createSVGElement("tspan");
  if (serv.name.indexOf('\n') >= 0) {

    var tspan2 = tspan.cloneNode();
    var name = serv.name.split('\n');
    jQuery(tspan).text(name[0]);
    jQuery(tspan2).text(name[1]);

    setAttributes(tspan2, {
      x: center.x,
      dy: tspan_delta
    });

    text.appendChild(tspan);
    text.appendChild(tspan2);
  } else {
    jQuery(tspan).text(serv.name);
    text.appendChild(tspan);
  }

  group.appendChild(text);
  services.appendChild(group);

  var service_bubble = jQuery(".serv-" + index);

  //Uses tween to look for right position
  twn_pivot_path.seek(index);
  TweenLite.set(service_bubble, {
    x: pivot_path.x,
    y: pivot_path.y,
    transformOrigin: "center center"
  });

  service_bubble.click(serviceClick);
}

//Creates pointer
function createPointer() {
  var service_pointer = createSVGElement("circle");

  setAttributes(service_pointer, {
    cx: center.x - pointer_dist,
    cy: center.y,
    r: 12,
    class: "pointer"
  });

  nav_container.appendChild(service_pointer);

  service_pointer = document.querySelector("svg .pointer");

  var pointer_circle = [{ x: 0, y: 0 }, { x: pointer_dist, y: pointer_dist }, { x: pointer_dist * 2, y: 0 }, { x: pointer_dist, y: -pointer_dist }, { x: 0, y: 0 }];

  twn_pointer_path.to(service_pointer, pointer_time, {
    bezier: {
      values: pointer_circle,
      curviness: 1.5 },
    ease: Power0.easeNone,
    transformOrigin: "center center"
  });
}

//Defines behavior for service bubbles
function serviceClick(ev) {

  //There's always an active service
  jQuery(".service.active").removeClass("active");

  var current = jQuery(ev.currentTarget);
  current.addClass("active");

  //There's a "serv-*" class for each bubble
  var current_class = current.attr("class").split(" ")[1];
  var class_index = current_class.split('-')[1];

  //Hides current text of the main bubble
  jQuery(use_copy).addClass("changing");

  //Sets pointer to the right position
  twn_pointer_path.tweenTo(class_index * (pointer_time / (2 * 6)));

  //After it's completely hidden, the text changes and becomes visible
  setTimeout(function () {
    var viewBoxY = 300 * class_index;
    symbol_copy.setAttribute("viewBox", "0 " + viewBoxY + " 300 300");
    jQuery(use_copy).removeClass("changing");
  }, 250);
}

//Array describes points for a whole circle in order to get
//the right curve
var half_circle = [{ x: -serv_dist, y: 0 }, { x: 0, y: serv_dist }, { x: serv_dist, y: 0 }, { x: 0, y: -serv_dist }, { x: -serv_dist, y: 0 }];

//A simple object is used in the tween to retrieve its values
var pivot_path = { x: half_circle[0].x, y: half_circle[0].y };

//The object is animated with a duration based on how many bubbles
//should be placed
var twn_pivot_path = TweenMax.to(pivot_path, 12, {
  bezier: {
    values: half_circle,
    curviness: 1.5
  },
  ease: Linear.easeNone
});

services_data.reduce(function (count, serv) {
  addService(serv, count);
  return ++count;
}, 0);

//The variable is modified inside the function
//but its also used later to toggle its class
var twn_pointer_path = new TimelineMax({ paused: true });
createPointer();

//Adding it immediately triggers a bug for the transform
setTimeout(function () {
  return jQuery("#service-collection .serv-0").addClass("active");
}, 200);
//# sourceURL=pen.js
</script>
<script>

$(function(){
  $('#demo').on('hide.bs.collapse', function () {
    $('#button').html('<span class="glyphicon glyphicon-collapse-down"></span> Show');
  })
  $('#demo').on('show.bs.collapse', function () {
    $('#button').html('<span class="glyphicon glyphicon-collapse-up"></span> Hide');
  })
})


$(document).ready(function(){
	
	/////////////////npi
	$(".getnpi").on('click',function(){
		console.log("clicked");
		var npi = $(this).attr("attr-npi");
		console.log("Hello"+npi);
		
		$.ajax({
			url:"Getnpi",
			type:"POST",
			data:{npi:npi},
			success : function(rp){
				console.log(rp);
			}
			
			
			
		})
		
		
	});
	
	
    $("#demo1").mouseover(function(){
    	
        $(this).css("color", "skyblue");
        
        $(this).css("cursor", "pointer");
    });
    $("#demo1").mouseout(function(){
        $("#demo").css("color", "white");
    });
});


</script>


	  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
          <p>Some text in the modal.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  <input type="hidden" id="hidennpi" />
  
</body>
</html>

