<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	String nombre = request.getParameter("nombre");
	String apellido = request.getParameter("apellido");

	Cookie username = new Cookie("username", request.getParameter("nombre"));
	Cookie subname = new Cookie("email", request.getParameter("apellido"));

	//Darle caducidad a las cookies
	username.setMaxAge(60 * 60 * 10);
	subname.setMaxAge(60 * 60 * 10);

	//Enviarla en la proxima cabecera HTML al cliente
	response.addCookie(username);
	response.addCookie(subname);
	request.getCookies();
	%>
	<form action="">
		<input type="hidden" name="usuario" value="<% username.getValue(); %>" />
		<input type="hidden" name="apellido" value="<% subname.getValue(); %>" />
	</form>
	<%
	String nextPage = "";
	nextPage = "/susDatos.jsp";
	%>
</body>
</html>