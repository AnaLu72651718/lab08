<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="model.entity.Producto"%>
<%@page import="java.util.Date"%>
<%
	Producto producto = (Producto) request.getAttribute("producto");
%>
<!DOCTYPE html PUBLIC >
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Oswald"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Editar Producto: <%=producto.getId()%></title>
<link rel="stylesheet" type="text/css" href="../estilos4.css">
	<script type="text/javascript" src="/validar.js"></script>
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
		<h2>Editar Producto</h2>
	</div>

	<form action="/productos/edit" method="post">
		<label>Edite el nombre </label> <input type="text" name="nombre"
			value="<%=producto.getNombre()%>" required> <br> <br>
		<br> <label>Edite la descripcion</label> <input type="text"
			name="descripcion" class="redondeado"
			value="<%=producto.getDescripcion()%>" required> <br> <br>
		<br> <label>Edite el precio</label> <input type="text"
			name="precio" class="redondeado" value="<%=producto.getPrecio()%>"
			required> <br> <br> <br> <label>Edite
			el stock</label> <input type="text" name="stock" class="redondeado"
			value="<%=producto.getStock()%>" required> <br> <br>


		<br> <input type="hidden" name="id" value="<%=producto.getId()%>">
		<input type="submit" value="Editar">
	</form>
	<center>
		<a href="/productos"><img src="/lista.png" width="50" height="50"></a>
	</center>
</body>
</html>