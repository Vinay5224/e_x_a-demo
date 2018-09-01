package templates;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.Document;

import com.mongodb.BasicDBObject;
import com.mongodb.MongoClient;
import com.mongodb.MongoCredential;
import com.mongodb.ServerAddress;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Collation;


/**
 * Servlet implementation class TrackHistory1
 */
@WebServlet("/TrackHistory1")
public class TrackHistory1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TrackHistory1() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		// TODO Auto-generated method stub
		doGet(request, response);

		String npi = request.getParameter("npi").trim();

	//	MongoClient client = new MongoClient("34.225.16.50", 27081 );
		MongoCredential credential = MongoCredential.createCredential("Exafluencep", "Provider", "$Exafluence@123".toCharArray());
		MongoClient client = new MongoClient(new ServerAddress("34.234.131.180", 27234), Arrays.asList(credential));
		MongoDatabase DB = client.getDatabase("Provider");
		MongoCollection<Document> historycoll = DB.getCollection("CMSHistory");

		BasicDBObject npiquery = new BasicDBObject("NPI", npi);
		System.out.println("npi"+npi);

		FindIterable<Document> hissearch = historycoll.find(npiquery).limit(1);
		Iterator<Document> Itersrch = hissearch.iterator();
		String html="";
		if(Itersrch.hasNext()){

			Document doctrack = Itersrch.next();
			Set<String> trackkeys = doctrack.keySet();
			ArrayList<String> lastElement = new ArrayList<String>();
			for(String setkey: trackkeys){

				if(!setkey.equalsIgnoreCase("_id") && !setkey.equalsIgnoreCase("NPI")){
					lastElement.add(setkey);
				}
			}

			ArrayList<String> getdate = lastElement;
			System.out.println(getdate.toString());
			
		 
			if(lastElement.size() > 1){
				
			 

				for(String x : getdate){
					
					
					
					System.out.println("Date"+x);
					 html+="<tr class='row' >"
					 		+ "<td  class='col-md-12' style='background-color: burlywood; color: white; font-weight: bold;' >Record update at "+x+"  </td>"
					 /*		+ "<td  class='col-md-4' style='background-color: burlywood; color: white; font-weight: bold;' ></td>"*/
					 		/*+ "<td  class='col-md-4' style='background-color: burlywood; color: white; font-weight: bold;' ></td>"*/
					 		+ "</tr>";
					//html+="<div style='background-color: khaki; '> Record update at "+x+"</div>";
					Document subDoc =(Document) doctrack.get(x);
					Set<String> subkeys = subDoc.keySet();
					for(String y : subkeys){

						//check if PASt_
						if(!(y.matches("Past_(.*)")))
						{

							System.out.println(y);
							String present =(String) subDoc.get(y);
							String past =(String) subDoc.get("Past_"+y);

							if( (y.matches(".*Telephone.*")) || (y.matches(".*Fax.*"))  ) {					  

								present = present.replaceAll("[^a-zA-Z0-9]", "").replaceAll("[()]","");
								past = past.replaceAll("[^a-zA-Z0-9]", "").replaceAll("[()]","");
								 
							}

							if(y.matches(".*Date.*"))
							{
								String [] sp= present.split("-");
								present = sp[1]+"/"+sp[2]+"/"+sp[0];

							}

							if (present.equalsIgnoreCase("true")) {
								present = "Y";	
							} else if (present.equalsIgnoreCase("false")) {
								present = "N";
							} 

							System.out.println("^"+past +"^^^^"+ present+"^");
							if(!present.equals(past)){
								html+="<tr class='row' > "+x;
								//System.out.println(j + "   "+ doc.get(j));  
								html  +="<td class='col-md-4' >"+y.replaceAll("_", " ")+"</td>";
								html  +="<td class='col-md-4' >"+past+"</td>";
								html  +="<td class='col-md-4' >"+present+"</td>";
								///now get data from static db
								html+="</tr>";  

								
							}

						}


					}
					
					System.out.println("*********************");
					
				}

 


			}

			else{
				String str = "No Previouse Records for "+npi;
				response.getWriter().write(str);

			}



		}
		System.out.println();
		System.out.println(html);
		response.getWriter().write(html);

	}

}
