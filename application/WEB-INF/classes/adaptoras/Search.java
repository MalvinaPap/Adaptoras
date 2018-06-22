package adaptoras;


import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class Search {

   public static List<User> searchUsers(String city,String provides) throws Exception {

	   try{

			Statement stmt = Database.connect();
			String query = "select id,name,surname,email,description from ismgroup32.users where lives='"+city+"' and (exists (select * from provides where users.id=provides.user_id and content ='"+provides+"'));";
			ResultSet rs = stmt.executeQuery(query);

			List<User> users = new ArrayList<User>();
			while (rs.next()) {
                users.add(new User(rs.getInt("id"),rs.getString("email"),rs.getString("name"),rs.getString("surname"),rs.getString("description")));
			}


	       Database.disconnect(stmt); // closing connection
	       return users;

	   	} catch (Exception e) {
	   		throw new Exception( e.getMessage() );
		}
   }

   public static List<User> searchUsersByCity(String city) throws Exception {

   	   try{

   			Statement stmt = Database.connect();
   			String query = "select id,name,surname,email,description from ismgroup32.users where lives='"+city+"';";
   			ResultSet rs = stmt.executeQuery(query);

   			List<User> users = new ArrayList<User>();
   			while (rs.next()) {
                   users.add(new User(rs.getInt("id"),rs.getString("email"),rs.getString("name"),rs.getString("surname"),rs.getString("description")));
   			}


   	       Database.disconnect(stmt); // closing connection
   	       return users;

   	   	} catch (Exception e) {
   	   		throw new Exception( e.getMessage() );
   		}
   }

   public static List<User> searchUsersByProvides(String provides) throws Exception {

      	   try{

      			Statement stmt = Database.connect();
      			String query = "select id,name,surname,email,description from ismgroup32.users where exists (select * from provides where users.id=provides.user_id and content ='"+provides+"');";
      			ResultSet rs = stmt.executeQuery(query);

      			List<User> users = new ArrayList<User>();
      			while (rs.next()) {
                      users.add(new User(rs.getInt("id"),rs.getString("email"),rs.getString("name"),rs.getString("surname"),rs.getString("description")));
      			}


      	       Database.disconnect(stmt); // closing connection
      	       return users;

      	   	} catch (Exception e) {
      	   		throw new Exception( e.getMessage() );
      		}
      }




}
