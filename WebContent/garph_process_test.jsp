<%@page import="org.neo4j.shell.impl.SystemOutput"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.*,javax.servlet.*,java.util.*,graph.*"%>

<%

try{
	String rel=request.getParameter("rel");
	//System.out.println("rel:::"+rel);


String data="";
String edges1="";
ArrayList<String> ToList=drawGraph.ToListGraphDBRelations("C:/Users/Administrator/Documents/Neo4jDB/DLTST");
 for(int i=0;i<ToList.size();i++)
{ 
	 data=ToList.get(i);
	 
	 
	 /* 
	 	String data6=ToList.get(i);
	    String data1=ToList.get(i).split("in")[1].trim();
		String data2=ToList.get(i).split("is related to")[1].trim();
		String data3=data2.split("in")[1].trim();
		String data4=data1.split("in")[0].trim();
		String data5=data4.split("is related to")[0].trim(); 
	 
		System.out.println("data1::"+data1);
		System.out.println("data2::"+data2);
		System.out.println("data3::"+data3);
		System.out.println("data4::"+data4);
		System.out.println("data5::"+data5); 
		System.out.println("data6::"+data6); */  
		
		
		
	// System.out.println("Graph_Viewsssssss"+data);
}
 
System.out.println("\n*******");


if(rel.equalsIgnoreCase("rela"))
{
String searchrel=request.getParameter("REL");
System.out.println("searchrel::::::"+searchrel);


/* if(searchrel.equalsIgnoreCase("DIM_PROVIDER")){
	System.out.println("data_dispalyed");
} */

String edges="";
String relation="";


for(int i=0;i<ToList.size();i++)
{
	//relation=ToList.get(i).split(":")[2].trim();
	
	//System.out.println("relation:::relation"+relation);
	
	/* String relate=ToList.get(i).split("in")[0].trim();
	
	if(relate.trim().equalsIgnoreCase(searchrel.trim()))
	{ */
	data=ToList.get(i);
	
	String data1=ToList.get(i).split("in")[1].trim();
	String data2=ToList.get(i).split("is related to")[1].trim();
	String data3=data2.split("in")[1].trim();
	String data4=data1.split("in")[0].trim();
	String data5=data4.split("is related to")[0].trim(); 
	String data6=ToList.get(i).split("in")[0].trim();
	
	//System.out.println("data6::"+data6);
	
	/* System.out.println("data1::"+data1);
	System.out.println("data2::"+data2);
	System.out.println("data3::"+data3);
	System.out.println("data4::"+data4);
	System.out.println("data5::"+data5);   */
		
	//String data2=ToList.get(i).split("in")[0].trim();
	//System.out.println("equalsIgnoreCase:::relatesss:"+data1);
	if(data3.trim().equalsIgnoreCase(searchrel.trim())||data5.trim().equalsIgnoreCase(searchrel.trim()))
	{
		edges=data;
		System.out.println("data3:::relatesss:"+edges);
		
		
		
	} 
	/* 
	if(data5.trim().equalsIgnoreCase(searchrel.trim()))
	{
		edges=data;
		System.out.println("data5:::relatesss:"+edges);
		 
	}  */
	
}


if(edges.equalsIgnoreCase(""))
{
 	
}
else
{
//edges=edges.substring(1,edges.length());
edges1="["+edges+"]";
System.out.println("edges111_data"+edges1+"");
response.getWriter().write(edges1);

}
}


}catch(Exception ee){ee.printStackTrace();}
%> 