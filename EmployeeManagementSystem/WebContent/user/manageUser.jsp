<%@ include file="../header.jsp" %>
<br>
<%  
   if (session.getAttribute("username") == null) {
	   response.sendRedirect("login.jsp");
   }
   
   %>
  <div class="container">
   <nav aria-label="breadcrumb">
	  <ol class="breadcrumb">
    	<li class="breadcrumb-item"><a href="http://localhost:8080/EmployeeManagementSystem/dashboard.jsp">Dashboard</a></li>
    	<li class="breadcrumb-item active" aria-current="page">Manage User</li>
  	  </ol>
	</nav>


	<div class="row">
		
		<div class="col-sm-8"><h1 class="text-secondary">${username}</h1><br> </div>
	</div>
	
	<ul class="list-group list-group-flush">
  		<li class="list-group-item"><a href="http://localhost:8080/EmployeeManagementSystem/user/admin/addNewUser.jsp">Add new User</a></li>
  		<li class="list-group-item"><a href="http://localhost:8080/EmployeeManagementSystem/user/admin/editUsers.jsp">Edit User</a></li>
	</ul>
   
   </div>
</body>
</html>