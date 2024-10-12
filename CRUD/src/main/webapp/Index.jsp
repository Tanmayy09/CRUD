<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String errmsg = (String) session.getAttribute("error");
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
		<h3 class="p-2">Welcome to our Candidate Portal</h3>
	</nav>
	<section class="vh-80">
		<div class="container-fluid h-custom">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-md-9 col-lg-6 col-xl-5">
					<img src="image/login/candi.avif" class="img-fluid"
						alt="candidate image" oncontextmenu="return false;">
				</div>
				<div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
					<form action="CandiServlet" method="post">
						<h3 class="pt-5 text-center">Candidate Login</h3>
						<!-- Email input -->
						<div class="form-outline mb-4">
							<label class="form-label" for="form3Example3">Admission
								number</label> <input name="uadmn" type="text" id="passcheck"
								class="form-control form-control-lg <%if (errmsg != null) {%> border-danger shake"
								data-bs-toggle="tooltip" data-bs-placement="top"
								data-bs-custom-class="custom-tooltip show"
								data-bs-title="<%=errmsg%>" <%}%> value=""
								placeholder="Enter Your Admission number" required />

						</div>
						<!-- Password input -->
						<label class=" form-label" for="form3Example4">Password</label>
						<div class="form-outline mb-3">
							<input name="upassword" type="password"
								class="form-control form-control-lg <%if (errmsg != null) {%> border-danger shake"
								data-bs-toggle="tooltip" data-bs-placement="top"
								data-bs-custom-class="custom-tooltip show"
								data-bs-title="<%=errmsg%>" <%}%> value=""
								placeholder="Enter password(2000-01-02)" required />
							<div class="form-text text-muted">If first time login!!!
								your password is your DOB(yyyy-mm-dd)</div>
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
							<button type="submit" class="btn btn-primary btn-lg"
								style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.8); padding-left: 2.5rem; padding-right: 2.5rem;">Login</button>
							<p class=" mt-2 pt-1 mb-0 ">
								Are you Admin? <a href="adminLogin.jsp" class="link">Admin
									Login</a>
							</p>
						</div>
					</form>
					<%
					session.removeAttribute("error");
					%>
				</div>
			</div>
		</div>
	</section>
	<div class=" py-4 px-4 px-xl-5 bg-primary" style="margin-top: 30px;">
		<!-- Copyright -->
		<div class=" text-center text-white mb-3 mb-md-0">
			Copyright © 2024. All rights reserved<br>Designed & Developed by
			Tanmay Srivastava
		</div>
	</div>
</body>

<script type="text/javascript">
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

</script>
</html>