package com.user.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.model.Login;
import com.user.service.UserServiceImpl;

/**
 * Servlet implementation class AddUserToLogin
 */
@WebServlet("/AddUserToLogin")
public class AddUserToLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUserToLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out = response.getWriter();
		
		String username = request.getParameter("email");
		String password = request.getParameter("password");
		int user_id = Integer.parseInt(request.getParameter("LoginUserId"));
		
		Login login = new Login();
		
		login.setUsername(username);
		login.setPassword(password);
		login.setUser_id(user_id);
		
		UserServiceImpl iuserservice = new UserServiceImpl();
		try {
			iuserservice.addLogin(login);
			
			out.println("<script type=\"text/javascript\">");
			out.println("alert('successfully added new user');");
			out.println("location='user/admin/addNewUser.jsp';");
			out.println("</script>");
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Error with adding data');");
			out.println("location='user/admin/addNewUser.jsp';");
			out.println("</script>");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Error with adding data');");
			out.println("location='user/admin/addNewUser.jsp';");
			out.println("</script>");
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
