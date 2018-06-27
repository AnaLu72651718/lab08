<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="controller.productos.ProductosControllerIndex"%>
<%@ page import="model.entity.Producto"%>
<%
	List<Producto> productos = (List<Producto>) request.getAttribute("productos");
%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<link rel="stylesheet" type="text/css" href="estilos4.css">
<link href="https://fonts.googleapis.com/css?family=Oswald"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>NET & JAC</title>
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
				<h2>Lista de Productos</h2>
			</div>
			<div class="tabla">
				<%
					if (productos.isEmpty()) {
				%>
				<p>No se encuentran productos.Añada Productos</p>
				<%
					} else {
				%>
				<center>
					<table>
						<tr id="head">
							<th>ID</th>
							<th>Nombre</th>
							<th>Descripcion</th>
							<th>Precio</th>
							<th>Estado</th>
							<th>Stock</th>

						</tr>
						<%
							for (Producto p : productos) {
						%>
						<tr class="body">
							<td><a href="/productos/view?id=<%=p.getId()%>"> <%=p.getId()%></a></td>
							<td><%=p.getNombre()%></td>
							<td><%=p.getDescripcion()%></td>
							<td><%=p.getPrecio()%></td>
							<td><%=p.isEstatus()%></td>
							<td><%=p.getStock()%></td>

						</tr>
						<%
							}
						%>
					</table>
				</center>
				<%
					}
				%>
			</div>
		</div>
	</div>

</body>
</html>

