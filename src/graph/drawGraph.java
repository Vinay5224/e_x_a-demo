package graph;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.lang.reflect.Array;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map.Entry;

import org.neo4j.graphdb.GraphDatabaseService;
import org.neo4j.graphdb.Label;
import org.neo4j.graphdb.Node;
import org.neo4j.graphdb.Relationship;
import org.neo4j.graphdb.RelationshipType;
import org.neo4j.graphdb.Result;
import org.neo4j.graphdb.factory.GraphDatabaseFactory;
import org.neo4j.helpers.collection.Iterators;
import org.neo4j.graphdb.factory.GraphDatabaseFactory;
//import com.microsoft.sqlserver.jdbc.SQLServerDriver;
public class drawGraph {

	
	static String dbName="",DBServerName="",DBHost="",userName="",dbPassword="";
	static Connection conn = null;
	static int tableCount=0;
	static  HashMap<String,Integer> nodeMap=null;
	static ArrayList<String> fromToList=null;
	static ArrayList<String> ToList=null;
	
	
	public static ArrayList<String> fromToGraphDBRelations(String path) throws Exception
	{
		GraphDatabaseFactory dbFactory = new GraphDatabaseFactory();
		GraphDatabaseService db = dbFactory.newEmbeddedDatabase(new File("C:/Users/Administrator/Documents/Neo4jDB/DLTST"));
		
		fromToList=new ArrayList<String>(1);
		try (org.neo4j.graphdb.Transaction tx = db.beginTx()) {
			
			 Result relResult=db.execute("MATCH ()-[r]->() RETURN r");
			 while(relResult.hasNext())
			 {
				 Iterator<Relationship> col=relResult.columnAs("r"); 
				 while(col.hasNext())
				 {
					 String relNameString=col.next().getProperty("RELATION").toString();
					 relNameString=relNameString.replaceAll("\"", "~");
					//System.out.println("Relatioship"+relNameString);
					 String[] relSplit=relNameString.split("~");
					// System.out.println("splited_array"+relSplit);
					 fromToList.add(relSplit[3]+":"+relSplit[7]+":"+relSplit[1]);
					 
					 
				 }
			 }
			tx.success();
			//tx.terminate();
		   tx.close();
		    
		}
		
		db.shutdown();
		
		return fromToList;
		
	}
	
	public static ArrayList<String> ToListGraphDBRelations(String path) throws Exception
	{
		GraphDatabaseFactory dbFactory = new GraphDatabaseFactory();
		GraphDatabaseService db = dbFactory.newEmbeddedDatabase(new File("D:/DataBase/DLTST"));
		
		ToList=new ArrayList<String>();
		try (org.neo4j.graphdb.Transaction tx = db.beginTx()) {
			
			 Result relResult=db.execute("MATCH ()-[r]->() RETURN r");
			 while(relResult.hasNext())
			 {
				 Iterator<Relationship> col=relResult.columnAs("r"); 
				 while(col.hasNext())
				 {
					 String relNameString=col.next().getProperty("RELATION").toString();
					 relNameString=relNameString.replaceAll("\"", "~");
					// System.out.println("Relatioship_dara"+relNameString);
					 String[] relSplit=relNameString.split("~");
					 ToList.add(relSplit[1]+relSplit[2]+relSplit[3]+relSplit[4]+relSplit[1]+relSplit[2]+relSplit[7]);
					 //ToList.add(relSplit[1]+relSplit[2]+relSplit[3]+relSplit[4]+relSplit[7]);
				 }
			 }
			tx.success();
		//tx.terminate();
		    tx.close();
		    
		}
		
		db.shutdown();
		
		return ToList;
		
	}
	
 
}
