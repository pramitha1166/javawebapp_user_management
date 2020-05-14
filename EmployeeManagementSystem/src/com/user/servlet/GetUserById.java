package com.user.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.user.model.User;
import com.user.service.IUserService;
import com.user.service.UserServiceImpl;

/**
 * Servlet implementation class GetUserById
 */
@WebServlet("/GetUserById")
public class GetUserById extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetUserById() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String userID = request.getParameter("UserID");
		
		
		IUserService iUserService = new UserServiceImpl();
		
		
		
		try {
			User user = iUserService.getUserById(userID);
			
			request.setAttribute("user1", user);
			
			RequestDispatcher rd = request.getRequestDispatcher("user/admin/ShowUserByIdAdmin.jsp");
			rd.forward(request, response);
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			response.sendRedirect("test.jsp");
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			response.sendRedirect("test.jsp");
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
