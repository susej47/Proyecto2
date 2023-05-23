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
  <link rel="stylesheet" type="text/css" href="css/style.css">
  <meta charset="UTF-8">
  <title>Foro de Mensajes</title>
  <style>
    .mensaje-container {
      border: 1px solid #ccc;
      padding: 10px;
      margin-bottom: 10px;
      text-align: center; /* Centrar el mensaje */
      width: 80%; /* Limitar el ancho al 80% */
      margin-left: auto; /* Centrar horizontalmente */
      margin-right: auto; /* Centrar horizontalmente */
    }

    .fecha {
      font-size: 12px;
      color: #666;
      text-align: left;
      float: left;
    }

    .usuario {
      font-size: 12px;
      color: #666;
      text-align: right;
      float: right;
    }

    .titulo {
      font-size: 16px;
      font-weight: bold;
      clear: both;
    }

    .contenido {
      margin-top: 5px;
    }

    .aceptado {
      border-color: green;
    }

    .rechazado {
      border-color: red;
    }
  </style>
</head>
<body>
<header class='cabecera'>
  <div class="nav-box"><a href="index.jsp">Inicio</a></div>
  <div id="registrarse" class="nav-box"><a href="register.jsp">Registrarse</a></div>
  <div id="entrar" class="nav-box"><a href="login.jsp">Entrar</a></div>
  <div class="nav-box"><p id="user-info"></p></div>
</header>
<h1 style="text-align: center">Foro de Mensajes</h1>
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
  <div>
    <button>Aceptar</button>
    <button>Rechazar</button>
  </div>
</div>
<% } %>

</body>
</html>
