<!DOCTYPE html>
<html lang="es">
<head>
    <!-- Configuración del documento -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/styles.css"> <!-- Enlace a la hoja de estilos -->
    <title>Gestion de Usuarios - SALUD Contigo</title> <!-- Título del documento -->
</head>
<body>
<!-- Encabezado -->
<header>
    <div class="logo">
        <img src="img/logo.PNG" alt="Logo SALUD Contigo"> <!-- Imagen del logo -->
    </div>
    <!-- Navegación -->
    <nav>
        <ul>
            <li><a href="#" class="active">Home</a></li> <!-- Enlace a la página de inicio (actualmente activa) -->
            <li><a href="web/login.html">Salir</a></li> <!-- Enlace para salir -->
        </ul>
    </nav>
</header>

<!-- Contenido principal -->
<div class="container">
    <h2>Gestion de Usuarios</h2> <!-- Título -->
    <br>
    <!-- Formulario para agregar usuarios -->
    <form id="userForm">
        <table class="form-table">
            <tr>
                <td><label for="id">ID:</label></td>
                <td><input type="text" id="id" name="id"></td>
            </tr>
            <tr>
                <td><label for="identificacion">Identificacion:</label></td>
                <td><input type="text" id="identificacion" name="identificacion"></td>
            </tr>
            <tr>
                <td><label for="nombre">Nombre:</label></td>
                <td><input type="text" id="nombre" name="nombre"></td>
            </tr>
            <tr>
                <td><label for="apellido">Apellido:</label></td>
                <td><input type="text" id="apellido" name="apellido"></td>
            </tr>
            <tr>
                <td><label for="usuario">Username:</label></td>
                <td><input type="text" id="usuario" name="usuario"></td>
            </tr>
            <tr>
                <td><label for="contrasena">Password:</label></td>
                <td><input type="password" id="contrasena" name="contrasena"></td>
            </tr>
        </table>
        <br>
        <button type="submit">Agregar</button>
        <button type="button" onclick="limpiarFormulario()">Limpiar</button>

        <!-- Botones para actualizar y borrar -->
        <button onclick="actualizarUsuario()">Actualizar</button>
        <button onclick="borrarUsuario()">Borrar</button>
    </form>
    <br>
    <!-- Lista de usuarios -->
    <h3>Usuarios Registrados</h3>
    <table id="userTable">
        <thead>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Identificacion</th>
            <th>Username</th>
            <th>Password</th>
        </tr>
        </thead>
        <tbody>
        <!-- Iterar sobre la lista de usuarios y mostrar cada uno -->
        <c:forEach items="${listaUsuarios}" var="usuario">
            <tr>
                <td>${usuario.id}</td>
                <td>${usuario.nombre}</td>
                <td>${usuario.apellido}</td>
                <td>${usuario.identificacion}</td>
                <td>${usuario.user}</td>
                <td>${usuario.password}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <br>
</div>

<!-- Pie de página -->
<footer>
    <p>SALUD Contigo - Todos los derechos reservados</p> <!-- Información de derechos de autor -->
</footer>

<!-- Script para limpiar el formulario -->
<script>
    function limpiarFormulario() {
        document.getElementById("userForm").reset();
    }
</script>

<!-- JavaScript para redireccionar al hacer clic en el botón -->
<script>
    document.getElementById("iniciar-sesion-button").addEventListener("click", function () {
        window.location.href = "../web/home.html"; // Redirecciona a la página home.html al hacer clic en el botón
    });
</script>

</body>
</html>

<%--<%@ page import="modelo.Usuario" %>--%>
<%--<%@ page import="java.util.List" %>--%>
<%--<%@ page import="java.util.ArrayList" %>--%>


<%--<!DOCTYPE html>--%>
<%--<html lang="es">--%>
<%--<head>--%>
<%--    <!-- Configuración del documento -->--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <link rel="stylesheet" href="css/styles.css"> <!-- Enlace a la hoja de estilos -->--%>
<%--    <title>Gestion de Usuarios - SALUD Contigo</title> <!-- Título del documento -->--%>
<%--</head>--%>
<%--<body>--%>
<%--<!-- Encabezado -->--%>
<%--<header>--%>
<%--    <div class="logo">--%>
<%--        <img src="img/logo.PNG" alt="Logo SALUD Contigo"> <!-- Imagen del logo -->--%>
<%--    </div>--%>
<%--    <!-- Navegación -->--%>
<%--    <nav>--%>
<%--        <ul>--%>
<%--            <li><a href="#" class="active">Home</a></li> <!-- Enlace a la página de inicio (actualmente activa) -->--%>
<%--            <li><a href="/index.jsp">Salir</a></li> <!-- Enlace para salir -->--%>
<%--        </ul>--%>
<%--    </nav>--%>
<%--</header>--%>

