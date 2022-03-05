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

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style >
body {
	color: #566787;
	background: #f5f5f5;
	font-family: 'Varela Round', sans-serif;
	font-size: 13px;
}
</style>
</head>
<body>
<jsp:useBean id="bean" class="com.restaurant.Bean.ManageTableBean"
		scope="request"></jsp:useBean>
		<br><br><br><br>
	<div class="card" style="width: 50rem; height: 20%; margin-top: 10%; margin-left: 10%;">
	<div class="card-header">
						<h4>
							<strong>Update Table</strong>
						</h4>
					</div>
					<div class="card-header">
 
  <div class="card-body">
   <form action="ManageTableCtrl" method="post">
						<input type="hidden" name="id" id="id" value="<%=bean.getTid()%>">
						<!-- Form for table here -->
						<div class="form-group">
											<label for="name" class="cols-sm-2 control-label"><strong>Table
													Name</strong></label>
											<div class="cols-sm-10">
												<div class="input-group">

													<input type="text" class="form-control" name="tname"
														id="name" placeholder="Enter Table Name" value="<%=bean.getTable_name() %>" required /> <span
														style="color: red; font-style: inherit;"><strong><%=(request.getAttribute("msg") == null) ? "" : request.getAttribute("msg")%></strong></span>
												</div>
											</div>
											<div class="form-group">
											<label for="name" class="cols-sm-2 control-label"><strong>
													Capacity</strong></label>
											<div class="cols-sm-10">
												<div class="input-group">

													<input type="text" class="form-control" name="tcap"
														id="name" placeholder="Enter Table Capacity" value="<%=bean.getTable_cap() %>" required /> <span
														style="color: red; font-style: inherit;"><strong><%=(request.getAttribute("msg") == null) ? "" : request.getAttribute("msg")%></strong></span>
												</div>
											</div>
											<div class="form-group">
												<label for="inputState"><strong>Status</strong></label> <select
													name="status" id="inputState" value="<%=bean.getStatus() %>" class="form-control">

													<option>Active</option>
													<option>Inactive</option>

												</select>
											</div>
											<div class="form-group">
													<label for="inputState"><strong>Store</strong></label> <select
														name="storeid" id="inputState" class="form-control">
														<%
														Connection con1=DBConnection.getConn();
														Statement st1=con1.createStatement();
															ResultSet rs1=st1.executeQuery("SELECT * FROM R_STORE");
														while(rs1.next())
														{
															%>
										<option value="<%out.print(rs1.getInt(1));%>"><%=rs1.getString("sname") %></option>
												<%} %>
													</select>
												</div>	

														
											</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary" name="Action"
								value="Update">Update changes</button>
						</div>
					</form>
  </div>
</div>
<%-- <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Update Store</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					<form action="ManageStoreCtrl" method="post">
						<input type="hidden" name="id" id="id" value="<%=bean.getId()%>">
						<!-- Form for store here -->
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label"><strong>Store
									Name</strong></label>
							<div class="cols-sm-10">
								<div class="input-group">

									<input type="text" class="form-control" name="sname" id="name"
										placeholder="Enter Store Name"
										value="<%=bean.getStore_name() %>" required /> <span
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
								value="Update">Update changes</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div> --%>
	</div>
</body>
</html>