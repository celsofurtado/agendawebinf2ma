package br.senai.sp.jandira.dbutils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {

	private static Connection con;
	
	public static Connection getConexao(){
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String dbUrl = "jdbc:mysql://10.107.134.3:3306/agenda?useSSL=false";
			con = DriverManager.getConnection(dbUrl, "root", "bcd127");
			System.out.println("Banco Conectado!");
		} catch (SQLException erroBanco){
			erroBanco.printStackTrace();
			System.out.println("Banco NÃO Conectado!");
		} catch (Exception erro){
			erro.printStackTrace();
			System.out.println("Banco NÃO Conectado!");
		}
		
		return con;
	}
	
}
