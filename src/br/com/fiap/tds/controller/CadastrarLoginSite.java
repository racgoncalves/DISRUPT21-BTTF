package br.com.fiap.tds.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.fiap.tds.bean.Login;
import br.com.fiap.tds.bo.LoginBo;

@WebServlet("/cadastrarLoginSite")
public class CadastrarLoginSite extends javax.servlet.http.HttpServlet {
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
		String apelido = request.getParameter("apelido");
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		int codigo = Integer.parseInt(request.getParameter("codigo"));

		try {

			// Pega os dados de login
			login = new Login(apelido, email, senha);

			// Cadastra no banco de dados
			loginBo.cadastrar(login);

			// Atualiza a página do personagem
			request.setAttribute("codigoLogin", login.getCodigo());
			request.setAttribute("codigo", codigo);
			request.getRequestDispatcher("x_BTTF_personagem.jsp").forward(request, response);

		} catch (Exception e) {

			// Colocando mensagem de erro na página
			request.setAttribute("erro", "Ação não concluída! " + e.getMessage());
			request.getRequestDispatcher("x_BTTF_personagem.jsp").forward(request, response);
		}

	}
}
