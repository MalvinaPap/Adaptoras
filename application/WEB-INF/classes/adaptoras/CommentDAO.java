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

public class CommentDAO {

   public static List<Comment> getUserComments(int id) throws Exception {
   	try{

   	    Statement stmt = Database.connect();
   	    String query = "select sender_id,users.name,users.surname,comments.content,date_sent from users,comments where users.id=sender_id and receipient_id="+id+" order by date_sent;";
   	    ResultSet rs = stmt.executeQuery(query);
   	    List<Comment> comments = new ArrayList<Comment>();
   	    int sender_id=0;
        while (rs.next()) {
			sender_id=Integer.parseInt(rs.getString("sender_id"));
			comments.add(new Comment(sender_id,rs.getString("name"),rs.getString("surname"),rs.getString("content"),rs.getString("date_sent")));
		}

   	    Database.disconnect(stmt); // closing connection
        return comments;

   	    } catch (Exception e) {
   		throw new Exception( e.getMessage() );
            }
       }


       public static void saveComment(Comment com) throws Exception {


		      int id = IDHandler.setCommentId();
              int s_id=com.getSid();
			  int r_id=com.getRid();
			  String comment = com.getComment();

			  Date date = Calendar.getInstance().getTime();
			  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			  String cdate = sdf.format(date);

		      try{

		   		Statement stmt = Database.connect();
		   		String query = "INSERT INTO `ismgroup32`.`comments`VALUES ("+id+",'"+comment+"',"+s_id+","+r_id+",'"+cdate+"');";
		   	    stmt.executeUpdate(query);

		   	    Database.disconnect(stmt); // closing connection
		   	 } catch (Exception e) {
		   		throw new Exception( e.getMessage() );
		   	 }

       }


}