package br.com.fiap.tds.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.fiap.tds.bean.Personagem;
import br.com.fiap.tds.bo.PersonagemBo;

@WebServlet("/cadastrarPersonagem")
public class CadastrarPersonagem extends javax.servlet.http.HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Arruma os caracteres
		request.setCharacterEncoding("UTF-8");

		// Classe Bean
		Personagem personagem = new Personagem();

		// Classe Bo
		PersonagemBo personagemBo = new PersonagemBo();

		// Atributos
		String nomePersonagem = request.getParameter("nomePersonagem");
		
		int idadePresente = 0;
		int idadePassado = 0;
		
		String getIdadePresente = request.getParameter("idadePresente");
		if (getIdadePresente != null && !getIdadePresente.isEmpty()
				&& !getIdadePresente.isBlank())
			idadePresente = Integer.parseInt(getIdadePresente);
		
		String getIdadePassado = request.getParameter("idadePassado");		
		if (getIdadePassado != null && !getIdadePassado.isEmpty()
				&& !getIdadePassado.isBlank())		
			idadePassado = Integer.parseInt(getIdadePassado);
		String descricao = request.getParameter("descricao");
		String nomeAtor = request.getParameter("nomeAtor");
		String dataNascimento = request.getParameter("dataNascimento");

		try {

			// Envia os dados para a classe bean
			personagem = new Personagem(nomePersonagem, idadePresente, idadePassado, descricao, nomeAtor,
					dataNascimento);

			// Cadastra no banco de dados
			personagemBo.cadastrar(personagem);

			// Leva para a página de personagens
			request.getRequestDispatcher("x_admin_2_personagens.jsp").forward(request, response);

		} catch (Exception e) {

			// Colocando mensagem de erro na página
			request.setAttribute("erro", "Ação não concluída! " + e.getMessage());
			request.getRequestDispatcher("x_admin_2_personagens.jsp").forward(request, response);
		}

	}
}
