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
							<strong>Manage Products</strong>
						</h4>
					</div>
					<div class="card-header">
						<strong>Update Information</strong><br>
						<%if(request.getAttribute("tabledata")!= null) {%>

						<div class="alert alert-warning alert-dismissible fade show"
							role="alert">
							<strong>Hey!!</strong> Product Successfully Added
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<%} %>
						<%if(request.getAttribute("success")!= null) {%>

						<div class="alert alert-warning alert-dismissible fade show"
							role="alert">
							<strong>Hey!!</strong> Product Successfully Edited
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<%} %>
						<%if(request.getAttribute("deleteproduct")!= null) {%>

						<div class="alert alert-warning alert-dismissible fade show"
							role="alert">
							<strong>Hey!!</strong> Product Successfully Deleted
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
													Product <b>Management</b>
												</h2>
											</div>
											<div class="col-sm-7">
												<!-- <button type="button" class="btn btn-primary"
													data-toggle="modal" data-target="#exampleModal">
													Add Table</button> -->
													<form action="ProductCtrl" method="post">
	<button name="Action" value="Generate" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                class="fas fa-download fa-sm text-white-50"></i> Generate Report</button>
                                
                                </form>												
												<!--  <a href="#" class="btn btn-secondary"><i class="material-icons">&#xE147;</i> <span>Add New User</span></a> -->
												<!-- <a href="#" class="btn btn-secondary"><i class="material-icons">&#xE24D;</i> <span>Export to Excel</span></a> -->
											</div>
										</div>
									</div>



									<table class="table table-striped table-hover">
										<thead>
											<tr>
												<!-- <th>#</th> -->
												<th>Product Name</th>
												<th>Category</th>
												<th>Price</th>
												<th>Store</th>
												
												<th>Status</th>
												<th>Action</th>
											</tr>
										</thead>
										<%
            Connection con=DBConnection.getConn();
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from r_product inner join r_store on r_store.id=r_product.storenameid inner join r_category on r_category.id=r_product.categoryid;");
            while(rs.next())
            {%>
										<tbody>
											<tr>
												<td class="col-md-1"><%=rs.getString(2) %></td>
												<td class="col-md-1"><%=rs.getString(13) %></td>
												<td class="col-md-1"><i class="fas fa-rupee-sign"></i><%=rs.getString(3) %></td>
												<td class="col-md-1"><%=rs.getString(10) %></td>
												
												<%if(rs.getString(7).equals("Active") ){%>
												<td><span class="status text-success">&bull;</span> <%=rs.getString(7) %></td>
												<%}else{%>

												<td><span class="status text-danger">&bull;</span><%=rs.getString(7) %></td>
												<%} %>
												<td><a href="ProductCtrl?id=<%=rs.getInt(1)  %>"
													class="edit"><i class="material-icons">&#xE8B8;</i></a>



													<a href="deleteproduct.jsp?id=<%=rs.getInt(1) %>"
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
									</div> -->
								</div>
							</div>
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
									<form action="ManageTableCtrl" method="post">
										<!-- Form for store here -->
										<div class="form-group">
											<label for="name" class="cols-sm-2 control-label"><strong>Table
													Name</strong></label>
											<div class="cols-sm-10">
												<div class="input-group">

													<input type="text" class="form-control" name="tname"
														id="name" placeholder="Enter Table Name" required /> <span
														style="color: red; font-style: inherit;"><strong><%=(request.getAttribute("msg") == null) ? "" : request.getAttribute("msg")%></strong></span>
												</div>
											</div>
											<div class="form-group">
												<label for="name" class="cols-sm-2 control-label"><strong>
														Capacity</strong></label>
												<div class="cols-sm-10">
													<div class="input-group">

														<input type="text" class="form-control" name="tcap"
															id="name" placeholder="Enter Table Capacity" required />
														<span style="color: red; font-style: inherit;"><strong><%=(request.getAttribute("msg") == null) ? "" : request.getAttribute("msg")%></strong></span>
													</div>
												</div>
												<div class="form-group">
													<label for="inputState"><strong>Status</strong></label> <select
														name="status" id="inputState" class="form-control">

														<option>Active</option>
														<option>Inactive</option>

													</select>
												</div>
												
												<div class="form-group">
													<label for="inputState"><strong>Store</strong></label> <select
														name="storeid" id="inputState" class="form-control">
														<%
														Connection con1=DBConnection.getConn();
														Statement st1=con.createStatement();
															ResultSet rs1=st.executeQuery("SELECT * FROM R_STORE");
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