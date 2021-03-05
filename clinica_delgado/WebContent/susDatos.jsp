<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="menu.html"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sus datos</title>
</head>
<body>
	<% 
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
	%>
 <h4>Hola <% out.println( nombre + " " + apellido + " "); %></h4>
 <%  %>
</body>
</html>