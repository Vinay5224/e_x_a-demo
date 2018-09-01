package templates;



import java.util.Arrays;
import java.util.Iterator;

import javax.management.ObjectName;

import org.bson.Document;

import com.mongodb.DB;
import com.mongodb.MongoClient;
import com.mongodb.MongoCredential;
import com.mongodb.ServerAddress;
import com.mongodb.async.client.MongoCollection;
import com.mongodb.async.client.MongoDatabase;
import com.mongodb.client.FindIterable;

import Utils.*;


public class theme1 {
public static void main( String args[] ) {  
	
MongoCredential credential;
credential = MongoCredential.createCredential(Configs.username, Configs.db1, Configs.password.toCharArray());
	
 MongoClient mongoClient = new MongoClient(new ServerAddress(Configs.ip, 27234), Arrays.asList(credential));
 DB db = mongoClient.getDB( "ARUJ" );
System.out.println("connected to the database successfully");
com.mongodb.client.MongoCollection<Document> coll = (com.mongodb.client.MongoCollection<Document>) db.getCollection("MEMBER");
System.out.println("collection successfully created");
FindIterable<Document> findIterable = coll.find();
Iterator<Document> iter = findIterable.iterator();
while(iter.hasNext()){
	
Document reports = iter.next();
//System.out.println(reports);
Object Reports = reports.get("Report_Name");

System.out.println(Reports);
/*System.out.println(links);*/




}
}

}