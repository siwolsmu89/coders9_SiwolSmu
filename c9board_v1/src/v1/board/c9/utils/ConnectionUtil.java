package v1.board.c9.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionUtil {

	static {
		try {
			Class.forName("org.mariadb.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
	public static Connection getConnection() throws SQLException {
		String url = "jdbc:mariadb://localhost:3306/coders9_board_v1?useUnicode=true&characterEncoding=utf8";
		String user = "siwolsmu";
		String pwd = "zxcv1234";
		
		return DriverManager.getConnection(url, user, pwd);
	}
	
}
