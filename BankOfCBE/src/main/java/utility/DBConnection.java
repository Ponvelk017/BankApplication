package utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	public static Connection connection = null;
	private static String url = "jdbc:mysql://localhost:3306/Bankapp";
	private static String userName = "root";
	private static String password = "";

	private DBConnection() {

	}

	public static Connection getConnection() {
		if (connection == null) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				connection = DriverManager.getConnection(url, userName, password);
				System.out.println("Connection Established");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return connection;
	}
	public void closeConnection() {
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
