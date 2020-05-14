<%@page import="com.user.model.User"%>
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

<%

	User user1 = new User();
	user1 = (User) request.getAttribute("user1");

%>
<script>

function confirmEdit() {
	var r = confirm("Are you sure to edit this User?");
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
    	<li class="breadcrumb-item"><a href="http://localhost:8080/EmployeeManagementSystem/user/admin/editUsers.jsp">Edit Users</a></li>
    	<li class="breadcrumb-item active" aria-current="page">Show User</li>
  	  </ol>
	</nav>

<form method="post" action="UpdateUser">
	<table>
		<tr>
			<td>First Name</td>
			<td><input type="text" name="Fname" value="<%= user1.getFirstName() %>"></td>
		</tr>
		<tr>
			<td>Last Name</td>
			<td><input type="text" name="Lname" value="<%= user1.getLastName() %>"></td>
		</tr>
		<tr>
			<td>Email</td>
			<td><input type="text" name="email" value="<%= user1.getEmail() %>"></td>
		</tr>
		<tr>
			<td>Address</td>
			<td><input type="text" name="address" value="<%= user1.getAddress() %>"></td>
		</tr>
		<tr>
			<td>Phone number</td>
			<td><input type="text" name="phone_num" value="<%= user1.getPhone_num() %>"></td>
		</tr>
		<tr>
			<td>User Type</td>
			<td>
				<select name="user_type">
					<option value="<%= user1.getUser_type() %>"><%= user1.getUser_type() %></option>
					<option value="admin">admin</option>
					<option value="accountant">accounttant</option>
					<option value="projectmanager">project manager</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>
					<input type="hidden" name="UserID" value="<%= user1.getUserID() %>">
					<input type="submit" value="update" onclick="return confirmEdit()">
			</td>
		</tr>
		
	</table>
</form>
</div>
</body>
</html>