package com.apms.dao;

import java.sql.Connection;
import java.sql.DriverManager;


public class ApmsDao {
	private static String host = "jdbc:mysql://localhost:3306/apms";
	private static String username = DBCredentials.user;
	private static String password = DBCredentials.pass;
	private static Connection conn;
	
	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(host, username, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() {
		return conn;
	}
	
	public void closeConnection() {
		try {
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
//	public boolean login(String user, String pass) {
//		try {
//			
//			PreparedStatement query = conn.prepareStatement("select * from Student where regNo=? and passwd=?");
//			query.setString(1, user);
//			query.setString(2, pass);
//			
//			ResultSet rs = query.executeQuery();
//			if (rs.next()) {
//				return true;
//			} else {
//				return false;
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//			return false;
//		}
//		
//	}
}
