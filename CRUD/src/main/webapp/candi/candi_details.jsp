<%@page import="com.entities.user"%>
<%@page import="com.entities.getHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String s_ID = request.getParameter("s_ID");
getHelper g = new getHelper();
user u = g.getbyAdm(Integer.parseInt(s_ID));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Candidate?Profile</title>
<%@ include file="/Component/allcss.jsp"%>
</head>
<body>
	<!-- nav -->
	<jsp:include page="/Component/candiNav.jsp">
		<jsp:param name="s_ID" value="<%=u.getS_ID()%>" />
	</jsp:include>

	<section style="background-color: #e8f5ff;">
		<div class="row">
			<div class="col-md-5 mx-4">
				<div class=" mt-4 fw-bold fs-4">Student Details</div>
				<div class="row mt-3">
					<div class="col-sm-3">
						<h6 class="mb-0">Full Name</h6>
					</div>
					<div class="col-sm-9 text-secondary"><%=u.getS_name()%></div>
				</div>
				<hr>
				<div class="row">
					<div class="col-sm-3">
						<h6 class="mb-0">Email</h6>
					</div>
					<div class="col-sm-9 text-secondary"><%=u.getS_email()%></div>
				</div>
				<hr>
				<div class="row">
					<div class="col-sm-3">
						<h6 class="mb-0">Mobile</h6>
					</div>
					<div class="col-sm-9 text-secondary"><%=u.getS_mobile()%></div>
				</div>
				<hr>
				<div class="row">
					<div class="col-sm-3">
						<h6 class="mb-0">University No</h6>
					</div>
					<div class="col-sm-9 text-secondary"><%=u.getS_univer()%></div>
				</div>
				<hr>
				<div class="row">
					<div class="col-sm-3">
						<h6 class="mb-0">Year/Sem</h6>
					</div>
					<div class="col-sm-9 text-secondary"><%=u.getYear_sem()%></div>
				</div>
				<hr>
				<div class="row">
					<div class="col-sm-3">
						<h6 class="mb-0">Batch</h6>
					</div>
					<div class="col-sm-9 text-secondary"><%=u.getBatch()%></div>
				</div>
			</div>
			<div class="col-md-5 mx-4">
				<div class=" mt-4 fw-bold fs-4">Personal Details</div>
				<div class="row mt-3">
					<div class="col-sm-3">
						<h6 class="mb-0">Father's Name</h6>
					</div>
					<div class="col-sm-9 text-secondary"><%=u.getP().getF_name()%></div>
				</div>
				<hr>
				<div class="row">
					<div class="col-sm-3">
						<h6 class="mb-0">Father's Mobile</h6>
					</div>
					<div class="col-sm-9 text-secondary"><%=u.getP().getF_numb()%></div>
				</div>
				<hr>
				<div class="row">
					<div class="col-sm-3">
						<h6 class="mb-0">DOB</h6>
					</div>
					<div class="col-sm-9 text-secondary"><%=u.getDob()%></div>
				</div>
				<hr>
				<div class="row">
					<div class="col-sm-3">
						<h6 class="mb-0">ADDRESS</h6>
					</div>
					<div class="col-sm-9 text-secondary"><%=u.getP().getAddress()%></div>
				</div>
				<hr>
				<div class="row">
					<div class="col-sm-3">
						<h6 class="mb-0">Gender</h6>
					</div>
					<div class="col-sm-9 text-secondary"><%=u.getP().getGender()%></div>
				</div>
				<hr>
			</div>
		</div>
		<div class="mt-3">
			<p class="placeholder-glow">
				<span class="placeholder mx-5 col-11 placeholder-xs"></span>
			</p>
		</div>
		<div class="text-danger fw-bold">
			<marquee behavior="scroll" direction="left" scrollamount="10">
				Plz change your password first!! Ignore If Done.. </marquee>
		</div>
		<div class="mx-5">
			<button class="btn btn-info shadow" data-bs-toggle="modal"
				data-bs-target="#staticBackdrop">Update Info</button>
		</div>
	</section>


	<!-- update modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">Update Information</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form></form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Send Details</button>
				</div>
			</div>
		</div>
	</div>


</body>
</html>