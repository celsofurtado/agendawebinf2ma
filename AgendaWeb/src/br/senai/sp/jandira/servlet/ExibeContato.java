package br.senai.sp.jandira.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.senai.sp.jandira.dao.ContatoDao;
import br.senai.sp.jandira.modelo.Contato;

/**
 * Servlet implementation class ExibeContato
 */
@WebServlet("/ExibeContato")
public class ExibeContato extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExibeContato() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("Contato: " + request.getParameter("id"));
		
		int id = Integer.parseInt(request.getParameter("id"));
		ContatoDao cDao = new ContatoDao();
		Contato c = new Contato();
		c = cDao.getContato(id);
		
		request.setAttribute("contato", c);
		
		RequestDispatcher rd = request.getRequestDispatcher("editar_contato.jsp");
		rd.forward(request, response);
		
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
