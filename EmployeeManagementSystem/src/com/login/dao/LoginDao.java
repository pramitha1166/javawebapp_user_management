package com.login.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.user.model.Login;
import com.user.utl.DBConnection;

public class LoginDao {
	
	String sql = "select * from login where username=? and password=?";
	
	public boolean check(Login login) throws ClassNotFoundException, SQLException {
	
		
		Connection connection = DBConnection.getConnection();
	
		PreparedStatement st = connection.prepareStatement(sql); 
	
		st.setString(1, login.getUsername());
		st.setString(2, login.getPassword());
		
		ResultSet res = st.executeQuery();
		
		if(res.next()) {
			
			login.setUser_id(res.getInt("user_id"));
			
			return true;
		}
		return false;
		
	}
	
}
