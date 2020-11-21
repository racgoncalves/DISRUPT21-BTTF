package br.com.fiap.tds.controller;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.LineNumberReader;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.fiap.tds.bean.Comentario;
import br.com.fiap.tds.bean.Login;
import br.com.fiap.tds.bean.Personagem;
import br.com.fiap.tds.bo.ComentarioBo;

@WebServlet("/cadastrarComentario")
public class CadastrarComentario extends javax.servlet.http.HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Arruma os caracteres
		request.setCharacterEncoding("UTF-8");

		// Classe Bean
		Comentario comentario = new Comentario();
		Personagem personagem = new Personagem();
		Login login = new Login();

		// Classe Bo
		ComentarioBo comentarioBo = new ComentarioBo();

		String path = this.getServletContext().getRealPath("/WEB-INF/Python/mineracaoBTTF.py");

		// Atributos
		int codigo = Integer.parseInt(request.getParameter("codigo"));
		int codigoLogin = Integer.parseInt(request.getParameter("codigoLogin"));
		String texto = request.getParameter("comentario");

		// Enviando parametros ao script python
		try {
			String[] params = new String[] { "python3", path, texto };
			Process proc = Runtime.getRuntime().exec(params); // Execute the py file
			InputStreamReader stdin = new InputStreamReader(proc.getInputStream());
			LineNumberReader input = new LineNumberReader(stdin);
			String emocao = input.readLine();

			// Coloca codigo no personagem
			personagem.setCodigo(codigo);

			// Coloca codigo no login
			login.setCodigo(codigoLogin);

			// Envia os dados para a classe bean
			comentario = new Comentario(personagem, login, texto, emocao);

			// Cadastra no banco de dados
			comentarioBo.cadastrar(comentario);

			// Leva para a página do personagem
			request.setAttribute("codigo", codigo);
			request.setAttribute("codigoLogin", codigoLogin);
			request.getRequestDispatcher("x_BTTF_personagem.jsp").forward(request, response);

		} catch (Exception e) {

			// Colocando mensagem de erro na página
			request.setAttribute("codigo", codigo);
			request.setAttribute("codigoLogin", codigoLogin);
			request.setAttribute("erro", "Ação não concluída! " + e.getMessage());
			request.getRequestDispatcher("x_BTTF_personagem.jsp").forward(request, response);
		}

	}
}
