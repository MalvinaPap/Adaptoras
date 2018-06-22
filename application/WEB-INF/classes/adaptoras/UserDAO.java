package adaptoras;

import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * UserDAO provides all the necessary methods for "handling" user's data.
 *
 *
 *
 */
public class UserDAO {

	public UserDAO() {

	}


	public static void authenticate(String email, String password) throws Exception {

		Statement stmt = Database.connect();

        String query = "select email,password from users u;";
        ResultSet rs = stmt.executeQuery(query);

        while (rs.next()) {
			String a = rs.getString("email");
			if (a.equals(email)) {
				String b = rs.getString("password");
				if (b.equals(password)) {
					Database.disconnect(stmt);
					return;
				} else {
					Database.disconnect(stmt);
					throw new Exception("Wrong username or password");
				}
			}
	    }
	    Database.disconnect(stmt);
	    throw new Exception("Wrong username or password");

	}


	 public static int getUserId(String email) throws Exception {

			Statement stmt = Database.connect();

	        String query = "select id from users where email='"+email+"';";
	        ResultSet rs = stmt.executeQuery(query);

	        while (rs.next()) {
				int id=rs.getInt("id");
				Database.disconnect(stmt);
				return id;
		    }

		    throw new Exception("User with this email does not exist");

		}



	public static void saveUser(User user) throws Exception {

	        int id = IDHandler.setUserId();
			String name= user.getName();
			String surname= user.getSurname();
			String email= user. getEmail();
			String gender= user.getGender();
		    String password= user.getPassword();
		    String city=user.getLives();


			try{

				Statement stmt = Database.connect();
				String query = "INSERT INTO `ismgroup32`.`users` (`id`,`password`,`name`,`surname`,`email`,`gender`,`lives`,`isfrom`,`birthday`,`description`) VALUES	("+id+",'"+password+"','"+name+"','"+surname+"','"+email+"','"+gender+"','"+city+"',null,null,null);";
			    stmt.executeUpdate(query);

				Database.disconnect(stmt); // closing connection
			} catch (Exception e) {
				throw new Exception( e.getMessage() );
			}

	}

	public static User getUserData(int id) throws Exception {

		String email=null;
		String password=null;
		String name=null;
		String surname=null;
	    String gender=null;
		String lives=null;
		String isfrom=null;
		String birthday=null;
	    String description=null;
		try{

			Statement stmt = Database.connect();
			String query = "select name,surname,birthday,gender,email,lives,isfrom,description from users where id="+id+";";
			ResultSet rs = stmt.executeQuery(query);

			while (rs.next()) {
				email=rs.getString("email");
				name=rs.getString("name");
				surname=rs.getString("surname");
				gender=rs.getString("gender");
				lives=rs.getString("lives");
				isfrom=rs.getString("isfrom");
				birthday=rs.getString("birthday");
				description=rs.getString("description");

		    }

		    User user = new User(email,password,name,surname,gender,lives,isfrom,birthday,description);
		    Database.disconnect(stmt); // closing connection
		    return user;

		} catch (Exception e) {
			throw new Exception( e.getMessage() );
		}
    }





    public static List<String> getUserProvides(int id) throws Exception {
			try{

				Statement stmt = Database.connect();
				String query = "select content from provides where user_id="+id+";";
				ResultSet rs = stmt.executeQuery(query);
				List<String> provides = new ArrayList<String>();
				while (rs.next()) {
					provides.add(rs.getString("content"));
				}

				Database.disconnect(stmt); // closing connection
                return provides;



			} catch (Exception e) {
				throw new Exception( e.getMessage() );
			}
    }


    public static List<String> getUserInterests(int id) throws Exception {
		try{

			Statement stmt = Database.connect();
			String query = "select interest from interests where user_id="+id+";";
			ResultSet rs = stmt.executeQuery(query);
			List<String> interests = new ArrayList<String>();
			while (rs.next()) {
				interests.add(rs.getString("interest"));
			}

			Database.disconnect(stmt); // closing connection
            return interests;

		} catch (Exception e) {
			throw new Exception( e.getMessage() );
	    }
    }






}
