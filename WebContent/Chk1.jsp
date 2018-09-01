<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.mongodb.BasicDBObject"%>
<%@ page import="com.mongodb.MongoClient"%>
<%@ page import="com.mongodb.client.FindIterable"%>
<%@ page import="com.mongodb.client.MongoCollection"%>
<%@ page import="com.mongodb.client.MongoDatabase"%>
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

<%@ page import="Utils.Configs"%>
<%@ page import="org.bson.Document"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>

<%
	String dates = request.getParameter("date");
	String state = request.getParameter("state").toUpperCase();
	String city = request.getParameter("city").toUpperCase();
	String TrackCityParam = request.getParameter("TrackCityParam");

	String TrackStateParam = request.getParameter("TrackStateParam");
	int lmt =Integer.parseInt(request.getParameter("lmt"))*5;
	 

	String TrackCity, TrackState;
	String html = "";

	//System.out.println("html" + html+" lmt "+lmt+"\n state:::"+state);

	/* String dbParameters = "NPI,Provider Business Practice Location Address Postal Code,Provider Business Practice Address Country Code If outside US,Provider Business Practice Location Address City Name,Provider First Line Business Practice Location Address,Provider Second Line Business Practice Location Address,Provider Business Practice Location Address Fax Number,Provider Business Practice Location Address Telephone Number,Provider Business Practice Location Address State Name,Provider Business Mailing Address Postal Code,Provider Business Mailing Address Country Code If outside US,Provider Business Mailing Address City Name,Provider First Line Business Mailing Address,Provider Second Line Business Mailing Address,Provider Business Mailing Address Fax Number,Provider Business Mailing Address Telephone Number,Provider Business Mailing Address State Name,Authorized Official Telephone Number,Authorized Official Title or Position,Last Update Date,Authorized Official First Name,Authorized Official Last Name,Provider Enumeration Date,Is Sole Proprietor,Provider Organization Name Legal Business Name,Healthcare Provider Taxonomy Code_1,Healthcare Provider Primary Taxonomy Switch_1,Provider License Number_1,Provider License Number State Code_1,Healthcare Provider Taxonomy Group_1,Healthcare Provider Taxonomy Code_2,Healthcare Provider Primary Taxonomy Switch_2,Provider License Number_2,Provider License Number State Code_2,Healthcare Provider Taxonomy Group_2,Healthcare Provider Taxonomy Code_3,Healthcare Provider Primary Taxonomy Switch_3,Provider License Number_3,Provider License Number State Code_3,Healthcare Provider Taxonomy Group_3,Healthcare Provider Taxonomy Code_4,Healthcare Provider Primary Taxonomy Switch_4,Provider License Number_4,Provider License Number State Code_4,Healthcare Provider Taxonomy Group_4,Healthcare Provider Taxonomy Code_5,Healthcare Provider Primary Taxonomy Switch_5,Provider License Number_5,Provider License Number State Code_5,Healthcare Provider Taxonomy Group_5,Healthcare Provider Taxonomy Code_6,Healthcare Provider Primary Taxonomy Switch_6,Provider License Number_6,Provider License Number State Code_6,Healthcare Provider Taxonomy Group_6,Healthcare Provider Taxonomy Code_7,Healthcare Provider Primary Taxonomy Switch_7,Provider License Number_7,Provider License Number State Code_7,Healthcare Provider Taxonomy Group_7,Healthcare Provider Taxonomy Code_8,Healthcare Provider Primary Taxonomy Switch_8,Provider License Number_8,Provider License Number State Code_8,Healthcare Provider Taxonomy Group_8,Healthcare Provider Taxonomy Code_9,Healthcare Provider Primary Taxonomy Switch_9,Provider License Number_9,Provider License Number State Code_9,Healthcare Provider Taxonomy Group_9,Healthcare Provider Taxonomy Code_10,Healthcare Provider Primary Taxonomy Switch_10,Provider License Number_10,Provider License Number State Code_10,Healthcare Provider Taxonomy Group_10,Healthcare Provider Taxonomy Code_11,Healthcare Provider Primary Taxonomy Switch_11,Provider License Number_11,Provider License Number State Code_11,Healthcare Provider Taxonomy Group_11,Healthcare Provider Taxonomy Code_12,Healthcare Provider Primary Taxonomy Switch_12,Provider License Number_12,Provider License Number State Code_12,Healthcare Provider Taxonomy Group_12,Healthcare Provider Taxonomy Code_13,Healthcare Provider Primary Taxonomy Switch_13,Provider License Number_13,Provider License Number State Code_13,Healthcare Provider Taxonomy Group_13,Healthcare Provider Taxonomy Code_14,Healthcare Provider Primary Taxonomy Switch_14,Provider License Number_14,Provider License Number State Code_14,Healthcare Provider Taxonomy Group_14,Healthcare Provider Taxonomy Code_15,Healthcare Provider Primary Taxonomy Switch_15,Provider License Number_15,Provider License Number State Code_15,Healthcare Provider Taxonomy Group_15,Other Provider Identifier_1,Other Provider Identifier Type Code_1,Other Provider Identifier State_1,Other Provider Identifier Issuer_1,Other Provider Identifier_2,Other Provider Identifier Type Code_2,Other Provider Identifier State_2,Other Provider Identifier Issuer_2,Other Provider Identifier_3,Other Provider Identifier Type Code_3,Other Provider Identifier State_3,Other Provider Identifier Issuer_3,Other Provider Identifier_4,Other Provider Identifier Type Code_4,Other Provider Identifier State_4,Other Provider Identifier Issuer_4,Other Provider Identifier_5,Other Provider Identifier Type Code_5,Other Provider Identifier State_5,Other Provider Identifier Issuer_5,Other Provider Identifier_6,Other Provider Identifier Type Code_6,Other Provider Identifier State_6,Other Provider Identifier Issuer_6,Other Provider Identifier_7,Other Provider Identifier Type Code_7,Other Provider Identifier State_7,Other Provider Identifier Issuer_7,Other Provider Identifier_8,Other Provider Identifier Type Code_8,Other Provider Identifier State_8,Other Provider Identifier Issuer_8,Other Provider Identifier_9,Other Provider Identifier Type Code_9,Other Provider Identifier State_9,Other Provider Identifier Issuer_9,Other Provider Identifier_10,Other Provider Identifier Type Code_10,Other Provider Identifier State_10,Other Provider Identifier Issuer_10,Other Provider Identifier_11,Other Provider Identifier Type Code_11,Other Provider Identifier State_11,Other Provider Identifier Issuer_11,Other Provider Identifier_12,Other Provider Identifier Type Code_12,Other Provider Identifier State_12,Other Provider Identifier Issuer_12,Other Provider Identifier_13,Other Provider Identifier Type Code_13,Other Provider Identifier State_13,Other Provider Identifier Issuer_13,Other Provider Identifier_14,Other Provider Identifier Type Code_14,Other Provider Identifier State_14,Other Provider Identifier Issuer_14, Other Provider Identifier_15,Other Provider Identifier Type Code_15,Other Provider Identifier State_15,Other Provider Identifier Issuer_15,Other Provider Identifier_16,Other Provider Identifier Type Code_16,Other Provider Identifier State_16,Other Provider Identifier Issuer_16,Other Provider Identifier_17,Other Provider Identifier Type Code_17,Other Provider Identifier State_17,Other Provider Identifier Issuer_17,Other Provider Identifier_18,Other Provider Identifier Type Code_18,Other Provider Identifier State_18,Other Provider Identifier Issuer_18,Other Provider Identifier_19,Other Provider Identifier Type Code_19,Other Provider Identifier State_19,Other Provider Identifier Issuer_19,Other Provider Identifier_20,Other Provider Identifier Type Code_20,Other Provider Identifier State_20,Other Provider Identifier Issuer_20,Other Provider Identifier_21,Other Provider Identifier Type Code_21,Other Provider Identifier State_21,Other Provider Identifier Issuer_21,Other Provider Identifier_22,Other Provider Identifier Type Code_22,Other Provider Identifier State_22,Other Provider Identifier Issuer_22, Other Provider Identifier_23,Other Provider Identifier Type Code_23,Other Provider Identifier State_23,Other Provider Identifier Issuer_23,Other Provider Identifier_24,Other Provider Identifier Type Code_24,Other Provider Identifier State_24,Other Provider Identifier Issuer_24,Provider Credential Text,Provider Last Name Legal Name,Provider Gender Code,Provider First Name,Provider Middle Name, Provider Name Prefix Text,Provider Name Suffix Text,Authorized Official Middle Name,Provider Other Last Name Type Code,Provider Other Credential Text,Is Organization Subpart,Employer Identification Number EIN,NPI Reactivation Date,NPI Deactivation Date,NPI Deactivation Reason Code,Authorized Official Name Prefix Text,Authorized Official Name Suffix Text,Authorized Official Credential Text,Provider Other Last Name,Provider Other Middle Name,Provider Other First Name,Provider Other Organization Name,Provider Other Organization Name Type Code,Provider Other Name Prefix Text, Provider Other Name Suffix Text,Parent Organization LBN,Parent Organization TIN"; */
	String dbParameters = "NPI,Provider Business Practice Location Address Country Code If outside US,Provider Business Practice Location Address City Name,Provider First Line Business Practice Location Address,Provider Second Line Business Practice Location Address,Provider Business Practice Location Address Telephone Number,Provider Business Practice Location Address State Name,Provider Business Practice Location Address Fax Number,Provider Business Practice Location Address Postal Code,Provider Business Mailing Address Country Code If outside US,Provider Business Mailing Address City Name,Provider First Line Business Mailing Address,Provider Second Line Business Mailing Address,Provider Business Mailing Address Telephone Number,Provider Business Mailing Address State Name,Provider Business Mailing Address Fax Number,Provider Business Mailing Address Postal Code,Healthcare Provider Taxonomy Code_1,Provider License Number State Code_1,Healthcare Provider Primary Taxonomy Switch_1,Other Provider Identifier_2,Other Provider Identifier Type Code_2,Other Provider Identifier State_2,Other Provider Identifier Issuer_2,Authorized Official Telephone Number,Authorized Official Title or Position,Last Update Date,Authorized Official First Name,Authorized Official Last Name,Authorized Official Name Prefix Text,Provider Enumeration Date,Provider Organization Name Legal Business Name,Healthcare Provider Taxonomy Code_2,Healthcare Provider Primary Taxonomy Switch_2,Other Provider Identifier Type Code_1,Other Provider Identifier State_1,Provider Other Organization Name Type Code,Provider Other Organization Name,Healthcare Provider Taxonomy Code_3,Healthcare Provider Taxonomy Code_4,Healthcare Provider Taxonomy Code_5,Healthcare Provider Taxonomy Code_6,Healthcare Provider Taxonomy Code_7,Healthcare Provider Taxonomy Code_8,Healthcare Provider Taxonomy Code_9,Healthcare Provider Taxonomy Code_10,Healthcare Provider Taxonomy Code_11,Healthcare Provider Taxonomy Code_12,Healthcare Provider Taxonomy Code_13,Healthcare Provider Taxonomy Code_14,Healthcare Provider Taxonomy Code_15,Healthcare Provider Primary Taxonomy Switch_3,Healthcare Provider Primary Taxonomy Switch_4,Healthcare Provider Primary Taxonomy Switch_5,Healthcare Provider Primary Taxonomy Switch_6,Healthcare Provider Primary Taxonomy Switch_7,Healthcare Provider Primary Taxonomy Switch_8,Healthcare Provider Primary Taxonomy Switch_9,Healthcare Provider Primary Taxonomy Switch_10,Healthcare Provider Primary Taxonomy Switch_11,Healthcare Provider Primary Taxonomy Switch_12,Healthcare Provider Primary Taxonomy Switch_13,Healthcare Provider Primary Taxonomy Switch_14,Healthcare Provider Primary Taxonomy Switch_15,Other Provider Identifier Type Code_3,Other Provider Identifier Type Code_4,Other Provider Identifier Type Code_5,Other Provider Identifier Type Code_6,Other Provider Identifier Type Code_7,Other Provider Identifier Type Code_8,Other Provider Identifier Type Code_9,Other Provider Identifier Type Code_10,Other Provider Identifier Type Code_11,Other Provider Identifier Type Code_12,Other Provider Identifier Type Code_13,Other Provider Identifier Type Code_14,Other Provider Identifier Type Code_15,Other Provider Identifier Type Code_16,Other Provider Identifier Type Code_17,Other Provider Identifier Type Code_18,Other Provider Identifier Type Code_19,Other Provider Identifier Type Code_20,Other Provider Identifier Type Code_21,Other Provider Identifier Type Code_22,Other Provider Identifier Type Code_23,Other Provider Identifier Type Code_24,Other Provider Identifier State_3,Other Provider Identifier State_4,Other Provider Identifier State_5,Other Provider Identifier State_6,Other Provider Identifier State_7,Other Provider Identifier State_8,Other Provider Identifier State_9,Other Provider Identifier State_10,Other Provider Identifier State_11,Other Provider Identifier State_12,Other Provider Identifier State_13,Other Provider Identifier State_14,Other Provider Identifier State_15,Other Provider Identifier State_16,Other Provider Identifier State_17,Other Provider Identifier State_18,Other Provider Identifier State_19,Other Provider Identifier State_20,Other Provider Identifier State_21,Other Provider Identifier State_22,Other Provider Identifier State_23,Other Provider Identifier State_24,Other Provider Identifier Issuer_1,Other Provider Identifier Issuer_3,Other Provider Identifier Issuer_4,Other Provider Identifier Issuer_5,Other Provider Identifier Issuer_6,Other Provider Identifier Issuer_7,Other Provider Identifier Issuer_8,Other Provider Identifier Issuer_9,Other Provider Identifier Issuer_10,Other Provider Identifier Issuer_11,Other Provider Identifier Issuer_12,Other Provider Identifier Issuer_13,Other Provider Identifier Issuer_14,Other Provider Identifier Issuer_15,Other Provider Identifier Issuer_16,Other Provider Identifier Issuer_17,Other Provider Identifier Issuer_18,Other Provider Identifier Issuer_19,Other Provider Identifier Issuer_20,Other Provider Identifier Issuer_21,Other Provider Identifier Issuer_22,Other Provider Identifier Issuer_23,Other Provider Identifier Issuer_24,Healthcare Provider Taxonomy Group_1,Healthcare Provider Taxonomy Group_2,Healthcare Provider Taxonomy Group_3,Healthcare Provider Taxonomy Group_4,Healthcare Provider Taxonomy Group_5,Healthcare Provider Taxonomy Group_6,Healthcare Provider Taxonomy Group_7,Healthcare Provider Taxonomy Group_8,Healthcare Provider Taxonomy Group_9,Healthcare Provider Taxonomy Group_10,Healthcare Provider Taxonomy Group_11,Healthcare Provider Taxonomy Group_12,Healthcare Provider Taxonomy Group_13,Healthcare Provider Taxonomy Group_14,Healthcare Provider Taxonomy Group_15,Provider License Number State Code_2,Provider License Number State Code_3,Provider License Number State Code_4,Provider License Number State Code_5,Provider License Number State Code_6,Provider License Number State Code_7,Provider License Number State Code_8,Provider License Number State Code_9,Provider License Number State Code_10,Provider License Number State Code_11,Provider License Number State Code_12,Provider License Number State Code_13,Provider License Number State Code_14,Provider License Number State Code_15,Provider License Number_1,Provider License Number_2,Provider License Number_3,Provider License Number_4,Provider License Number_5,Provider License Number_6,Provider License Number_7,Provider License Number_8,Provider License Number_9,Provider License Number_10,Provider License Number_11,Provider License Number_12,Provider License Number_13,Provider License Number_14,Provider License Number_15,Is Organization Subpart,Provider Credential Text,Provider First Name,Provider Last Name Legal Name,Provider Gender Code,Other Provider Identifier_1,Other Provider Identifier_2,Other Provider Identifier_3,Other Provider Identifier_4,Other Provider Identifier_5,Other Provider Identifier_6,Other Provider Identifier_7,Other Provider Identifier_8,Other Provider Identifier_9,Other Provider Identifier_10,Other Provider Identifier_11,Other Provider Identifier_12,Other Provider Identifier_13,Other Provider Identifier_14,Other Provider Identifier_15,Other Provider Identifier_16,Other Provider Identifier_17,Other Provider Identifier_18,Other Provider Identifier_19,Other Provider Identifier_20,Other Provider Identifier_21,Other Provider Identifier_22,Other Provider Identifier_23,Other Provider Identifier_24,"

			+ "Provider Middle Name,Provider Name Prefix Text,Provider Name Suffix Text,Authorized Official Name Suffix Text,Authorized Official Credential Text,Employer Identification Number EIN,Parent Organization LBN,Parent Organization TIN,NPI Deactivation Reason Code,NPI Deactivation Date,NPI Reactivation Date,"
			+ "Other Provider Identifier_24,Other Provider Identifier_25,Other Provider Identifier_26,Other Provider Identifier_27,Other Provider Identifier_28,Other Provider Identifier_29,Other Provider Identifier_30,Other Provider Identifier_31,Other Provider Identifier_32,Other Provider Identifier_33,Other Provider Identifier_34,Other Provider Identifier_35,Other Provider Identifier_36,Other Provider Identifier_37,Other Provider Identifier_38,Other Provider Identifier_39,Other Provider Identifier_40,Other Provider Identifier_41,Other Provider Identifier_42,Other Provider Identifier_43,Other Provider Identifier_44,Other Provider Identifier_45,Other Provider Identifier_46,Other Provider Identifier_47,Other Provider Identifier_48,Other Provider Identifier_49,"
			+ "Other Provider Identifier Issuer_24,Other Provider Identifier Issuer_25,Other Provider Identifier Issuer_26,Other Provider Identifier Issuer_27,Other Provider Identifier Issuer_28,Other Provider Identifier Issuer_29,Other Provider Identifier Issuer_30,Other Provider Identifier Issuer_31,Other Provider Identifier Issuer_32,Other Provider Identifier Issuer_33,Other Provider Identifier Issuer_34,Other Provider Identifier Issuer_35,Other Provider Identifier Issuer_36,Other Provider Identifier Issuer_37,Other Provider Identifier Issuer_38,Other Provider Identifier Issuer_39,Other Provider Identifier Issuer_40,Other Provider Identifier Issuer_41,Other Provider Identifier Issuer_42,Other Provider Identifier Issuer_43,Other Provider Identifier Issuer_44,Other Provider Identifier Issuer_45,Other Provider Identifier Issuer_46,Other Provider Identifier Issuer_47,Other Provider Identifier Issuer_48,Other Provider Identifier Issuer_49,"
			+ "Other Provider Identifier State_24,Other Provider Identifier State_25,Other Provider Identifier State_26,Other Provider Identifier State_27,Other Provider Identifier State_28,Other Provider Identifier State_29,Other Provider Identifier State_30,Other Provider Identifier State_31,Other Provider Identifier State_32,Other Provider Identifier State_33,Other Provider Identifier State_34,Other Provider Identifier State_35,Other Provider Identifier State_36,Other Provider Identifier State_37,Other Provider Identifier State_38,Other Provider Identifier State_39,Other Provider Identifier State_40,Other Provider Identifier State_41,Other Provider Identifier State_42,Other Provider Identifier State_43,Other Provider Identifier State_44,Other Provider Identifier State_45,Other Provider Identifier State_46,Other Provider Identifier State_47,Other Provider Identifier State_48,Other Provider Identifier State_49,"
			+ "Other Provider Identifier Type Code_24,Other Provider Identifier Type Code_25,Other Provider Identifier Type Code_26,Other Provider Identifier Type Code_27,Other Provider Identifier Type Code_28,Other Provider Identifier Type Code_29,Other Provider Identifier Type Code_30,Other Provider Identifier Type Code_31,Other Provider Identifier Type Code_32,Other Provider Identifier Type Code_33,Other Provider Identifier Type Code_34,Other Provider Identifier Type Code_35,Other Provider Identifier Type Code_36,Other Provider Identifier Type Code_37,Other Provider Identifier Type Code_38,Other Provider Identifier Type Code_39,Other Provider Identifier Type Code_40,Other Provider Identifier Type Code_41,Other Provider Identifier Type Code_42,Other Provider Identifier Type Code_43,Other Provider Identifier Type Code_44,Other Provider Identifier Type Code_45,Other Provider Identifier Type Code_46,Other Provider Identifier Type Code_47,Other Provider Identifier Type Code_48,Other Provider Identifier Type Code_49";

	ArrayList<String> webParameters = new ArrayList<String>();
	for (String s : dbParameters.split(",")) {
		webParameters.add(s);
	}

	ArrayList<String> dbParam = webParameters;

	MongoCredential credential = MongoCredential.createCredential("Exafluencep", "Provider", "$Exafluence@123".toCharArray());
	MongoClient client = new MongoClient(new ServerAddress("34.234.131.180", 27234), Arrays.asList(credential));
	MongoDatabase database = client.getDatabase("Provider");
	MongoCollection<Document> collection = database.getCollection("CMSHistory");
	//MongoCollection<Document> wholecoll = database.getCollection("CMSData");

	/// if the req attr is empty then makecondition as true
	Boolean dateCondition, stateCondition, cityCondition;

	/* ///set condition for date 
	if(dates.equals("") || dates.equals(null))
		{
		System.out.println("date empty");
		//make it true
		dateCondition=true;
		}
	else{
			String h = (String)dt.get("Last_Update_Date");
		dateCondition=
	}
	////////////////// */
	long collectioncount = collection.count();
	
	//if lmt greater than actual count then give sreach not found exception
	
	//if(lmt <= collectioncount){
		//limit less so continue
		FindIterable<Document> search = collection.find();//.skip(lmt).limit(5);

	Iterator<Document> Iter = search.iterator();
	System.out.println("DOne");

	while (Iter.hasNext()) {

		Document doc = Iter.next();

		Set<String> keys = doc.keySet();
		List<String> K = new ArrayList<String>();
		K.addAll(keys);
		String lastelement = K.get(K.size() - 1);
		//System.out.println(lastelement);

		//got lost doct get 
		Document lastDoc = (Document) doc.get(lastelement);
		Set<String> subKeys = lastDoc.keySet();

		//System.out.println(TrackCityParam+" --city-- "+subKeys.contains(TrackCityParam));
		//System.out.println(TrackStateParam+" --state-- "+subKeys.contains(TrackStateParam));
		String TrackLUD = ((String) lastDoc.get("Last_Update_Date")).trim();

		System.out.println();
		//check if given value empty , if empty make condition true ,if given check if exist or not 
		if (dates.equals(""))
			dateCondition = true;
		else
			dateCondition = TrackLUD.equalsIgnoreCase(dates);

		if (state.equals(""))
			stateCondition = true;
		else if (!subKeys.contains(TrackStateParam))
			stateCondition = false;
		else {
			TrackState = ((String) lastDoc.get(TrackStateParam)).trim();
			stateCondition = TrackState.equalsIgnoreCase(state);

		}

		if (city.equals("")) {
			cityCondition = true;

		} else if (!subKeys.contains(TrackCityParam))
			cityCondition = false;
		else {
			TrackCity = ((String) lastDoc.get(TrackCityParam)).trim();
			cityCondition = TrackCity.matches("(.*)" + city + "(.*)");
		}

		//check if paramets exits or not 

		//final check condition
		//System.out.println(dateCondition + " " + stateCondition + " " + cityCondition);

		if ((dateCondition) && (stateCondition) && (cityCondition)) {

			System.out.println("found" + doc.get("NPI"));
			html += "<div class='col-sm-6'> ";
			//here print all documents
			html += "<div class='card'> <div class='card-body'> <h5 class='card-title'> <b>NPI "
					+ doc.get("NPI") + "  </b><a target='_blank' class='btn btn-primary' href='https://npiregistry.cms.hhs.gov/api/?number="+doc.get("NPI").toString().trim()+"&pretty=on' > API </a>"
					+ "     <button style='margin-left: 80px;' type='button' class='btn btn-primary cf' data-toggle='modal' attr-npi='"
					+ doc.get("NPI").toString().trim() + "'   data-target='#myModal' >Track history</button>"
					+ "</h5> <div class='scrl' style='padding:10px' id='style-6'>";

			html += "<table class='table' style='font-size: 13px;'> <thead class='thead-light'>"
					+ "<tr class='row'> <th class='col-md-4' >Attributes</th> <th class='col-md-4'>Past data</th> <th class='col-md-4'>Present data</th> </tr> </thead> <tbody>";

			for (String y : subKeys) {
				if (!(y.matches("Past_(.*)"))) {

					//System.out.println(y);
					String present = (String) lastDoc.get(y);
					String past = (String) lastDoc.get("Past_" + y);

					if ((y.matches(".*Telephone.*")) || (y.matches(".*Fax.*"))) {

						present = present.replaceAll("[^a-zA-Z0-9]", "").replaceAll("[()]", "");
						past = past.replaceAll("[^a-zA-Z0-9]", "").replaceAll("[()]", "");

					}

					if (y.matches(".*Date.*")) {
						String[] sp = present.split("-");
						present = sp[1] + "/" + sp[2] + "/" + sp[0];

					}

					if (present.equalsIgnoreCase("true")) {
						present = "Y";
					} else if (present.equalsIgnoreCase("false")) {
						present = "N";
					}

					//	System.out.println("^"+past +"^^^^"+ present+"^");
					if (!present.equals(past)) {
						html += "<tr class='row' > ";
						//System.out.println(j + "   "+ doc.get(j));  
						html += "<td class='col-md-4' >" + y.replaceAll("_", " ") + "</td>";
						html += "<td class='col-md-4' >" + past + "</td>";
						html += "<td class='col-md-4' >" + present + "</td>";
						///now get data from static db
						html += "</tr>";

					}

				}

			}
			//html+="</div>";
			html += "</tbody></table></div> </div> </div><br> </div>";
			System.out.println("CHK1------------"+html);
			response.getWriter().write(html);
		} else {

			System.out.println("no records with this combination found");

		}

		//	System.out.println(html);

	}
/* 	}
	else{
		//limit greater so exit
		html+="limitexceed";
	} */
	
	
	
	
	
	out.println(html);
	System.out.println(html);
	//client.close();
%>