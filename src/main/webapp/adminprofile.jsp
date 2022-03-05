<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.restaurant.DBConnect.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
    <%@ include file="header.jsp" %>
     <%@include file="menubar.jsp" %>
     <% %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
<%-- <input type="text" hidden="yes" name="uname" value="<%out.println(session.getAttribute("admin"));%>"> --%>
<%
System.out.print("inside admin profile");
if(request.getAttribute("list")!=null)
{
	ArrayList al=(ArrayList)request.getAttribute("list");
	Iterator it=al.iterator();
	while(it.hasNext())
	
		
	

 /* Connection conn=DBConnection.getConn();
Statement st=conn.createStatement();
String sql="SELECT * FROM R_USER";
ResultSet rs=st.executeQuery(sql);
while(rs.next())  */
{
	ArrayList pList = (ArrayList) it.next();%> 
	

<br><br>

<div class="col-md-10">
<br>
<h2>User Profile</h2>
              <div class="card mb-3">
                <div class="card-body">
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Username</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%-- <%=rs.getString(2) %> --%>
                      <%=pList.get(0) %>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Email</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                     <%--  <%=rs.getString(3) %> --%>
                     <%=pList.get(1) %>
                    </div>
                  </div>
                  <hr>
                   <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">First Name</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                     <%--  <%=rs.getString(4) %> --%>
                     <%=pList.get(2) %>
                    </div>
                  </div><hr>
                   <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Last Name</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                     <%--  <%=rs.getString(5) %> --%>
                     <%=pList.get(3) %>
                    </div>
                  </div><hr>
                  
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Phone</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                    <%--   <%=rs.getString(6) %> --%>
                    <%=pList.get(4) %>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Gender</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%-- <%=rs.getString(7) %> --%>
                      <%=pList.get(5) %>
                    </div>
                  </div>
                  <hr>
                  
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Role</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                     <strong style="color:highlight;"> Super Administrator</strong>
                    </div>
                  </div>
                </div>
              </div>




<% }
}
%>







<!-- jQuery and JS bundle w/ Popper.js -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<%-- <%@ include file="js/script.js" %> --%>
<%@include file="footer.jsp" %>
</body>
</html>