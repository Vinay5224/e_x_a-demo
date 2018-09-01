

import java.io.IOException;
import java.security.SecureRandom;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Random;

import javax.mail.MessagingException;
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

/**
 * Servlet implementation class forget
 */
@WebServlet("/forget")
public class forget extends HttpServlet {
	String ip=util.Db.ip;
	String hostip=util.Db.hostip;
	int port=util.Db.port;
	
	private static final long serialVersionUID = 1L;
	static String name,companyname,designation,Email;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public forget() {
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
		doGet(request, response);
		
		name = request.getParameter("name");
		companyname = request.getParameter("companyname");
		designation = request.getParameter("designation");
		 Email = request.getParameter("email");
		 
		 
		 MongoCredential credential = MongoCredential.createCredential("Exahealth", "Exahealth", "Exahealth@123".toCharArray());
			MongoClient client = new MongoClient(new ServerAddress(ip,port), Arrays.asList(credential));
			MongoDatabase DB = client.getDatabase("Exahealth");
			MongoCollection<Document> Signincoll = DB.getCollection("newuser");
			
			BasicDBObject query = new BasicDBObject("Name", name);
			query.put("Company Name", companyname);
			query.put("Designation", designation);
			query.put("Email", Email);
			

			FindIterable<Document> search = Signincoll.find(query);
			Iterator<Document> iter = search.iterator();
			if(iter.hasNext()){
				Document doc = iter.next();
				
				String randomPassword = createRandomCode(10);
				BasicDBObject updateObj = new BasicDBObject("Email", doc.getString("Email"));
	            BasicDBObject updatePasswod = new BasicDBObject("$set", new BasicDBObject("Password", randomPassword));
	            Signincoll.updateOne(updateObj, updatePasswod);
	            
	            //sending password to user
	            try {
	            	 
	            	Gmail.sendtoClient("New Password","Login with this Password="+randomPassword, doc.getString("Email").trim());
					//Gmail.send(doc.getString("Email").trim(), "New Password", "Login with this Password="+randomPassword);
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	            response.getWriter().write("done");
				
				
			}else{
				
				response.getWriter().write("Invalid");
			}
	
	}
	//creating random password
	public static String createRandomCode(final int codeLength) {

	    int min = 65;// A
	    int max = 90;// Z


	    StringBuilder sb = new StringBuilder();
	    Random random = new SecureRandom();

	    for (int i = 0; i < codeLength; i++) {

	        Character c;

	        do {

	            c = (char) (random.nextInt((max - min) + 1) + min);

	        } while (sb.indexOf(c.toString()) > -1);

	        sb.append(c);
	    }

	    String output = sb.toString();
	    return output;
	}
}
