package adaptoras;

import java.util.ArrayList;
import java.util.List;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import org.apache.commons.fileupload.*;


public class Image {


	public static void saveProfileImage(String id,String filename) throws Exception {

			  try{
                    String path= "/images/"+filename;
					Statement stmt = Database.connect();
					stmt.executeUpdate("delete from ismgroup32.images where user_id="+id+";");
					String query = "INSERT INTO `ismgroup32`.`images` (`user_id`,`filename`,`path`) VALUES	("+id+",'"+filename+"','"+path+"');";
					stmt.executeUpdate(query);

					Database.disconnect(stmt); // closing connection
			  } catch (Exception e) {
					throw new Exception( e.getMessage() );
			  }

	}

}