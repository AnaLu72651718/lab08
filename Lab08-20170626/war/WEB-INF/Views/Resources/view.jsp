<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.entity.Resource"%>
<%
	Resource resources = (Resource) request.getAttribute("resources");
%>
<!DOCTYPE html>
<html lang="es">
<head>
<link href="https://fonts.googleapis.com/css?family=Oswald"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<meta charset="utf-8">
<title><%=resources.getUrl()%></title>
<link rel="stylesheet" type="text/css" href="../estilos4.css">
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
	<div >
	<center>
		<h2 id="id" name="<%=resources.getId()%>">Datos del Resource</h2>
		<table>
			<tr>
				<th>ID del resource</th>
				<td><%=resources.getId()%></td>
			</tr>
			<tr>
				<th>Nombre del Resource</th>
				<td><%=resources.getUrl()%></td>
			</tr>
			<tr>
				<th>Fecha de Creación</th>
				<td><%=resources.getMade()%></td>
			</tr>
			<tr>
				<th>Estado</th>
				<td><%=resources.isStatus()%></td>
			</tr>
		</table>
</center>
<center>
			<a href="/resources/edit?id=<%=resources.getId()%>"><img
				src="/edit.png" width="50" height="50" /> </a> <a href="/resources"><img
				src="/lista.png" width="50" height="50"> </a>
			<form action="/resources/delete" method="post">
				<input type="hidden" value="<%=resources.getId()%>" name="id">
				<input type="image" src="/delete.png" height="50" />
		</center>
		</form>

	</div>

</body>
</html>