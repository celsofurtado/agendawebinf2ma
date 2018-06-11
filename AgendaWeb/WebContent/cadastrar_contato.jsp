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
		
			<!-- CABE�ALHO DA P�GINA -->
			<header>
				<div class="navbar navbar-default">
					<div class="row">
						<div class="col-md-12">
							<h1 style="color: black"><img src="imagens/calendar.png" height="32px" width="32px" style="margin-right:10px;"><strong>UaiContatos</strong></h1>
						</div>
					</div>
				</div>
			</header>
			
			<!-- CONTE�DO DA P�GINA -->
			<div class="container">
				<div class="row">
					<div class="col-md-3">
						<div class="panel panel-primary">
  						<div class="panel-heading"><strong><img src="imagens/user24.png" height="24px" width="24px" style="margin-right:10px;">Usu�rio</strong></div>
  						<div class="panel-body">
    						<p><strong>Usu�rio: </strong><%= u.getNome() %>
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
    							<li class="nav-item"><a href="#">Cadastrar Contato</a></li>
    						</ul>
  						</div>
						</div>
					
					</div>
					<div class="col-md-9">
						<div class="panel panel-primary">
  						<div class="panel-heading"><strong><img src="imagens/users48.png" height="24px" width="24px" style="margin-right:10px;">Cadastrar contato:</strong></div>
  						<div class="panel-body">
    						<!-- FORMUL�RIO DE CADASTRO DE CONTATOS -->
    						<form method="POST" action="GravarContato">
    							<!-- LINHA 01 -->
    							<fieldset>
    								<legend>Dados gerais:</legend>
    								<div class="form-row">
    									<div class="form-group col-md-6">
    										<label for="txtNome">Nome:</label>
    										<input type="text" name="txtNome" class="form-control">
    									</div>
    									<div class="form-group col-md-3">
    										<label for="txtDtNasc">Dt. Nasc.:</label>
    										<input type="date" name="txtDtNasc" class="form-control">
    									</div>
    									<div class="form-group col-md-3">
    										<label for="cbSexo">Sexo:</label>
    										<select name="cbSexo" class="form-control">
    											<option value="s">Selecione</option>
    											<option value="f">Feminino</option>
    											<option value="m">Masculino</option>
    										</select>
    									</div>
    								
    								</div>
    							</fieldset>
    							<!-- LINHA 02 -->
    							<fieldset>
    								<legend>Dados de contato:</legend>
    								<div class="form-row">
    									<div class="form-group col-md-6">
    										<label for="txtEmail">E-mail:</label>
    										<input type="mail" name="txtEmail" class="form-control">
    									</div>
    									<div class="form-group col-md-3">
    										<label for="txtTelefone">Telefone:</label>
    										<input type="text" name="txtTelefone" class="form-control">
    									</div>
    									<div class="form-group col-md-3">
    										<label for="txtCelular">Celular:</label>
    										<input type="text" name="txtCelular" class="form-control">
    									</div>
    								
    								</div>
    							</fieldset>
    							<!-- LINHA 03 -->
    							<fieldset>
    								<legend>Dados de endere�o:</legend>
    								<div class="form-row">
    									<div class="form-group col-md-8">
    										<label for="txtLogradouro">Logradouro:</label>
    										<input type="text" name="txtLogradouro" class="form-control">
    									</div>
    									<div class="form-group col-md-4">
    										<label for="txtBairro">Bairro:</label>
    										<input type="text" name="txtTelefone" class="form-control">
    									</div>    								
    								</div>
    								<div class="form-row">
    									<div class="form-group col-md-6">
    										<label for="txtCidade">Cidade:</label>
    										<input type="text" name="txtCidade" class="form-control">
    									</div>
    									<div class="form-group col-md-3">
    										<label for="txtEstado">Estado:</label>
    										<input type="text" name="txtEstado" class="form-control">
    									</div>  
    									<div class="form-group col-md-3">
    										<label for="txtCep">CEP:</label>
    										<input type="text" name="txtCep" class="form-control">
    									</div>   								
    								</div>
    							</fieldset>
    						<hr>
							<div class="form-row">
								<div class="col-md-12">
									<input type="submit" value=">> Salvar" class="btn btn-success" />
									<input type="reset" value=">> Limpar" class="btn btn-warning" />
									<a href="login.html" class="btn btn-danger">>> Cancelar</a>
								</div>
							</div>	
    						</form>
  						</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- RODAP� DA P�GINA -->
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







