import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;

import com.sun.mail.smtp.SMTPMessage;

public class Gmail {
	 
	
	public static void main (String args[]) throws AddressException, MessagingException{
		
		//send( "First Demo","dsjhdskjlfsh");
	}

	
	   public static void sendtoClient( String subject, String content,String Clientemail)throws AddressException, MessagingException {

		   String host = "smtp.gmail.com";
		   String from= "exahealth.info@gmail.com";
		   String to = Clientemail;
		   
		   
		   
		Properties props = new Properties();
		props.put("mail.smtp.starttls.enable", "true"); 
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "587"); 

		Session session = Session.getInstance(props);
		session.setDebug(true);

		try {

		SMTPMessage msg = new SMTPMessage(session);

		String encodingOptions = "text/html; charset=UTF-8";
		msg.setFrom(new InternetAddress(from));
		msg.setRecipients(Message.RecipientType.TO, to);
		msg.setSubject(subject);
		msg.setHeader("Content-Type", encodingOptions);

		Transport tr = session.getTransport("smtp");

		String username="exahealth.info@gmail.com";
		String password="Exa2468@";

		tr.connect(host, username, password);
		msg.setContent(content,"text/html");  
		msg.saveChanges();  
		tr.sendMessage(msg, msg.getAllRecipients());
		tr.close(); 
		}
		catch (Exception mex) {
		System.out.println(mex);
		}
				
			}
	

	      public static void send( String subject, String content)throws AddressException, MessagingException {

   String host = "smtp.gmail.com";
   String from= "exahealth.info@gmail.com";
   String to = "vinay@exafluence.com";
   
   
   
Properties props = new Properties();
props.put("mail.smtp.starttls.enable", "true"); 
props.put("mail.smtp.host", host);
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.port", "587"); 

Session session = Session.getInstance(props);
session.setDebug(true);

try {

SMTPMessage msg = new SMTPMessage(session);

String encodingOptions = "text/html; charset=UTF-8";
msg.setFrom(new InternetAddress(from));
msg.setRecipients(Message.RecipientType.TO, to);
msg.setSubject(subject);
msg.setHeader("Content-Type", encodingOptions);

Transport tr = session.getTransport("smtp");

String username="exahealth.info@gmail.com";
String password="Exa2468@";

tr.connect(host, username, password);
msg.setContent(content,"text/html");  
msg.saveChanges();  
tr.sendMessage(msg, msg.getAllRecipients());
tr.close(); 
}
catch (Exception mex) {
System.out.println(mex);
}
		
	}

}
