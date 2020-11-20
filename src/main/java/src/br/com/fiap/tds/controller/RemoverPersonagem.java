package br.com.fiap.tds.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.fiap.tds.bo.PersonagemBo;

@WebServlet("/removerPersonagem")
public class RemoverPersonagem extends javax.servlet.http.HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PersonagemBo personagemBo = new PersonagemBo();

		int codigo = Integer.parseInt(request.getParameter("codigo"));

		try {

			personagemBo.remover(codigo);
			request.getRequestDispatcher("x_admin_2_personagens.jsp").forward(request, response);

		} catch (Exception e) {
			// Colocando mensagem de erro na p�gina
			request.setAttribute("erro", e.getMessage());
			request.getRequestDispatcher("x_admin_2_personagens.jsp").forward(request, response);
		}
	}
}