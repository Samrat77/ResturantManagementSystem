<%@page import="com.restaurant.Model.ManageStoreDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.restaurant.Bean.ManageStoreBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.restaurant.DBConnect.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.restaurant.DBConnect.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<%@include file="menubar.jsp"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
body {
	color: #566787;
	background: #f5f5f5;
	font-family: 'Varela Round', sans-serif;
	font-size: 13px;
}

.table-responsive {
	margin: 30px 0;
}

.table-wrapper {
	min-width: 1000px;
	background: #fff;
	padding: 20px 25px;
	border-radius: 3px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}

.table-title {
	padding-bottom: 15px;
	background: #299be4;
	color: #fff;
	padding: 16px 30px;
	margin: -20px -25px 10px;
	border-radius: 3px 3px 0 0;
}

.table-title h2 {
	margin: 5px 0 0;
	font-size: 24px;
}

.table-title .btn {
	color: #566787;
	float: right;
	font-size: 13px;
	background: #fff;
	border: none;
	min-width: 50px;
	border-radius: 2px;
	border: none;
	outline: none !important;
	margin-left: 10px;
}

.table-title .btn:hover, .table-title .btn:focus {
	color: #566787;
	background: #f2f2f2;
}

.table-title .btn i {
	float: left;
	font-size: 21px;
	margin-right: 5px;
}

.table-title .btn span {
	float: left;
	margin-top: 2px;
}

table.table tr th, table.table tr td {
	border-color: #e9e9e9;
	padding: 12px 15px;
	vertical-align: middle;
}

table.table tr th:first-child {
	width: 60px;
}

table.table tr th:last-child {
	width: 100px;
}

table.table-striped tbody tr:nth-of-type(odd) {
	background-color: #fcfcfc;
}

table.table-striped.table-hover tbody tr:hover {
	background: #f5f5f5;
}

table.table th i {
	font-size: 13px;
	margin: 0 5px;
	cursor: pointer;
}

table.table td:last-child i {
	opacity: 0.9;
	font-size: 22px;
	margin: 0 5px;
}

table.table td a {
	font-weight: bold;
	color: #566787;
	display: inline-block;
	text-decoration: none;
}

table.table td a:hover {
	color: #2196F3;
}

table.table td a.settings {
	color: #2196F3;
}

table.table td a.delete {
	color: #F44336;
}

table.table td i {
	font-size: 19px;
}

table.table .avatar {
	border-radius: 50%;
	vertical-align: middle;
	margin-right: 10px;
}

.status {
	font-size: 30px;
	margin: 2px 2px 0 0;
	display: inline-block;
	vertical-align: middle;
	line-height: 10px;
}

.text-success {
	color: #10c469;
}

.text-info {
	color: #62c9e8;
}

.text-warning {
	color: #FFC107;
}

.text-danger {
	color: #ff5b5b;
}

.pagination {
	float: right;
	margin: 0 0 5px;
}

.pagination li a {
	border: none;
	font-size: 13px;
	min-width: 30px;
	min-height: 30px;
	color: #999;
	margin: 0 2px;
	line-height: 30px;
	border-radius: 2px !important;
	text-align: center;
	padding: 0 6px;
}

.pagination li a:hover {
	color: #666;
}

.pagination li.active a, .pagination li.active a.page-link {
	background: #03A9F4;
}

.pagination li.active a:hover {
	background: #0397d6;
}

.pagination li.disabled i {
	color: #ccc;
}

.pagination li i {
	font-size: 16px;
	padding-top: 6px
}

