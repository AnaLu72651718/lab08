<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@page import="model.entity.Role"%>
<%
	List<Role> roles = (List<Role>) request.getAttribute("roles");
%>
<!DOCTYPE html>
<html lang="es">
<head>
<link href="https://fonts.googleapis.com/css?family=Oswald"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Añadir usuario</title>
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
input[type=email], select {
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
		<font color=#fffff>
			<h2>Añadir Usuario</h2>
		</font>
	</div>
	<form action="/users/add" method="post" onsubmit="return validar();">

		<input type="text" id="nombre" name="nombre"> <label
			for="nombre"> Ingrese el nombre </label><br>
		<br> <input type="email" id="correo" name="correo"> <label
			for="correo">Ingrese el correo </label><br>
		<br>
		<p>Seleccione su genero</p>
		<div class="radio">
			<input type="radio" name="gender" id="hombre" value="true" checked>
			<label for="hombre">Masculino</label> <input type="radio"
				name="gender" id="mujer" value="false"> <label for="mujer">Femenino</label>
		</div>
		<label for="roles"> Seleccione el rol </label> <select name="roles">
			<%
				for (Role r : roles) {
			%>
			<option value="<%=r.getId()%>"><%=r.getNombre()%></option>
			<%
				}
			%>
		</select> <input type="submit" id="submiit" value="Crear Usuario">


	</form>
	<script>
				(function(){
					
					var formulario = document.getElementsByName('formulario')[0],
						elementos = formulario.elements,
						boton = document.getElementById('submit');
					
					var validarNombre = function(e){
						if(formulario.nombre.value == ""){
							alert("Llene el campo nombre");
							e.preventDefault();
						}
						else if(isNaN(formulario.nombre.value)===false){
							alert("El campo NOMBRE solo debe contener letras");
							e.preventDefault();
						}
					}
							
					var validarCorreo = function(e){
						if(formulario.correo.value == ""){
							alert("Llene el campo correo");
							e.preventDefault();
						}
					}
					var validar = function(e){
						validarNombre(e);
						validarCorreo(e);
					}
					
					formulario.addEventListener("submit",validar);
					
					
				}())	
			</script>
	</div>
	<center>
	<a href="/users"><img src="/lista.png" width="50" height="50"></a></center>
	</div>
</body>
</html>