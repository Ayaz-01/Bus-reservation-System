

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class DbUtils {
	static final String url;
	static final String username;
	static final String password;
	
	static {
		//read credentials from property file
		ResourceBundle bundle = ResourceBundle.getBundle("dbdetails"); 
		url = bundle.getString("url");
		username = bundle.getString("username");
		password = bundle.getString("password");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch(ClassNotFoundException ex) {
			System.err.println("Fatal Error, Bye Bye");
			System.exit(1);
		}
	}
	
	static Connection connectToDatabase() throws SQLException {
		return DriverManager.getConnection(url, username, password);
	}
	
	static void closeConnection(Connection conn) throws SQLException{
		if(conn != null)
			conn.close();
	}

		
	}
	
