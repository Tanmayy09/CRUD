<%@page import="com.entities.Admin"%>
<%@page import="java.util.List"%>
<%@page import="com.entities.getHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
getHelper t = new getHelper();
List<Admin> tc = t.getAllTeacher();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CRUD?Admin?Profile</title>
<%@ include file="/Component/allcss.jsp"%>
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
					<strong class="fs-3">PROFILE</strong>
					<a class="btn btn-outline-primary me-4" href="password.jsp?step=step1&id=<%=aid.getId()%>">Change Password</a>
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
					<div class="card-header text-center">
						About Me
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-6">
								<label>Employee Id</label>
							</div>
							<div class="col-md-6">
								<p><%=aid.getEmp_id() %></p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label>Name</label>
							</div>
							<div class="col-md-6">
								<p><%=aid.getName() %></p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label>Email</label>
							</div>
							<div class="col-md-6">
								<p><%=aid.getEmail() %></p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label>Contact</label>
							</div>
							<div class="col-md-6">
								<p><%=aid.getPh_num() %></p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label>Role</label>
							</div>
							<div class="col-md-6">
								<p><%=aid.getRole() %></p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label>Department</label>
							</div>
							<div class="col-md-6">
								<p><%=aid.getDepartment() %></p>
							</div>
						</div>
					</div>
					<div class="card-footer text-muted text-center">
						Plz contact website developer for your detail correction
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>