<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@page import="model.entity.User"%>
<%@page import="model.entity.Role"%>
<%
	User user = (User) request.getAttribute("user");
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
<meta charset="utf-8">
<title><%=user.getNombre()%></title>
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

	<div>
		<h2 id="id" name="<%=user.getId()%>">Perfil de Usuario:</h2>
		<center>
			<table>
				<tr>
					<th>ID de usuario</th>
					<td><%=user.getId()%></td>
				</tr>
				<tr>
					<th>Nombre</th>
					<td><%=user.getNombre()%></td>
				</tr>

				<tr>
					<th>Rol</th>
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
						if (r.getId().equals(user.getIdRol())) {
									almacenaRol = r.getNombre();
								} else {
									almacenaRol = r.getNombre();
								}
					%>
					<%
						}
					%>
					<td><%=almacenaRol%></td>
					<%
						}
					%>
				</tr>

				<tr>
					<th>Correo Electrónico</th>
					<td><%=user.getCorreo()%></td>
				</tr>
				<tr>
					<th>Género</th>
					<td>
						<%
							if (user.isGender()) {
						%> Masculino <%
							} else {
						%> Femenino <%
							}
						%>
					</td>
				</tr>

				<tr>
					<th>Creado</th>
					<td><%=user.getMade()%></td>
				</tr>
				<tr>
					<th>Estado</th>
					<td><%=user.isEstatus()%></td>
				</tr>
			</table>
		</center>


		<center>
			<a href="/users/edit?id=<%=user.getId()%>"><img src="/edit.png"
				width="50" height="50" /> </a> <a href="/users"><img
				src="/lista.png" width="50" height="50"> </a>
			<form action="/users/delete" method="post">
				<input type="hidden" value="<%=user.getId()%>" name="id"> <input
					type="image" src="/delete.png" height="55" />
		</center>
		</form>
	</div>
</body>
</html>