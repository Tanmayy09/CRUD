<%@page import="com.entities.Admin"%>
<%@page import="com.entities.user"%>
<%@page import="java.util.List"%>
<%@page import="com.entities.getHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String a_id = request.getParameter("id");
	getHelper st = new getHelper();
	List<user> stu = st.getAllStudent();
	Admin aid = st.getAdmin(Integer.parseInt(a_id));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CRUD?Student</title>
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
							class="nav-link  m-2" href="#item-2?id=<%=aid.getId()%>"> <i
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
					tabindex="0">
					<div style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
						<ol class="breadcrumb mt-2">
							<li class="breadcrumb-item"><a class="nav-link" href="AdminPage.jsp?id=<%=aid.getId()%>">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">Students</li>
						</ol>
					</div>
					<div class="text-center" id="item-2">
						<h3>All Students</h3>
						<hr>
					</div>
				</div>
				<div class="container-fluid mt-4">
					<table class="table" id="table">
						<thead>
							<tr>
								<th scope="col">S_No.</th>
								<th scope="col">Name</th>
								<th scope="col">Admission Number</th>
								<th scope="col">University Number</th>
								<th scope="col">Course</th>
								<th scope="col">More details</th>
							</tr>
						</thead>
						<tbody>
						<%
						for(user s : stu)
						{
						%>
							<tr>
								<th><%=s.getS_ID()%></th>
								<td><%=s.getS_name()%></td>
								<td><%=s.getS_adm()%></td>
								<td><%=s.getS_univer()%></td>
								<td><%=s.getC().getC_name() %></td>
								<td><a class="" href="stdetail.jsp?id=<%=aid.getId()%>&s_ID=<%= s.getS_ID()%>">More details</a></td>
							</tr>
						<%} %>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>
</body>
</html>