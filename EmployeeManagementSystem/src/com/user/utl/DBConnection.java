package com.user.utl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	public DBConnection() {
		// TODO Auto-generated constructor stub
	}

	

	private static String url = "jdbc:MySQL://localhost:3306/employeemanagementsystem?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	private static String name = "root";
	private static String password = "";
	private static String driver = "com.mysql.jdbc.Driver";
	private static Connection connection;
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		
		Class.forName(driver);
		connection = DriverManager.getConnection(url,name,password);
		
		System.out.println("connection success");
		
		return connection;
	}
	
	
}
