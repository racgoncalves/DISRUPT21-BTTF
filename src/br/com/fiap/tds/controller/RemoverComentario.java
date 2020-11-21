package br.com.fiap.tds.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.fiap.tds.bo.ComentarioBo;

@WebServlet("/removerComentario")
public class RemoverComentario extends javax.servlet.http.HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ComentarioBo comentarioBo = new ComentarioBo();
		
		int codigoPersonagem = Integer.parseInt(request.getParameter("codigoPersonagem"));
		int codigo = Integer.parseInt(request.getParameter("codigo"));

		try {

			comentarioBo.remover(codigo);
			
			// Envia para a página de comentários
			request.setAttribute("codigo", codigoPersonagem);
			request.getRequestDispatcher("x_admin_2_comentarios.jsp").forward(request, response);

		} catch (Exception e) {
			// Colocando mensagem de erro na página
			request.setAttribute("codigo", codigoPersonagem);
			request.setAttribute("erro", e.getMessage());
			request.getRequestDispatcher("x_admin_2_comentarios.jsp").forward(request, response);
		}
	}
}
