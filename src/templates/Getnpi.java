package templates;

import java.io.IOException;
import java.util.Arrays;
import java.util.Iterator;

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

import Utils.Configs;

/**
 * Servlet implementation class Getnpi
 */
@WebServlet("/Getnpi")
public class Getnpi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Getnpi() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String html;
		String npi= request.getParameter("npi");
		MongoCredential credential;
		credential = MongoCredential.createCredential(Configs.username, Configs.db1, Configs.password.toCharArray());
			
		Dummy.Mongo = new MongoClient(new ServerAddress(Configs.ip, 27234), Arrays.asList(credential));
		// Dummy.Mongo = new MongoClient("192.168.0.230", 27234);
			Dummy.DB = Dummy.Mongo.getDatabase("Provider");
			Dummy.notifyColl = Dummy.DB.getCollection("Notification");
 		BasicDBObject query = new BasicDBObject("NPI","1447205208" );
			FindIterable<Document> search = Dummy.notifyColl.find(query);
			html="<table style='width:100%'><tr> <th>Past data</th> <th>Present</th> </tr>";
			Iterator<Document> Iter = search.iterator();
			while(Iter.hasNext()){
				 // System.out.println("Hello"+Iter.next());
				Document doc = Iter.next();
				html += "<tr>  <td></td> <td>50</td> </tr>";
				
			}
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		
	/**/
	}

}