<%--<!-- Contenido principal -->--%>
<%--<div class="container">--%>
<%--    <h2>Gestion de Usuarios</h2> <!-- Título -->--%>
<%--    <br>--%>
<%--    <!-- Formulario para agregar usuarios -->--%>
<%--    <form id="userForm">--%>
<%--        <table class="form-table">--%>
<%--            <tr>--%>
<%--                <td><label for="id">ID:</label></td>--%>
<%--                <td><input type="text" id="id" name="id"></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td><label for="identificacion">Identificacion:</label></td>--%>
<%--                <td><input type="text" id="identificacion" name="identificacion"></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td><label for="nombre">Nombre:</label></td>--%>
<%--                <td><input type="text" id="nombre" name="nombre"></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td><label for="apellido">Apellido:</label></td>--%>
<%--                <td><input type="text" id="apellido" name="apellido"></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td><label for="usuario">Username:</label></td>--%>
<%--                <td><input type="text" id="usuario" name="usuario"></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td><label for="contrasena">Password:</label></td>--%>
<%--                <td><input type="password" id="contrasena" name="contrasena"></td>--%>
<%--            </tr>--%>
<%--        </table>--%>
<%--        <br>--%>
<%--        <button type="submit">Agregar</button>--%>
<%--        <button type="button" onclick="limpiarFormulario()">Limpiar</button>--%>

<%--        <!-- Botones para actualizar y borrar -->--%>
<%--        <button onclick="actualizarUsuario()">Actualizar</button>--%>
<%--        <button onclick="borrarUsuario()">Borrar</button>--%>
<%--    </form>--%>
<%--    <br>--%>
<%--    <!-- Lista de usuarios -->--%>
<%--    <h3>Usuarios Registrados</h3>--%>
<%--    <table id="userTable">--%>
<%--        <tr>--%>
<%--            <th>ID</th>--%>
<%--            <th>Identificacion</th>--%>
<%--            <th>Nombre</th>--%>
<%--            <th>Apellido</th>--%>
<%--            <th>Username</th>--%>
<%--            <th>Password</th>--%>
<%--        </tr>--%>
<%--        <!-- Los usuarios serán mostrados aquí dinámicamente -->--%>
<%--        <%--%>
<%--            // List<Usuario> listaUsuarios = (List<Usuario>) request.getAttribute("listaUsuarios");--%>
<%--            List<Usuario> listaUsuarios = new ArrayList<>();--%>
<%--            for (Usuario usuario : listaUsuarios) {--%>
<%--        %>--%>
<%--        <tr>--%>
<%--            <td><%= usuario.getId() %></td>--%>
<%--            <td><%= usuario.getIdentificacion() %></td>--%>
<%--            <td><%= usuario.getNombre() %></td>--%>
<%--            <td><%= usuario.getApellido() %></td>--%>
<%--            <td><%= usuario.getUser() %></td>--%>
<%--            <td><%= usuario.getPassword() %></td>--%>
<%--        </tr>--%>
<%--        <% } %>--%>
<%--    </table>--%>
<%--    <br>--%>
<%--</div>--%>

<%--<!-- Pie de página -->--%>
<%--<footer>--%>
<%--    <p>SALUD Contigo - Todos los derechos reservados</p> <!-- Información de derechos de autor -->--%>
<%--</footer>--%>

<%--<!-- Script para limpiar el formulario -->--%>
<%--<script>--%>
<%--    function limpiarFormulario() {--%>
<%--        document.getElementById("userForm").reset();--%>
<%--    }--%>
<%--</script>--%>

<%--<!-- JavaScript para redireccionar al hacer clic en el botón -->--%>
<%--<script>--%>
<%--    document.getElementById("iniciar-sesion-button").addEventListener("click", function () {--%>
<%--        window.location.href = "../web/home.html"; // Redirecciona a la página home.html al hacer clic en el botón--%>
<%--    });--%>
<%--</script>--%>

<%--</body>--%>
<%--</html>--%>