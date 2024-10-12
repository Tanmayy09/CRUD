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
<title>CRUD?Course</title>
<%@include file="/Component/allcss.jsp"%>
<style>
</style>
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
							class="nav-link m-2" href="Students.jsp?id=<%=aid.getId()%>"> <i
							class="fa fa-graduation-cap"></i><span
							class="ms-1 d-none d-sm-inline">Students</span></a> <a
							class="nav-link m-2" href="Teachers.jsp?id=<%=aid.getId()%>"><i
							class="fa-solid fa-chalkboard-user"></i> <span
							class="ms-1 d-none d-sm-inline">Faculty</span></a> <a
							class="nav-link m-2" href="#course?id=<%=aid.getId()%>"><i
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
			<div class="col-md-10 container mt-3">
				<div data-bs-spy="scroll" data-bs-target="#navbar-example3"
					data-bs-smooth-scroll="true" class="scrollspy-example-2"
					tabindex="0">
					<div class="row mt-5 me-2" id="course">
						<div style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
					  		<ol class="breadcrumb ">
					    		<li class="breadcrumb-item"><a href="AdminPage.jsp?id=<%=aid.getId()%>">Home</a></li>
					    		<li class="breadcrumb-item active" aria-current="page">Course</li>
					  		</ol>
						</div>
						<div class="col-md-4 pt-2">
							<div class="card border-info">
								<div class="card-header">Computer Science Engineering</div>
								<div class="card-body">
									<img class="card-img-middle" src="../image/cour/cs.jpg" width="100%"
										oncontextmenu="return false;">
								</div>
								<div class="card-footer">Focuses on the theoretical
									foundations of computation, programming, algorithms, and
									software development. It offers a broad understanding of
									computing systems and software design.</div>
							</div>
						</div>
						<div class="col-md-4 pt-2">
							<div class="card border-info">
								<div class="card-header">Computer Science-AIML</div>
								<div class="card-body">
									<img class="card-img-middle" src="../image/cour/aiml.jpg" width="100%"
										oncontextmenu="return false;">
								</div>
								<div class="card-footer">Specializes in artificial
									intelligence and machine learning, exploring how to create
									intelligent systems that learn from data. It combines computer
									science with advanced algorithms, neural networks, and data
									science.</div>
							</div>
						</div>
						<div class="col-md-4 pt-2">
							<div class="card border-info">
								<div class="card-header">Computer Science-DS</div>
								<div class="card-body">
									<img class="card-img-middle" src="../image/cour/csds.png" width="100%"
										oncontextmenu="return false;">
								</div>
								<div class="card-footer">Integrates computer science with
									data science, emphasizing the analysis and management of large
									datasets. It involves statistical methods, data mining, and
									machine learning to extract insights from data.</div>
							</div>
						</div>
						<div class="col-md-4 pt-2">
							<div class="card border-info">
								<div class="card-header">Information Technology</div>
								<div class="card-body">
									<img class="card-img-middle" src="../image/cour/it.jpg" width="100%"
										oncontextmenu="return false;">
								</div>
								<div class="card-footer">Concentrates on the application
									of computing technology to solve business problems. It includes
									networking, cybersecurity, software development, and IT project
									management.</div>
							</div>
						</div>
						<div class="col-md-4 pt-2">
							<div class="card border-info">
								<div class="card-header">Electronics & Communication
									Engineering</div>
								<div class="card-body">
									<img class="card-img-middle" src="../image/cour/ece.jpg" width="100%"
										oncontextmenu="return false;">
								</div>
								<div class="card-footer">Concentrates on the application
									of computing technology to solve business problems. It includes
									networking, cybersecurity, software development, and IT project
									management.</div>
							</div>
						</div>
						<div class="col-md-4 pt-2">
							<div class="card border-info">
								<div class="card-header">Electrical & Electronics
									Engineering</div>
								<div class="card-body">
									<img class="card-img-middle" src="../image/cour/eee.jpg" width="100%"
										oncontextmenu="return false;">
								</div>
								<div class="card-footer">Encompasses the study of
									electrical systems, power generation, and electronic devices.
									It focuses on both electrical power systems and the underlying
									electronics that control them.</div>
							</div>
						</div>
						<div class="col-md-4 pt-2">
							<div class="card border-info">
								<div class="card-header">Mechanical Engineering</div>
								<div class="card-body">
									<img class="card-img-middle" src="../image/cour/me.jpg" width="100%"
										oncontextmenu="return false;">
								</div>
								<div class="card-footer">Involves the design, analysis,
									and manufacturing of mechanical systems. It covers areas like
									thermodynamics, materials science, robotics, and automotive
									engineering.</div>
							</div>
						</div>
						<div class="col-md-4 pt-2">
							<div class="card border-info">
								<div class="card-header">MCA</div>
								<div class="card-body">
									<img class="card-img-middle" src="../image/cour/mca.jpg" width="100%"
										oncontextmenu="return false;">
								</div>
								<div class="card-footer">A postgraduate program that
									provides in-depth knowledge of computer applications, software
									development, and IT management. It prepares students for
									advanced roles in software engineering and IT consultancy.</div>
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
</html>