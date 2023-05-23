<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <style>
        /* Estilos para los botones */
        .centered-buttons {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .centered-buttons button {
            margin: 0 10px;
            padding: 10px 20px;
            font-size: 16px;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="./css/style.css">
    <script>
        window.addEventListener('DOMContentLoaded', (event) => {
            const userInfo = document.getElementById('user-info');
            const logoutForm = document.getElementById('logout-form');
            const forumLink = document.getElementById('forum-link');
            const pedirAyudaLink = document.getElementById('pedir-ayuda-link');
            const ayudarLink = document.getElementById('ayudar-link');
            const entrar = document.getElementById('entrar');
            const registrarse = document.getElementById('registrarse');

            // Verificar si el usuario ha iniciado sesión y mostrar/ocultar la foto y el nombre de usuario
            if (isUserLoggedIn()) {
                const username = getUsername(); // Obtener el nombre de usuario del backend
                const profileImage = getProfileImage(); // Obtener la imagen de perfil del backend


                // Mostrar la foto y el nombre de usuario
                //<img src="${profileImage}" alt="Imagen de perfil">

                userInfo.innerHTML = "<span>" + username + "</span>";

                // Mostrar el formulario de logout
                logoutForm.style.display = 'block';


                // Mostrar los enlaces de Pedir Ayuda y Ayudar
                pedirAyudaLink.style.display = 'block';
                ayudarLink.style.display = 'block';
                entrar.classList.add("show-none");
                entrar.classList.remove("nav-box");
                registrarse.classList.add("show-none");
                registrarse.classList.remove("nav-box");

            } else {
                // Ocultar la foto y el nombre de usuario
                userInfo.style.display = 'none';

                // Ocultar el formulario de logout
                logoutForm.style.display = 'none';

                // Ocultar el enlace de forum
                forumLink.style.display = 'none';

                // Ocultar los enlaces de Pedir Ayuda y Ayudar
                pedirAyudaLink.style.display = 'none';
                ayudarLink.style.display = 'none';
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

        // Función de ejemplo para obtener el nombre de usuario desde el backend
        function getUsername() {
            // Implementa la lógica real para obtener el nombre de usuario desde el backend
            const cookies = document.cookie.split(';');

            const usuario = cookies.map(cookie => {
                        if (cookie.trim().startsWith('nombreUsuario')) {
                            return cookie.split('=')[1];
                        }
                    }
                );

            return usuario; // Cambia esto con tu lógica real
        }

        // Función de ejemplo para obtener la imagen de perfil desde el backend
        function getProfileImage() {
            // Implementa la lógica real para obtener la imagen de perfil desde el backend
            return 'img/imagen_perfil.jpg'; // Cambia esto con tu lógica real
        }
    </script>
</head>
<body>
<header class='cabecera'>
    <div class="nav-box"><a href="index.jsp">Inicio</a></div>
    <div id="registrarse" class="nav-box"><a href="register.jsp">Registrarse</a></div>
    <div id="entrar" class="nav-box"><a href="login.jsp">Entrar</a></div>
    <div class="nav-box"><p id="user-info"></p></div>
</header>
<h1 style="text-align: center">Bienvenido a la p&aacute;gina principal</h1>

<div class="centered-buttons">
    <button onclick="window.location.href='pedir_ayuda.jsp'" id="pedir-ayuda-link" style="display: none;">Pedir ayuda
    </button>
    <button onclick="window.location.href='ayudar.jsp'" id="ayudar-link" style="display: none;">Ayudar</button>
</div>

</body>
</html>
