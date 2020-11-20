package br.com.fiap.tds.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.fiap.tds.bean.Login;
import br.com.fiap.tds.bo.LoginBo;

@WebServlet("/logarSite")
public class LoginSite extends javax.servlet.http.HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Classe Bean
		Login login = new Login();

		// Classe Bo
		LoginBo loginBo = new LoginBo();

		// Atributos
		int codigo = Integer.parseInt(request.getParameter("codigo"));
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");

		try {

			// Testa o login
			login = loginBo.pesquisar(email, senha);

			// Leva para a página do personagem
			request.setAttribute("codigoLogin", login.getCodigo());
			request.setAttribute("codigo", codigo);
			request.getRequestDispatcher("x_BTTF_personagem.jsp").forward(request, response);

		} catch (Exception e) {

			// Colocando mensagem de erro na página
			request.setAttribute("codigo", codigo);
			request.setAttribute("erro", "Ação não concluída! " + e.getMessage());
			request.getRequestDispatcher("x_BTTF_personagem.jsp").forward(request, response);

		}
	}
}
