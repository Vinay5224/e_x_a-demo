<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 
    import com.mongodb.BasicDBObject;
import com.mongodb.Mongo;
import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase; -->

<%@ page import="com.mongodb.*"%>

<%@ page import="com.mongodb.client.*"%>
<%@ page import="java.util.*"%>

<%@ page import="gmail.Gmail"%>
<%@ page import="org.bson.Document"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>confirm page</title>
</head>
<style>
.div2 {
	margin-left: 258px;
	width: 525px;
	height: 275px;
	padding: 10px;
	border: 1px solid #555;
}

body {
	background-image:
		url("https://img00.deviantart.net/274c/i/2011/109/8/8/background_m3_login_for_m1_by_andreascy-d3ecbzg.jpg");
}

table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

td, th {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #dddddd;
}
</style>


<body>

	<div class="container">
		<h2>
			<b>Confirm Page</b>
		</h2>

		<div class="panel-body">

			<div class="div2" style="background-color: white;">

				<table>

					<tr>
						<td>Name</td>
						<td>
							<%
								out.println(request.getParameter("name").toString().replaceAll("_", " "));
							%>
						</td>
					</tr>

					<tr>
						<td>Company Name</td>
						<td>
							<%
								out.println(request.getParameter("cn").toString().replaceAll("_", " "));
							%>
						</td>
					</tr>

					<tr>
						<td>Designation</td>
						<td>
							<%
								out.println(request.getParameter("dn").toString().replaceAll("_", " "));
							%>
						</td>
					</tr>

					<tr>
						<td>Email</td>
						<td>
							<%
								out.println(request.getParameter("em"));
							%>
						</td>
					</tr>

				</table>


				<%
					String vd = request.getParameter("vd");
					 MongoCredential credential = MongoCredential.createCredential("Exahealth", "Exahealth", "Exahealth@123".toCharArray());
					MongoClient client = new MongoClient(new ServerAddress("34.234.131.180",27234), Arrays.asList(credential));
					MongoDatabase DB = client.getDatabase("Exahealth");
					MongoCollection<Document> coll = DB.getCollection("newuser");
					BasicDBObject que = new BasicDBObject("Email", request.getParameter("em").toString().trim());
					FindIterable<Document> search = coll.find(que);
					Iterator<Document> iter = search.iterator();
					if (iter.hasNext()) {

						Document doc = iter.next();

						String value = doc.getString("IsValidated");
						if (value.equals("")) {
							//descion not yet taken
							///chk vd value if ok or reject
							if (vd.equals("ok")) {
								//accept the invitation
								out.println(
										"<div class='alert alert-success'><strong> <span class='glyphicon glyphicon-ok'aria-hidden='true'></span>User Approved</strong></div>");

								BasicDBObject updateObj = new BasicDBObject("Email",
										request.getParameter("em").toString().trim());
								BasicDBObject updatePasswod = new BasicDBObject("$set", new BasicDBObject("IsValidated", "y"));
								coll.updateOne(updateObj, updatePasswod);
								String serverIP = request.getLocalAddr();
								String ApplicationName = ((HttpServletRequest) request).getContextPath().replace("/", "");

								String content = "Your account now have the access to login.\n\n <br> Please login by clicking <a href='http://"
										+ serverIP + ":8080/" + ApplicationName + "/login.jsp'>here<a>";

								String act = "http://" + serverIP + ":8080/" + ApplicationName + "/confirm.jsp";
								String Subject = "Your account has been verified ";

								Gmail.sendtoClient(Subject, content, request.getParameter("em").toString().trim());

							} else {
								//reject the invitation
								BasicDBObject updateObj = new BasicDBObject("Email",
										request.getParameter("em").toString().trim());
								BasicDBObject updatePasswod = new BasicDBObject("$set", new BasicDBObject("IsValidated", "n"));
								coll.updateOne(updateObj, updatePasswod);
								out.println(
										"<div class='alert alert-danger'><strong> <span class='glyphicon glyphicon-remove'aria-hidden='true'></span>User Rejected</strong></div>");

							}

						} else {
							//decision taken
							//chk what desision
							if (value.equals("y")) {
								out.println(
										"<div class='alert alert-success'><strong> <span class='glyphicon glyphicon-ok'aria-hidden='true'></span>User Already Approved</strong></div>");

							} else {

								out.println(
										"<div class='alert alert-danger'><strong> <span class='glyphicon glyphicon-ok'aria-hidden='true'></span>User Already Rejected</strong></div>");
							}

						}

					}
				%>


			</div>
			<br> <br>




		</div>

	</div>


</body>

</html>