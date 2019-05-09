package common.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBManager {
	private DBManager() {}
	private static DBManager instance = new DBManager();
	public static DBManager getInstance () {
		return instance;
	}
	
	public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); // 클래스 적재
			conn = DriverManager.getConnection("jdbc:oracle:thin:@52.78.102.85:1521:xe", "setflix", "1234");

		} catch (SQLException | ClassNotFoundException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return conn;
	}

	// select 수행후 리소스 해제를 위한 메소드
	public static void close(Connection conn, Statement pstmt, ResultSet rs) {
		try {
			if (conn != null)
				conn.close();
			if (pstmt != null)
				pstmt.close();
			if (rs != null)
				rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// select 수행후 리소스 해제를 위한 메소드
	public static void close(Connection conn, Statement pstmt) {
		try {
			if (conn != null)
				conn.close();
			if (pstmt != null)
				pstmt.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
