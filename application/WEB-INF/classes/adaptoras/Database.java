package adaptoras;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**Manipulates Database connections
 *
 * @author adaptoras
 * @throws SQLException
 */

class Database {


			public Database() {
			}

			public static Statement connect() throws SQLException{

				String url = "jdbc:mysql://195.251.249.131:3306/ismgroup32?useUnicode=true&amp;characterEncoding=utf8";
				System.out.println("Connecting database...");

				try  {
					Connection connection = DriverManager.getConnection(url,"ismgroup32","qs658f");
				    System.out.println("Database connected!\n");
				    Statement stmt = connection.createStatement();
				    return stmt;

				} catch (SQLException e) {
				    throw new IllegalStateException("Cannot connect the database!", e);
				}

			}


			/**Disonnects java program from local database
			 * @throws SQLException
			 * @returns Connection
			 * @param Statement */

			public static void disconnect(Statement stm) throws SQLException {
				stm.close();
			}


}


















