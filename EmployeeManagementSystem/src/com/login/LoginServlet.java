package com.login;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.dao.LoginDao;
import com.user.model.Login;
import com.user.model.User;
import com.user.service.UserServiceImpl;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		String username = request.getParameter("username");
		String pass = request.getParameter("password");
		
		
		Login login = new Login();
		
		login.setUsername(username);
		login.setPassword(pass);
		
		LoginDao dao = new LoginDao();
		User user = new User();
		UserServiceImpl userservice = new UserServiceImpl(); 
		
		try {
			if ( dao.check(login) ) {
				
				HttpSession session = request.getSession();
				
				session.setAttribute("username", username);
				
				session.setAttribute("user_id", login.getUser_id());
				
				user = userservice.getUserById(login.getUser_id());
				
				session.setAttribute("usertype", user.getUser_type());
				
				session.setAttribute("user", user);
				
				session.setAttribute("login", login);
				
				response.sendRedirect("dashboard.jsp");
			}else {
				response.sendRedirect("login.jsp");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
