package com.user.service;

import java.sql.SQLException;

import com.user.model.Login;

import com.user.model.User;

public interface IUserService {


	public void addUser(User user) throws ClassNotFoundException, SQLException;
	
	public User getUserById(String userID) throws ClassNotFoundException, SQLException;
	
	public void updateUser(String userID, User user) throws ClassNotFoundException, SQLException;

	User getUserById(int userID) throws ClassNotFoundException, SQLException;

	public void addLogin(Login login) throws ClassNotFoundException, SQLException;
	
	public void chagePass(Login login, int userID) throws ClassNotFoundException, SQLException;
	
	public void deleteUser(int user_id) throws ClassNotFoundException, SQLException;
	
	public void deleteLogi(int user_id) throws ClassNotFoundException, SQLException;
	

}
