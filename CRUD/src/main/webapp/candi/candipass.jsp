<%@page import="com.entities.user"%>
<%@page import="com.entities.getHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String s_ID = request.getParameter("s_ID");
getHelper g = new getHelper();
user u = g.getbyAdm(Integer.parseInt(s_ID));

String upass = (String) session.getAttribute("upass");
String erpass = (String) session.getAttribute("erpass");
String epass = (String) session.getAttribute("epass");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Candidate?Profile</title>
<%@ include file="/Component/allcss.jsp"%>
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
	<!-- nav -->
	<jsp:include page="/Component/candiNav.jsp">
		<jsp:param name="s_ID" value="<%=u.getS_ID()%>" />
	</jsp:include>
	<section style="background-color: #e8f5ff;">
		<%
		if (upass != null) {
		%>
		<div class="toast-container align-items-center top-0 start-50 mt-5"
			role="alert" aria-live="assertive" aria-atomic="true">
			<div class="toast d-flex" id="myToast">
				<div class="toast-body">
					<h5 class="modal-title text-success">
						<%=upass%></h5>
				</div>
				<button type="button" class="btn-close me-2 m-auto"
					data-bs-dismiss="toast" aria-label="Close"></button>
			</div>
		</div>
		<%
		}
		%>

		<div class="fw-bold">
			<h4 class="pt-4 mx-3">Change Password</h4>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card shadow border-info mb-3">
					<div class="card-header">Fill Details</div>
					<div class="card-body" style="background-color: #e8f5ff;">
						<form action="../candipass" method="post">
							<input type="hidden" name="s_ID" value=<%=s_ID%>> <label
								class="form-group">Old Password</label> <input required id="passcheck"
								name="oldp" placeholder="Enter Old password" type="password"
								class="mt-2 form-control  <%if (erpass != null) {%> border-danger shake"
								data-bs-toggle="tooltip" data-bs-placement="top"
								data-bs-custom-class="custom-tooltip "
								data-bs-title="<%=erpass%>"<%}%>> <label
								class="form-group mt-3">New Password</label> <input required id="passcheck"
								name="newp" placeholder="Enter Old password" type="password"
								class=" mt-2 form-control <%if (epass != null) {%> border-danger shake"
								data-bs-toggle="tooltip" data-bs-placement="top"
								data-bs-custom-class="custom-tooltip"
								data-bs-title="<%=epass%>" <%}%>> <label
								class="form-group mt-3">Confirm Password</label> <input required
								name="conp" placeholder="Enter Old password" type="password"
								class="  mt-2 form-control <%if (epass != null) {%> border-danger shake<%}%>">
							<div class="mt-3">
								<button class="btn btn-info shadow">Save</button>
							</div>
						</form>
						<%
						session.removeAttribute("epass");
						session.removeAttribute("erpass");
						session.removeAttribute("upass");
						%>
					</div>
				</div>
			</div>
		</div>
	</section>
	<footer>
		<div class=" py-4 px-4 px-xl-5 bg-secondary"">
			<!-- Copyright -->
			<div class=" text-center text-white mb-3 mb-md-0">
				Copyright © 2024. All rights reserved<br>Designed & Developed
				by Tanmay Srivastava
			</div>
		</div>
	</footer>
</body>

<script>
document.addEventListener("DOMContentLoaded", function() {
	// Initialize the tooltips
	var tooltipTriggerEl = document.getElementById('passcheck');
	if (tooltipTriggerEl) {
		var tooltip = new bootstrap.Tooltip(tooltipTriggerEl);
<%if (erpass != null || epass!=null ) {%>
	tooltip.show();
<%}%>
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