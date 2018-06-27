<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="controller.users.UsersControllerIndex"%>
<%@ page import="model.entity.User"%>
<%@ page import="model.entity.Role"%>
<%
	List<User> users = (List<User>) request.getAttribute("users");
	List<Role> roles = (List<Role>) request.getAttribute("roles");
	String almacenaRol = "";
%>
<!DOCTYPE html>
<html lang="es">
<head>
<link href="https://fonts.googleapis.com/css?family=Oswald"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../estilos4.css">
<meta charset="utf-8">
<title>Lista de Usuarios</title>
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
<body>
	<div id="header">
		<ul class="nav">
			<li><a href="index.html">Inicio</a></li>
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
				<h2>Lista de Usuarios</h2>
			</div>
			<div class="tabla">
				<%
					if (users.isEmpty()) {
				%>
				<p>No se encuentran usuarios. Añada Usuarios</p>
				<%
					} else {
				%>
				<table>
					<thead>
						<tr>
							<th>ID</th>
							<th>Nombre</th>
							<th>Rol</th>
							<th>Correo electrónico</th>
							<th>Género</th>
							<th>Estado</th>
							<th>Creado</th>

						</tr>
					</thead>
					<%
						for (User us : users) {
					%>
					<tr>
						<td><a href="/users/view?id=<%=us.getId()%>"><%=us.getId()%></a></td>
						<td><%=us.getNombre()%></td>
						<%
							if (roles.isEmpty()) {
						%>
						<%
							} else {
						%>
						<%
							for (Role r : roles) {
						%>
						<%
							if (r.getId().equals(us.getIdRol())) {
												almacenaRol = r.getNombre();
											}
										}
						%>
						<td><%=almacenaRol%></td>
						<%
							}
						%>

						<td><%=us.getCorreo()%></td>
						<td>
							<%
								if (us.isGender()) {
							%> Masculino <%
								} else {
							%> Femenino <%
								}
							%>
						</td>
						<td><%=us.isEstatus()%></td>
						<td><%=us.getMade()%></td>

					</tr>
					<%
						}
					%>
				</table>
				<%
					}
				%>

			</div>
</body>
</html>