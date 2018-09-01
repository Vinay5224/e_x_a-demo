<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

  <%@page import="templates.theme1"%>
<%@page import="org.bson.Document" %>
<%@page import="com.mongodb.MongoClient"%>
<%@page import="com.mongodb.client.FindIterable"%>
<%@page import="com.mongodb.async.client.MongoCollection"%>
<%@page import="com.mongodb.async.client.MongoDatabase"%>
<%@page import="java.util.Iterator"%>
<%@page import="javax.management.ObjectName"%>

<head>
 
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
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
/* Object links   = reports.get("url"); */
System.out.println(Reports);
/* System.out.println(links); */


 
%>
<div class="container">

    
      <button type="button" "style=""class="btn btn-success" he><%	out.print(Reports);	%></button>
	
	
						
<%
}
%>						
						

      
</div>

</body>
</html>
