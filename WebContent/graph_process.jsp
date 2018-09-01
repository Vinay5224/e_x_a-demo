<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.*,javax.servlet.*,java.util.*,graph.*"%>

<%

try{
String flag=request.getParameter("flag");
System.out.println("flag:::"+flag);

ArrayList<String> fromToList=drawGraph.fromToGraphDBRelations("C:/Users/Administrator/Documents/Neo4jDB/DLTST");
for(int i=0;i<fromToList.size();i++)
{
	//System.out.println(fromToList.get(i));
}

String data="";

 
System.out.println("\n*******");


if(flag.equalsIgnoreCase("attribute"))
{
String searchAttribute=request.getParameter("attrib");
System.out.println("searchAttribute::"+searchAttribute);
String nodes="";
String edges="";
String fromNodeColor="";
String toNodeColor="";
HashSet<String> uniqueNodes=new HashSet<String>();
String relation="";
String edge="";


for(int i=0;i<fromToList.size();i++)
{
	relation=fromToList.get(i).split(":")[2].trim();
	
	
	
	if(relation.trim().equalsIgnoreCase(searchAttribute.trim()))
	{
		
		fromNodeColor=nodes+""+"\"color\":"+"\""+"#A9A9A9";
		toNodeColor=nodes+""+"\"color\":"+"\""+"#A9A9A9";
		String check=fromToList.get(i).split(":")[0].trim();
		String tolist=fromToList.get(i).split(":")[1].trim();
	   
		
		
		
		if(check.equalsIgnoreCase("FCT_CLAIM_UNIVERSE")||  check.equalsIgnoreCase("FCT_CLAIM_DIAGNOSIS") || check.equalsIgnoreCase( "REF_DIAGNOSIS_CODE")    )
				     {
				    	fromNodeColor=nodes+""+"\"color\":"+"\""+"#DE9BF9";//claims colour
				    	//toNodeColor=nodes+""+"\"color\":"+"\""+"#FFFF00";
					}
				     if(tolist.equalsIgnoreCase("FCT_CLAIM_UNIVERSE")||  tolist.equalsIgnoreCase( "FCT_CLAIM_DIAGNOSIS") || tolist.equalsIgnoreCase( "REF_DIAGNOSIS_CODE") )
				    {
				    	toNodeColor=nodes+""+"\"color\":"+"\""+"#DE9BF9";
				    	
				    }
				
				
				     //Provider
				     
				if(check.equalsIgnoreCase("DIM_PROVIDER") || check.equalsIgnoreCase("PROVIDER_ADDRESS")|| check.equalsIgnoreCase("DIM_PROVIDER_CONTRACTS") || check.equalsIgnoreCase("PROVIDER_SPECIALITY"))
					    {
					    	fromNodeColor=nodes+""+"\"color\":"+"\""+"  #FB95AF";//PROVIDER colour
					    	//toNodeColor=nodes+""+"\"color\":"+"\""+"# #FFD86E";
						}
					     if(tolist.equalsIgnoreCase("DIM_PROVIDER") || tolist.equalsIgnoreCase("PROVIDER_ADDRESS") || tolist.equalsIgnoreCase("DIM_PROVIDER_CONTRACTS") || tolist.equalsIgnoreCase("PROVIDER_SPECIALITY"))
					
					    {
					    	toNodeColor=nodes+""+"\"color\":"+"\""+" #FB95AF";
					    	
					    }
		  
				 if(check.equalsIgnoreCase("DIM_MEMBER")|| check.equalsIgnoreCase("MEMBER_ADDRESS")|| check.equalsIgnoreCase("MEMBER_CARE_MANAGER"))
					    {
							fromNodeColor=nodes+""+"\"color\":"+"\""+"#68BDF6";//MEMBER colour
						    //toNodeColor=nodes+""+"\"color\":"+"\""+"#FFFF00";
							}
						     if(tolist.equalsIgnoreCase("DIM_MEMBER")|| tolist.equalsIgnoreCase("MEMBER_ADDRESS") || tolist.equalsIgnoreCase("MEMBER_CARE_MANAGER"))
						
						    {
						    	toNodeColor=nodes+""+"\"color\":"+"\""+"#68BDF6";
						    	
						    }
		uniqueNodes.add("\"id\":"+"\""+fromToList.get(i).split(":")[0].trim()+"\""+","+"\"label\":"+"\""+fromToList.get(i).split(":")[0].trim()+"\""+","+fromNodeColor+"\"");
		uniqueNodes.add("\"id\":"+"\""+fromToList.get(i).split(":")[1].trim()+"\""+","+"\"label\":"+"\""+fromToList.get(i).split(":")[1].trim()+"\""+","+toNodeColor+"\"" );

		edges+=","+"{"+"\"from\":"+"\""+fromToList.get(i).split(":")[0].trim()+"\""+",\"to\":"+"\""+fromToList.get(i).split(":")[1].trim()+"\""+"}";
		edge+=fromToList.get(i).split(":")[2].trim()+ " " +"in "+fromToList.get(i).split(":")[0].trim()+ " "+ "is Related to "+fromToList.get(i).split(":")[2].trim()+ " "+"in "+fromToList.get(i).split(":")[1].trim();
		
		
	}


}


if(edges.equalsIgnoreCase(""))
{
        	
}
else
{
edges=edges.substring(1,edges.length());
edges="["+edges+"]";
System.out.println("edges:"+edges);
}


Iterator<String>itr=uniqueNodes.iterator();
while(itr.hasNext())
{
	
	String node=itr.next();
	nodes+=","+"{"+node+"}";
	
}

if(edges.equalsIgnoreCase(""))
{
 	System.out.println("Invalid attribute name : "+searchAttribute);
}
else
{
nodes=nodes.substring(1,nodes.length());
nodes="["+nodes+"]";
System.out.println("nodes:"+nodes+"");
response.getWriter().write(nodes+"~"+edges);
}
}

}catch(Exception ee){ee.printStackTrace();}
%> 