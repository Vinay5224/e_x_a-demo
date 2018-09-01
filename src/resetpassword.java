

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.Document;

import com.mongodb.BasicDBObject;
import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

/**
 * Servlet implementation class resetpassword
 */
@WebServlet("/resetpassword")
public class resetpassword extends HttpServlet {
	
	String ip=util.Db.ip;
	String hostip=util.Db.hostip;
	int port=util.Db.port;
	private static final long serialVersionUID = 1L;
    static String Email, presentpassword, confirmpassword;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public resetpassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		
		  Email = request.getParameter("email");
		  presentpassword = request.getParameter("presentpass");
	      confirmpassword = request.getParameter("confirmpass");
		
		MongoClient client = new MongoClient(ip, port);
		MongoDatabase DB = client.getDatabase("Exahealth");
		MongoCollection<Document> Signincoll = DB.getCollection("newuser");
		
		BasicDBObject query = new BasicDBObject("Email", Email);
		query.put("Password", presentpassword);

		FindIterable<Document> search = Signincoll.find(query);
		Iterator<Document> iter = search.iterator();
		if(iter.hasNext()){
			Document doc = iter.next();
			
			BasicDBObject updateObj = new BasicDBObject("Email", doc.getString("Email"));
            BasicDBObject updatePasswod = new BasicDBObject("$set", new BasicDBObject("Password", doc.getString("Password")));
            Signincoll.updateOne(updateObj, updatePasswod);
            
            response.getWriter().write("done");
			
			
		}else{
			
			response.getWriter().write("Invalid");
		}
		
	}

}
