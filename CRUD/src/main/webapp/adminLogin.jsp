<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String errmsg = (String) session.getAttribute("error");
String msg =(String) session.getAttribute("logout");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CRUD Platform</title>
<%@ include file="Component/allcss.jsp"%>
<style type="text/css">
	@keyframes shake {
  0% { transform: translateX(0); }
  25% { transform: translateX(-5px); }
  50% { transform: translateX(5px); }
  75% { transform: translateX(-5px); }
  100% { transform: translateX(0); }
}

.shake {
  animation: shake 0.3s ease-in-out;
}
</style>
</head>
<body>
	<nav class="text-center bg-primary text-white">
		<h3 class="p-2">Welcome to our Admin Portal</h3>
	</nav>
	<%if(msg!=null){ %>
	<div class="toast-container align-items-center top-0 start-50 mt-5"
		role="alert" aria-live="assertive" aria-atomic="true">
		<div class="toast d-flex" id="myToast">
			<div class="toast-body">
				<h5
					class="modal-title text-success">
					<%=msg %></h5>
			</div>
			<button type="button" class="btn-close me-2 m-auto"
				data-bs-dismiss="toast" aria-label="Close"></button>
		</div>
	</div>
	<%} %>
	
	<section class="vh-80">
		<div class="container-fluid">
			<div class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-md- col-lg-6 col-xl-4">
					<img src="image/login/admin_logo4.jpg" class="img-fluid" alt="adm image" oncontextmenu="return false;" >
				</div>
				<div class="col-md- col-lg-6 col-xl-4 offset-xl-1">
					<form action="AdminServlet" method="post">
						<h3 class="pt-5 text-center">Admin Login</h3>
						<!-- Email input -->
						<div class="form-outline mb-4">
							<label class="form-label" for="form3Example3">Enter Email</label>
							<input name="email" type="text" id="passcheck"
								class="form-control form-control-lg <%if(errmsg!=null){%> border-danger shake"
								data-bs-toggle="tooltip" data-bs-placement="top"
								data-bs-custom-class="custom-tooltip show"
								data-bs-title="<%=errmsg %>"<%} %> value=""
								placeholder="Enter Your Registered Email" required /> 
								
						</div>
						<!-- Password input -->
						<label class="form-label" for="form3Example4">Password</label>
						<div class="form-outline mb-3">
							<input name="password" type="password" id="passcheck"
								class="form-control form-control-lg <%if(errmsg!=null){%>border-danger shake <%}%>"
								placeholder="Enter password" required /> 	
						</div>
        				
						<div class="d-flex justify-content-between align-items-center">
							<!-- Checkbox -->
							<div class="form-check mb-0">
								<input class="form-check-input me-2" type="checkbox" value=""
									id="form2Example3" required /> <label class="form-check-label"
									for="form2Example3">Remember me</label>
							</div>
							<a href="forgetpass.jsp" class="text-body">Forgot password?</a>
						</div>
						<div class="text-center mt-4 pt-2">
							<button type="submit" class="btn btn-primary btn-lg" value="login"
								style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.8); padding-left: 2.5rem; padding-right: 2.5rem;">Login</button>
							<p class=" mt-2 pt-1 mb-0 ">Are you candidate?
							<a href="Index.jsp" class="link">Candidate Login</a>
							</p>
						</div>
					</form>
					<%
					session.removeAttribute("error");
					session.removeAttribute("logout");
					%>
				</div>
			</div>
		</div>
	</section>
	<div class=" py-4 px-4 px-xl-5 bg-primary" style="margin-top: 58px;">
			<!-- Copyright -->
			<div class=" text-center text-white mb-3 mb-md-0">Copyright © 2024. All rights reserved<br>Designed & Developed by Tanmay Srivastava</div>
		</div>
</body>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        // Initialize the tooltips
        var tooltipTriggerEl = document.getElementById('passcheck');
        if (tooltipTriggerEl) {
            var tooltip = new bootstrap.Tooltip(tooltipTriggerEl);
            
            <% if (errmsg!=null) { %>
                tooltip.show();
            <% } %>
        }
    });
    
    document.addEventListener("DOMContentLoaded", function() {
        var toastEl = document.getElementById('myToast');
        var toast = new bootstrap.Toast(toastEl);

        // Show the toast (you can trigger this when needed)
        toast.show();
        setTimeout(function() {
           toast.hide();
        }, 3000); // Hide after 3 seconds
    });
</script>
</html>