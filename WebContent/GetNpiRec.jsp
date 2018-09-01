<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="com.mongodb.BasicDBObject" %>
	<%@ page import="com.mongodb.MongoClient" %>
	<%@ page import="com.mongodb.client.FindIterable" %>
	<%@ page import="com.mongodb.client.MongoCollection" %>
	<%@ page import="com.mongodb.client.MongoDatabase" %>
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
	
	 <%@ page import="Utils.Configs" %>
	 <%@ page import="org.bson.Document" %>
	<%@ page import="java.util.ArrayList" %>
		<%@ page import="java.util.Iterator" %>
 


<%
 

String dbParameters = "NPI,Provider Business Practice Location Address Postal Code,Provider Business Practice Address Country Code If outside US,Provider Business Practice Location Address City Name,Provider First Line Business Practice Location Address,Provider Second Line Business Practice Location Address,Provider Business Practice Location Address Fax Number,Provider Business Practice Location Address Telephone Number,Provider Business Practice Location Address State Name,Provider Business Mailing Address Postal Code,Provider Business Mailing Address Country Code If outside US,Provider Business Mailing Address City Name,Provider First Line Business Mailing Address,Provider Second Line Business Mailing Address,Provider Business Mailing Address Fax Number,Provider Business Mailing Address Telephone Number,Provider Business Mailing Address State Name,Authorized Official Telephone Number,Authorized Official Title or Position,Last Update Date,Authorized Official First Name,Authorized Official Last Name,Provider Enumeration Date,Is Sole Proprietor,Provider Organization Name Legal Business Name,Healthcare Provider Taxonomy Code_1,Healthcare Provider Primary Taxonomy Switch_1,Provider License Number_1,Provider License Number State Code_1,Healthcare Provider Taxonomy Group_1,Healthcare Provider Taxonomy Code_2,Healthcare Provider Primary Taxonomy Switch_2,Provider License Number_2,Provider License Number State Code_2,Healthcare Provider Taxonomy Group_2,Healthcare Provider Taxonomy Code_3,Healthcare Provider Primary Taxonomy Switch_3,Provider License Number_3,Provider License Number State Code_3,Healthcare Provider Taxonomy Group_3,Healthcare Provider Taxonomy Code_4,Healthcare Provider Primary Taxonomy Switch_4,Provider License Number_4,Provider License Number State Code_4,Healthcare Provider Taxonomy Group_4,Healthcare Provider Taxonomy Code_5,Healthcare Provider Primary Taxonomy Switch_5,Provider License Number_5,Provider License Number State Code_5,Healthcare Provider Taxonomy Group_5,Healthcare Provider Taxonomy Code_6,Healthcare Provider Primary Taxonomy Switch_6,Provider License Number_6,Provider License Number State Code_6,Healthcare Provider Taxonomy Group_6,Healthcare Provider Taxonomy Code_7,Healthcare Provider Primary Taxonomy Switch_7,Provider License Number_7,Provider License Number State Code_7,Healthcare Provider Taxonomy Group_7,Healthcare Provider Taxonomy Code_8,Healthcare Provider Primary Taxonomy Switch_8,Provider License Number_8,Provider License Number State Code_8,Healthcare Provider Taxonomy Group_8,Healthcare Provider Taxonomy Code_9,Healthcare Provider Primary Taxonomy Switch_9,Provider License Number_9,Provider License Number State Code_9,Healthcare Provider Taxonomy Group_9,Healthcare Provider Taxonomy Code_10,Healthcare Provider Primary Taxonomy Switch_10,Provider License Number_10,Provider License Number State Code_10,Healthcare Provider Taxonomy Group_10,Healthcare Provider Taxonomy Code_11,Healthcare Provider Primary Taxonomy Switch_11,Provider License Number_11,Provider License Number State Code_11,Healthcare Provider Taxonomy Group_11,Healthcare Provider Taxonomy Code_12,Healthcare Provider Primary Taxonomy Switch_12,Provider License Number_12,Provider License Number State Code_12,Healthcare Provider Taxonomy Group_12,Healthcare Provider Taxonomy Code_13,Healthcare Provider Primary Taxonomy Switch_13,Provider License Number_13,Provider License Number State Code_13,Healthcare Provider Taxonomy Group_13,Healthcare Provider Taxonomy Code_14,Healthcare Provider Primary Taxonomy Switch_14,Provider License Number_14,Provider License Number State Code_14,Healthcare Provider Taxonomy Group_14,Healthcare Provider Taxonomy Code_15,Healthcare Provider Primary Taxonomy Switch_15,Provider License Number_15,Provider License Number State Code_15,Healthcare Provider Taxonomy Group_15,Other Provider Identifier_1,Other Provider Identifier Type Code_1,Other Provider Identifier State_1,Other Provider Identifier Issuer_1,Other Provider Identifier_2,Other Provider Identifier Type Code_2,Other Provider Identifier State_2,Other Provider Identifier Issuer_2,Other Provider Identifier_3,Other Provider Identifier Type Code_3,Other Provider Identifier State_3,Other Provider Identifier Issuer_3,Other Provider Identifier_4,Other Provider Identifier Type Code_4,Other Provider Identifier State_4,Other Provider Identifier Issuer_4,Other Provider Identifier_5,Other Provider Identifier Type Code_5,Other Provider Identifier State_5,Other Provider Identifier Issuer_5,Other Provider Identifier_6,Other Provider Identifier Type Code_6,Other Provider Identifier State_6,Other Provider Identifier Issuer_6,Other Provider Identifier_7,Other Provider Identifier Type Code_7,Other Provider Identifier State_7,Other Provider Identifier Issuer_7,Other Provider Identifier_8,Other Provider Identifier Type Code_8,Other Provider Identifier State_8,Other Provider Identifier Issuer_8,Other Provider Identifier_9,Other Provider Identifier Type Code_9,Other Provider Identifier State_9,Other Provider Identifier Issuer_9,Other Provider Identifier_10,Other Provider Identifier Type Code_10,Other Provider Identifier State_10,Other Provider Identifier Issuer_10,Other Provider Identifier_11,Other Provider Identifier Type Code_11,Other Provider Identifier State_11,Other Provider Identifier Issuer_11,Other Provider Identifier_12,Other Provider Identifier Type Code_12,Other Provider Identifier State_12,Other Provider Identifier Issuer_12,Other Provider Identifier_13,Other Provider Identifier Type Code_13,Other Provider Identifier State_13,Other Provider Identifier Issuer_13,Other Provider Identifier_14,Other Provider Identifier Type Code_14,Other Provider Identifier State_14,Other Provider Identifier Issuer_14, Other Provider Identifier_15,Other Provider Identifier Type Code_15,Other Provider Identifier State_15,Other Provider Identifier Issuer_15,Other Provider Identifier_16,Other Provider Identifier Type Code_16,Other Provider Identifier State_16,Other Provider Identifier Issuer_16,Other Provider Identifier_17,Other Provider Identifier Type Code_17,Other Provider Identifier State_17,Other Provider Identifier Issuer_17,Other Provider Identifier_18,Other Provider Identifier Type Code_18,Other Provider Identifier State_18,Other Provider Identifier Issuer_18,Other Provider Identifier_19,Other Provider Identifier Type Code_19,Other Provider Identifier State_19,Other Provider Identifier Issuer_19,Other Provider Identifier_20,Other Provider Identifier Type Code_20,Other Provider Identifier State_20,Other Provider Identifier Issuer_20,Other Provider Identifier_21,Other Provider Identifier Type Code_21,Other Provider Identifier State_21,Other Provider Identifier Issuer_21,Other Provider Identifier_22,Other Provider Identifier Type Code_22,Other Provider Identifier State_22,Other Provider Identifier Issuer_22, Other Provider Identifier_23,Other Provider Identifier Type Code_23,Other Provider Identifier State_23,Other Provider Identifier Issuer_23,Other Provider Identifier_24,Other Provider Identifier Type Code_24,Other Provider Identifier State_24,Other Provider Identifier Issuer_24,Provider Credential Text,Provider Last Name Legal Name,Provider Gender Code,Provider First Name,Provider Middle Name, Provider Name Prefix Text,Provider Name Suffix Text,Authorized Official Middle Name,Provider Other Last Name Type Code,Provider Other Credential Text,Is Organization Subpart,Employer Identification Number EIN,NPI Reactivation Date,NPI Deactivation Date,NPI Deactivation Reason Code,Authorized Official Name Prefix Text,Authorized Official Name Suffix Text,Authorized Official Credential Text,Provider Other Last Name,Provider Other Middle Name,Provider Other First Name,Provider Other Organization Name,Provider Other Organization Name Type Code,Provider Other Name Prefix Text, Provider Other Name Suffix Text,Parent Organization LBN,Parent Organization TIN";
 
