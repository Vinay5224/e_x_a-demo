package templates;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Bashkill
 */
@WebServlet("/Bashkill")
public class Bashkill extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Bashkill() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String result = "";
		String act = request.getParameter("act");
		
		 Runtime r = Runtime.getRuntime();    
		if(act.equals("start")){
			//start bash
			 
			Map<String,String> chk = getResJps(r);
			if(chk.containsKey("org.apache.spark.deploy.SparkSubmit"))
				result = "Already";
			else
			{
				Process p1 = r.exec("/home/exa4/Music/shell/dep.sh");
				result = "started";
			}
			  
		}else{
			try {
                
				Map<String,String> chk=	getResJps(r);
				
				if(!(chk.containsKey("org.apache.spark.deploy.SparkSubmit")))
					result = "AlreadyStopped";
				else
				{
					 
					String pid= chk.get("org.apache.spark.deploy.SparkSubmit");
					System.out.println("Pid is "+pid);
					//now kill with that pid
					Process p = r.exec("/home/exa4/Music/shell/kill.sh "+pid);
					result = "stopped";
				}	
				
				
				
			    

			} catch (IOException e) {
			    System.out.println(e);
			}
			
		}
		
		
		
		
		
		
		
		System.out.println(result);
		response.getWriter().write(result);
		
		 
	}

	public Map<String,String> getResJps(Runtime r) throws IOException {
		Process p = r.exec("/home/exa4/Music/shell/jps.sh");

		BufferedReader in =
		    new BufferedReader(new InputStreamReader(p.getInputStream()));
		String inputLine;
		Map<String,String> res = new HashMap<String,String>();
		
		while ((inputLine = in.readLine()) != null) {
		    //System.out.println(inputLine);
			String re [] = inputLine.split(" ");
			res.put(re[1],re[0]);
		    //result += inputLine;
		}
		in.close();
		
		System.out.println(res);
		return res;
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Bashkill");
		doGet(request, response);
		
		
	}
	 
}
