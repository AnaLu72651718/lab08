<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.entity.User"%>
<%@page import="java.util.Date"%>
<%@ page import="java.util.List"%>
<%@page import="model.entity.Role"%>
<%
	List<Role> roles = (List<Role>) request.getAttribute("roles");
%>
<%
	User user = (User) request.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="es">
<head>
<link href="https://fonts.googleapis.com/css?family=Oswald"
	rel="stylesheet">
<meta charset="utf-8">
<title>Editar Usuario</title>
<link rel="stylesheet" type="text/css" href="../estilos4.css">
</head>
<style>
input[type=text], select {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=submit] {
	width: 100%;
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: #45a049;
}

div {
	border-radius: 5px;
	padding: 20px;
}

* {
	padding: 0px;
	margin: 0px;
}

#header {
	font-family: 'Montserrat', sans-serif;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #333;
}

li {
	float: left;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

.nav>li {
	float: left;
}

.nav li ul {
	display: none;
}

.nav li:hover>ul {
	display: block;
}

ul li a:hover, ul li a:active {
	background-color: #05319c;
}
</style>
<body>
	<div class="wrap">

		<div id="header">
		
		<ul class="nav">
			<li><a href="/users">Usuarios</a>
				<ul>
					<li><a href="/users/add">Agregar Usuarios</a></li>
				</ul></li>
			<li><a href="/productos">Productos</a>
				<ul>
					<li><a href="/productos/add">Agregar Productos</a></li>
				</ul></li>
			<li><a href="/roles">Roles</a>
				<ul>
					<li><a href="/roles/add">Agregar Roles</a></li>
				</ul></li>
			<li><a href="/access">Access</a>
				<ul>
					<li><a href="/access/add">Agregar Accesos</a></li>
				</ul></li>
			<li><a href="/resources">Recurso</a>
				<ul>
					<li><a href="/resources/add">Agregar Recursos</a></li>
				</ul></li>
			<li><a href="/users/login">Login</a></li>
			<li><a href="/users/logout">Logout</a></li>
		</ul>
		</div>
	</div>

	<div class="titulo">
		<h2>Editar Usuario</h2>
	</div>

	<form action="/users/edit" method="post" name="formulario">


		<label>Edite el nombre </label> <input type="text" name="nombre"
			value="<%=user.getNombre()%>" required> <br> <br> <label>Edite
			el correo</label> <input type="email" name="correo"
			value="<%=user.getCorreo()%>" required> <br> <br> <label>Edite
			su genero</label>
		<%
			String hc = "", mc = "";
			if (user.isGender())
				hc = "checked";
			else
				mc = "checked";
		%>
		<div class="radio">
			<input type="radio" name="gender" id="hombre" value="true" <%=hc%>>
			<label for="hombre">Masculino</label> <input type="radio"
				name="gender" id="mujer" value="false" <%=mc%>> <label
				for="mujer">Femenino</label>
		</div>
		<br> <br> <label>Edite su rol</label> <select name="roles">
			<%
				for (Role r : roles) {
			%>
			<option value="<%=r.getId()%>"><%=r.getNombre()%></option>
			<%
				}
			%>
		</select> <input type="hidden" name="id" value="<%=user.getId()%>"> <input
			type="submit" value="Editar Usuario">


	</form>



	<script>
		(function() {

			var formulario = document.getElementsByName('formulario')[0], elementos = formulario.elements, boton = document
					.getElementById('submit');

			var validarNombre = function(e) {
				if (formulario.nombre.value == "") {
					alert("Llene el campo nombre");
					e.preventDefault();
				} else if (isNaN(formulario.nombre.value) === false) {
					alert("El campo NOMBRE solo debe contener letras");
					e.preventDefault();
				}
			}

			var validarCorreo = function(e) {
				if (formulario.correo.value == "") {
					alert("Llene el campo correo");
					e.preventDefault();
				}
			}
			var validar = function(e) {
				validarNombre(e);
				validarCorreo(e);
			}

			formulario.addEventListener("submit", validar);

		}())
	</script>
	</div><center>
	<a href="/users"><img src="/lista.png" height="50"></a></center>
	</div>
</body>
</html>