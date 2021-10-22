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
}
