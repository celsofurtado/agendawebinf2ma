<%@page import="br.senai.sp.jandira.modelo.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
	Usuario u = new Usuario();
	u = (Usuario) session.getAttribute("usuario");
	
	if (u == null){
		response.sendRedirect("login.html");
	} else {
	
%>
		<!DOCTYPE html>
		<html>
		<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Resposta da Servlet</title>
		<link href="css/bootstrap.css" rel="stylesheet">
		</head>
		<body>
		
			<h1>Resultado:</h1>
			<h3>Nome: <%= u.getNome() %></h3>
			<h3>E-mail: <%= u.getEmail() %></h3>
			<h3>Senha: <%= u.getSenha() %></h3>
			<h3>Cidade: <%= u.getCidade() %></h3>
		
		</body>
		</html>

<% } %>