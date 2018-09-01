<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.mongodb.BasicDBObject"%>
<%@ page import="com.mongodb.MongoClient"%>
<%@ page import="com.mongodb.client.FindIterable"%>
<%@ page import="com.mongodb.client.MongoCollection"%>
<%@ page import="com.mongodb.client.MongoDatabase"%>
<%@page import="java.util.*"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page import="com.mongodb.MongoCredential"%>
<%@page import="com.mongodb.ServerAddress"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@ page import="org.bson.Document"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="Utils.Configs"%>


<!DOCTYPE html>
<html lang="en">
 
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<title>Exafluence</title>

<link rel='stylesheet prefetch'
	href='https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css'>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js'></script>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<title>NPI Alerts</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.css" rel="stylesheet">

<!-- Custom styles for this template -->
<!-- <link href="css/starter-template.css" rel="stylesheet"> -->
 
</head>

<body style="background-color: floralwhite;">

<script type="text/javascript">
window.addEventListener( "pageshow", function ( event ) {
	  var historyTraversal = event.persisted || ( typeof window.performance != "undefined" && window.performance.navigation.type === 2 );
	  if ( historyTraversal ) {
	    // Handle page restore.
	    window.location.reload();
	  }
	});


</script>

<%-- <%
    String name = (String) session.getAttribute("email_id");  
 
   if(name ==null){
	   response.sendRedirect("login.jsp"); 
	   }
   else
   {
	   out.println(" ");
   }

   %> --%>

	<nav style="background-color: #d1e3f5 !important"
		class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
		<a class="navbar-brand" href="#"
			style="color: black; font-weight: bold;margin-bottom: -25px;">NPI ALERTS</a>

		<div class="navbar-brand" data-toggle="modal" data-target="#ppt"
			style="color: black; font-weight: bold;margin-bottom: -25px;margin-bottom: -25px;cursor: pointer;">About</div>
			
		<div class="collapse navbar-collapse" id="navbarsExampleDefault">


			<input id="NPI" class="form-control mr-sm-2" placeholder="Search"
				aria-label="Search" style="width: 35%" type="text">
			<button class="btn btn-outline-success my-2 my-sm-0" id="SrchNpi">Search</button>
			<!-- <a href="54.175.60.225:4040" target="_blank"><button class="btn btn-md btn-primary">Spark-Engine</button></a> -->

<!-- <div class="dropdown" style="margin-left: 530px">
    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
      Spark Engine
    </button>
    <div class="dropdown-menu">
    <div class="row">
    <div class="col-md-5">
    <span class="dropdown-item" style="cursor: pointer;" id="start" >
    <span class="glyphicon glyphicon-play" style="font-size: 20px;color: green;" aria-hidden="true"></span>
    </span>
    </div>
    <div class="col-md-5">
    <span class="dropdown-item"  style="cursor: pointer;" id="kill" >
     <span class="glyphicon glyphicon-stop" style="font-size: 20px;color: red" aria-hidden="true"></span>
    </span>
    </div>
    </div>
    
       <div class="dropdown-divider"></div>
       <a class="dropdown-item btn btn-dark" target="_blank" href="http://localhost:4040"> View Console</a>
    </div>
  </div>
 -->
<a href="index.jsp"> <img style="margin-left: 560px;" alt="" width="100px" src="img/logo.png" /></a>
		</div>

		<!-- <a href="index.jsp"><img alt="" width="100px" src="img/logo"></a> -->
		
	</nav>

	<main role="main" class="container">

	<div class="row" style="margin-top: 67px; font-size: medium;">
		<div class="col-md-2">
			<button id="Showallnpis" class="btn btn-primary btn-lg">Show
				All NPI records</button>
		</div>


		&nbsp; <input type="text" id="datepicker" placeholder="Select Date" />-
		<input type="text" id="state" placeholder="State" />- <input
			type="text" id="city" placeholder="City" /> &nbsp; <select
			id="AddPurpose">
			 
			<option value="mail">Mailing</option>
			<option value="location">Location</option>

		</select> &nbsp;
		<button id="Filter" class="btn btn-md btn-info">Filter</button>
	</div>




	<!-- <button class="btn btn-primary btn-lg">Show updated</button></div><div class="col-md-4" > -->
	
<br>
	<div id="load" class="progress"
							style="width: 500px; margin-left: 325px;">
							<div class="progress-bar progress-bar-striped active"
								role="progressbar" aria-valuenow="100" aria-valuemin="0"
								aria-valuemax="100" style="width: 100%"></div>
						</div>
<br>
<div class="showerr"  >

</div> 

	<div class="row" id="mainContent"
		style="background-color: white;">

	</div>
	<div class="row">
<div class="col-sm-12 col-sm-offset-5"  style="position: fixed;bottom: 5px;left:30px"> 
 							<button type="button" id="btnLoop" attr-loop="0" class="btn btn-info btn-lg LM">Load more records </button>
                    		 </div>
                    		 </div>

	</main>
 							
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

	<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	 
	<link rel="stylesheet" href="css/jquery-ui.min.css" />
	<link rel="stylesheet" href="npialerts.css" />	
		
	 	<!-- Modal -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog modal-lg">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">

					<h4 class="modal-title">
						<b>Track history </b> for <b id="h1npi"></b>
					</h4>


				</div>
				<!-- style="overflow: scroll;padding: 20px" -->
				<div class="modal-body" style="overflow-y:scroll;height: 400px;padding: 20px " >
					<p id="resTrackHistory" style="font-size: small;"></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
 
 
 
 <!-- Modal -->
<div class="modal fade" id="ppt" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Project details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <iframe src="https://docs.google.com/presentation/d/e/2PACX-1vS2fKjZLMJbRjiJgqiiY4skqyHxOT-bVdzNVyu8YmeYtDpkwKAmBnjhGT2YKW2q_6VtSPru82XXZO8_/embed?start=false&loop=false&delayms=3000" frameborder="0" width="775" height="569" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a class="btn btn-dark" href="https://docs.google.com/presentation/d/1ftUovvdBwj5dTNTXmKiuv_Hzbdifjdqc/export/pptx" download>download</a>
      </div>
    </div>
  </div>
</div>


<script	src="npialerts2.js"></script>

 
	<div id="snackbar">Please enter the valid NPI</div>
	<div id="snackbarnotchanged"></div>
</body>
</html>