package adaptoras;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


class IDHandler {

    public IDHandler() {
	}


	public static int setUserId() throws Exception {


       try{
		Statement stmt = Database.connect();
		String query = "SELECT MAX(id) FROM users u;";
        ResultSet rs = stmt.executeQuery(query);

        int id=0;
        while (rs.next()) {
       	  id = rs.getInt("max(id)")+1 ;
	    }
        Database.disconnect(stmt);
        return id;

       } catch (Exception e) {
	   		throw new Exception( e.getMessage() );
	   }

	}


	public static int setRequestId() throws Exception {
		try{
				Statement stmt = Database.connect();
				String query = "SELECT MAX(r_id) FROM request r;";
		        ResultSet rs = stmt.executeQuery(query);

		        int id=0;
		        while (rs.next()) {
		       	  id = rs.getInt("max(r_id)")+1 ;
			    }
		        Database.disconnect(stmt);
		        return id;

		 } catch (Exception e) {
			   throw new Exception( e.getMessage() );
	     }

    }


    public static int setCommentId() throws Exception {
		try{
				Statement stmt = Database.connect();
				String query = "SELECT MAX(c_id) FROM comments c;";
		        ResultSet rs = stmt.executeQuery(query);

		        int id=0;
		        while (rs.next()) {
		       	  id = rs.getInt("max(c_id)")+1 ;
			    }
		        Database.disconnect(stmt);
		        return id;

		 } catch (Exception e) {
			   throw new Exception( e.getMessage() );
	     }

    }








}
