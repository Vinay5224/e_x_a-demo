<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="templates.theme1"%>
<%@page import="org.bson.Document" %>
<%@page import="Utils.Configs"%>
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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body style="background-image:url(img/bcak.jpg); background-repeat:no-repeat;">
<h3 align="center" style="color: Black;" ><b> Claims Reports</b></h3>
 <a href="index.jsp" class="btn btn-info" style="margin-left: 1180px " role="button">BACK</a>
<div class="container-fluid">
  <div class="row">
    <div class="col-sm-2" style="overflow-y: scroll; height: 621px;overflow-y:hidden ">
    <%     
    Configs.Credential = MongoCredential.createCredential(Configs.username, Configs.db1, Configs.password.toCharArray());

	Configs.mongoClient = new MongoClient(new ServerAddress(Configs.ip, 27234), Arrays.asList(Configs.Credential));

	
	DB claimdb1 = Configs.mongoClient.getDB("ARUJ");
	DBCollection ReportsCollc = claimdb1.getCollection("CLAIM");
	DBCursor cursor2claim = ReportsCollc.find();
	while (cursor2claim.hasNext()) {
		DBObject result2c = cursor2claim.next();
		Map resultmapclaim = result2c.toMap();
		String reports1c = resultmapclaim.get("Report_Name").toString().trim();
		String Url2 = resultmapclaim.get("url2").toString().trim();
%>
       <p><b><a  class="z" attr-url2="<% out.print(Url2); %>" style="height:50px; color:black"><% out.println(reports1c);  %></a></b></p>
     <%	
}
   %>
    </div>
    <div class="col-sm-10">
  	<iframe id="Ifrm3" width="1000px" height="575px"
		style="margin-left: 20px; margin-top: 8px" src="https://www.iamexpat.nl/sites/default/files/styles/article--full/public/dutch-health-insurance.jpg?itok=cW8VeP0X"frameborder="0"
		allowFullScreen="true"></iframe>	
    </div>
  </div>
</div>
</body>			
<script>
$(document).ready(function(){
	$(".x").hide();
	$(".z").on('click',function(){
		$(".z").show();
		$("#Ifrm3").show();
		 var Url2 = $(this).attr("attr-url2");
		 console.log(Url2);
		 $("#Ifrm3").attr("src",'');
		 $("#Ifrm3").attr("src",Url2);
		 $("#Ifrm3").contentWindow.location.reload();
	  });   
	});
$(document).ready(function(){
    $(".z").mouseover(function(){
    	
        $(this).css("color", "skyblue");
        
        $(this).css("cursor", "pointer");
    });
    $(".z").mouseout(function(){
        $(".z").css("color", "Black");
    });
});

</script>

</html>