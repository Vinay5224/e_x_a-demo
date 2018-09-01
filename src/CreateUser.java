

import java.io.IOException;
import java.util.Arrays;
import java.util.Iterator;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.RemoteEndpoint.Basic;

import org.bson.Document;

import com.mongodb.BasicDBObject;
import com.mongodb.Mongo;
import com.mongodb.MongoClient;
import com.mongodb.MongoCredential;
import com.mongodb.ServerAddress;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

/**
 * Servlet implementation class CreateUser
 */
@WebServlet("/CreateUser")
public class CreateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String ip=util.Db.ip;
	String hostip=util.Db.hostip;
	int port=util.Db.port;
	
       static String name, companyname, designation, createusername,createpassword,confirmpassword;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateUser() {
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
		
		 name = request.getParameter("name").trim();
		 companyname = request.getParameter("companyname").trim();
		 designation = request.getParameter("designation").trim();
		 createusername = request.getParameter("createusername").trim();
		 createpassword = request.getParameter("createpassword").trim();
		 confirmpassword = request.getParameter("confirmpassword").trim();
		
		 MongoCredential credential = MongoCredential.createCredential("Exahealth", "Exahealth", "Exahealth@123".toCharArray());
			MongoClient client = new MongoClient(new ServerAddress(ip,port), Arrays.asList(credential));

		MongoDatabase DB = client.getDatabase("Exahealth");
		MongoCollection<Document> coll = DB.getCollection("newuser");
		
		BasicDBObject query = new BasicDBObject("Email", createusername);
		//query.put("Password", createpassword);

		FindIterable<Document> search = coll.find(query);
		Iterator<Document> iter = search.iterator();
		if(iter.hasNext()){
			
			response.getWriter().write("no");
			
		}else{
					
		Document doc =new Document("Name", name)
			.append("Company Name", companyname)
			.append("Designation", designation)
			.append("Email", createusername)
			.append("Password", createpassword)
		.append("IsValidated", "");
		coll.insertOne(doc);
		response.getWriter().write("ok");
		String serverIP = request.getLocalAddr();
		String ApplicationName = ((HttpServletRequest) request).getContextPath().replace("/", "");
		
		String act="http://"+ip+":8080/"+ApplicationName+"/confirm.jsp";
		System.out.println(act);
		act+="?name="+name.trim().replaceAll(" ", "_");
		act+="&cn="+companyname.trim().replaceAll(" ", "_");
		act+="&dn="+designation.trim().replaceAll(" ", "_");
		act+="&em="+createusername.trim().replaceAll(" ", "_");
		 
		System.out.println();
		String validate="<td style='background-color: #4ecdc4;border-color: #4c5764;border: 2px solid #45b7af;padding: 10px;text-align: center;'> <a style='display: block;color: white;font-size: 12px;text-decoration: none;text-transform: uppercase;font-weight:bold' href="+act+"&vd=ok"+">Accept</a> </td>";
		String reject="<td style='background-color: red;border-color: #4c5764;border: 2px solid #45b7af;padding: 10px;text-align: center;'> <a style='display: block;color: white;font-size: 12px;text-decoration: none;text-transform: uppercase;font-weight:bold' href="+act+"&vd=no"+">Reject</a> </td>";		
		try {
		
			String msg="<html><head></head><body><b>New user signup ! \n</b><br><table>"+
					"<tr> <td style='padding:10px;border: 1px solid black;'>Name </td><td style='padding:10px;border: 1px solid black;'>"+name+"</td></tr>"
					  + "<tr><td style='border: 1px solid black;'>Company Name  </td> <td style='padding:10px;border: 1px solid black;'>"+companyname+"</td></tr> "+
				"<tr> <td style='padding:10px;border: 1px solid black;'>Designation:</td><td style='border: 1px solid black;'>"+designation+"</td></tr> "+
				"<tr> <td style='padding:10px;border: 1px solid black;'>Email:</td><td style='border: 1px solid black;'>"+createusername+"</td></tr> "+					
				"<tr>"+
				validate+
				/*"<td style='background-color: #4ecdc4;border-color: #4c5764;border: 2px solid #45b7af;padding: 10px;text-align: center;'><a style='border: 1px solid black;display: block;color: black;font-size: 12px;text-decoration: none;text-transform: uppercase;' href='http://www.copernica.com'>Click me</a></td>"+*/
				 reject+ 
				"</tr>"+
				
				"</table><body></html>";
			
			Gmail.sendtoClient("New User Request",msg,"vinay@exafluence.com");
			
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		}
		
		
		
	}

}
