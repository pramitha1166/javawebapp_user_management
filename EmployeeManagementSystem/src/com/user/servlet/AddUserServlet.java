package com.user.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.model.User;
import com.user.service.IUserService;
import com.user.service.UserServiceImpl;

/**
 * Servlet implementation class AddUserServlet
 */
@WebServlet("/AddUserServlet")
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String Fname = request.getParameter("Fname");
		String Lname = request.getParameter("Lname");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String phone_num = request.getParameter("phone_num");
		String user_type = request.getParameter("user_type");
		
		
		
		User user = new User();
		
		user.setFirstName(Fname);
		user.setLastName(Lname);
		user.setEmail(email);
		user.setAddress(address);
		user.setPhone_num(phone_num);
		user.setUser_type(user_type);
		
		PrintWriter out = response.getWriter();
		
		try {
			IUserService iUserService = new UserServiceImpl();
			iUserService.addUser(user);
			
			out.println("<script type=\"text/javascript\">");
			out.println("alert('successfully added new user');");
			out.println("location='user/admin/addNewUser.jsp';");
			out.println("</script>");
			
		}
		catch(Exception e) {
			
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
