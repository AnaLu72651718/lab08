<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@page import="model.entity.Role"%>
<%@page import="model.entity.Resource"%>
<%
	List<Role> roles = (List<Role>) request.getAttribute("roles");
	List<Resource> resources = (List<Resource>) request.getAttribute("resources");
%>
<!DOCTYPE html>
<html lang="es">
<head>
<link href="https://fonts.googleapis.com/css?family=Oswald"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/estilos4.css">
<title>Añadir Access</title>
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

	<form action="/access/add" name="formulario" method="post">
		<h1>Añadir Nuevo Access</h1>

		<p>Seleccione su rol</p>
		<select name="roles">
			<%
				for (Role r : roles) {
			%>
			<option value="<%=r.getId()%>"><%=r.getNombre()%></option>
			<%
				}
			%>
		</select>

		<p>Seleccione su resource</p>
		<select name="resources">
			<%
				for (Resource r : resources) {
			%>
			<option value="<%=r.getId()%>"><%=r.getUrl()%></option>
			<%
				}
			%>
		</select> <input type="submit" id="submit" value="Crear Access">

	</form>

	<center>
		<a href="/access"><img src="/lista.png" width="50" height="50"></a>
	</center>
</body>
</html>