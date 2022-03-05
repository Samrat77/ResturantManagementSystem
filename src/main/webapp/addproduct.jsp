<%@page import="com.restaurant.Bean.ManageStoreBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.restaurant.Model.ManageStoreDAO"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.restaurant.DBConnect.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp"%>
<%@include file="menubar.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<style>
body {
	margin: 0;
	padding: 0;
	background-color: #e0e0e0;
	height: 100vh;
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
							Manage <strong> Products</strong>
						</h4>
					</div>
					<div class="card-header">
						<strong>Add products</strong>
						<%
							if (request.getAttribute("add") != null) {
						%>

						<div class="alert alert-warning alert-dismissible fade show"
							role="alert">
							<strong>Hey!!</strong> Products added Successfully
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<%
							}
						%>
					</div>
					<div class="card-body">

						<form class="form-horizontal" method="post" action="ProductCtrl">

							<div class="form-group">
								<label for="name" class="cols-sm-2 control-label"><strong>Product
										name</strong></label>
								<div class="cols-sm-10">
									<div class="input-group">

										<input type="text" class="form-control" name="pname" id="name"
											placeholder="Enter Product Name" />

									</div>


								</div>
							</div>
							<div class="form-group">
								<label for="email" class="cols-sm-2 control-label"><strong>Price</strong></label>
								<div class="cols-sm-10">
									<div class="input-group">

										<input type="text" class="form-control" name="price"
											placeholder="Enter price" />
									</div>
									<span style="color: red; font-style: inherit;"><strong><%=(request.getAttribute("no") == null) ? "" : request.getAttribute("no")%></strong></span>
								</div>
							</div>
							<div class="form-group">
								<label for="password" class="cols-sm-2 control-label"><strong>Description</strong></label>
								<div class="cols-sm-10">
									<div class="input-group">

										<textarea type="text" class="form-control" name="description"
											cols="3" rows="3"></textarea>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="exampleFormControlSelect1"><strong>Category</strong></label> <select
									class="form-control" id="exampleFormControlSelect1"
									name="category">
									<%
                             Connection con=DBConnection.getConn();
										String sql="SELECT * FROM R_category";
										
                            PreparedStatement ps=con.prepareStatement(sql);
                            ResultSet rs=ps.executeQuery();
                            while(rs.next())
                            {%>



									<option value="<%out.print(rs.getInt(1));%>"><%=rs.getString("categoryname") %></option>

									<% }
                                        		
                             %>
								</select>
							</div>
							<div class="form-group">
								<label for="exampleFormControlSelect2"><strong>Store</strong></label> <select
									 class="form-control" id="exampleFormControlSelect2"
									name="storename">
									<%
									/*   if (request.getAttribute("piList") != null) { */
						                    ArrayList al = (ArrayList) ManageStoreDAO.list();
						                    System.out.println(al);
						                    Iterator itr = al.iterator();
						                    while (itr.hasNext()) {
						 
						                      ArrayList pList = (ArrayList) itr.next();
						                        System.out.print("list is "+pList.get(0));
                            %><option value="<%out.print(pList.get(0));%>"><%=pList.get(1) %></option>

									<% }
                                        		
                             %>
								</select>
							</div>
							
												<div class="form-group">
													<label for="inputState"><strong>Status</strong></label> <select
														name="status" id="inputState" class="form-control">

														<option>Active</option>
														<option>Inactive</option>

													</select>
												</div>
							<div class="form-group col-sm-2 col-md-2" style="float: left;">
								<button type="submit"
									class="btn btn-primary btn-lg btn-block login-button"
									name="Action" value="Add">Save Changes</button>

							</div>
							<button type="reset" class="btn btn-warning">Reset</button>


						</form>
						<%-- <span style="color: red; font-style: inherit;"><strong><%=(request.getAttribute("edit") == null) ? "" : request.getAttribute("edit")%></strong></span> --%>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
</html>