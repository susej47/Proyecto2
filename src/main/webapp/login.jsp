<%-- 
    Document   : login
    Created on : 28 abr. 2023, 19:43:29
    Author     : mosorior
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="./css/style.css">
    <script>
        window.addEventListener('DOMContentLoaded', (event) => {
            const userInfo = document.getElementById('user-info');

            // Verificar si el usuario ha iniciado sesión y mostrar la foto de perfil
            if (isUserLoggedIn()) {
                const profileImage = getProfileImage(); // Obtener la imagen de perfil del backend
                userInfo.innerHTML = `<img src="${profileImage}" alt="Imagen de perfil">`;
            }
        });

        // Función de ejemplo para verificar si el usuario ha iniciado sesión
        function isUserLoggedIn() {
            // Obtener todas las cookies presentes en el navegador
            const cookies = document.cookie.split(';');

            // Verificar si la cookie de sesión está presente
            const isLoggedIn = cookies.some(cookie => cookie.trim().startsWith('sessionToken='));

            return isLoggedIn;
        }
    </script>
</head>
<body>
<header class='cabecera'>
    <div class="nav-box"><a href="index.jsp">Inicio</a></div>
    <div class="nav-box"><a href="register.jsp">Registrarse</a></div>
    <div class="nav-box"><a href="login.jsp">Entrar</a></div>
</header>

<h1 style="text-align: center">Formulario de Inicio de Sesion</h1>

<form class="register-form" method="POST" action="login_process.jsp">
    <label for="usuario">Usuario:</label>
    <input type="text" id="usuario" name="usuario" required>

    <label for="contrasena">Contrase&ntilde;a:</label>
    <input type="password" id="contrasena" name="contrasena" required>

    <input class="button" type="submit" value="Iniciar Sesion">
</form>
</body>
</html>
