<%@page import="com.entities.Admin"%>
<%@page import="com.entities.getHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
getHelper at = new getHelper();
Admin aid = at.getAdmin(Integer.parseInt(id));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CRUD?HELP</title>
<%@ include file="/Component/allcss.jsp"%>
<style>
.insta {
	background: linear-gradient(45deg, #833AB4, #FD1D1D, #FCAF45, #405DE6);
	-webkit-background-clip: text;
	color: transparent;
}
</style>
</head>
<body>
	<jsp:include page="/Component/adminNav.jsp">
        <jsp:param name="id" value="<%=aid.getId()%>" />
    </jsp:include>

	<!-- making sidebar -->
	<section>
		<div class="row">
			<div class="col-2 p-5 mt-3 shadow border-end">
				<nav id="navbar-example3"
					class="h-100 justify-item-stretch pe-3 position-fixed">
					<nav class="nav nav-pills flex-column">
						<a class="nav-link m-2 mt-3" href="AdminPage.jsp?id=<%=aid.getId()%>"> <i
							class="fa fa-table-columns"></i><span
							class="ms-1 d-none d-sm-inline"> DashBoard</span></a> <a
							class="nav-link m-2" href="Students.jsp?id=<%=aid.getId()%>"> <i
							class="fa fa-graduation-cap"></i><span
							class="ms-1 d-none d-sm-inline">Students</span></a> <a
							class="nav-link m-2" href="Teachers.jsp?id=<%=aid.getId()%>"><i
							class="fa-solid fa-chalkboard-user"></i> <span
							class="ms-1 d-none d-sm-inline">Faculty</span></a> <a
							class="nav-link m-2" href="course.jsp?id=<%=aid.getId()%>"><i
							class="fa-solid fa-book-open-reader"></i> <span
							class="ms-1 d-none d-sm-inline">Courses</span></a> <a
							class="nav-link m-2" href="#item-3?id=<%=aid.getId()%>"><i
							class="fa-solid fa-money-bill-wave"></i> <span
							class="ms-1 d-none d-sm-inline">Fees</span></a> <a
							class="nav-link m-2" href="#help?id=<%=aid.getId()%>"><i
							class="fa-solid fa-question"></i><span
							class="ms-1 d-none d-sm-inline">Help</span></a>
					</nav>
				</nav>
			</div>
			<div class="col-10 mt-5">
				<div data-bs-spy="scroll" data-bs-target="#navbar-example3"
					data-bs-smooth-scroll="true" class="scrollspy-example-2"
					tabindex="0">
					<div class="container mt-4" id="help">
						<div style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
					  		<ol class="breadcrumb ">
					    		<li class="breadcrumb-item"><a href="AdminPage.jsp?id=<%=aid.getId()%>">Home</a></li>
					    		<li class="breadcrumb-item active" aria-current="page">Help</li>
					  		</ol>
						</div>
						<div class="card border-light shadow mt-4 mx-5">
							<div class="row mt-5">
								<div class="col-md-6 ">
									<h3 class="text-center fw-bold">Get in Touch with me</h3>
									<form class="me-3">
										<label for="firstName" class="form-label mx-3">Name</label> <input
											required class="form-control mx-3" value="<%=aid.getName()%>" type="text"
											 name="aname"> <label
											for="firstName" class="form-label mx-3 mt-2">Email</label> <input
											required class="form-control mx-3" type="email"
											name="aname" value="<%= aid.getEmail()%>"> <label
											for="firstName" class="form-label mx-3 mt-2">Query</label>
										<textarea required style="height: 60px;"
											class="form-control mx-3" placeholder="Enter Query"
											name="aAdd"></textarea>
										<div class="text-center mt-2">
											<button type="submit" class="btn btn-outline-primary">Send Message</button>
										</div>
									</form>
								</div>
								<div class="col-md-6 ">
									<div class="map m-2">
										<iframe 
											src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d23394.239897258027!2d77.43788896449998!3d28.57992531415696!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x390cee9426f41e7f%3A0x1e6989d391cf16ad!2sPatwari%2C%20Greater%20Noida%2C%20Uttar%20Pradesh!5e1!3m2!1sen!2sin!4v1725977264409!5m2!1sen!2sin"
											width="400" height="350" style="border: 0;"
											allowfullscreen="" loading="lazy"
											div="no-referrer-when-downgrade"></iframe>
									</div>
								</div>
								<div class="container p-4">
								    <!-- Section: Social media -->
								    <section class="mb-4 text-center">
								         <!-- Instagram -->
								      <a class="btn" href="https://www.instagram.com/tanmaysrivastava09?igsh=NGVyeDJ0ZWh2NnQ2" target="_blank" type="button"
								        ><img src="../image/social/insta.jpg" width="30px"></a>
								
								      <!-- Linkedin -->
								      <a class="btn  rounded" href="https://www.linkedin.com/in/tanmay-srivastava-5a6469232" target="_blank" role="button"
								        ><i class="fab fa-linkedin-in fa-2x" style="color: #0082ca;"></i></a>
								
								      <!-- Github -->
								      <a class="btn btn-outline btn-floating m-1" href="https://github.com/Tanmayy09" target="_blank" role="button"
								        ><i class="fab fa-github fa-2x" style="color: #333333;"></i></a>
								    </section>
								  </div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>