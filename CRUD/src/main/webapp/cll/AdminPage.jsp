<%@page import="com.entities.getHelper"%>
<%@page import="com.helper.factory"%>
<%@page import="org.hibernate.*"%>
<%@page import="com.entities.courses"%>
<%@page import="com.entities.Course_details"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.entities.Admin"%>

<%
String id = request.getParameter("id");
getHelper at = new getHelper();
Admin aid = at.getAdmin(Integer.parseInt(id)); 
String msg = (String) session.getAttribute("msg");
String errmsg = (String) session.getAttribute("errmsg");
String tc = (msg != null || errmsg != null) ? " text-center toast align-items-center show" : "toast align-items-center";
Course_details c = new Course_details();
List<courses> m = c.getAllCourses();
Session s = factory.getFactory().openSession();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>CRUD?AdminPage</title>
<%@ include file="/Component/allcss.jsp"%>
<style type="text/css">
.admin .ca {
	border: 1px solid #e2e2e2;
}

.admin .ca:hover {
	background: #e2e2e2;
	cursor: pointer;
}
}
</style>
</head>
<body>
	<jsp:include page="/Component/adminNav.jsp">
        <jsp:param name="id" value="<%=aid.getId()%>" />
    </jsp:include>	

	<%
	if (msg != null || errmsg != null) {
	%>
	<div class="toast-container show align-items-center top-1 end-0 mt-5"
		role="alert" aria-live="assertive" aria-atomic="true">
		<div class="toast d-flex" id="myToast">
			<div class="toast-body">
				<h5
					class="modal-title <%=(msg != null) ? "text-success" : "text-danger"%>">
					<%=(msg != null) ? msg : errmsg%></h5>
			</div>
			<button type="button" class="btn-close me-2 m-auto"
				data-bs-dismiss="toast" aria-label="Close"></button>
		</div>
	</div>
	<%
	}
	session.removeAttribute("msg");
	session.removeAttribute("errmsg");
	%>

	<!-- making sidebar -->
	<section>
		<div class="row">
			<div class="col-2 p-5 border mt-3">
				<nav id="navbar-example3"
					class="h-100 justify-item-stretch pe-3 border-end-0 position-fixed">
					<nav class="nav nav-pills flex-column">
						<a class="nav-link m-2 mt-3" href="#dash?"> <i
							class="fa fa-table-columns"></i><span
							class="ms-1 d-none d-sm-inline"> DashBoard</span></a> <a
							class="nav-link  m-2" href="Students.jsp?id=<%=aid.getId()%>"> <i
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
							class="nav-link m-2" href="Help.jsp?id=<%=aid.getId()%>"><i
							class="fa-solid fa-question"></i><span
							class="ms-1 d-none d-sm-inline">Help</span></a>
					</nav>
				</nav>
			</div>
			<div class="col-10 container admin show active mt-5">
				<div data-bs-spy="scroll" data-bs-target="#navbar-example3"
					data-bs-smooth-scroll="true" class="scrollspy-example-2"
					tabindex="0">
					<div class="row mt-5 me-2">
						<div class="col-md-3" id="dash">
							<div class="card ca shadow">
								<div class="card-body">
									<%
									Query sq = s.createQuery("select count(s_ID) from user");
									Long Sid = (Long) sq.uniqueResult();
									int sid = Sid.intValue();
									%>
									<h4 class="mt-2 ms-2"><%=sid%></h4>
									<div class="d-flex justify-content-between">
										<h3 class="text-muted">Students</h3>
										<i class="fa-solid fa-user-graduate fs-2"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="card ca shadow">
								<div class="card-body">
									<%
									Query cq = s.createQuery("select count(id) from courses");
									Long Cid = (Long) cq.uniqueResult();
									int cid = Cid.intValue();
									%>
									<h4 class="mt-1 ms-2"><%=cid%></h4>
									<div class="d-flex justify-content-between">
										<h3 class="text-muted">Courses</h3>
										<i class="fa-solid fa-book-open-reader fs-2"></i>
									</div>

								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="card ca shadow">
								<div class="card-body">
									<%
									Query fq = s.createQuery("select count(id) from Admin");
									Long Fid = (Long) fq.uniqueResult();
									int fid = Fid.intValue();
									%>
									<h4 class="mt-1 ms-2"><%=fid %></h4>
									<div class="d-flex justify-content-between">
										<h3 class="text-muted">Faculty</h3>
										<i class="fa-solid fa-chalkboard-user fs-2"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<a class=" nav-link card ca shadow" href="Students.jsp">
								<div class="card-body">
									<h4 class="mt-1 ms-2"></h4>
									<div class="d-flex justify-content-between">
										<h3 class="text-muted">Update Student</h3>
										<i class="fa-solid fa-pen fs-2"></i>
									</div>
								</div>
							</a>
						</div>
						<div class="mt-3">
							<p class="placeholder-glow">
								<span class="placeholder col-12 placeholder-xs"></span>
							</p>
						</div>
						<div class="container mt-4">
							<div class="card">
								<div class="card-header">
									<ul class="nav nav-pills card-header-pills">
										<li class="nav-item"><a class="nav-link active"
											id="add-student-tab" data-bs-toggle="pill"
											href="#add-student">Add Student</a></li>
										<li class="nav-item"><a class="nav-link"
											id="delete-student-tab" data-bs-toggle="pill"
											href="#delete-student">Delete Student</a></li>
									</ul>
								</div>
								<div class="card-body">
									<div class="tab-content">
										<!-- Add Student Form -->
										<div class="tab-pane fade show active" id="add-student">
											<h4 class="card-title text-center">Add Student</h4>
											<form class="mt-3" action="../A_D_operation" method="post">
												<input type="hidden" name="operation" value="addStudent">
												<input type="hidden" name="id" value="<%=aid.getId()%>">
												<div class="row mb-3">
													<div class="col-md-6 p-2">
														<label for="firstName" class="form-label">Student
															Name</label> <input required class="form-control" type="text"
															placeholder="Enter Name" name="sname">
													</div>
													<div class="col-md-6 p-2">
														<label for="lastName" class="form-label">Student
															Email</label> <input required class="form-control" type="email"
															placeholder="Enter Student email" name="semail">
														<div class="form-text text-muted">We'll never share
															your email to others</div>
													</div>
													<div class="col-md-6 p-2">
														<label for="phoneNumber" class="form-label">Phone
															Number</label> <input required class="form-control" type="number"
															placeholder="Enter Mobile Number" maxlength="10" name="smobile">
													</div>
													<div class="col-md-6 p-2">
														<label for="lastName" class="form-label">Admission
															Number</label> <input required class="form-control" type="text"
															placeholder="Enter Admission Number" name="sadmn">
													</div>
													<div class="col-md-6 p-2">
														<label for="lastName" class="form-label">University
															Number</label> <input required class="form-control" type="number"
															placeholder="Enter Student University Number"
															name="suniver">
													</div>
													<div class="col-md-6 p-2">
														<label for="lastName" class="form-label">Date Of
															Birth</label> <input required class="form-control" type="date"
															placeholder="Enter DOB" name="sdob">
													</div>
													
													<div class="col-md-6 p-2">
														<label for="lastName" class="form-label">Courses</label> <select
															name="cID" class="form-control" required>
															<option value="" disabled selected hidden>Select
																Course</option>
															<%
															for (courses cr : m) {
															%>
															<option value="<%=cr.getC_id()%>"><%=cr.getC_name()%></option>
															<%
															}
															%>
														</select>
													</div>
													<div class="col-md-6 p-2">
														<label for="lastName" class="form-label">Year/Semester</label>
														<input required class="form-control" type="text"
															placeholder="Enter Year-Sem()" name="syear">
													</div>
													<div class="col-md-6 p-2">
														<label for="lastName" class="form-label">Batch</label> <input
															required class="form-control" type="text"
															placeholder="eg 2020-2024" name="sbatch">
													</div>
												</div>
												<hr>
												<h4>Personal Details</h4>
												<div class="row mb-3">
													<div class="col-md-6 p-2">
														<label for="lastName" class="form-label">Father's
															Name</label> <input required class="form-control" type="text"
															placeholder="Enter Father's name" name="sfather">
													</div>
													<div class="col-md-6 p-2">
														<label for="lastName" class="form-label">Father
															Mobile Number</label> <input required class="form-control"
															type="number" placeholder="Mobile Number" name="fmobile">
													</div>
													<div class="col-md-6 p-2">
														<label for="lastName" class="form-label">Address</label>
														<textarea required style="height: 75px;"
															class="form-control"
															placeholder="Enter Permanent Address" name="sAdd"></textarea>
													</div>
													<div class="col-md-6 p-2">
														<label for="Gender" class="form-label">Gender</label> <select
															name="sgender" class="form-select" id="gender">
															<option selected>Choose...</option>
															<option value="Male">Male</option>
															<option value="Female">Female</option>
															<option value="Other">Other</option>
														</select>
													</div>
												</div>
												<div class="container text-center p-2 ">
													<button class="btn btn-primary">Add Student</button>
													<button class="btn btn-outline-secondary" type="reset">Reset</button>
												</div>
											</form>
										</div>



										<!-- Delete Student Form -->
										<div class="tab-pane fade" id="delete-student" role="tabpanel"
											aria-labelledby="delete-student-tab">
											<h5 class="card-title text-center">Delete Student</h5>
											<form class="mt-3" action="../A_D_operation" method="post">
												<input type="hidden" name="operation" value="deletestudent">
												<input type="hidden" name="id" value="<%=aid.getId()%>">
												<div class="row mb-3">
													<div class="col-md-6 p-2">
														<label for="firstName" class="form-label">Student
															Admission Number </label> <input required class="form-control"
															type="text" placeholder="Admission Number" name="sdadmn">
													</div>
													<div class="col-md-6 p-2">
														<label for="firstName" class="form-label">Student
															University Number </label> <input required class="form-control"
															type="number" placeholder="Enter Universiry Number"
															name="sduniver">
													</div>
												</div>
												<div class="container text-center">
													<button class="btn btn-danger">Delete</button>
													<button class="btn btn-outline-secondary" type="reset">Reset</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<footer>
		<div class=" py-4 px-4 px-xl-5 bg-secondary" style="margin-top: 20px;">
			<!-- Copyright -->
			<div class=" text-center text-white mb-3 mb-md-0">
				Copyright © 2024. All rights reserved<br>Designed & Developed
				by Tanmay Srivastava
			</div>
		</div>
	</footer>
</body>
<script type="text/javascript">
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