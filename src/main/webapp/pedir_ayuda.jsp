<%@ page import="com.example.dao.MensajeDAO" %>
<%@ page import="com.example.model.Mensaje" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<%
  List<Mensaje> mensajes = new MensajeDAO().getMensajes();
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" type="text/css" href="css/style.css">
  <title>Foro de Mensajes</title>
</head>
<body>
<header class='cabecera'>
  <div class="nav-box"><a href="index.jsp">Inicio</a></div>
  <div id="registrarse" class="nav-box"><a href="register.jsp">Registrarse</a></div>
  <div id="entrar" class="nav-box"><a href="login.jsp">Entrar</a></div>
  <div class="nav-box"><p id="user-info"></p></div>
    <form id="logout-form" action="logout.jsp" method="post" style="display: none;">
      <input class="button" type="submit" value="Cerrar sesión">
    </form>
  </div>
</header>
<h1 style="text-align: center">Pide Ayuda</h1>
<%
  DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
%>
<%
  for (Mensaje mensaje : mensajes) {
    String fecha = mensaje.getFecha(); // Obtener la fecha sin aplicar formato
%>
<div class="mensaje-container <%= mensaje.getAceptado() == 1 ? "aceptado" : "" %> <%= mensaje.getAceptado() == 1 ? "rechazado" : "" %>">
  <div class="fecha"><%= fecha %></div>
  <div class="usuario"><%= mensaje.getUsuario() %></div>
  <div class="titulo"><%= mensaje.getTitulo() %></div>
  <div class="contenido"><%= mensaje.getContenido() %></div>
</div>
<% } %>

<div class="centrar-registro">
  <button class="button" style="cursor: pointer">
    <a href="crear.jsp" style="text-decoration: none; color: white;" >Pedir ayuda</a>
  </button>
</div>

</body>
</html>
