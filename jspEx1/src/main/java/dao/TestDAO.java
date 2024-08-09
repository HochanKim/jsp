package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import Model.User;

public class TestDAO {
	
	public String userName() {
		return "안철수";
	}
	
	public class UserDao {
	    private String jdbcURL = "jdbc:mysql://localhost:3306/sample";
	    private String jdbcUsername = "root";
	    private String jdbcPassword = "test1234";
	    private Connection conn;

	    // 데이터베이스 연결
	    protected void connect() throws SQLException {
	        if (conn == null || conn.isClosed()) {
	            try {
	                Class.forName("com.mysql.jdbc.Driver");
	            } catch (ClassNotFoundException e) {
	                throw new SQLException(e);
	            }
	            conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
	        }
	    }
	    
		
		
		public User userDB() throws SQLException {
			// 특정 테이블 조회
			// 조회한 데이터의 결과를 리턴
			connect(); // 호출할 DB 연결
			Statement stmt = conn.createStatement();
			String sql = "SELECT * FROM TBL_USER";
			ResultSet rs = stmt.executeQuery(sql);
			
			/*
			 * while(rs.next()) {
			 * 
			 * }
			 */
			rs.next();
			String id = rs.getString("userId");
			String name = rs.getString("name");
			String status = rs.getString("status");
			
			User user = new User(id, name, status);
			return user;
		}
	}
	
}