.hint-text {
	float: left;
	margin-top: 10px;
	font-size: 13px;
}
</style>
</head>
<body>
	<div class="container">
		<br>
		<div class="row justify-content">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						<h4>
							<strong>Manage Category</strong>
						</h4>
					</div>
					<div class="card-header">
						<strong>Update Information</strong><br>
						<%if(request.getAttribute("cat")!= null) {%>

						<div class="alert alert-warning alert-dismissible fade show"
							role="alert">
							<strong>Hey!!</strong> Category Successfully Added
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<%} %>
						<%if(request.getAttribute("success")!= null) {%>

						<div class="alert alert-warning alert-dismissible fade show"
							role="alert">
							<strong>Hey!!</strong> Category Successfully Edited
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<%} %>
						<%if(request.getAttribute("deletecat")!= null) {%>

						<div class="alert alert-warning alert-dismissible fade show"
							role="alert">
							<strong>Hey!!</strong> Category Successfully Deleted
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<%} %>
					</div>
					<div class="card-body">





						<!-- start  of table -->
						<div class="container-xl">
							<div class="table-responsive">
								<div class="table-wrapper">
									<div class="table-title">
										<div class="row">
											<div class="col-sm-5">
												<h2>
													Category <b>Management</b>
												</h2>
											</div>
											<div class="col-sm-7">
												<button type="button" class="btn btn-primary"
													data-toggle="modal" data-target="#exampleModal">
													Add Category</button>
												<!--  <a href="#" class="btn btn-secondary"><i class="material-icons">&#xE147;</i> <span>Add New User</span></a> -->
												<!-- <a href="#" class="btn btn-secondary"><i class="material-icons">&#xE24D;</i> <span>Export to Excel</span></a> -->
											</div>
										</div>
									</div>



									<table class="table table-striped table-hover">
										<thead>
											<tr>
												<!-- <th>#</th> -->
												<th>Category Name</th>
												<!-- <th>Date Created</th>
                        <th>Role</th> -->
												<th>Status</th>
												<th>Action</th>
											</tr>
										</thead>
										<%
            Connection con=DBConnection.getConn();
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM R_CATEGORY");
            while(rs.next())
            {%>
										<tbody>
											<tr>
												<td class="col-md-1"><%=rs.getString(2) %></td>
												<%if(rs.getString(3).equals("Active") ){%>
												<td><span class="status text-success">&bull;</span> <%=rs.getString(3) %></td>
												<%}else{%>

												<td><span class="status text-danger">&bull;</span><%=rs.getString(3) %></td>
												<%} %>
												<td><a href="ManageCategoryCtrl?id=<%=rs.getInt(1)  %>"
													class="edit" onclick="init()"><i class="material-icons">&#xE8B8;</i></a>
													<a href="deletecat.jsp?id=<%=rs.getInt(1) %>"
													class="delete" title="Delete"><i class="material-icons">&#xE5C9;</i></a>
													<input type="hidden" name="id" id="id"
													value="<%=rs.getInt(1)%>"></td>
											</tr>
											<%} %>
										</tbody>
									</table>

									<!-- <div class="clearfix">
										<div class="hint-text">
											Showing <b>5</b> out of <b>25</b> entries
										</div>

										<ul class="pagination">
											<li class="page-item disabled"><a href="store.jsp">Previous</a></li>
											<li class="page-item active"><a href="#"
												class="page-link" name="page">1</a></li>
											<li class="page-item "><a href="#" class="page-link">2</a></li>
											<li class="page-item active"><a href="#" class="page-link">3</a></li>
                    <li class="page-item"><a href="#" class="page-link">4</a></li>
                    <li class="page-item"><a href="#" class="page-link">5</a></li>
											<li class="page-item"><a href="#" class="page-link">Next</a></li>
										</ul>
									</div> -->
								</div>
							</div>
						</div>
					</div>
					<!--end of table  -->


					<div class="modal fade" id="exampleModal" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Add
										Category</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>

								<div class="modal-body">
									<form action="ManageCategoryCtrl" method="post">
										<!-- Form for store here -->
										<div class="form-group">
											<label for="name" class="cols-sm-2 control-label"><strong>Category
													Name</strong></label>
											<div class="cols-sm-10">
												<div class="input-group">

													<input type="text" class="form-control" name="cname"
														id="name" placeholder="Enter Category Name" required /> <span
														style="color: red; font-style: inherit;"><strong><%=(request.getAttribute("msg") == null) ? "" : request.getAttribute("msg")%></strong></span>
												</div>
											</div>
											<div class="form-group">
												<label for="inputState"><strong>Status</strong></label> <select
													name="status" id="inputState" class="form-control">

													<option>Active</option>
													<option>Inactive</option>

												</select>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">Close</button>
											<button type="submit" class="btn btn-primary" name="Action"
												value="Save">Save changes</button>
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
</body>
</html>