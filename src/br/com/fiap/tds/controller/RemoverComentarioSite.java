package br.com.fiap.tds.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.fiap.tds.bo.ComentarioBo;

@WebServlet("/removerComentarioSite")
public class RemoverComentarioSite extends javax.servlet.http.HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ComentarioBo comentarioBo = new ComentarioBo();

		int codigoComentario = Integer.parseInt(request.getParameter("codigoComentario"));
		int codigoLogin = Integer.parseInt(request.getParameter("codigoLogin"));
		int codigoPersonagem = Integer.parseInt(request.getParameter("codigoPersonagem"));

		try {

			comentarioBo.remover(codigoComentario);

			// Leva para a página do personagem
			request.setAttribute("codigo", codigoPersonagem);
			request.setAttribute("codigoLogin", codigoLogin);
			request.getRequestDispatcher("x_BTTF_personagem.jsp").forward(request, response);

		} catch (Exception e) {
			// Colocando mensagem de erro na página
			request.setAttribute("erro", e.getMessage());
			request.getRequestDispatcher("erro.jsp").forward(request, response);
		}
	}
}
