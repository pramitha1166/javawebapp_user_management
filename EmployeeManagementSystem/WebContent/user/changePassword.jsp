<%@ include file="../header.jsp" %>
<br>
<%  
   if (session.getAttribute("username") == null) {
	   response.sendRedirect("../login.jsp");
   }
   
   %>
   
   <script>

function confirmChange() {
	var r = confirm("Are you sure to change password?");
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
    	<li class="breadcrumb-item"><a href="http://localhost:8080/EmployeeManagementSystem/user/preferences.jsp">Preferences</a></li>
    	<li class="breadcrumb-item active" aria-current="page">Change Password</li>
  	  </ol>
	</nav>

	<form class="form" method="post" action="../ChangePassword">
		<div class="form-group">
			 <label for="exampleInputPassword1">Enter Current Password</label>
    		<input type="password" class="form-control" id="exampleInputPassword1" name="currentPass" placeholder="Enter Current Password">
		</div>
		<div class="form-group">
			 <label for="exampleInputPassword1">Enter New Password</label>
    		<input type="password" class="form-control" id="exampleInputPassword1"  name="newPass" placeholder="Enter New Password">
		</div>
		<button type="submit" class="btn btn-primary" onclick="return confirmChange()">Change Password</button>
	</form>



</div>

</body>
</html>