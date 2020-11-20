package br.com.fiap.tds.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.fiap.tds.bean.Login;
import br.com.fiap.tds.bo.LoginBo;

@WebServlet("/atualizarLogin")
public class AtualizarLogin extends javax.servlet.http.HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Arruma os caracteres
		request.setCharacterEncoding("UTF-8");

		// Classe Bean
		Login login = new Login();

		// Classe Bo
		LoginBo loginBo = new LoginBo();

		try {

			// Atributos
			int codigo = Integer.parseInt(request.getParameter("codigo"));

			// Carrega o colaborador
			login = loginBo.pesquisar(codigo);

			String apelido = request.getParameter("apelido");
			if (apelido != null && !apelido.isEmpty()) {
				login.setApelido(apelido);
			}

			String email = request.getParameter("email");
			if (email != null && !email.isEmpty()) {
				login.setEmail(email);
			}

			String senha = request.getParameter("senha");
			if (senha != null && !senha.isEmpty()) {
				login.setSenha(senha);
			}

			// Cadastra no banco de dados
			loginBo.atualizar(login);

			// Atualiza a p�gina do login
			request.getRequestDispatcher("x_admin_3_atualizar_login.jsp").forward(request, response);

		} catch (Exception e) {

			// Colocando mensagem de erro na p�gina
			request.setAttribute("erro", "A��o n�o conclu�da! " + e.getMessage());
			request.getRequestDispatcher("x_admin_3_atualizar_login.jsp").forward(request, response);
		}

	}
}
