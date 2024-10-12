<%@page import="com.entities.Admin"%>
<%@page import="com.entities.user"%>
<%@page import="com.entities.getHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String s_ID = request.getParameter("s_ID");
getHelper st = new getHelper();
user sta = st.getbyAdm(Integer.parseInt(s_ID));
String id = request.getParameter("id");
Admin aid = st.getAdmin(Integer.parseInt(id));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CRUD?Stu_Details</title>
<%@ include file="/Component/allcss.jsp"%>
</head>
<body>
	<jsp:include page="/Component/adminNav.jsp">
        <jsp:param name="id" value="<%=aid.getId()%>" />
    </jsp:include>

	<!-- making sidebar -->
	<section>
		<div class="row">
			<div class="col-2 p-5 mt-3 border-end shadow">
				<nav id="navbar-example3"
					class="h-100 justify-item-stretch pe-3 border-end-0 position-fixed">
					<nav class="nav nav-pills flex-column">
						<a class="nav-link m-2 mt-3" href="AdminPage.jsp?id=<%=aid.getId()%>"> <i
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
			<div class="col-md-10 mt-5">
				<div data-bs-spy="scroll" data-bs-target="#navbar-example3"
					data-bs-smooth-scroll="true" class="scrollspy-example-2"
					tabindex="0"></div>
				<div class="container mt-4">
					<!-- Breadcrumb -->
					<div style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
						<ol class="breadcrumb mt-2">
							<li class="breadcrumb-item"><a class="" href="AdminPage.jsp?id=<%=aid.getId()%>">Home</a></li>
							<li class="breadcrumb-item"><a href="Students.jsp?id=<%=aid.getId()%>">Students</a></li>
							<li class="breadcrumb-item active" aria-current="page">Student
								Profile</li>
						</ol>
					</div>
					<!-- /Breadcrumb -->
					<div class="" id="stdetails"></div>
					<div class="row gutters-sm">
						<div class="col-md-4 mb-3">
							<div class="card">
								<div class="card-body">
									<div class="d-flex flex-column align-items-center text-center">
										<%
										String gender = sta.getP().getGender();
										if (gender.equals("Male")) {
										%>
										<img src="https://bootdey.com/img/Content/avatar/avatar7.png"
											alt="Admin" class="rounded-circle" width="150">
										<%
										} else if (gender.equals("Female")) {
										%>
										<img src="https://bootdey.com/img/Content/avatar/avatar8.png"
											alt="Admin" class="rounded-circle" width="150">
										<%
										} else {
										%>
										<img src="https://www.avatar.com/pandorapedia/neytiri"
											alt="Admin" class="rounded-circle" width="150">
										<%
										}
										%>
										<div class="mt-3">
											<h4 class="p-2"><%=sta.getS_name()%></h4>
											<p class="text-secondary mb-1"><%=sta.getC().getC_name()%></p>
											<p class="text-muted font-size-sm"><%=sta.getS_adm()%></p>
										</div>
									</div>
								</div>
							</div>
							<div class="card mt-3">
								<h4 class="text-center">Personal Details</h4>
								<ul class="list-group list-group-flush">
									<li
										class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
										<h6>DOB
										</h6> <span class="text-secondary"><%=sta.getDob()%></span>
									</li>
									<li
										class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
										<h6 class="mb-0">Gender</h6> <span class="text-secondary"><%=sta.getP().getGender()%></span>
									</li>
									<li
										class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
										<h6 class="mb-0">Father's Name</h6> <span
										class="text-secondary"><%=sta.getP().getF_name()%></span>
									</li>
									<li
										class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
										<h6 class="mb-0">Father Mob</h6> <span class="text-secondary"><%=sta.getP().getF_numb()%></span>
									</li>
									<li
										class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
										<h6 class="mb-0">Address</h6> <span class="text-secondary"><%=sta.getP().getAddress()%></span>
									</li>
								</ul>
							</div>
						</div>
						<div class="col-md-8">
							<div class="card mb-3">
								<div class="card-body">
									<div class="row">
										<div class="col-sm-3">
											<h6 class="mb-0">Full Name</h6>
										</div>
										<div class="col-sm-9 text-secondary"><%=sta.getS_name()%></div>
									</div>
									<hr>
									<div class="row">
										<div class="col-sm-3">
											<h6 class="mb-0">Email</h6>
										</div>
										<div class="col-sm-9 text-secondary"><%=sta.getS_email()%></div>
									</div>
									<hr>
									<div class="row">
										<div class="col-sm-3">
											<h6 class="mb-0">Mobile</h6>
										</div>
										<div class="col-sm-9 text-secondary"><%=sta.getS_mobile()%></div>
									</div>
									<hr>
									<div class="row">
										<div class="col-sm-3">
											<h6 class="mb-0">University No</h6>
										</div>
										<div class="col-sm-9 text-secondary"><%=sta.getS_univer()%></div>
									</div>
									<hr>
									<div class="row">
										<div class="col-sm-3">
											<h6 class="mb-0">Year/Sem</h6>
										</div>
										<div class="col-sm-9 text-secondary"><%=sta.getYear_sem()%></div>
									</div>
									<hr>
									<div class="row">
										<div class="col-sm-3">
											<h6 class="mb-0">Batch</h6>
										</div>
										<div class="col-sm-9 text-secondary"><%=sta.getBatch()%></div>
									</div>
									<hr>
									<div class="row">
										<div class="col-sm-12">
											<a class="btn btn-info "
												href="stedit.jsp?id=<%=aid.getId()%>&s_ID=<%=sta.getS_ID()%>&id=<%=sta.getP().getP_id()%>">Edit</a>
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

</body>
</html>