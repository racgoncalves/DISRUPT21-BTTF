package br.com.fiap.tds.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.fiap.tds.bean.Login;
import br.com.fiap.tds.bo.LoginBo;

@WebServlet("/cadastrarLogin")
public class CadastrarLogin extends javax.servlet.http.HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Arruma os caracteres
		request.setCharacterEncoding("UTF-8");

		// Classe Bean
		Login login = new Login();

		// Classe Bo
		LoginBo loginBo = new LoginBo();

		// Atributos
		String apelido = request.getParameter("apelidoCadastro");
		String email = request.getParameter("emailCadastro");
		String senha = request.getParameter("senhaCadastro");

		try {

			// Pega os dados de login
			login = new Login(apelido, email, senha);

			// Cadastra no banco de dados
			loginBo.cadastrar(login);

			// Atualiza a p�gina do login
			request.getRequestDispatcher("x_admin_2_logins.jsp").forward(request, response);

		} catch (Exception e) {

			// Colocando mensagem de erro na p�gina
			request.setAttribute("erro", "A��o n�o conclu�da! " + e.getMessage());
			request.getRequestDispatcher("x_admin_2_logins.jsp").forward(request, response);
		}

	}
}
