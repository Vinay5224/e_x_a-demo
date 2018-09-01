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
<h3 align="center" ><b> Population Health Reports</b></h3>
 <a href="index.jsp" class="btn btn-info" style="margin-left: 1180px " role="button">BACK</a>
<div class="container-fluid">
  <div class="row">
    <div class="col-sm-2" style="overflow-y: scroll; height: 621px;overflow-y:hidden ">
    <%     
    Configs.Credential = MongoCredential.createCredential(Configs.username, Configs.db1, Configs.password.toCharArray());

	Configs.mongoClient = new MongoClient(new ServerAddress(Configs.ip, 27234), Arrays.asList(Configs.Credential));

	DB populationdb1 = Configs.mongoClient.getDB("ARUJ");
 	 DBCollection ReportsCollph = populationdb1.getCollection("POPULATION_HEALTH");
	   DBCursor cursor2population=ReportsCollph.find();
        while(cursor2population.hasNext()){
           DBObject result2ph=cursor2population.next();
           Map resultmappopulation=result2ph.toMap();
           String reports1ph = resultmappopulation.get("Report_Name").toString().trim();
           String Url3 = resultmappopulation.get("url3").toString().trim();
%>
       <%-- <p><b><a   class="x"  id="report" style=" attr-src=""  font-style: inherit;"><% out.println(reports1p);  %></a></b></p>  --%>
        <p><b><a   class="p" attr-url3="<% out.print(Url3); %>" style="height:50px; color:black"><% out.println(reports1ph);  %></a></b></p>
       <%-- <button type="button" attr-url3="<% out.print(Url3); %>" style="height:50px"
						class="btn btn-primary  p">
						 <% out.print(reports1ph); %></label>  --%>
     <%	
}
   %>
    </div>
    <div class="col-sm-10" >
   <%--  <%
   /* FindIterable<Document> findIterable1 = collection.find();
   Iterator<Document> iter1 = findIterable.iterator(); */
   while(cursor2provider.hasNext()){
       DBObject result2p=cursor2provider.next();
       Map resultmapprovider=result2p.toMap();
       String reports1p = resultmapprovider.get("Report_Name").toString().trim();
       String Url1 = resultmapprovider.get("url1").toString().trim();
            %>
   --%>
     <%--  <iframe id="Ifrm1" class="y" src=" <% out.print(reports1p); %>" height="600" width="1000"></iframe>  --%>
     	<iframe id="Ifrm4" width="1000px" height="565px"
		style="margin-left: 20px; margin-top: 10px" src="https://www.iamexpat.nl/sites/default/files/styles/article--full/public/dutch-health-insurance.jpg?itok=cW8VeP0X" frameborder="0"
		allowFullScreen="true"> </iframe>
  <%--  <%
            }
   %> --%>
    </div>
  </div>
</div>
</body>
<script>
$(document).ready(function(){
	$(".x").hide();
	$(".p").on('click',function(){
		  $(this).addClass("red");
		//$("#PopSearch").hide();
		 var Url3 = $(this).attr("attr-url3");
		 console.log(Url3);
		 $("#Ifrm4").show();
		 $("#Ifrm4").attr("src",'');
		 $("#Ifrm4").attr("src",Url3);
		 $("#Ifrm4").contentWindow.location.reload();
	  });   

	});
$(document).ready(function(){
    $(".p").mouseover(function(){
    	
        $(this).css("color", "skyblue");
        
        $(this).css("cursor", "pointer");
    });
    $(".p").mouseout(function(){
        $(".p").css("color", "Black");
    });
});

</script>
</html>