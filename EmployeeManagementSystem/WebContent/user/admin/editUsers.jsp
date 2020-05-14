<%@page import="java.sql.ResultSet"%>
<%@page import="com.user.utl.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.user.service.UserServiceImpl"%>
<%@page import="com.user.service.IUserService"%>
<%@ include file="../../header.jsp" %>
<br>
<%  
   if (session.getAttribute("username") == null) {
	   response.sendRedirect("login.jsp");
   }
   
   %>
   
   <%
	if(!session.getAttribute("usertype").equals("admin")) {
		response.sendRedirect("../../dashboard.jsp");
	}
	
%>

<script>

function confirmAdd() {
	var r = confirm("Are you sure to edit this User?");
	if (r==true) {
		return true;
	}else {
		return false;
	} 
}

function confirmDelete() {
	var r = confirm("Are You Sure to Delete This User?");
	if (r==true) {
		return true;
	}else {
		return false;
	} 
}

</script>
   
<div class="container">
   
   <nav aria-label="breadcrumb">
	  <ol class="breadcrumb">
    	<li class="breadcrumb-item"><a href="http://localhost:8080/EmployeeManagementSystem/dashboard.jsp">Dashboard</a></li>
    	<li class="breadcrumb-item"><a href="http://localhost:8080/EmployeeManagementSystem/user/manageUser.jsp">Manage User</a></li>
    	<li class="breadcrumb-item active" aria-current="page">Edit User</li>
  	  </ol>
	</nav>


	<div class="row">
		
		<div class="col-sm-8"><h1 class="text-secondary">${username}</h1><br> </div>
	</div>


	<table class="table">
		<tr>
			<td>User ID</td>
			<td>First name</td>
			<td>Last name</td>
			<td>Email</td>
			<td>Address</td>
			<td>Phone Number</td>
		</tr>
		<%
		 Connection connection = DBConnection.getConnection();
		java.sql.Statement st = connection.createStatement();
		
		ResultSet rs = st.executeQuery("SELECT * FROM user");
		
		while(rs.next()) {
		%>
		
		<tr>
			<td><%=rs.getInt("user_id") %></td>
			<td><%=rs.getString("firstname") %></td>
			<td><%=rs.getString("lastname") %></td>
			<td><%=rs.getString("email") %></td>
			<td><%=rs.getString("address") %></td>
			<td><%=rs.getString("phone_num") %></td>
			<td><%=rs.getString("user_type") %></td>
			<td>
				<form action="../../getUserById" method="post">
					<input type="hidden"  name="UserID" value="<%=rs.getInt("user_id") %>">
					<input type="submit" class="btn btn-primary" value="Edit" onclick="return confirmAdd()">
				</form>
			</td>
			<td>
				<form action="../../Delete" method="post">
					<input type="hidden" name="UserID" value="<%=rs.getInt("user_id") %>">
					<input type="submit" class="btn btn-danger" id="removeUser" value="remove" onclick="return confirmDelete()">
				</form>
			</td>
		</tr>

		<%
		}
		%>
		
	</table>



	<form method="get" action="../../getUserById">
	
		<input type="text" name="UserID"><br>
		<input type="submit" value="Get User By ID">
	
	</form>


</div>


</body>
</html>