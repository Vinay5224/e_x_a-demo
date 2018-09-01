package templates;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;

import javax.print.Doc;

import org.bson.Document;

import com.mongodb.MongoClient;
import com.mongodb.MongoCredential;
import com.mongodb.ServerAddress;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

public class Dummy {
	 static int a = 0;
	 public  static MongoCredential credential;
	public  static MongoClient Mongo;
	public static MongoDatabase DB;
	public static MongoCollection<Document> notifyColl;


	public static void main(String[] args) {
		
		  credential = MongoCredential.createCredential("Exafluencep", "Provider", "$Exafluence@123".toCharArray());

		 Mongo = new MongoClient(new ServerAddress("34.234.131.180", 27234), Arrays.asList(credential));

		
		 DB = Mongo.getDatabase("Provider");
		 notifyColl = DB.getCollection("Notification");
	
		
		 
		 
		FindIterable<Document> search = notifyColl.find();
		Iterator<Document> Iter = search.iterator();
		
		
		
		
		
		while(Iter.hasNext()){
			Document doc = Iter.next();
			Object present = doc.keySet();
		
			System.out.println(present);
			/*System.out.println(previous);*/
			if(doc.get("isRead").equals(false)){
				a = a+1;
			}else{
				System.out.println("Condition is true");
			}
		}
		
		System.out.println(a);
	}

}
