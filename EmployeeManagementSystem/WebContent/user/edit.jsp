<%@page import="com.user.model.User"%>
<%@ include file="../header.jsp" %>
<br>
<%  
   if (session.getAttribute("username") == null) {
	   response.sendRedirect("login.jsp");
   }
   
   %>
   
   <%
   
   User user = (User) session.getAttribute("user");
   
   %>
   
   <script>

function confirmUpdate() {
	var r = confirm("Are you sure to update your profile?");
	if (r==true) {
		return true;
	}else {
		return false;
	} 
}
</script>
<div class="container bootstrap snippet">

	<nav aria-label="breadcrumb">
	  <ol class="breadcrumb">
    	<li class="breadcrumb-item"><a href="http://localhost:8080/EmployeeManagementSystem/dashboard.jsp">Dashboard</a></li>
    	<li class="breadcrumb-item"><a href="http://localhost:8080/EmployeeManagementSystem/user/profile.jsp">Profile</a></li>
    	<li class="breadcrumb-item active" aria-current="page">Edit Profile</li>
  	  </ol>
	</nav>
	
    <div class="row">
  		<div class="col-sm-10"><h1>User name</h1></div>
    	
    </div>
              

      <div class="text-center">
        <img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail" alt="avatar">
        <h6>Upload a different photo...</h6>
        <input type="file" class="text-center center-block file-upload">
      </div></hr><br>

               

              
          <div class="tab-content">
            <div class="tab-pane active" id="home">
                <hr>
                  <form class="form" action="../UpdateProfile" method="post" id="registrationForm">
                      <div class="form-group">
                          
                          <div class="col-xs-6">
                              <label for="first_name"><h4>First name</h4></label>
                              <input type="text" class="form-control" name="Fname" id="first_name" placeholder="first name" title="enter your first name if any." value="<%=user.getFirstName()%>">
                          </div>
                      </div>
                      <div class="form-group">
                          
                          
                          <div class="col-xs-6">
                            <label for="last_name"><h4>Last name</h4></label>
                              <input type="text" class="form-control" name="Lname" id="last_name" placeholder="last name" title="enter your last name if any." value="<%=user.getLastName() %>">
                          </div>
                      </div>
          
                      <div class="form-group">
                          
                          <div class="col-xs-6">
                              <label for="phone"><h4>Phone</h4></label>
                              <input type="text" class="form-control" name="phone_num" id="phone" placeholder="enter phone" title="enter your phone number if any." value="<%=user.getPhone_num() %>">
                          </div>
                      </div>
          
                          
                          <div class="col-xs-6">
                              <label for="email"><h4>Email</h4></label>
                              <input type="email" class="form-control" name="email" id="email" placeholder="you@email.com" title="enter your email." value="
                          <%=user.getEmail() %>">
                          </div>
                    
                      <div class="form-group">
                          
                          <div class="col-xs-6">
                              <label for="address"><h4>Address</h4></label>
                              <input type="text" name="address" class="form-control" id="location" placeholder="somewhere" title="enter a location" value="<%=user.getAddress() %>">
                              <input type="hidden" name="user_type" class="form-control" id="location" placeholder="somewhere" title="enter a location" value="<%=user.getUser_type() %>">
                          </div>
                      </div>
               
                    
                      <div class="form-group">
                           <div class="col-xs-12">
                                <br>
                                <input type="hidden" name="UserID" value="<%= user.getUserID() %>">
                              	<button class="btn btn-lg btn-success" type="submit" onclick="return confirmUpdate()"><i class="glyphicon glyphicon-ok-sign"></i> Save</button>
                               	<button class="btn btn-lg" type="reset"><i class="glyphicon glyphicon-repeat"></i> Reset</button>
                            </div>
                      </div>
                      
                      </form>
            </div>
            </div>
</div>


</body>
</html>