 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="templates.Dummy"%>
<%@page import="org.bson.Document" %>
<%@page import="com.mongodb.MongoClient"%>
<%@page import="com.mongodb.client.FindIterable"%>
<%@page import="com.mongodb.client.MongoCollection"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style>

.navbar-default .dropdown-menu.notify-drop {
  min-width: 330px;
  background-color: #fff;
  min-height: 360px;
  max-height: 360px;
}
.navbar-default .dropdown-menu.notify-drop .notify-drop-title {
  border-bottom: 1px solid #e2e2e2;
  padding: 5px 15px 10px 15px;
}
.navbar-default .dropdown-menu.notify-drop .drop-content {
  min-height: 280px;
  max-height: 280px;
  overflow-y: scroll;
}
.navbar-default .dropdown-menu.notify-drop .drop-content::-webkit-scrollbar-track
{
  background-color: #F5F5F5;
}

.navbar-default .dropdown-menu.notify-drop .drop-content::-webkit-scrollbar
{
  width: 8px;
  background-color: #F5F5F5;
}

.navbar-default .dropdown-menu.notify-drop .drop-content::-webkit-scrollbar-thumb
{
  background-color: #ccc;
}
.navbar-default .dropdown-menu.notify-drop .drop-content > li {
  border-bottom: 1px solid #e2e2e2;
  padding: 10px 0px 5px 0px;
}
.navbar-default .dropdown-menu.notify-drop .drop-content > li:nth-child(2n+0) {
  background-color: #fafafa;
}
.navbar-default .dropdown-menu.notify-drop .drop-content > li:after {
  content: "";
  clear: both;
  display: block;
}
.navbar-default .dropdown-menu.notify-drop .drop-content > li:hover {
  background-color: #fcfcfc;
}
.navbar-default .dropdown-menu.notify-drop .drop-content > li:last-child {
  border-bottom: none;
}
.navbar-default .dropdown-menu.notify-drop .drop-content > li .notify-img {
  float: left;
  display: inline-block;
  width: 45px;
  height: 45px;
  margin: 0px 0px 8px 0px;
}
.navbar-default .dropdown-menu.notify-drop .allRead {
  margin-right: 7px;
}
.navbar-default .dropdown-menu.notify-drop .rIcon {
  float: right;
  color: #999;
}
.navbar-default .dropdown-menu.notify-drop .rIcon:hover {
  color: #333;
}
.navbar-default .dropdown-menu.notify-drop .drop-content > li a {
  font-size: 12px;
  font-weight: normal;
}
.navbar-default .dropdown-menu.notify-drop .drop-content > li {
  font-weight: bold;
  font-size: 11px;
}
.navbar-default .dropdown-menu.notify-drop .drop-content > li hr {
  margin: 5px 0;
  width: 70%;
  border-color: #e2e2e2;
}
.navbar-default .dropdown-menu.notify-drop .drop-content .pd-l0 {
  padding-left: 0;
}
.navbar-default .dropdown-menu.notify-drop .drop-content > li p {
  font-size: 11px;
  color: #666;
  font-weight: normal;
  margin: 3px 0;
}
.navbar-default .dropdown-menu.notify-drop .drop-content > li p.time {
  font-size: 10px;
  font-weight: 600;
  top: -6px;
  margin: 8px 0px 0px 0px;
  padding: 0px 3px;
  border: 1px solid #e2e2e2;
  position: relative;
  background-image: linear-gradient(#fff,#f2f2f2);
  display: inline-block;
  border-radius: 2px;
  color: #B97745;
}
.navbar-default .dropdown-menu.notify-drop .drop-content > li p.time:hover {
  background-image: linear-gradient(#fff,#fff);
}
.navbar-default .dropdown-menu.notify-drop .notify-drop-footer {
  border-top: 1px solid #e2e2e2;
  bottom: 0;
  position: relative;
  padding: 8px 15px;
}
.navbar-default .dropdown-menu.notify-drop .notify-drop-footer a {
  color: #777;
  text-decoration: none;
}
.navbar-default .dropdown-menu.notify-drop .notify-drop-footer a:hover {
  color: #333;
}

body{
background-color: rgba(49, 112, 143, 0.76);


}
</style>

<body>

 <%!static int count=0; 
static Document doc;
static ArrayList<Integer> NPI;

%>
   <%
   
   Dummy.Mongo = new MongoClient("192.168.0.230", 27234);
	Dummy.DB = Dummy.Mongo.getDatabase("ProviderDummy");
	Dummy.notifyColl = Dummy.DB.getCollection("Notification");
	
	FindIterable<Document> search = Dummy.notifyColl.find();
	Iterator<Document> Iter = search.iterator();
	while(Iter.hasNext()){
		
		 doc = Iter.next();
		
		if(doc.get("isRead").equals(false)){
			
			count = count+1;
			int a = (int) doc.get("ID");
			NPI.add(a);  
			
			
			
		}else{
			System.out.println("Condition is true");
		}
	
	System.out.println(count);
	}
		 %> 
<div class="container">
	<div class="row">
		<nav class="navbar navbar-default">
  <div class="container-fluid" style="background: rgba(0, 228, 255, 0.52)"  >
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active" style="background-color: #31708f"; ><a href="#">METADATA <span class="sr-only">(current)</span></a></li>
        <li><a href="#">MEMBERSHIP</a></li>
        <li><a href="#">PROVIDER</a></li>
         <li><a href="#">CLAIMS</a></li>
        <li><a href="#">POPULATION HEALTH</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">ADMIN<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">ADD USER </a></li>
            <li><a href="#">CONFIGURATION</a></li>
         <li><a href="#">LOGOUT</a></li>
          </ul>
        </li>
      </ul>
   
    <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <img src="img/notif1.png"  style="width:40px;height:30px;cursor:pointer;" >  (<b><%out.println(count); %> <% count=0; %>     </b>)</a>
       
          <ul class="dropdown-menu notify-drop">
            <div class="notify-drop-title">
          <!--   	<div class="row">
            		<div class="col-md-6 col-sm-6 col-xs-6">Notifications (<b>2</b>)</div>
            		<div class="col-md-6 col-sm-6 col-xs-6 text-right"><a href="" class="rIcon allRead" data-tooltip="tooltip" data-placement="bottom" title="tümü okundu."><i class="fa fa-dot-circle-o"></i></a></div>
            	</div> -->
            </div>
          
            <div class="drop-content">
            	<li>
            	  
            		<div class="col-md-9 col-sm-9 col-xs-9 pd-l0">
            <%-- 	<%  out.println(NPI)       %> --%>
            		</div>
            	</li>
            	
            </div>
            <div class="notify-drop-footer text-center">
            	<a href=""><i class="fa fa-eye"></i></a>
            </div>
          </ul>
        </li>
      </ul>
  
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
	</div>
	
</div>
</body>
<script>
    $(function () {
  $('[data-tooltip="tooltip"]').tooltip()
	});
</script>
</html>