package com.user.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.user.model.Login;
import com.user.model.User;
import com.user.service.UserServiceImpl;

/**
 * Servlet implementation class ChangePasswordNew
 */
@WebServlet("/ChangePasswordNew")
public class ChangePasswordNew extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordNew() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		
		String currentPass = request.getParameter("currentPass");
		String newPass = request.getParameter("newPass");
		
		
		
		Login login = new Login();
		
		login = (Login) session.getAttribute("login");
		
		int user_id = (int) session.getAttribute("user_id");
		/*
		if (currentPass == login.getPassword()) {
			UserServiceImpl userService = new UserServiceImpl();
			try {
				userService.chagePass(newPass, user_id);
				response.sendRedirect("user/changePassword.jsp");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			response.sendRedirect("test.jsp");
		}*/
		if( currentPass.equals(login.getPassword()) ) {
			UserServiceImpl userService = new UserServiceImpl();
			login.setPassword(newPass);
			try {
				userService.chagePass(login, user_id);
				
				
				
				session.setAttribute("login", login);
				
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Your Password have been changed!');");
				out.println("location='user/changePassword.jsp';");
				out.println("</script>");
				
			
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Your Password have been not changed!');");
				out.println("location='user/changePassword.jsp';");
				out.println("</script>");
				
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Your Password have been not changed!');");
				out.println("location='user/changePassword.jsp';");
				out.println("</script>");
				
				e.printStackTrace();
			}
		}else {
			
			out.println("<script type=\"text/javascript\">");
			out.println("alert('You enter invalid current password. Please Enter Valid Current Password');");
			out.println("location='user/changePassword.jsp';");
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
