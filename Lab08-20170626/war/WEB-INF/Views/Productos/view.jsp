<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="model.entity.Producto"%>
<%
	Producto producto = (Producto) request.getAttribute("producto");
%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Oswald"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="../estilos4.css">
</head>
<style>
*{
padding: 0px;
margin: 0px;
}
#header{
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
.nav > li{
float: left;
}
.nav li ul{
display: none;
}

.nav li:hover > ul{
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
</div></div>
<h2>
	Producto
	<%=producto.getId()%></h2>
	<a id="add" href="/productos" title="Añadir Producto"></a>
	<div id="tabla">

		<center>
			<table>
				<tr>
					<th>ID de usuario</th>
					<td><%=producto.getId()%></td>
				</tr>
				<tr>
					<th>Nombre</th>
					<td><%=producto.getNombre()%></td>
				</tr>
				<tr>
					<th>Descripcion</th>
					<td><%=producto.getDescripcion()%></td>
				</tr>
				<tr>
					<th>Precio</th>
					<td><%=producto.getPrecio()%></td>
				</tr>
				<tr>
					<th>Stock</th>
					<td><%=producto.getStock()%></td>
				</tr>

				<tr>
					<th>Estado</th>
					<td><%=producto.isEstatus()%></td>
				</tr>

			</table>
		</center>
	</div>

		<center>
			<a href="/productos/edit?id=<%=producto.getId()%>"><img
				src="/edit.png" width="50" height="50" /> </a> <a href="/productos"><img
				src="/lista.png" width="50" height="50"> </a>
			<form action="/productos/delete" method="post">
				<input type="hidden" value="<%=producto.getId()%>" name="id">
				<input type="image" src="/delete.png" width="30" height="30" />
		</center>
		</form>
	
</body>
</html>