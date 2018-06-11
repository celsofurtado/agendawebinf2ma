<%@page import="br.senai.sp.jandira.dao.ContatoDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.senai.sp.jandira.modelo.Usuario"%>
<%@page import="br.senai.sp.jandira.modelo.Contato"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
	ArrayList<Contato> listaContatos = new ArrayList();

	Usuario u = new Usuario();
	u = (Usuario) session.getAttribute("usuario");

	if (u == null) {
		response.sendRedirect("login.html");
	} else {
		ContatoDao c = new ContatoDao();
		listaContatos = c.getContatos(u.getId());
%>
		<!DOCTYPE html>
		<html>
		<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Resposta da Servlet</title>
		<link href="css/bootstrap.css" rel="stylesheet">
		</head>
		<body>
		
			<!-- CABEÇALHO DA PÁGINA -->
			<header>
				<div class="navbar navbar-default">
					<div class="row">
						<div class="col-md-12">
							<h1 style="color: black"><img src="imagens/calendar.png" height="32px" width="32px" style="margin-right:10px;"><strong>UaiContatos</strong></h1>
						</div>
					</div>
				</div>
			</header>
			
			<!-- CONTEÚDO DA PÁGINA -->
			<div class="container">
				<div class="row">
					<div class="col-md-3">
						<div class="panel panel-primary">
  						<div class="panel-heading"><strong><img src="imagens/user24.png" height="24px" width="24px" style="margin-right:10px;">Usuário</strong></div>
  						<div class="panel-body">
    						<p><strong>Usuário: </strong><%= u.getNome() %>
    						<p><strong>Cidade: </strong><%= u.getCidade() %>
    						<p><strong>Dt. Nasc.: </strong><%= u.getDtNasc() %>
    						<p>
    							<a href="sair.jsp"><img src="imagens/sair32.png" height="24px" width="24px" style="margin-right:10px;">Efetuar Logout</a>
    						</p>
  						</div>
						</div>
						<div class="panel panel-primary">
  						<div class="panel-heading"><strong><img src="imagens/menu24.png" height="24px" width="24px" style="margin-right:10px;">Menu</strong></div>
  						<div class="panel-body">
    						<ul class="nav">
    							<li class="nav-item"><a href="index.jsp">Home</a></li>
    							<li class="nav-item"><a href="cadastrar_contato.jsp">Cadastrar Contato</a></li>
    						</ul>
  						</div>
						</div>
					
					</div>
					<div class="col-md-9">
						<div class="panel panel-primary">
  						<div class="panel-heading"><strong><img src="imagens/users48.png" height="24px" width="24px" style="margin-right:10px;">Meus Contatos</strong></div>
  						<div class="panel-body">
    						<table class="table table-hover">
    							<thead>
    								<tr>
    									<th>ID</th>
    									<th>Nome</th>
    									<th>E-mail</th>
    									<th></th>
    									<th></th>
    								</tr>
    							</thead>
    							
    							<% for (Contato contato : listaContatos){ %>
    							
    								<tr>
    									<td><%= contato.getId() %>
    									<td><%= contato.getNome() %>
    									<td><%= contato.getEmail() %>
    									<td><a href="editar_contato.jsp?id=<%= contato.getId() %>"><img src="imagens/userEdit32.png" height="24px" width="24px"></a></td>
    									<td><a href="excluir_contato.jsp?id=<%= contato.getId() %>"><img src="imagens/userDelete32.png" height="24px" width="24px"></a></td>
    								</tr>
    							
    							<% } %>
    							
    						</table>
  						</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- RODAPÉ DA PÁGINA -->
			<footer>
				<div class="navbar navbar-default">
					<div class="row">
						<div class="col-md-12">
							<p><h3></h3>&copy; CelSoft - 2018</h3></p>
						</div>
					</div>
				</div>
			</footer>
		
		</body>
		</html>

<%
	}
%>







