<%@page import="java.sql.ResultSet"%>
<%@page import="com.user.utl.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ include file="../../header.jsp" %>
<br>
<%  
   if (session.getAttribute("username") == null) {
	   response.sendRedirect("../../login.jsp");
   }


   %>

<%
	if(!session.getAttribute("usertype").equals("admin")) {
		response.sendRedirect("../../dashboard.jsp");
	}
	
%>

<script>

	function validateForm() {
		var fname = document.forms["myForm"]["Fname"].value;
		var lname = document.forms["myForm"]["Lname"].value;
		var email = document.forms["myForm"]["email"].value;
		var address = document.forms["myForm"]["address"].value;
		var phone_num = document.forms["myForm"]["phone_num"].value;
		var user_type = document.forms["myForm"]["user_type"].value;
		if(fname=="") {
			swal("Name must be filled out");
			return false;
		}
		else if(lname=="") {
			swal("Name must be filled out");
			return false;
		}else if(email=="") {
			swal("Email must be filled out");
			return false;
		}else if(address=="") {
			swal("Address must be filled out");
			return false;
		}else if(phone_num=="") {
			swal("Phone Number must be filled out");
			return false;
		}else if(user_type=="") {
			swal("User Type must be filled out");
			return false;
		}
		
	}
	
	function confirmAdd() {
		var r = confirm("Do You Want Add New User");
		if (r==true) {
			return true;
		}else {
			return false;
		} 
	}
	
	function confirmAddLogin() {
		var r = confirm("Do You Want Give Login Access to this User?");
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

<form action="../../addUser" method="get" name="myForm" onsubmit="return validateForm()">
	<table class="table table-dark table-hover">
	
	<tr>
		<th colspan="2"><i class="fa fa-plus" aria-hidden="true"></i> Add new User</th>
		
	</tr>
	
	<tr>
		<td>Enter First name</td>
		<td><input class="form-control" type="text" name="Fname">
	</tr>
	<tr>
		<td>Enter Last Name</td>
		<td><input class="form-control" type="text" name="Lname">
	</tr>
	<tr>
		<td>Enter Email</td>
		<td><input class="form-control" type="text" name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$">
	</tr>
	<tr>
		<td>Enter Address</td>
		<td><input class="form-control" type="text" name="address">
	</tr>
	<tr>
		<td>Enter Phone Number</td>
		<td><input class="form-control" type="text" name="phone_num" pattern="[0][0-9]{9}"></td>
	</tr>
	<tr>
		<td>Select User Type</td>
		<td>
			<select class="form-control" name="user_type">
				<option value="admin">admin</option>
				<option value="accountant">accounttant</option>
				<option value="projectmanager">project manager</option>
			</select>
		
		</td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" class="btn btn-primary btn-lg btn-block" value="submit"  onclick="return confirmAdd()"></td>
	</tr>
	<tr>
		<td colspan="2"><input type="reset" class="btn btn-secondary btn-lg btn-block" value="clear"></td>
	</tr>
	
	</table>
	
</form>

<br><br><hr>



<table class="table table-hover">
	<thead class="thead-dark">
		<tr>
			<th scope="col">User ID</th>
			<th scope="col">First name</th>
			<th scope="col">Last name</th>
			<th scope="col">Email</th>
			<th scope="col">Address</th>
			<th scope="col">Phone Number</th>
			<th scope="col">User Type</th>
			<th scope="col">Add Password</th>
		</tr>
	</thead>
		<%
		 Connection connection = DBConnection.getConnection();
		java.sql.Statement st = connection.createStatement();
		
		ResultSet rs = st.executeQuery("SELECT * FROM user");
		
		while(rs.next()) {
		%>
		
	<tbody>
		<tr>
			
			<td><%=rs.getInt("user_id") %></td>
			<td><%=rs.getString("firstname") %></td>
			<td><%=rs.getString("lastname") %></td>
			<td><%=rs.getString("email") %></td>
			<td><%=rs.getString("address") %></td>
			<td><%=rs.getString("phone_num") %></td>
			<td><%=rs.getString("user_type") %></td>
				
			<td>
				<form method="post" action="../../AddToLogin">	
					<input type="hidden" name="LoginUserId" value="<%=rs.getInt("user_id")%>">
					<input type="hidden" name="email" value="<%=rs.getString("email") %>">
					<input type="password" class="form inerse" name="password">
					<input type="submit" class="btn btn-primary mt-1" onclick="return confirmAddLogin()" value="Add to Login">
				</form>
			</td>
			
		</tr>
		<%
		}
		%>
		
	</tbody>
	</table>



</div>


</body>
</html>