package templates;

import java.util.ArrayList;
import java.util.Iterator;

import javax.print.Doc;

import org.bson.Document;

import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

public class Dummy {
	 static int a = 0;
	public  static MongoClient Mongo;
	public static MongoDatabase DB;
	public static MongoCollection<Document> notifyColl;


	public static void main(String[] args) {
		Mongo = new MongoClient("34.234.131.180", 27234);
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
