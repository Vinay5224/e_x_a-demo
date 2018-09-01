import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Iterator;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

import org.bson.Document;
import org.json.JSONException;
import org.json.JSONObject;

import com.github.wnameless.json.flattener.JsonFlattener;
import com.mongodb.BasicDBObject;
import com.mongodb.MongoClient;
import com.mongodb.MongoCredential;
import com.mongodb.ServerAddress;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

import Utils.Configs;

public class One extends TimerTask{
	static Document doc;
    static String db;
    static Map<String, Object> flattenJson;
    static String timestamp = new SimpleDateFormat("yyyy.MM.dd_HH:mm:ss").format(Calendar.getInstance().getTime());
	
	public void run(){
		
		System.out.println("Started");
		
		String webUIparameters = "results[0].number,results[0].addresses[0].country_code,results[0].addresses[0].city,results[0].addresses[0].address_1,results[0].addresses[0].address_2,results[0].addresses[0].telephone_number,results[0].addresses[0].state,results[0].addresses[0].fax_number,results[0].addresses[0].postal_code,results[0].addresses[1].country_code,results[0].addresses[1].city,results[0].addresses[1].address_1,results[0].addresses[1].address_2,results[0].addresses[1].telephone_number,results[0].addresses[1].state,results[0].addresses[1].fax_number,results[0].addresses[1].postal_code,results[0].taxonomies[0].code,results[0].taxonomies[0].state,results[0].taxonomies[0].primary,results[0].identifiers[0].identifier,results[0].identifiers[0].code,results[0].identifiers[0].state,results[0].identifiers[0].issuer,results[0].basic.authorized_official_telephone_number,results[0].basic.authorized_official_title_or_position,results[0].basic.last_updated,results[0].basic.authorized_official_first_name,results[0].basic.authorized_official_last_name,results[0].basic.authorized_official_name_prefix,results[0].basic.enumeration_date,results[0].basic.organization_name,results[0].taxonomies[1].code,results[0].taxonomies[1].primary,results[0].identifiers[1].code,results[0].identifiers[1].state,results[0].other_names[0].code,results[0].other_names[0].organization_name,results[0].taxonomies[2].code,results[0].taxonomies[3].code,results[0].taxonomies[4].code,results[0].taxonomies[5].code,results[0].taxonomies[6].code,results[0].taxonomies[7].code,results[0].taxonomies[8].code,results[0].taxonomies[9].code,results[0].taxonomies[10].code,results[0].taxonomies[11].code,results[0].taxonomies[12].code,results[0].taxonomies[13].code,results[0].taxonomies[14].code,results[0].taxonomies[2].primary,results[0].taxonomies[3].primary,results[0].taxonomies[4].primary,results[0].taxonomies[5].primary,results[0].taxonomies[6].primary,results[0].taxonomies[7].primary,results[0].taxonomies[8].primary,results[0].taxonomies[9].primary,results[0].taxonomies[10].primary,results[0].taxonomies[11].primary,results[0].taxonomies[12].primary,results[0].taxonomies[13].primary,results[0].taxonomies[14].primary,results[0].identifiers[2].code,results[0].identifiers[3].code,results[0].identifiers[4].code,results[0].identifiers[5].code,results[0].identifiers[6].code,results[0].identifiers[7].code,results[0].identifiers[8].code,results[0].identifiers[9].code,results[0].identifiers[10].code,results[0].identifiers[11].code,results[0].identifiers[12].code,results[0].identifiers[13].code,results[0].identifiers[14].code,results[0].identifiers[15].code,results[0].identifiers[16].code,results[0].identifiers[17].code,results[0].identifiers[18].code,results[0].identifiers[19].code,results[0].identifiers[20].code,results[0].identifiers[21].code,results[0].identifiers[22].code,results[0].identifiers[23].code,results[0].identifiers[2].state,results[0].identifiers[3].state,results[0].identifiers[4].state,results[0].identifiers[5].state,results[0].identifiers[6].state,results[0].identifiers[7].state,results[0].identifiers[8].state,results[0].identifiers[9].state,results[0].identifiers[10].state,results[0].identifiers[11].state,results[0].identifiers[12].state,results[0].identifiers[13].state,results[0].identifiers[14].state,results[0].identifiers[15].state,results[0].identifiers[16].state,results[0].identifiers[17].state,results[0].identifiers[18].state,results[0].identifiers[19].state,results[0].identifiers[20].state,results[0].identifiers[21].state,results[0].identifiers[22].state,results[0].identifiers[23].state,results[0].identifiers[1].issuer,results[0].identifiers[2].issuer,results[0].identifiers[3].issuer,results[0].identifiers[4].issuer,results[0].identifiers[5].issuer,results[0].identifiers[6].issuer,results[0].identifiers[7].issuer,results[0].identifiers[8].issuer,results[0].identifiers[9].issuer,results[0].identifiers[10].issuer,results[0].identifiers[11].issuer,results[0].identifiers[12].issuer,results[0].identifiers[13].issuer,results[0].identifiers[14].issuer,results[0].identifiers[15].issuer,results[0].identifiers[16].issuer,results[0].identifiers[17].issuer,results[0].identifiers[18].issuer,results[0].identifiers[19].issuer,results[0].identifiers[20].issuer,results[0].identifiers[21].issuer,results[0].identifiers[22].issuer,results[0].identifiers[23].issuer,results[0].taxonomies[0].taxonomy_group,results[0].taxonomies[1].taxonomy_group,results[0].taxonomies[2].taxonomy_group,results[0].taxonomies[3].taxonomy_group,results[0].taxonomies[4].taxonomy_group,results[0].taxonomies[5].taxonomy_group,results[0].taxonomies[6].taxonomy_group,results[0].taxonomies[7].taxonomy_group,results[0].taxonomies[8].taxonomy_group,results[0].taxonomies[9].taxonomy_group,results[0].taxonomies[10].taxonomy_group,results[0].taxonomies[11].taxonomy_group,results[0].taxonomies[12].taxonomy_group,results[0].taxonomies[13].taxonomy_group,results[0].taxonomies[14].taxonomy_group,results[0].taxonomies[1].state,results[0].taxonomies[2].state,results[0].taxonomies[3].state,results[0].taxonomies[4].state,results[0].taxonomies[5].state,results[0].taxonomies[6].state,results[0].taxonomies[7].state,results[0].taxonomies[8].state,results[0].taxonomies[9].state,results[0].taxonomies[10].state,results[0].taxonomies[11].state,results[0].taxonomies[12].state,results[0].taxonomies[13].state,results[0].taxonomies[14].state,results[0].taxonomies[0].license,results[0].taxonomies[1].license,results[0].taxonomies[2].license,results[0].taxonomies[3].license,results[0].taxonomies[4].license,results[0].taxonomies[5].license,results[0].taxonomies[6].license,results[0].taxonomies[7].license,results[0].taxonomies[8].license,results[0].taxonomies[9].license,results[0].taxonomies[10].license,results[0].taxonomies[11].license,results[0].taxonomies[12].license,results[0].taxonomies[13].license,results[0].taxonomies[14].license,results[0].basic.organizational_subpart,results[0].basic.credential,results[0].basic.first_name,results[0].basic.last_name,results[0].basic.gender,results[0].identifiers[0].identifier,results[0].identifiers[1].identifier,results[0].identifiers[2].identifier,results[0].identifiers[3].identifier,results[0].identifiers[4].identifier,results[0].identifiers[5].identifier,results[0].identifiers[6].identifier,results[0].identifiers[7].identifier,results[0].identifiers[8].identifier,results[0].identifiers[9].identifier,results[0].identifiers[10].identifier,results[0].identifiers[11].identifier,results[0].identifiers[12].identifier,results[0].identifiers[13].identifier,results[0].identifiers[14].identifier,results[0].identifiers[15].identifier,results[0].identifiers[16].identifier,results[0].identifiers[17].identifier,results[0].identifiers[18].identifier,results[0].identifiers[19].identifier,results[0].identifiers[20].identifier,results[0].identifiers[21].identifier,results[0].identifiers[22].identifier,results[0].identifiers[23].identifier,results[0].basic.middle_name,results[0].basic.name_prefix,results[0].basic.name_suffix,results[0].basic.authorized_official_name_suffix,results[0].basic.authorized_official_credential,results[0].basic.replacement_npi,results[0].basic.parent_organization_legal_business_name,results[0].basic.parent_organization_ein,results[0].basic.deactivation_reason_code,results[0].basic.deactivation_date,results[0].basic.reactivation_date";
		String dbParameters = "NPI,Provider Business Practice Location Address Country Code If outside US,Provider Business Practice Location Address City Name,Provider First Line Business Practice Location Address,Provider Second Line Business Practice Location Address,Provider Business Practice Location Address Telephone Number,Provider Business Practice Location Address State Name,Provider Business Practice Location Address Fax Number,Provider Business Practice Location Address Postal Code,Provider Business Mailing Address Country Code If outside US,Provider Business Mailing Address City Name,Provider First Line Business Mailing Address,Provider Second Line Business Mailing Address,Provider Business Mailing Address Telephone Number,Provider Business Mailing Address State Name,Provider Business Mailing Address Fax Number,Provider Business Mailing Address Postal Code,Healthcare Provider Taxonomy Code_1,Provider License Number State Code_1,Healthcare Provider Primary Taxonomy Switch_1,Other Provider Identifier_2,Other Provider Identifier Type Code_2,Other Provider Identifier State_2,Other Provider Identifier Issuer_2,Authorized Official Telephone Number,Authorized Official Title or Position,Last Update Date,Authorized Official First Name,Authorized Official Last Name,Authorized Official Name Prefix Text,Provider Enumeration Date,Provider Organization Name Legal Business Name,Healthcare Provider Taxonomy Code_2,Healthcare Provider Primary Taxonomy Switch_2,Other Provider Identifier Type Code_1,Other Provider Identifier State_1,Provider Other Organization Name Type Code,Provider Other Organization Name,Healthcare Provider Taxonomy Code_3,Healthcare Provider Taxonomy Code_4,Healthcare Provider Taxonomy Code_5,Healthcare Provider Taxonomy Code_6,Healthcare Provider Taxonomy Code_7,Healthcare Provider Taxonomy Code_8,Healthcare Provider Taxonomy Code_9,Healthcare Provider Taxonomy Code_10,Healthcare Provider Taxonomy Code_11,Healthcare Provider Taxonomy Code_12,Healthcare Provider Taxonomy Code_13,Healthcare Provider Taxonomy Code_14,Healthcare Provider Taxonomy Code_15,Healthcare Provider Primary Taxonomy Switch_3,Healthcare Provider Primary Taxonomy Switch_4,Healthcare Provider Primary Taxonomy Switch_5,Healthcare Provider Primary Taxonomy Switch_6,Healthcare Provider Primary Taxonomy Switch_7,Healthcare Provider Primary Taxonomy Switch_8,Healthcare Provider Primary Taxonomy Switch_9,Healthcare Provider Primary Taxonomy Switch_10,Healthcare Provider Primary Taxonomy Switch_11,Healthcare Provider Primary Taxonomy Switch_12,Healthcare Provider Primary Taxonomy Switch_13,Healthcare Provider Primary Taxonomy Switch_14,Healthcare Provider Primary Taxonomy Switch_15,Other Provider Identifier Type Code_3,Other Provider Identifier Type Code_4,Other Provider Identifier Type Code_5,Other Provider Identifier Type Code_6,Other Provider Identifier Type Code_7,Other Provider Identifier Type Code_8,Other Provider Identifier Type Code_9,Other Provider Identifier Type Code_10,Other Provider Identifier Type Code_11,Other Provider Identifier Type Code_12,Other Provider Identifier Type Code_13,Other Provider Identifier Type Code_14,Other Provider Identifier Type Code_15,Other Provider Identifier Type Code_16,Other Provider Identifier Type Code_17,Other Provider Identifier Type Code_18,Other Provider Identifier Type Code_19,Other Provider Identifier Type Code_20,Other Provider Identifier Type Code_21,Other Provider Identifier Type Code_22,Other Provider Identifier Type Code_23,Other Provider Identifier Type Code_24,Other Provider Identifier State_3,Other Provider Identifier State_4,Other Provider Identifier State_5,Other Provider Identifier State_6,Other Provider Identifier State_7,Other Provider Identifier State_8,Other Provider Identifier State_9,Other Provider Identifier State_10,Other Provider Identifier State_11,Other Provider Identifier State_12,Other Provider Identifier State_13,Other Provider Identifier State_14,Other Provider Identifier State_15,Other Provider Identifier State_16,Other Provider Identifier State_17,Other Provider Identifier State_18,Other Provider Identifier State_19,Other Provider Identifier State_20,Other Provider Identifier State_21,Other Provider Identifier State_22,Other Provider Identifier State_23,Other Provider Identifier State_24,Other Provider Identifier Issuer_1,Other Provider Identifier Issuer_3,Other Provider Identifier Issuer_4,Other Provider Identifier Issuer_5,Other Provider Identifier Issuer_6,Other Provider Identifier Issuer_7,Other Provider Identifier Issuer_8,Other Provider Identifier Issuer_9,Other Provider Identifier Issuer_10,Other Provider Identifier Issuer_11,Other Provider Identifier Issuer_12,Other Provider Identifier Issuer_13,Other Provider Identifier Issuer_14,Other Provider Identifier Issuer_15,Other Provider Identifier Issuer_16,Other Provider Identifier Issuer_17,Other Provider Identifier Issuer_18,Other Provider Identifier Issuer_19,Other Provider Identifier Issuer_20,Other Provider Identifier Issuer_21,Other Provider Identifier Issuer_22,Other Provider Identifier Issuer_23,Other Provider Identifier Issuer_24,Healthcare Provider Taxonomy Group_1,Healthcare Provider Taxonomy Group_2,Healthcare Provider Taxonomy Group_3,Healthcare Provider Taxonomy Group_4,Healthcare Provider Taxonomy Group_5,Healthcare Provider Taxonomy Group_6,Healthcare Provider Taxonomy Group_7,Healthcare Provider Taxonomy Group_8,Healthcare Provider Taxonomy Group_9,Healthcare Provider Taxonomy Group_10,Healthcare Provider Taxonomy Group_11,Healthcare Provider Taxonomy Group_12,Healthcare Provider Taxonomy Group_13,Healthcare Provider Taxonomy Group_14,Healthcare Provider Taxonomy Group_15,Provider License Number State Code_2,Provider License Number State Code_3,Provider License Number State Code_4,Provider License Number State Code_5,Provider License Number State Code_6,Provider License Number State Code_7,Provider License Number State Code_8,Provider License Number State Code_9,Provider License Number State Code_10,Provider License Number State Code_11,Provider License Number State Code_12,Provider License Number State Code_13,Provider License Number State Code_14,Provider License Number State Code_15,Provider License Number_1,Provider License Number_2,Provider License Number_3,Provider License Number_4,Provider License Number_5,Provider License Number_6,Provider License Number_7,Provider License Number_8,Provider License Number_9,Provider License Number_10,Provider License Number_11,Provider License Number_12,Provider License Number_13,Provider License Number_14,Provider License Number_15,Is Organization Subpart,Provider Credential Text,Provider First Name,Provider Last Name Legal Name,Provider Gender Code,Other Provider Identifier_1,Other Provider Identifier_2,Other Provider Identifier_3,Other Provider Identifier_4,Other Provider Identifier_5,Other Provider Identifier_6,Other Provider Identifier_7,Other Provider Identifier_8,Other Provider Identifier_9,Other Provider Identifier_10,Other Provider Identifier_11,Other Provider Identifier_12,Other Provider Identifier_13,Other Provider Identifier_14,Other Provider Identifier_15,Other Provider Identifier_16,Other Provider Identifier_17,Other Provider Identifier_18,Other Provider Identifier_19,Other Provider Identifier_20,Other Provider Identifier_21,Other Provider Identifier_22,Other Provider Identifier_23,Other Provider Identifier_24,Provider Middle Name,Provider Name Prefix Text,Provider Name Suffix Text,Authorized Official Name Suffix Text,Authorized Official Credential Text,Employer Identification Number EIN,Parent Organization LBN,Parent Organization TIN,NPI Deactivation Reason Code,NPI Deactivation Date,NPI Reactivation Date";
    		
		ArrayList<String> webParam = Splitting(webUIparameters);
		ArrayList<String> dbParam = Splitting(dbParameters);

		//System.out.println("WebUIPara" + webParam.size() + "::::" + "DBPARAM" + dbParam.size());
		
        // Getting first Document from the MongoDB
		MongoCredential credential = MongoCredential.createCredential("Exafluencep", "Provider", "$Exafluence@123".toCharArray());
		MongoClient client = new MongoClient(new ServerAddress("192.168.0.230", 27234), Arrays.asList(credential));

       // MongoClient client = new MongoClient("34.234.131.180", 27234);
        MongoDatabase database = client.getDatabase("Provider");
        MongoCollection<Document> collection = database.getCollection("provider");

        // BasicDBObject q = new BasicDBObject("NPI", "1447205208");

        FindIterable<Document> search = collection.find().limit(100).noCursorTimeout(true);

        Iterator<Document> Iter = search.iterator();
       // System.out.println("Hello");

        while(Iter.hasNext()) {

            doc = Iter.next();
            // Getting the that document from the Web
           
			try {
				 JSONObject json;
				 json = readJsonFromUrl("https://npiregistry.cms.hhs.gov/api/resultsDemo2/?number="+ doc.getString("NPI"));
				//json = readJsonFromUrl("https://npiregistry.cms.hhs.gov/api/?number=" + doc.getString("NPI"));
				  flattenJson = JsonFlattener.flattenAsMap(json.toString());
			} catch (IOException | JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
          
           
			
           
            // In this we will check with db and web parameters and we will update in the Collection of the MongoDB.
            for (int i = 0; i < dbParam.size(); i++) {
           
                //System.out.println(webParam.get(i));
                if(flattenJson.get(webParam.get(i)) != null){
                String temp = flattenJson.get(webParam.get(i)).toString().trim();
                // changing boolean to string
                if (temp.equals(true)) {
                    temp = "Y";	
                } else if (temp.equals(false)) {
                    temp = "N";
                }
              //String temp1 = (String) doc.get(dbParam.get(i));
                String temp1 = String.valueOf(doc.get(dbParam.get(i)));

                if( (dbParam.get(i).matches(".*Telephone.*")) || (dbParam.get(i).matches(".*Fax.*"))  ) 
                temp = temp.replace("-","");

                if(dbParam.get(i).equals("Provider Enumeration Date"))
                {
                String [] sp= temp.split("-");
                temp = sp[1]+"/"+sp[2]+"/"+sp[0];
                }
                
                if(dbParam.get(i).equals("Last Update Date"))
                {
                String [] sp= temp.split("-");
                temp = sp[1]+"/"+sp[2]+"/"+sp[0];
                }

                if(dbParam.get(i).equals("Provider Business Practice Location Address Postal Code"))
                {
                //System.out.println(doc.get("NPI")+"::"+temp+":");
                if(temp.length() == 9)
                temp = temp.substring(0,5)+"-"+temp.substring(5,9);
                else
                temp = temp+"-";

                //
                //System.out.println(temp);
                }
             

              //  String temp1 = (String) doc.get(dbParam.get(i));
       
                if (temp.equalsIgnoreCase(temp1)) {
                   
                   // System.out.println(doc.get(dbParam.get(i)) + "==========" + flattenJson.get(webParam.get(i)));

                } else {
                   
                /*    //Updating the values in the present collection
                    BasicDBObject replace = new BasicDBObject(dbParam.get(i),doc.get(dbParam.get(i)));
                    BasicDBObject updateOperationDocument = new BasicDBObject("$set", new BasicDBObject(dbParam.get(i),temp));
                    collection.updateOne(replace, updateOperationDocument);*/

               
                    //Updating in the Notification collection
                    MongoCollection<Document> notifyColl = database.getCollection("Notification");
                    BasicDBObject nofityobj = new BasicDBObject("NPI", doc.get("NPI"));
                    FindIterable<Document> searchNPI = notifyColl.find(nofityobj);
                    Iterator<Document> IterNPI = searchNPI.iterator();
                    Boolean bool = IterNPI.hasNext();
                    //If the document exists then update that document with changed values
                    if(bool.equals(null) || bool.equals(true)){
                       
                        BasicDBObject updateObj = new BasicDBObject("NPI", doc.get("NPI"));
                        BasicDBObject updateNotification = new BasicDBObject("$set", new BasicDBObject(dbParam.get(i), temp).append("Past_"+dbParam.get(i), temp1).append("Date_&_Time", timestamp));
                        notifyColl.updateOne(updateObj, updateNotification);
                       
                    }
                    //If document doesn't exists then append the first document with the corresponding NPI
                    else{
                       
                        Document appendNPI = new Document("NPI", doc.get("NPI"))
                                .append("Date_&_Time", timestamp)
                                .append(dbParam.get(i), temp)
                                .append("Past_"+dbParam.get(i), temp1)
                                .append("isRead", false);
                        notifyColl.insertOne(appendNPI);
                                           
                    }
           
                }

                }else{
                   // System.out.println("The parameter doesn't exists in the NPI registry for this"+doc.get("NPI")+":::::"+webParam.get(i));
                }
               
            }

        }


	
	
	
	
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		long startTime = System.currentTimeMillis();
		
		Timer timer = new Timer();
		timer.schedule(new One(), 0, 120000);
		
	}

	//Crawling from Url converting it into the JSON
	private static String readAll(Reader rd) throws IOException {
        StringBuilder sb = new StringBuilder();
        int cp;
        while ((cp = rd.read()) != -1) {
            sb.append((char) cp);
        }
        return sb.toString();
    }

    public static JSONObject readJsonFromUrl(String url) throws IOException, JSONException {
        InputStream is = new URL(url).openStream();
        try {
            BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
            String jsonText = readAll(rd);
            JSONObject json = new JSONObject(jsonText);
            return json;
        } finally {
            is.close();
        }
    }

    // String split method class
    public static ArrayList<String> Splitting(String split) {
        ArrayList<String> webParameters = new ArrayList<String>();
        for (String s : split.split(",")) {
            webParameters.add(s);

        }
        return webParameters;

    }
	
	
	
}