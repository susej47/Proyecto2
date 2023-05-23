<%@ page import="com.example.dao.MensajeDAO" %>
<%@ page import="com.example.dao.UsuarioDAO" %>

<%
    String sessionToken = (String) request.getSession().getAttribute("sessionToken");
    String usuario = (String) request.getSession().getAttribute("nombreUsuario");
%>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <meta charset="UTF-8">
    <title>Crear Mensaje</title>
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
<h1 style="text-align: center">Crear Mensaje</h1>
<form class="register-form" action="guardarMensaje" method="post">
    <input type="hidden" name="sessionToken" value="<%= sessionToken %>">
    <input type="hidden" name="usuario" value="<%= usuario %>">
    <label for="titulo">Titulo:</label><br>
    <input type="text" id="titulo" name="titulo"><br>
    <label for="contenido">Contenido:</label><br>
    <textarea class="text-area" id="contenido" name="contenido"></textarea><br><br>
    <button class="button" style="font-size: 18px" type="submit">Guardar Mensaje</button>
</form>
</body>
</html>
