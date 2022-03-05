<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.restaurant.DBConnect.DBConnection"%>
<%@page import="com.restaurant.Model.ManageTableDAO"%>
<%@page import="com.restaurant.Bean.ManageTableBean"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

String id=request.getParameter("id");

if (id != null) {
	int userid = Integer.parseInt(id);

	Connection con = DBConnection.getConn();
	String sql = "DELETE FROM R_USER WHERE ID=" + userid;
	PreparedStatement ps = con.prepareStatement(sql);
	int i = ps.executeUpdate();
	if (i > 0) {
		request.setAttribute("deletetable", "Table Successfully Deleted");
		request.getRequestDispatcher("adduser.jsp").forward(request, response);
%>
<%-- <jsp:forward page="/table.jsp" /> --%>
<%}} %>
</body>
</html>