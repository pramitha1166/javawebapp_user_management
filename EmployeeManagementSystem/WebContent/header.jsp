
 <%@page import="java.sql.ResultSet"%>
<%@page import="com.user.utl.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

	
  <link href="style.css" rel="stylesheet">

</head>
<body>




<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand -->
  <div class="container-fluid">
  	 <div class="header">
  	   <a class="navbar-brand" href="http://localhost:8080/EmployeeManagementSystem/dashboard.jsp">Employee Management System</a>
  	 </div>
  
  <ul class="nav navbar-nav navbar-right">
  
  	  <li>
  	  
  	  	<button type="button" class="btn btn-info btn-sm mt-1">
  			<small>Notifications</small> <span class="badge badge-light"></span>
		</button>
  	  
  	  </li>
  
      <li class="nav-item avatar dropdown">
        <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-333" data-toggle="dropdown"
          aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-user"></i> welcome/<%= session.getAttribute("username") %>(${usertype})
          <!--img src="https://mdbootstrap.com/img/Photos/Avatars/avatar-2.jpg" class="rounded-circle z-depth-0"
            alt="avatar image"-->
        </a>
        <div class="dropdown-menu dropdown-menu-right dropdown-default"
          aria-labelledby="navbarDropdownMenuLink-333">
          <a class="dropdown-item" href="http://localhost:8080/EmployeeManagementSystem/dashboard.jsp">Dashboard</a>
          <a class="dropdown-item" href="http://localhost:8080/EmployeeManagementSystem/user/profile.jsp">Profile</a>
          <a class="dropdown-item" href="http://localhost:8080/EmployeeManagementSystem/user/preferences.jsp">Preferences</a>
          
          <%
          if(session.getAttribute("usertype").equals("admin")) {
          %>
          <a class="dropdown-item" href="http://localhost:8080/EmployeeManagementSystem/user/manageUser.jsp">Manage Users</a>
          <% } %>
          
          <a class="dropdown-item" href="http://localhost:8080/EmployeeManagementSystem/logout.jsp">Logout</a>
          
        </div>
      </li>
      
      
      
    </ul>
  </div>
</nav>

  

