<%@ include file="header.jsp" %>
<%@ include file="mainHeader.jsp" %>

<%  
   if (session.getAttribute("username") == null) {
	   response.sendRedirect("login.jsp");
   }
   
   %>

<!--div class="container">

<!--  
  <h2>Hello ${username}</h2>
  <h3>Navbar With Dropdown</h3>
  <p>This example adds a dropdown menu in the navbar.</p>
  
  <button type="button" class="btn btn-primary btn-lg" id="employee">Manage Employee</button>
  <button type="button" class="btn btn-primary btn-lg">Manage Salary</button>
  <button type="button" class="btn btn-primary btn-lg">Manage Projects</button>
  
  
  
       <main role="main" class="inner cover">
        <h1 class="cover-heading">Cover your page.</h1>
        <p class="lead">Cover is a one-page template for building simple and beautiful home pages. Download, edit the text, and add your own fullscreen background photo to make it your own.</p>
        <p class="lead">
          <a href="#" class="btn btn-lg btn-secondary">Learn more</a>
        </p>
      </main>
  
  
</div>-->  

 <!-- Masthead -->
  <header class="masthead text-white text-center">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-xl-9 mx-auto">
          <h1 class="mb-1">Dashboard</h1>
          <p class="mb-5">The Best Employee Management System</p>
          <a href="#" class="btn btn-primary btn-xl rounded-pill ">Learn More</a>
        </div>
      </div>
    </div>
  </header>

<script>

	$("#employee").click(function() {
		swal("Hello world!");
	})

</script>

</body>
</html>