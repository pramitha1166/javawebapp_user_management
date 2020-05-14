package com.user.service;

import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.user.model.Login;

import com.user.model.User;
import com.user.utl.DBConnection;

public class UserServiceImpl implements IUserService  {

	
	private static Connection connection;

	
	private PreparedStatement preparedStatement;
	private java.sql.Statement statement ;
	
	public UserServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void addUser(User user) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		
	
			
			connection = DBConnection.getConnection();
			
			
			preparedStatement = connection.prepareStatement("INSERT INTO `user` (`firstname`, `lastname`, `email`, `address`, `phone_num`, `user_type`) VALUES (?, ?, ?, ?, ?, ?)");
			
			
			/*preparedStatement.setString(0, null);*/
			preparedStatement.setString(1, user.getFirstName());
			preparedStatement.setString(2, user.getLastName());
			preparedStatement.setString(3, user.getEmail());
			preparedStatement.setString(4, user.getAddress());
			preparedStatement.setString(5, user.getPhone_num());
			preparedStatement.setString(6, user.getUser_type());
			preparedStatement.execute();
			
		
	}


	@Override
	public User getUserById(int userID) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		
		User user = new User();
		
		connection = DBConnection.getConnection();
		
		java.sql.Statement st = connection.createStatement();
		
		ResultSet rs = st.executeQuery("SELECT * FROM user where user_id="+userID);
		if (rs.next()) {
			
			user.setUserID(rs.getInt("user_id"));
			user.setFirstName(rs.getString("firstname"));
			user.setLastName(rs.getString("lastname"));
			user.setEmail(rs.getString("email"));
			user.setAddress(rs.getString("address"));
			user.setPhone_num(rs.getString("phone_num"));
			user.setUser_type(rs.getString("user_type"));
		}
		
		
		
		return user;
	}
	
		
	public void updateUser(String userID, User user) throws ClassNotFoundException, SQLException {
		
		connection = DBConnection.getConnection();
		
		statement = connection.createStatement();
		
		String query = "update user set firstname='" +user.getFirstName()+ "', lastname='" +user.getLastName()+ "', email='" +user.getEmail()+ "', address='" +user.getAddress()+ "', phone_num='" +user.getPhone_num()+ "', user_type='"+user.getUser_type()+"' where user_id="+userID;
		
		statement.executeUpdate(query);
	}

	@Override
	public User getUserById(String userID) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
	User user = new User();
		
		connection = DBConnection.getConnection();
		
		java.sql.Statement st = connection.createStatement();
		
		ResultSet rs = st.executeQuery("SELECT * FROM user where user_id="+userID);
		if (rs.next()) {
			
			user.setUserID(rs.getInt("user_id"));
			user.setFirstName(rs.getString("firstname"));
			user.setLastName(rs.getString("lastname"));
			user.setEmail(rs.getString("email"));
			user.setAddress(rs.getString("address"));
			user.setPhone_num(rs.getString("phone_num"));
			user.setUser_type(rs.getString("user_type"));
		}
		
		
		
		return user;
	}

	@Override
	public void addLogin(Login login) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		connection = DBConnection.getConnection();
		
		preparedStatement = connection.prepareStatement("INSERT INTO `login` (`username`, `password`, `user_id`) VALUES (?, ?, ?)");
		
		
		preparedStatement.setString(1, login.getUsername());
		preparedStatement.setString(2, login.getPassword());
		preparedStatement.setInt(3, login.getUser_id());
		
		preparedStatement.execute();
	}

	public void chagePass(Login login, int userID) throws ClassNotFoundException, SQLException {
		
		connection = DBConnection.getConnection();
		
		statement = connection.createStatement();
		
		String query = "update login set password='"+login.getPassword()+"' where user_id="+userID;
	
		statement.executeUpdate(query);
	}
	
	public void deleteLogi(int user_id) throws ClassNotFoundException, SQLException {
		
		connection = DBConnection.getConnection();
		
		statement = connection.createStatement();
		
		String query = "delete from login where user_id="+user_id;
		
		
		/*String query = "delete from user where user_id"+user_id;*/
		statement.executeUpdate(query);

		
		
	} 
	

	
	
	public void deleteUser(int user_id) throws ClassNotFoundException, SQLException {
		
		connection = DBConnection.getConnection();
		
		statement = connection.createStatement();
		
		String query = "delete from user where user_id="+user_id;
		
		
		/*String query = "delete from user where user_id"+user_id;*/
		statement.executeUpdate(query);
	}
	
	
}
