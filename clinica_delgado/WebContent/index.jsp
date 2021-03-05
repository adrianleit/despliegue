<!-- Los import -->
<%@ page language="java" %>
<%@ page import = "java.sql.Connection"%>
<%@ page import = "java.sql.DriverManager"%> 
<%@ page import = "java.sql.ResultSet"%> 
<%@ page import = "java.sql.Statement"%> 
<%@ include file="menu.html"%>
<html>
<body>
<h1>Consulta a base de datos</h1>
<%

try
{
   // Conexion con bd
   Class.forName("com.mysql.jdbc.Driver");
   Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/clinica?serverTimezone=UTC", "root", "");
   if (!conexion.isClosed())
   {
      // La consulta
      Statement st = conexion.createStatement();
      ResultSet rs = st.executeQuery("select * from pacientes" );

      // Ponemos los resultados en un table de html
      out.println("<table border='1'><tr><td>Codigo de Paciente</td><td>Nombre</td><td>Apellido</td><td>DNI</td><td>Edad</td><td>Poblacion</td></tr>");
      while (rs.next())
      {
         out.println("<tr>");
         out.println("<td>"+rs.getObject("COD_PACIENTE")+"</td>");
         out.println("<td>"+rs.getObject("NOMBRE")+"</td>");
         out.println("<td>"+rs.getObject("APELLIDO")+"</td>");
         out.println("<td>"+rs.getObject("DNI")+"</td>");
         out.println("<td>"+rs.getObject("EDAD")+"</td>");
         out.println("<td>"+rs.getObject("POBLACION")+"</td>");
         out.println("</tr>");
      }
      out.println("</table>");

      // cierre de la conexion
      conexion.close();
   }
   else
      // Error en la conexion
      out.println("fallo");
}
catch (Exception e)
{
   // Error en algun momento.
   out.println("Excepcion "+e);
   e.printStackTrace();
}
%>
<br>
<form action="controlador.jsp">
	Nombre: <input type="text" name="nombre" />
	Apellido: <input type="text" name="apellido"/>
	<input type="submit" value="Enviar" />
</form>
</body>
</html>