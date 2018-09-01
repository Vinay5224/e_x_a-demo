

import java.io.IOException;
import java.util.Arrays;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.bson.Document;

import com.mongodb.BasicDBObject;
import com.mongodb.Mongo;
import com.mongodb.MongoClient;
import com.mongodb.MongoCredential;
import com.mongodb.ServerAddress;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

import util.*;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Document doc;
	String ip=util.Db.ip;
	int port=util.Db.port;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		
		
		String username = request.getParameter("username").trim();
		String password = request.getParameter("password").trim();
		System.out.println(username+password);
		
		 MongoCredential credential = MongoCredential.createCredential("Exahealth", "Exahealth", "Exahealth@123".toCharArray());
			MongoClient client = new MongoClient(new ServerAddress(ip,port), Arrays.asList(credential));
		MongoDatabase DB = client.getDatabase("Exahealth");
		MongoCollection<Document> coll = DB.getCollection("newuser");
		
		BasicDBObject query = new BasicDBObject("Email",username);
		query.put("Password", password);
		FindIterable<Document> search = coll.find(query);
		Iterator<Document> iter = search.iterator();
		 
		if(iter.hasNext()){
			
			Document doc = iter.next(); 
			System.out.println(doc);
			String b = doc.getString("IsValidated");
			// Boolean b=doc.getBoolean("IsValidated");
			System.out.println("is verified"+b);
			if(b.equals("y") && (!b.equals("")))
				 
				{response.getWriter().write("ok");
				HttpSession session=request.getSession();  
	             session.setAttribute("email_id",username); 
				
				}
			else
				response.getWriter().write("Notverified"); 
			
			
		}else{
			
			response.getWriter().write("Invalid");;
			
		}
		client.close();
	}

}
