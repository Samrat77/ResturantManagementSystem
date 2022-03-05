<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
    <%@ include file="header.jsp"%>
<%@include file="menubar.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- CSS only -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
JavaScript Bundle with Popper
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script> -->
</head>
<body>
<div class="card">
  <div class="card-header">
    ABC Restaurant Menu
  </div> 
   <div class="card-body" style="width: 100rem; height: 20%; margin-top: 10%; margin-left: 10%;">
<%
                int count = 0;
                String color = "#e0e0e0";
                if (request.getAttribute("piList") != null) {
                    ArrayList al = (ArrayList) request.getAttribute("piList");
                    System.out.println(al);
                    Iterator itr = al.iterator();
                    while (itr.hasNext()) {
 
                        /* if ((count % 2) == 0) {
                            color = "#eeffee";
                        } */
                        count++;
                        ArrayList pList = (ArrayList) itr.next();
            %>
            
            
 
    <h5 class="card-title"><%=pList.get(0) %></h5>
    <p class="card-text"><%=pList.get(1) %>&nbsp&nbsp
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<i class="fas fa-rupee-sign"></i><%=pList.get(2) %>
    
    <!-- <a href="#" class="btn btn-primary">Go somewhere</a> -->
  
            <%}} %></div> 
 
  
  
</div>
</body>
</html>