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

		<%
		
		//int lmt = Integer.parseInt(request.getParameter("lmt"));
		String npi = request.getParameter("npi");
		 
			/* String dbParameters = "NPI,Provider Business Practice Location Address Postal Code,Provider Business Practice Address Country Code If outside US,Provider Business Practice Location Address City Name,Provider First Line Business Practice Location Address,Provider Second Line Business Practice Location Address,Provider Business Practice Location Address Fax Number,Provider Business Practice Location Address Telephone Number,Provider Business Practice Location Address State Name,Provider Business Mailing Address Postal Code,Provider Business Mailing Address Country Code If outside US,Provider Business Mailing Address City Name,Provider First Line Business Mailing Address,Provider Second Line Business Mailing Address,Provider Business Mailing Address Fax Number,Provider Business Mailing Address Telephone Number,Provider Business Mailing Address State Name,Authorized Official Telephone Number,Authorized Official Title or Position,Last Update Date,Authorized Official First Name,Authorized Official Last Name,Provider Enumeration Date,Is Sole Proprietor,Provider Organization Name Legal Business Name,Healthcare Provider Taxonomy Code_1,Healthcare Provider Primary Taxonomy Switch_1,Provider License Number_1,Provider License Number State Code_1,Healthcare Provider Taxonomy Group_1,Healthcare Provider Taxonomy Code_2,Healthcare Provider Primary Taxonomy Switch_2,Provider License Number_2,Provider License Number State Code_2,Healthcare Provider Taxonomy Group_2,Healthcare Provider Taxonomy Code_3,Healthcare Provider Primary Taxonomy Switch_3,Provider License Number_3,Provider License Number State Code_3,Healthcare Provider Taxonomy Group_3,Healthcare Provider Taxonomy Code_4,Healthcare Provider Primary Taxonomy Switch_4,Provider License Number_4,Provider License Number State Code_4,Healthcare Provider Taxonomy Group_4,Healthcare Provider Taxonomy Code_5,Healthcare Provider Primary Taxonomy Switch_5,Provider License Number_5,Provider License Number State Code_5,Healthcare Provider Taxonomy Group_5,Healthcare Provider Taxonomy Code_6,Healthcare Provider Primary Taxonomy Switch_6,Provider License Number_6,Provider License Number State Code_6,Healthcare Provider Taxonomy Group_6,Healthcare Provider Taxonomy Code_7,Healthcare Provider Primary Taxonomy Switch_7,Provider License Number_7,Provider License Number State Code_7,Healthcare Provider Taxonomy Group_7,Healthcare Provider Taxonomy Code_8,Healthcare Provider Primary Taxonomy Switch_8,Provider License Number_8,Provider License Number State Code_8,Healthcare Provider Taxonomy Group_8,Healthcare Provider Taxonomy Code_9,Healthcare Provider Primary Taxonomy Switch_9,Provider License Number_9,Provider License Number State Code_9,Healthcare Provider Taxonomy Group_9,Healthcare Provider Taxonomy Code_10,Healthcare Provider Primary Taxonomy Switch_10,Provider License Number_10,Provider License Number State Code_10,Healthcare Provider Taxonomy Group_10,Healthcare Provider Taxonomy Code_11,Healthcare Provider Primary Taxonomy Switch_11,Provider License Number_11,Provider License Number State Code_11,Healthcare Provider Taxonomy Group_11,Healthcare Provider Taxonomy Code_12,Healthcare Provider Primary Taxonomy Switch_12,Provider License Number_12,Provider License Number State Code_12,Healthcare Provider Taxonomy Group_12,Healthcare Provider Taxonomy Code_13,Healthcare Provider Primary Taxonomy Switch_13,Provider License Number_13,Provider License Number State Code_13,Healthcare Provider Taxonomy Group_13,Healthcare Provider Taxonomy Code_14,Healthcare Provider Primary Taxonomy Switch_14,Provider License Number_14,Provider License Number State Code_14,Healthcare Provider Taxonomy Group_14,Healthcare Provider Taxonomy Code_15,Healthcare Provider Primary Taxonomy Switch_15,Provider License Number_15,Provider License Number State Code_15,Healthcare Provider Taxonomy Group_15,Other Provider Identifier_1,Other Provider Identifier Type Code_1,Other Provider Identifier State_1,Other Provider Identifier Issuer_1,Other Provider Identifier_2,Other Provider Identifier Type Code_2,Other Provider Identifier State_2,Other Provider Identifier Issuer_2,Other Provider Identifier_3,Other Provider Identifier Type Code_3,Other Provider Identifier State_3,Other Provider Identifier Issuer_3,Other Provider Identifier_4,Other Provider Identifier Type Code_4,Other Provider Identifier State_4,Other Provider Identifier Issuer_4,Other Provider Identifier_5,Other Provider Identifier Type Code_5,Other Provider Identifier State_5,Other Provider Identifier Issuer_5,Other Provider Identifier_6,Other Provider Identifier Type Code_6,Other Provider Identifier State_6,Other Provider Identifier Issuer_6,Other Provider Identifier_7,Other Provider Identifier Type Code_7,Other Provider Identifier State_7,Other Provider Identifier Issuer_7,Other Provider Identifier_8,Other Provider Identifier Type Code_8,Other Provider Identifier State_8,Other Provider Identifier Issuer_8,Other Provider Identifier_9,Other Provider Identifier Type Code_9,Other Provider Identifier State_9,Other Provider Identifier Issuer_9,Other Provider Identifier_10,Other Provider Identifier Type Code_10,Other Provider Identifier State_10,Other Provider Identifier Issuer_10,Other Provider Identifier_11,Other Provider Identifier Type Code_11,Other Provider Identifier State_11,Other Provider Identifier Issuer_11,Other Provider Identifier_12,Other Provider Identifier Type Code_12,Other Provider Identifier State_12,Other Provider Identifier Issuer_12,Other Provider Identifier_13,Other Provider Identifier Type Code_13,Other Provider Identifier State_13,Other Provider Identifier Issuer_13,Other Provider Identifier_14,Other Provider Identifier Type Code_14,Other Provider Identifier State_14,Other Provider Identifier Issuer_14, Other Provider Identifier_15,Other Provider Identifier Type Code_15,Other Provider Identifier State_15,Other Provider Identifier Issuer_15,Other Provider Identifier_16,Other Provider Identifier Type Code_16,Other Provider Identifier State_16,Other Provider Identifier Issuer_16,Other Provider Identifier_17,Other Provider Identifier Type Code_17,Other Provider Identifier State_17,Other Provider Identifier Issuer_17,Other Provider Identifier_18,Other Provider Identifier Type Code_18,Other Provider Identifier State_18,Other Provider Identifier Issuer_18,Other Provider Identifier_19,Other Provider Identifier Type Code_19,Other Provider Identifier State_19,Other Provider Identifier Issuer_19,Other Provider Identifier_20,Other Provider Identifier Type Code_20,Other Provider Identifier State_20,Other Provider Identifier Issuer_20,Other Provider Identifier_21,Other Provider Identifier Type Code_21,Other Provider Identifier State_21,Other Provider Identifier Issuer_21,Other Provider Identifier_22,Other Provider Identifier Type Code_22,Other Provider Identifier State_22,Other Provider Identifier Issuer_22, Other Provider Identifier_23,Other Provider Identifier Type Code_23,Other Provider Identifier State_23,Other Provider Identifier Issuer_23,Other Provider Identifier_24,Other Provider Identifier Type Code_24,Other Provider Identifier State_24,Other Provider Identifier Issuer_24,Provider Credential Text,Provider Last Name Legal Name,Provider Gender Code,Provider First Name,Provider Middle Name, Provider Name Prefix Text,Provider Name Suffix Text,Authorized Official Middle Name,Provider Other Last Name Type Code,Provider Other Credential Text,Is Organization Subpart,Employer Identification Number EIN,NPI Reactivation Date,NPI Deactivation Date,NPI Deactivation Reason Code,Authorized Official Name Prefix Text,Authorized Official Name Suffix Text,Authorized Official Credential Text,Provider Other Last Name,Provider Other Middle Name,Provider Other First Name,Provider Other Organization Name,Provider Other Organization Name Type Code,Provider Other Name Prefix Text, Provider Other Name Suffix Text,Parent Organization LBN,Parent Organization TIN"; */
			String dbParameters = "Entity_Type_Code, Replacement_NPI,Employer_Identification_Number_EIN,Provider_Organization_Name_Legal_Business_Name,Provider_Last_Name_Legal_Name ,Provider_First_Name,Provider_Middle_Name  , Provider_Name_Prefix_Text ,Provider_Name_Suffix_Text,Provider_Credential_Text,Provider_Other_Organization_Name,Provider_Other_Organization_Name_Type_Code,Provider_Other_Last_Name,Provider_Other_First_Name,Provider_Other_Middle_Name,Provider_Other_Name_Prefix_Text,Provider_Other_Name_Suffix_Text,Provider_Other_Credential_Text ,Provider_Other_Last_Name_Type_Code,Provider_First_Line_Business_Mailing_Address, Provider_Second_Line_Business_Mailing_Address,Provider_Business_Mailing_Address_City_Name,Provider_Business_Mailing_Address_State_Name,Provider_Business_Mailing_Address_Postal_Code,Provider_Business_Mailing_Address_Country_Code_If_outside_US ,Provider_Business_Mailing_Address_Telephone_Number,Provider_Business_Mailing_Address_Fax_Number ,Provider_First_Line_Business_Practice_Location_Address,Provider_Second_Line_Business_Practice_Location_Address,Provider_Business_Practice_Location_Address_City_Name,Provider_Business_Practice_Location_Address_State_Name,Provider_Business_Practice_Location_Address_Postal_Code,Provider_Business_Practice_Location_Address_Country_Code_If_outside_US,Provider_Business_Practice_Location_Address_Telephone_Number,Provider_Business_Practice_Location_Address_Fax_Number,Provider_Enumeration_Date,Last_Update_Date,NPI_Deactivation_Reason_Code,NPI_Deactivation_Date,NPI_Reactivation_Date,Provider_Gender_Code,Authorized_Official_Last_Name,Authorized_Official_First_Name,Authorized_Official_Middle_Name,Authorized_Official_Title_or_Position,Authorized_Official_Telephone_Number,Healthcare_Provider_Taxonomy_Code_1,Provider_License_Number_1,Provider_License_Number_State_Code_1,Healthcare_Provider_Primary_Taxonomy_Switch_1,Healthcare_Provider_Taxonomy_Code_2,Provider_License_Number_2,Provider_License_Number_State_Code_2,Healthcare_Provider_Primary_Taxonomy_Switch_2,Healthcare_Provider_Taxonomy_Code_3,Provider_License_Number_3,Provider_License_Number_State_Code_3,Healthcare_Provider_Primary_Taxonomy_Switch_3,Healthcare_Provider_Taxonomy_Code_4,Provider_License_Number_4,Provider_License_Number_State_Code_4,Healthcare_Provider_Primary_Taxonomy_Switch_4,Healthcare_Provider_Taxonomy_Code_5,Provider_License_Number_5,Provider_License_Number_State_Code_5,Healthcare_Provider_Primary_Taxonomy_Switch_5,Healthcare_Provider_Taxonomy_Code_6,Provider_License_Number_6,Provider_License_Number_State_Code_6,Healthcare_Provider_Primary_Taxonomy_Switch_6,Healthcare_Provider_Taxonomy_Code_7,Provider_License_Number_7,Provider_License_Number_State_Code_7,Healthcare_Provider_Primary_Taxonomy_Switch_7,Healthcare_Provider_Taxonomy_Code_8,Provider_License_Number_8,Provider_License_Number_State_Code_8,Healthcare_Provider_Primary_Taxonomy_Switch_8,Healthcare_Provider_Taxonomy_Code_9,Provider_License_Number_9,Provider_License_Number_State_Code_9,Healthcare_Provider_Primary_Taxonomy_Switch_9,Healthcare_Provider_Taxonomy_Code_10,Provider_License_Number_10,Provider_License_Number_State_Code_10,Healthcare_Provider_Primary_Taxonomy_Switch_10,Healthcare_Provider_Taxonomy_Code_11,Provider_License_Number_11,Provider_License_Number_State_Code_11,Healthcare_Provider_Primary_Taxonomy_Switch_11,Healthcare_Provider_Taxonomy_Code_12,Provider_License_Number_12,Provider_License_Number_State_Code_12,Healthcare_Provider_Primary_Taxonomy_Switch_12,Healthcare_Provider_Taxonomy_Code_13,Provider_License_Number_13  ,Provider_License_Number_State_Code_13  ,Healthcare_Provider_Primary_Taxonomy_Switch_13  ,            Healthcare_Provider_Taxonomy_Code_14  ,            Provider_License_Number_14  ,            Provider_License_Number_State_Code_14  ,            Healthcare_Provider_Primary_Taxonomy_Switch_14  ,            Healthcare_Provider_Taxonomy_Code_15  ,            Provider_License_Number_15  ,            Provider_License_Number_State_Code_15  , Healthcare_Provider_Primary_Taxonomy_Switch_15  ,            Other_Provider_Identifier_1 ,            Other_Provider_Identifier_Type_Code_1 ,            Other_Provider_Identifier_State_1,            Other_Provider_Identifier_Issuer_1  ,            Other_Provider_Identifier_2  ,            Other_Provider_Identifier_Type_Code_2  ,            Other_Provider_Identifier_State_2  ,            Other_Provider_Identifier_Issuer_2  ,            Other_Provider_Identifier_3  ,            Other_Provider_Identifier_Type_Code_3  ,            Other_Provider_Identifier_State_3  ,            Other_Provider_Identifier_Issuer_3  ,            Other_Provider_Identifier_4  ,            Other_Provider_Identifier_Type_Code_4  ,            Other_Provider_Identifier_State_4  ,            Other_Provider_Identifier_Issuer_4  ,            Other_Provider_Identifier_5  ,            Other_Provider_Identifier_Type_Code_5  ,            Other_Provider_Identifier_State_5  ,            Other_Provider_Identifier_Issuer_5  ,            Other_Provider_Identifier_6  ,            Other_Provider_Identifier_Type_Code_6  ,            Other_Provider_Identifier_State_6  ,            Other_Provider_Identifier_Issuer_6  ,            Other_Provider_Identifier_7  ,            Other_Provider_Identifier_Type_Code_7  ,            Other_Provider_Identifier_State_7  ,            Other_Provider_Identifier_Issuer_7  ,            Other_Provider_Identifier_8  ,            Other_Provider_Identifier_Type_Code_8  ,            Other_Provider_Identifier_State_8  ,            Other_Provider_Identifier_Issuer_8  ,            Other_Provider_Identifier_9  ,            Other_Provider_Identifier_Type_Code_9  ,            Other_Provider_Identifier_State_9  ,            Other_Provider_Identifier_Issuer_9  ,            Other_Provider_Identifier_10  ,            Other_Provider_Identifier_Type_Code_10  ,            Other_Provider_Identifier_State_10  ,            Other_Provider_Identifier_Issuer_10  ,            Other_Provider_Identifier_11  ,            Other_Provider_Identifier_Type_Code_11  ,            Other_Provider_Identifier_State_11  ,            Other_Provider_Identifier_Issuer_11  ,            Other_Provider_Identifier_12  ,            Other_Provider_Identifier_Type_Code_12  ,            Other_Provider_Identifier_State_12  ,            Other_Provider_Identifier_Issuer_12  ,            Other_Provider_Identifier_13  ,            Other_Provider_Identifier_Type_Code_13  ,            Other_Provider_Identifier_State_13  ,            Other_Provider_Identifier_Issuer_13  ,            Other_Provider_Identifier_14  ,            Other_Provider_Identifier_Type_Code_14  ,            Other_Provider_Identifier_State_14  ,            Other_Provider_Identifier_Issuer_14  ,            Other_Provider_Identifier_15  ,            Other_Provider_Identifier_Type_Code_15  ,            Other_Provider_Identifier_State_15  ,            Other_Provider_Identifier_Issuer_15  ,            Other_Provider_Identifier_16  ,            Other_Provider_Identifier_Type_Code_16  ,            Other_Provider_Identifier_State_16  ,            Other_Provider_Identifier_Issuer_16  ,            Other_Provider_Identifier_17  ,            Other_Provider_Identifier_Type_Code_17  ,            Other_Provider_Identifier_State_17  ,            Other_Provider_Identifier_Issuer_17  ,            Other_Provider_Identifier_18  ,            Other_Provider_Identifier_Type_Code_18  ,            Other_Provider_Identifier_State_18  ,            Other_Provider_Identifier_Issuer_18  ,            Other_Provider_Identifier_19  ,            Other_Provider_Identifier_Type_Code_19  ,            Other_Provider_Identifier_State_19  ,            Other_Provider_Identifier_Issuer_19  ,            Other_Provider_Identifier_20  ,            Other_Provider_Identifier_Type_Code_20  ,            Other_Provider_Identifier_State_20  ,            Other_Provider_Identifier_Issuer_20  ,            Other_Provider_Identifier_21  ,            Other_Provider_Identifier_Type_Code_21  ,            Other_Provider_Identifier_State_21  ,            Other_Provider_Identifier_Issuer_21  ,            Other_Provider_Identifier_22  ,            Other_Provider_Identifier_Type_Code_22  ,            Other_Provider_Identifier_State_22  ,            Other_Provider_Identifier_Issuer_22  ,            Other_Provider_Identifier_23  ,            Other_Provider_Identifier_Type_Code_23  ,            Other_Provider_Identifier_State_23  ,            Other_Provider_Identifier_Issuer_23  ,            Other_Provider_Identifier_24  ,            Other_Provider_Identifier_Type_Code_24  ,            Other_Provider_Identifier_State_24  ,            Other_Provider_Identifier_Issuer_24  ,            Other_Provider_Identifier_25  ,            Other_Provider_Identifier_Type_Code_25  ,            Other_Provider_Identifier_State_25  ,            Other_Provider_Identifier_Issuer_25  ,            Other_Provider_Identifier_26  ,            Other_Provider_Identifier_Type_Code_26  ,            Other_Provider_Identifier_State_26  ,            Other_Provider_Identifier_Issuer_26  ,            Other_Provider_Identifier_27  ,            Other_Provider_Identifier_Type_Code_27  ,            Other_Provider_Identifier_State_27  ,            Other_Provider_Identifier_Issuer_27  ,            Other_Provider_Identifier_28  ,            Other_Provider_Identifier_Type_Code_28  ,            Other_Provider_Identifier_State_28  ,            Other_Provider_Identifier_Issuer_28  ,Other_Provider_Identifier_29  ,Other_Provider_Identifier_Type_Code_29  ,Other_Provider_Identifier_State_29  ,Other_Provider_Identifier_Issuer_29  ,            Other_Provider_Identifier_30  ,            Other_Provider_Identifier_Type_Code_30  ,            Other_Provider_Identifier_State_30  ,            Other_Provider_Identifier_Issuer_30  ,            Other_Provider_Identifier_31  ,            Other_Provider_Identifier_Type_Code_31  ,            Other_Provider_Identifier_State_31  ,            Other_Provider_Identifier_Issuer_31  ,Other_Provider_Identifier_32  ,            Other_Provider_Identifier_Type_Code_32  ,            Other_Provider_Identifier_State_32  ,            Other_Provider_Identifier_Issuer_32  ,            Other_Provider_Identifier_33  ,            Other_Provider_Identifier_Type_Code_33  ,            Other_Provider_Identifier_State_33  ,            Other_Provider_Identifier_Issuer_33  ,            Other_Provider_Identifier_34  ,            Other_Provider_Identifier_Type_Code_34  ,            Other_Provider_Identifier_State_34  ,            Other_Provider_Identifier_Issuer_34  ,            Other_Provider_Identifier_35  ,            Other_Provider_Identifier_Type_Code_35  ,            Other_Provider_Identifier_State_35  ,            Other_Provider_Identifier_Issuer_35,            Other_Provider_Identifier_36,Other_Provider_Identifier_Type_Code_36,Other_Provider_Identifier_State_36,Other_Provider_Identifier_Issuer_36,Other_Provider_Identifier_37,Other_Provider_Identifier_Type_Code_37,Other_Provider_Identifier_State_37,Other_Provider_Identifier_Issuer_37,Other_Provider_Identifier_38,Other_Provider_Identifier_Type_Code_38,Other_Provider_Identifier_State_38,Other_Provider_Identifier_Issuer_38,Other_Provider_Identifier_39,Other_Provider_Identifier_Type_Code_39,Other_Provider_Identifier_State_39,Other_Provider_Identifier_Issuer_39,Other_Provider_Identifier_40,Other_Provider_Identifier_Type_Code_40,Other_Provider_Identifier_State_40,Other_Provider_Identifier_Issuer_40,Other_Provider_Identifier_41,Other_Provider_Identifier_Type_Code_41,Other_Provider_Identifier_State_41,Other_Provider_Identifier_Issuer_41,Other_Provider_Identifier_42,Other_Provider_Identifier_Type_Code_42,Other_Provider_Identifier_State_42,Other_Provider_Identifier_Issuer_42,Other_Provider_Identifier_43,Other_Provider_Identifier_Type_Code_43,Other_Provider_Identifier_State_43,Other_Provider_Identifier_Issuer_43,Other_Provider_Identifier_44,Other_Provider_Identifier_Type_Code_44,Other_Provider_Identifier_State_44,Other_Provider_Identifier_Issuer_44,Other_Provider_Identifier_45,Other_Provider_Identifier_Type_Code_45,Other_Provider_Identifier_State_45,Other_Provider_Identifier_Issuer_45,Other_Provider_Identifier_46,Other_Provider_Identifier_Type_Code_46,Other_Provider_Identifier_State_46,Other_Provider_Identifier_Issuer_46,Other_Provider_Identifier_47,Other_Provider_Identifier_Type_Code_47,Other_Provider_Identifier_State_47,Other_Provider_Identifier_Issuer_47,Other_Provider_Identifier_48,Other_Provider_Identifier_Type_Code_48,Other_Provider_Identifier_State_48,Other_Provider_Identifier_Issuer_48,Other_Provider_Identifier_49,Other_Provider_Identifier_Type_Code_49,Other_Provider_Identifier_State_49,Other_Provider_Identifier_Issuer_49,Other_Provider_Identifier_50,Other_Provider_Identifier_Type_Code_50,Other_Provider_Identifier_State_50,Other_Provider_Identifier_Issuer_50,Is_Sole_Proprietor,Is_Organization_Subpart,Parent_Organization_LBN,Parent_Organization_TIN,Authorized_Official_Name_Prefix_Text  , Authorized_Official_Name_Suffix_Text,Authorized_Official_Credential_Text,Healthcare_Provider_Taxonomy_Group_1,Healthcare_Provider_Taxonomy_Group_2,Healthcare_Provider_Taxonomy_Group_3,Healthcare_Provider_Taxonomy_Group_4,Healthcare_Provider_Taxonomy_Group_5,Healthcare_Provider_Taxonomy_Group_6,Healthcare_Provider_Taxonomy_Group_7,Healthcare_Provider_Taxonomy_Group_8,Healthcare_Provider_Taxonomy_Group_9,Healthcare_Provider_Taxonomy_Group_10,Healthcare_Provider_Taxonomy_Group_11,Healthcare_Provider_Taxonomy_Group_12,Healthcare_Provider_Taxonomy_Group_13,Healthcare_Provider_Taxonomy_Group_14,Healthcare_Provider_Taxonomy_Group_15";

			ArrayList<String> webParameters = new ArrayList<String>();
			for (String s : dbParameters.split(",")) {
				webParameters.add(s.trim());

			}

			ArrayList<String> dbParam = webParameters;

			//MongoCredential credential = MongoCredential.createCredential("Exafluencep", "Provider", "$Exafluence@123".toCharArray());
				MongoCredential credential = MongoCredential.createCredential("Exafluencep", "Provider", "$Exafluence@123".toCharArray());
	MongoClient client = new MongoClient(new ServerAddress("34.234.131.180", 27234), Arrays.asList(credential));
			MongoDatabase database = client.getDatabase("Provider");
			MongoCollection<Document> collection = database.getCollection("CMSHistory");

			 BasicDBObject q = new BasicDBObject("NPI", npi);

			FindIterable<Document> search = collection.find(q);

			Iterator<Document> Iter = search.iterator();
			System.out.println("Hello");

			while (Iter.hasNext()) {
				String html = "";
				// style='width: 35rem; height: 19rem;'
				Document doc = Iter.next();
		%>
		<div class='col-sm-6'>
			<div class='card'>
				<div class='card-body'>
					<h5 class='card-title'>
						<b>NPI </b><b>
							<%
								out.println(doc.get("NPI"));
							%>
						</b>
			<a  class="btn btn-primary" href="https://npiregistry.cms.hhs.gov/api/?number=<%out.print(doc.get("NPI").toString().trim()); %>&pretty=on" target="_blank">
			 API </a>	
				<button style='margin-left: 80px;' type='button'  
							class='btn btn-primary cf' data-toggle='modal'
							attr-npi="<% out.print(doc.get("NPI").toString().trim()); %>"
							data-target='#myModal'>Track history</button>
					</h5>
					<div class='scrl' style='padding: 10px' id='style-6'>

						<table class='table' style='font-size: 13px;'>
							<thead class='thead-light'>
								<tr class='row'>
									<th class='col-md-4'>Attributes</th>
									<th class='col-md-4'>Past data</th>
									<th class='col-md-4'>Present data</th>
								</tr>
							</thead>
							<tbody>


								<%
									Set<String> keys = doc.keySet();

										Object lastElement = null;
										for (String s : keys) {

											lastElement = s;
										}
										Map<String, String> retrieve = (Map<String, String>) doc.get(lastElement);

										Set<String> embedkeys = retrieve.keySet();
										//	for(Map.Entry<String, String> ss: retrieve.entrySet()){			  

										//if((!j.equals("NPI")) && (!j.equals("_id")) && (!doc.get(j).equals("")) )

										for (String innerkey : embedkeys) {

											if (!(innerkey.matches("Past.*"))) {
												String pastdata = retrieve.get("Past_" + innerkey).toString().trim();
												String presentdata = retrieve.get(innerkey).toString().trim();
												// String j = ss.getKey();

												if ((innerkey.matches(".*Telephone.*")) || (innerkey.matches(".*Fax.*"))) {

													presentdata = presentdata.replace("-", "");
												}

												if (innerkey.matches(".*Date.*")) {
													String[] sp = presentdata.split("-");
													presentdata = sp[1] + "/" + sp[2] + "/" + sp[0];

												}

												if (presentdata.equalsIgnoreCase("true")) {
													presentdata = "Y";
												} else if (presentdata.equalsIgnoreCase("false")) {
													presentdata = "N";
												}

												if (!presentdata.equals(pastdata)) {
								%>
								<tr class='row'>

									<td class='col-md-4'>
										<%
											out.println(innerkey.replaceAll("_", " "));
										%>
									</td>
									<td class='col-md-4'>
										<%
											out.println(pastdata);
										%>
									</td>
									<td class='col-md-4'>
										<%
											out.println(presentdata);
										%>
									</td>



								</tr>
								<%
									}

											}

										}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<br>
		</div>
		 

		<%
			//out.println(html);
				retrieve.clear();
			}
			client.close();
		%>
