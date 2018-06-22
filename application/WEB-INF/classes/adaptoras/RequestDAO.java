package adaptoras;

import java.util.ArrayList;
import java.util.List;
import java.util.Date;
import java.util.Calendar;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;

public class RequestDAO {

	 public static void saveRequest(Request r) throws Exception {


			      int id = IDHandler.setRequestId();
	              int s_id=r.getSenderId();
				  int r_id=r.getReceipientId();
				  String comment = r.getComment();
				  String cause= r.getCause();
				  String status= r.getStatus();
				  String period= r.getPeriod();

				  Date date = Calendar.getInstance().getTime();
				  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				  String rdate = sdf.format(date);

			      try{

			   		Statement stmt = Database.connect();
			   		String query = "INSERT INTO `ismgroup32`.`request`VALUES ("+id+",'"+cause+"','"+status+"','"+rdate+"','"+period+"','"+comment+"',"+s_id+","+r_id+");";
			   	    stmt.executeUpdate(query);

			   	    Database.disconnect(stmt); // closing connection
			   	 } catch (Exception e) {
			   		throw new Exception( e.getMessage() );
			   	 }
      }

      public static List<Request> getRequestsSent(int id) throws Exception {
	     	try{

	     	   Statement stmt = Database.connect();
	     	   String query = "select users.name,users.surname,r_id,cause,status,date,period,comment,sender_id,receipient_id from request,users where users.id=receipient_id and sender_id="+id+" order by date;";
	     	   ResultSet rs = stmt.executeQuery(query);
	     	   List<Request> sent = new ArrayList<Request>();
	           int request_id=0;
	           int sender_id=0;
	           int receipient_id=0;
	           String fullname=null;
	           while (rs.next()) {
	  			request_id=Integer.parseInt(rs.getString("r_id"));
	  			sender_id=Integer.parseInt(rs.getString("sender_id"));
	  			receipient_id=Integer.parseInt(rs.getString("receipient_id"));
	  			fullname=rs.getString("name")+" "+rs.getString("surname");
	   	  	    sent.add(new Request(request_id,sender_id,receipient_id,rs.getString("cause"),rs.getString("status"),rs.getString("date"),rs.getString("period"),rs.getString("comment"),fullname));
			   }

	     	  Database.disconnect(stmt); // closing connection
	          return sent;

	     	    } catch (Exception e) {
	     		throw new Exception( e.getMessage() );
	              }
       }


        public static List<Request> getRequestsReceived(int id) throws Exception {
	   	     	try{

	   	     	   Statement stmt = Database.connect();
	   	     	   String query = "select users.name,users.surname,r_id,cause,status,date,period,comment,sender_id,receipient_id from request,users where users.id=sender_id and receipient_id="+id+" order by date;";
	   	     	   ResultSet rs = stmt.executeQuery(query);
	   	     	   List<Request> sent = new ArrayList<Request>();
	   	           int request_id=0;
	   	           int sender_id=0;
	   	           int receipient_id=0;
	   	           String fullname=null;
	   	           while (rs.next()) {
					if (!rs.getString("status").equals("declined")) {
						request_id=Integer.parseInt(rs.getString("r_id"));
						sender_id=Integer.parseInt(rs.getString("sender_id"));
						receipient_id=Integer.parseInt(rs.getString("receipient_id"));
						fullname=rs.getString("name")+" "+rs.getString("surname");
						sent.add(new Request(request_id,sender_id,receipient_id,rs.getString("cause"),rs.getString("status"),rs.getString("date"),rs.getString("period"),rs.getString("comment"),fullname));
				    }
	   	  		  }


	   	     	 Database.disconnect(stmt); // closing connection
	   	          return sent;

	   	     	    } catch (Exception e) {
	   	     		throw new Exception( e.getMessage() );
	   	              }
       }

       public static void answerRequest(int id,String status) throws Exception {

	   	   	     	try{

	   	   	     	   Statement stmt = Database.connect();
	   	   	     	   String query = "UPDATE `ismgroup32`.`request` SET `status`='"+status+"' where `r_id`="+id+";";

	   	               stmt.executeUpdate(query);

	   	   	     	   Database.disconnect(stmt); // closing connection

	   	   	       } catch (Exception e) {
	   	   	     		throw new Exception( e.getMessage() );
	   	   	       }
       }


}
