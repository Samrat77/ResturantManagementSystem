<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.restaurant.DBConnect.DBConnection"%>
<%@page import="java.sql.Connection"%>
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
<link href="css/style.css" rel="stylesheet">
<style>
body {
	color: #566787;
	background: #f5f5f5;
	font-family: 'Varela Round', sans-serif;
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
							<strong>Manage Users</strong>
						</h4>
					</div>
					<div class="card-header">
						<strong>Update Information</strong><br>
						<%if(request.getAttribute("useradded")!= null) {%>

						<div class="alert alert-warning alert-dismissible fade show"
							role="alert">
							<strong>Hey!!</strong> User Successfully Added
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<%} %>
						<%if(request.getAttribute("edit")!= null) {%>

						<div class="alert alert-warning alert-dismissible fade show"
							role="alert">
							<strong>Hey!!</strong> User Successfully Edited
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<%} %>
						<%if(request.getAttribute("deletetable")!= null) {%>

						<div class="alert alert-warning alert-dismissible fade show"
							role="alert">
							<strong>Hey!!</strong> User Successfully Deleted
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
													User <b>Management</b>
												</h2>
											</div>
											<div class="col-sm-7">
												<button type="button" class="btn btn-primary"
													data-toggle="modal" data-target="#exampleModal">
													Add User</button>
												<!--  <a href="#" class="btn btn-secondary"><i class="material-icons">&#xE147;</i> <span>Add New User</span></a> -->
												<!-- <a href="#" class="btn btn-secondary"><i class="material-icons">&#xE24D;</i> <span>Export to Excel</span></a> -->
											</div>
										</div>
									</div>



									<table class="table table-striped table-hover">
										<thead>
											<tr>
												<!-- <th>#</th> -->
												<th>UserName</th>
												<th>Email</th>
												<th>Name</th>
												<th>Phone</th>
												<th>Group</th>
												<th>Action</th>
											</tr>
										</thead>
										<%
            Connection con=DBConnection.getConn();
			Statement st=con.createStatement();
			String sql="SELECT ID,USERNAME,EMAIL,FNAME,LNAME,PHONE,GROUPNAME FROM R_USER WHERE ROLEID NOT LIKE 1;";
			ResultSet rs=st.executeQuery(sql);
			while(rs.next()){
            %>
										<tbody>
											<tr>
												<td class="col-md-1"><%=rs.getString(2) %></td>
												<td class="col-md-1"><%=rs.getString(3) %></td>
												
												<td class="col-md-1"><%=rs.getString(4) %><%=rs.getString(5) %></td>
												<td class="col-md-1"><%=rs.getString(6) %></td>
												<td class="col-md-1"><%=rs.getString(7) %></td>
												
												<td><a href="UserCtrl?id=<%=rs.getInt(1)  %>"
													class="edit"><i class="material-icons">&#xE8B8;</i></a>



													<a href="deleteuser.jsp?id=<%=rs.getInt(1) %>"
													class="delete" title="Delete"><i
														class="material-icons">&#xE5C9;</i></a> <input type="hidden"
													name="id" id="id" value="<%=rs.getInt(1)%>"></td>
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
									</div>
								</div>
							</div> -->
						</div>
					</div>
					<!-- end of table -->


					<div class="modal fade" id="exampleModal" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Add Store</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>

								<div class="modal-body">
									<form action="UserCtrl" method="post">
										<!-- Form for store here -->
										<div class="form-group">
											<label for="name" class="cols-sm-2 control-label"><strong>User
													Name</strong></label>
											<div class="cols-sm-10">
												<div class="input-group">

													<input type="text" class="form-control" name="uname"
														id="name" placeholder="Enter User Name" required /> <span
														style="color: red; font-style: inherit;"><strong><%=(request.getAttribute("no") == null) ? "" : request.getAttribute("no")%></strong></span>
												</div>
											</div>
											<div class="form-group">
												<label for="name" class="cols-sm-2 control-label"><strong>
														Email</strong></label>
												<div class="cols-sm-10">
													<div class="input-group">

														<input type="text" class="form-control" name="email"
															id="name" placeholder="Enter Eamil id" required />
														<span style="color: red; font-style: inherit;"><strong><%=(request.getAttribute("emailid") == null) ? "" : request.getAttribute("emailid")%></strong></span>
													</div>
												</div>
												
												<div class="form-group">
												<label for="name" class="cols-sm-2 control-label"><strong>
														First Name</strong></label>
												<div class="cols-sm-10">
													<div class="input-group">

														<input type="text" class="form-control" name="fname"
															id="name" placeholder="Enter First Name" required />
														<span style="color: red; font-style: inherit;"><strong><%=(request.getAttribute("emailid") == null) ? "" : request.getAttribute("emailid")%></strong></span>
													</div>
												</div>
												<div class="form-group">
												<label for="name" class="cols-sm-2 control-label"><strong>
														Last Name</strong></label>
												<div class="cols-sm-10">
													<div class="input-group">

														<input type="text" class="form-control" name="lname"
															id="name" placeholder="Enter Last Name" required />
														<span style="color: red; font-style: inherit;"><strong><%=(request.getAttribute("emailid") == null) ? "" : request.getAttribute("emailid")%></strong></span>
													</div>
												</div></div>
												<div class="form-group">
												<label for="name" class="cols-sm-2 control-label"><strong>
														Phone</strong></label>
												<div class="cols-sm-10">
													<div class="input-group">

														<input type="text" class="form-control" name="phone"
															id="name" placeholder="Enter Contact Number" required />
														<span style="color: red; font-style: inherit;"><strong><%=(request.getAttribute("no") == null) ? "" : request.getAttribute("no")%></strong></span>
													</div>
												</div></div>
												<div class="col-sm-10">
										<div class="form-check">
										
											<input class="form-check-input" type="radio" name="choose"
												id="gridRadios1"   > <label
												class="form-check-label" for="gridRadios1"> Male </label>
											&nbsp&nbsp&nbsp&nbsp <input class="form-check-input"
												type="radio" name="choose" id="gridRadios2"  >
											<label class="form-check-label" for="gridRadios2">
												Female </label>
										</div>

									</div>
								</div>
								<div class="form-group">
								<label for="password" class="cols-sm-2 control-label"><strong>Password</strong></label>
								<div class="cols-sm-10">
									<div class="input-group">



										<input type="password" class="form-control" name="password"
											placeholder="Enter password" />

									</div>
								</div>
							</div>
							<div class="form-group">
													<label for="inputState"><strong>Group</strong></label> <select
														name="group" id="inputState" class="form-control">

														<option value="staff">Staff</option>
														<option value="member">Members</option>

													</select>
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