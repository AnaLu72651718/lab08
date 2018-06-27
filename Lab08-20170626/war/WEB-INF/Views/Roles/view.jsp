<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.entity.Role"%>
<%
	Role roles = (Role) request.getAttribute("roles");
%>
<!DOCTYPE html>
<html lang="es">
<head>
<link rel="stylesheet" type="text/css" href="../estilos4.css">
<link href="https://fonts.googleapis.com/css?family=Oswald"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<meta charset="utf-8">
<title><%=roles.getNombre()%></title>
</head>

<style>
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

	<h2>
		Role
		<%=roles.getId()%></h2>
	<a id="add" href="/roles" title="Añadir Roles"></a>
	<div id="tabla">

		<center>
			<table>
				<tr>
					<th>ID de usuario</th>
					<td><%=roles.getId()%></td>
				</tr>
				<tr>
					<th>Nombre</th>
					<td><%=roles.getNombre()%></td>
				</tr>
				<tr>
					<th>Estado</th>
					<td><%=roles.isEstatus()%></td>
				</tr>
				<tr>
					<th>Creacion</th>
					
					<td><%=roles.getMade()%></td>
				</tr>

			</table>
		</center>
	</div>

	<center>
		<a href="/roles/edit?id=<%=roles.getId()%>"><img src="/edit.png"
			width="50" height="50" /> </a> <a href="/roles"><img
			src="/lista.png" width="50" height="50"> </a>
		<form action="/roles/delete" method="post">
			<input type="hidden" value="<%=roles.getId()%>" name="id"> <input
				type="image" src="/delete.png" height="50" />
	</center>
	</form>
	</div>
</body>
</html>
