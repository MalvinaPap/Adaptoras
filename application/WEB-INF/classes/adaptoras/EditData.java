package adaptoras;

import java.util.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class EditData {

   public static void updateProvides(int id,String[] provides) throws Exception {

       if(provides == null) {
		   return;
       }
	   try{
		   Statement stmt = Database.connect();
		   stmt.executeUpdate("delete from ismgroup32.provides where user_id="+id+";");
		   String query = "INSERT INTO `ismgroup32`.`provides`(`user_id`,`content`) VALUES ";

		   for (String p:provides) {
			 query=query + "("+id+",'"+p+"'),";
		   }
		   query = query.substring(0, query.length() - 1);
		   query=query + ";";

	       stmt.executeUpdate(query);

	   	   Database.disconnect(stmt); // closing connection
	   } catch (Exception e) {
	   	   throw new Exception( e.getMessage() );
	   }


  }


  public static void updateInterests(int id,String[] interests) throws Exception {

       if(interests == null) {
	   		 return;
       }
 	   try{
 		   Statement stmt = Database.connect();
 		   stmt.executeUpdate("delete from ismgroup32.interests where user_id="+id+";");
 		   String query = "INSERT INTO `ismgroup32`.`interests`(`user_id`,`interest`) VALUES ";

 		   for (String i:interests) {
 			 query=query + "("+id+",'"+i+"'),";
 		   }
 		   query = query.substring(0, query.length() - 1);
 		   query=query + ";";

 	       stmt.executeUpdate(query);

 	   	   Database.disconnect(stmt); // closing connection
 	   } catch (Exception e) {
 	   	   throw new Exception( e.getMessage() );
 	   }


  }


  public static void updateProfile(int id,List<String> toChange,List<String> values) throws Exception {
      if (toChange.size() ==0 || values.size() == 0) {
		  return;
      }
      try{
      	Statement stmt = Database.connect();
        String query = "UPDATE `ismgroup32`.`users` SET ";
        for (int i=0; i<=toChange.size()-1 ; i++) {
			query = query + "`"+toChange.get(i)+"`='"+values.get(i)+"',";
	    }
	    query = query.substring(0, query.length() - 1);
	    query = query + " where `id`="+id+";";

	    stmt.executeUpdate(query);


	    Database.disconnect(stmt); // closing connection
	  } catch (Exception e) {
	   	  throw new Exception( e.getMessage() );
 	  }
  }

}