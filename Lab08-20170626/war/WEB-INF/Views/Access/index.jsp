<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="controller.access.AccessControllerIndex"%>
<%@ page import="model.entity.Access"%>
<%List<Access> access = (List<Access>)request.getAttribute("access");%>
<!DOCTYPE html>
<html lang="es">
<head>
	<link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../estilos4.css">
	<title>Lista de Access</title>
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


<div class="contenedor-formulario">
		<div class="wrap">
			<div class="titulo">
				<h2>Lista de Access</h2>
			</div>
			<div class="tabla">
		<% if (access.isEmpty()){ %>
		<p>No se encuentran access. Añada nuevos</p>
		<%} else { %>
		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>Rol</th>
					<th>Resource</th>
					<th>Creado</th>
				</tr>
			</thead>
			<% for (Access a: access){%>
			<tr>
				<td><a  href="/access/view?id=<%=a.getId()%>"><%=a.getId()%></a></td>
				<td><%=a.getIdRol()%></td>
				<td><%=a.getIdResource() %></td>
				<td><%=a.getMade() %></td>
			</tr>
			<%} %>
		</table>
		<%} %>
		
			
	
</body>
</html>