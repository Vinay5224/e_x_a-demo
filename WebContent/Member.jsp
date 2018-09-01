<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="templates.theme1"%>
<%@page import="org.bson.Document" %>
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

<h3 align="center" style="color: Black;" ><b> Member Reports</b></h3>
    <a href="index.jsp" class="btn btn-info" style="margin-left: 1180px " role="button">BACK</a>
<div class="container-fluid">

  <div class="row">
    <div class="col-sm-2" style="overflow-y: scroll; height: 621px;overflow-y:hidden ">
 
    
    <%     

    Configs.Credential = MongoCredential.createCredential(Configs.username, Configs.db1, Configs.password.toCharArray());

	Configs.mongoClient = new MongoClient(new ServerAddress(Configs.ip, 27234), Arrays.asList(Configs.Credential));

	DB providerdb1 = Configs.mongoClient.getDB("ARUJ");
	 DBCollection ReportsCollp = providerdb1.getCollection("MEMBER");
	   DBCursor cursor2provider=ReportsCollp.find();

        while(cursor2provider.hasNext()){
           DBObject result2p=cursor2provider.next();
           Map resultmapprovider=result2p.toMap();
           String reports1p = resultmapprovider.get("Report_Name").toString().trim();
           String Url = resultmapprovider.get("url").toString().trim();

%>
       <%-- <p><b><a   class="x"  id="report" style=" attr-src=""  font-style: inherit;"><% out.println(reports1p);  %></a></b></p>  --%>
       
       
        <p><b><a   class="x" attr-url="<% out.print(Url); %>"  style="height:50px; color:black"><% out.println(reports1p);  %></a></b></p> 
      
      <%--  <a attr-url="<% out.print(Url); %>" style="height:50px"
						class=" x">
						 <% out.print(reports1p); %></a> 
        --%>
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
     
     	<iframe id="Ifrm" width="950px" height="565px"
		style="margin-left: 20px; margin-top: 10px" src="https://app.powerbi.com/view?r=eyJrIjoiMDMzM2M1MzctMTg4Yi00MjkxLWFlYTEtMTUzNmIxMzhkNTkwIiwidCI6ImQ2ZWVkNDY1LWUzZmYtNDM4Yi05OTUwLTQ2OGI1ZjlhZTE3MSJ9" frameborder="0"
		allowFullScreen="true"></iframe>
  <%--  <%
            }
   %> --%>
    
    </div>
  </div>
</div>
</body>

<script>
$(document).ready(function(){
	//$(".x").hide();
	$(".x").on('click', function() {
	//	$("#MemberSearch").hide();
		$("#Ifrm").show();
		var Url = $(this).attr("attr-url");
		console.log(Url);
		$("#Ifrm").attr("src", '');
		$("#Ifrm").attr("src", Url);
		$("#Ifrm").contentWindow.location.reload();
	  });   
	});
$(document).ready(function(){
    $(".x").mouseover(function(){
    	
        $(this).css("color", "skyblue");
        
        $(this).css("cursor", "pointer");
    });
    $(".x").mouseout(function(){
        $(".x").css("color", "Black");
    });
});

</script>
</html>