ArrayList<String> webParameters = new ArrayList<String>();
for (String s : dbParameters.split(",")) {
	webParameters.add(s);

}

ArrayList<String> dbParam =webParameters;
MongoCredential credential = MongoCredential.createCredential("Exafluencep", "Provider", "$Exafluence@123".toCharArray());
MongoClient client = new MongoClient(new ServerAddress(Configs.ip, 27234), Arrays.asList(credential));

	

/* MongoClient client = new MongoClient("192.168.0.229", 27081); */
MongoDatabase database = client.getDatabase("Provider");
MongoCollection<Document> collection = database.getCollection("Notification");

BasicDBObject q = new BasicDBObject("NPI", request.getParameter("npi").toString());

FindIterable<Document> search = collection.find(q);

Iterator<Document> Iter = search.iterator();
System.out.println("Hello"+q);
while(Iter.hasNext()) {
	String html="";
		Document doc = Iter.next();
		html +="<div class='col-sm-12'> <div class='card' style='width: 45rem; height: 19rem;'> <div class='card-body'><h5 class='card-title'>NPI "+request.getParameter("npi").toString()+"</h5> <div class='scrl' id='style-6'>";
		html +="<table class='table'  style='font-size: 13px;'> <thead class='thead-light'> <tr> <th>Attribute</th> <th>Past data</th> <th>Present data</th> </tr> </thead> <tbody>";

		html+="<tr>";

		
		
		// System.out.println(doc);
	for(int i=0; i< dbParam.size(); i++){
		//  String Present = (String) doc.get(dbParam.get(i));
		//  String Past = (String) doc.get("Past_"+dbParam.get(i));
		//  System.out.println(Present+Past);
		if(doc.get(dbParam.get(i))!= null && doc.get("Past_"+dbParam.get(i))!=null){
			System.out.println(dbParam.get(i)+"=="+doc.get(dbParam.get(i))+"::::"+"Past_"+dbParam.get(i)+"=="+doc.get("Past_"+dbParam.get(i)));
            html  +="<td style='width:40%'>"+dbParam.get(i).trim()+"</td>";
           
            html  +="<td>"+doc.get("Past_"+dbParam.get(i))+"</td>";
            html  +="<td>"+doc.get(dbParam.get(i))+"</td>";
		} 
		html+="</tr>";
	}
	html+="</tbody></table></div> </div> </div> </div>";

	out.println(html);

}

%>