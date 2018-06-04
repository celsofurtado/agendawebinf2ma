<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%

	//Teste de recuperação de valores via request

	String email = request.getParameter("txtEmail");
	String senha = request.getParameter("txtSenha");
	String frase = (String) request.getAttribute("frase");
	
	

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
	<h3>E-mail: <%= email %></h3>
	<h3>Senha: <%= senha %></h3>
	<h3>A frase é: <%= frase %></h3>

</body>
</html>