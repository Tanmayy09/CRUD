<%@page import="com.entities.Admin"%>
<%@page import="com.entities.getHelper"%>
<%
String id = request.getParameter("id");
getHelper at = new getHelper();
Admin aid = at.getAdmin(Integer.parseInt(id)); 


String a = (String) session.getAttribute("adname");
%>

<!-- navbar -->
	<nav class="navbar navbar-dark shadow fixed-top"
		style="background-color: white;">
		<div class="container-fluid">
			<a class="navbar-brand text-primary fw-bold mx-5"
				href="AdminPage.jsp?id=<%=aid.getId()%>"><i class="fa-regular fa-face-smile"></i>
				Admin Hub</a>
			<form class="d-flex" role="search">
				<input class="form-control me-1" type="search" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-primary" type="submit">Search</button>
			</form>
			<div class="ml-auto d-flex align-items-center">
				<h4 class="mx-4">
					Welcome,
					<%=a%></h4>
				<div class="dropdown mx-3">
					<img class="img rounded-circle  dropdown-toggle"
						src="../image/user.jpg" width="40px" data-bs-toggle="dropdown"
						aria-expanded="false" style="cursor: pointer;">
					<ul class="dropdown-menu dropdown-menu-end">
						<li><a class="dropdown-item" href="adminProfile.jsp?id=<%=aid.getId()%>"><i
								class="fa fa-user me-2"></i> Profile</a></li>
						<li><a class="dropdown-item" href="password.jsp?step=step1&id=<%=aid.getId()%>"><i
								class="fa-solid fa-lock me-2"></i> Change Password</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" style="cursor: pointer;"
							data-bs-toggle="modal" data-bs-target="#LogoutModal"><i
								class="fa fa-arrow-right-from-bracket me-2"></i> Logout</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>

	
	<!-- Modal for Logout -->
	<div class="modal fade" id="LogoutModal" tabindex="-1"
		data-bs-backdrop="static" data-bs-keyboard="false"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Logout</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">Are you sure?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<a href="../LogoutServlet" type="button" class="btn btn-primary">Yes</a>
				</div>
			</div>
		</div>
	</div>