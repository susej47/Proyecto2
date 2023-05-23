<%-- 
    Document   : register
    Created on : 28 abr. 2023, 19:43:29
    Author     : mosorior
--%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <title>Registro</title>
</head>
<body>

<header class='cabecera'>
    <div class="nav-box"><a href="index.jsp">Inicio</a></div>
    <div class="nav-box"><a href="register.jsp">Registrarse</a></div>
    <div class="nav-box"><a href="login.jsp">Entrar</a></div>
</header>


<h1 style="text-align: center">Formulario de Registro</h1>

<form class="register-form" method="post" action="register_process.jsp">

    <label for="nombre">Nombre:</label>
    <input type="text" id="nombre" name="nombre">

    <label for="apellido">Apellido:</label>
    <input type="text" id="apellido" name="apellido">

    <label for="usuario">Usuario:</label>
    <input type="text" id="usuario" name="usuario" required>

    <label for="contrasena">Contrase&ntilde;a:</label>
    <input type="password" id="contrasena" name="contrasena" required>

    <label for="rol">Rol:</label>
    <select id="rol" name="rol" required onchange="mostrarCamposAdicionales()">
        <option value="">Seleccione un rol</option>
        <option value="solicitante">Solicitante</option>
        <option value="contribuyente">Contribuyente</option>
    </select>

    <div class="show-none" id="campo-telefono" >
        <label for="telefono">Telefono:</label>
        <input type="text" id="telefono" name="telefono">
    </div>
    <div class="show-none" id="campo-habilidad" >
        <label for="habilidad">Habilidad:</label>
        <input type="text" id="habilidad" name="habilidad">
    </div>

    <input class="button" type="submit" value="Registrarse">
</form>

<script>

    const SESSION_COOKIE_NAME = 'sessionToken';

    function mostrarCamposAdicionales() {
        const rolSeleccionado = document.getElementById('rol').value;
        const campoTelefono = document.getElementById('campo-telefono');
        const campoHabilidad = document.getElementById('campo-habilidad');
        const campoCurriculum = document.getElementById('campo-curriculum');

        if (rolSeleccionado === 'solicitante') {

            campoHabilidad.classList.add('show-none');
            campoHabilidad.classList.remove('phone');
            campoTelefono.classList.remove('show-none');
            campoTelefono.classList.add('phone');

            //campoTelefono.style.flexDirection = 'column';
            campoCurriculum.style.display = 'none';
            document.getElementById('habilidad').required = false;
        } else if (rolSeleccionado === 'contribuyente') {
            campoTelefono.classList.add('show-none');
            campoTelefono.classList.remove('phone');
            campoHabilidad.classList.add('phone');
            campoHabilidad.classList.remove('show-none');


            //campoCurriculum.style.display = 'block';
            document.getElementById('telefono').required = false;
        } else {
            campoTelefono.classList.add('show-none');
            campoHabilidad.classList.add('show-none');
            campoHabilidad.classList.remove('phone');
            campoTelefono.classList.remove('phone');


            document.getElementById('telefono').required = false;
            document.getElementById('habilidad').required = false;
        }
    }

    // Realizar una solicitud al servidor para registrar al usuario
    fetch('register_process.jsp', {
        method: 'POST',
        body: formData // Tu objeto FormData con los datos del formulario
    })
        .then(response => response.json())
        .then(data => {
            // Verificar si el registro fue exitoso y obtener el token de sesión del servidor
            if (data.success && data.sessionToken) {
                const sessionToken = data.sessionToken;

                // Configurar la cookie de sesión con el token
                document.cookie = `${SESSION_COOKIE_NAME}=${sessionToken}; path=/`;

                // Redirigir al usuario a una página de inicio o a donde desees después del registro exitoso
                window.location.href = 'index.jsp'; // Reemplaza 'index.jsp' con la página a la que deseas redirigir
            } else {
                // El registro no fue exitoso, manejar el error o mostrar un mensaje al usuario
            }
        })
        .catch(error => {
            // Manejar cualquier error en la solicitud
        });
</script>
</body>
</html>
