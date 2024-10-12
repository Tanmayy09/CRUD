<%@page import="com.entities.Admin"%>
<%@page import="java.util.List"%>
<%@page import="com.entities.getHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
getHelper t = new getHelper();
List<Admin> tc = t.getAllTeacher();

String step = request.getParameter("step") != null ? request.getParameter("step") : "step1";
String erroldpass = (String) session.getAttribute("erroldpass");
String newpass = (String) session.getAttribute("newpass");
String errnewpass = (String) session.getAttribute("errnewpass");
String errepass = (String) session.getAttribute("errepass");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CRUD?Admin?Profile</title>
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
	<%@ include file="/Component/adminNav.jsp"%>

	<!-- making sidebar -->
	<section>
		<div class="row">
			<div class="col-2 p-5 border-end shadow mt-3">
				<nav id="navbar-example3"
					class="h-100 justify-item-stretch pe-3 border-end-0 position-fixed">
					<nav class="nav nav-pills flex-column">
						<a class="nav-link m-2 mt-3"
							href="AdminPage.jsp?id=<%=aid.getId()%>"> <i
							class="fa fa-table-columns"></i><span
							class="ms-1 d-none d-sm-inline"> DashBoard</span></a> <a
							class="nav-link  m-2" href="Students.jsp?id=<%=aid.getId()%>">
							<i class="fa fa-graduation-cap"></i><span
							class="ms-1 d-none d-sm-inline">Students</span>
						</a> <a class="nav-link m-2" href="Teachers.jsp?id=<%=aid.getId()%>"><i
							class="fa-solid fa-chalkboard-user"></i> <span
							class="ms-1 d-none d-sm-inline">Faculty</span></a> <a
							class="nav-link m-2" href="course.jsp?id=<%=aid.getId()%>"><i
							class="fa-solid fa-book-open-reader"></i> <span
							class="ms-1 d-none d-sm-inline">Courses</span></a> <a
							class="nav-link m-2" href="#item-3?id=<%=aid.getId()%>"><i
							class="fa-solid fa-money-bill-wave"></i> <span
							class="ms-1 d-none d-sm-inline">Fees</span></a> <a
							class="nav-link m-2" href="Help.jsp?id=<%=aid.getId()%>"><i
							class="fa-solid fa-question"></i><span
							class="ms-1 d-none d-sm-inline">Help</span></a>
					</nav>
				</nav>
			</div>
			<div class="col-md-10 mt-5 bg-light vh-100">
				<p class="mt-4 ms-4 d-flex justify-content-between">
					<strong class="fs-3">PROFILE</strong> <a
						class="btn btn-outline-primary me-4"
						href="adminProfile.jsp?id=<%=aid.getId()%>"><i
						class="fa fa-arrow-right-from-bracket me-2"></i>Profile</a>
				</p>
				<div class="row mx-3 shadow">
					<div class="col-md-12 rounded bg-primary d-flex">
						<img class="img rounded-circle m-3" src="../image/user.jpg"
							width="70px">
						<div class=" m-3 ps-1">
							<strong class="text-white fs-3">Hii,<%=aid.getName()%></strong>
							<p class="text-muted">Administration</p>
						</div>
					</div>
				</div>
				<div class="card mt-3 shadow mx-3">
					<div class="card-header text-center">Want to Change Password?
					</div>
					<div class="card-body">
						<div class="text-center">

							<%
							if (step.equals("step1")) {
							%>
							<form action="../adminPass" method="post">
								<input class="form-control" type="hidden" name="step"
									value="step1"> <input class="form-control"
									type="hidden" name="aid" value="<%=aid.getId()%>">
								<div class="row">
									<h5>Verify Old Password</h5>
									
									<div class="col-md-12 mt-2">
										<label><input id="PasswordInput"
											class="form-control <%if (erroldpass != null) {%> border-danger shake "
											data-bs-toggle="tooltip" data-bs-placement="top"
											data-bs-custom-class="custom-tooltip show"
											data-bs-title="<%=erroldpass%>" <%}%> name="oldpassword"
											maxlength="10" placeholder="Old Password" value=""
											type="password" required></label>
									</div>
									<div class="col-md-12 mt-2">
										<button class="btn btn-info mt-2" type="submit">Next</button>
									</div>
								</div>
							</form>
							<%
							}
							session.removeAttribute("erroldpass");
							if (step.equals("step2")) {
							%>
							<form action="../adminPass" method="post">
								<input class="form-control" type="hidden" name="step"
									value="step2"> <input class="form-control"
									type="hidden" name="aid" value="<%=aid.getId()%>">
								<div class="row">
									<h5>Set New PassWord</h5>
									<%
										if (newpass!=null) {
										%>
									<h5 class="<%=(newpass != null) ? "text-success":""%>">
										<%=(newpass != null) ? newpass :""%>
										<%
										}
										%>
									</h5>
									<div class="col-md-12 mt-2">
									<%if(errnewpass!=null){ %>
										<label><input id="PasswordInput"
											class="form-control <%if (errnewpass!=null) {%> border-danger shake"
											data-bs-toggle="tooltip" data-bs-placement="top"
											data-bs-custom-class="custom-tooltip show"
											data-bs-title="<%=errnewpass %>"<%} %>
											maxlength="10" name="newpassword" placeholder="New Password"
											type="text" required></label>
									<%} else if(errepass!=null){ %>
									<label><input id="PasswordInput"
											class="form-control <%if (errepass!=null) {%> border-danger shake"
											data-bs-toggle="tooltip" data-bs-placement="top"
											data-bs-custom-class="custom-tooltip show"
											data-bs-title="<%=errepass %>"<%} %>
											maxlength="10" name="newpassword" placeholder="New Password"
											type="text" required></label>
									<%} else{ %>
									<label><input
											class="form-control"
											maxlength="10" name="newpassword" placeholder="New Password"
											type="text" required></label>
									<%} %>
									</div>
									<div class="col-md-12 mt-2">
										<label><input 
											class="form-control <%if(errepass != null){%> border-danger shake"
											data-bs-toggle="tooltip" data-bs-placement="top"
											data-bs-custom-class="custom-tooltip show"
											data-bs-title="<%=errepass %>"<%} %>
											maxlength="10" name="renewpassword"  placeholder="Re-Password"
											type="password" required></label>
									</div>
									<div class="col-md-12 mt-2">
										<button class="btn btn-info mt-2" type="submit">Update</button>
										<a href="password.jsp?step=step1&id=<%=aid.getId()%>"
											class="btn btn-outline-secondary mt-2" type="submit">Cancel</a>
									</div>
								</div>
							</form>
							<%
							}
							session.removeAttribute("errepass");
							session.removeAttribute("errnewpass");
							session.removeAttribute("newpass");
							%>
						</div>
					</div>
					<div class="card-footer text-muted text-center mt-3">Plz
						contact website developer for Personal detail correction</div>
				</div>
			</div>
		</div>
	</section>
</body>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        // Initialize the tooltips
        var tooltipTriggerEl = document.getElementById('PasswordInput');
        if (tooltipTriggerEl) {
            var tooltip = new bootstrap.Tooltip(tooltipTriggerEl);
            
            <% if (erroldpass != null || errepass!=null || errnewpass!=null ) { %>
                // Automatically show the tooltip when there's an error
                tooltip.show();
            <% } %>
        }
    });
</script>


</html>