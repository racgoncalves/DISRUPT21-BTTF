package br.com.fiap.tds.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.fiap.tds.bean.Personagem;
import br.com.fiap.tds.bo.PersonagemBo;

@WebServlet("/atualizarPersonagem")
public class AtualizarPersonagem extends javax.servlet.http.HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Arruma os caracteres
		request.setCharacterEncoding("UTF-8");

		// Classe Bean
		Personagem personagem = new Personagem();

		// Classe Bo
		PersonagemBo personagemBo = new PersonagemBo();

		try {

			// Atributos
			int codigo = Integer.parseInt(request.getParameter("codigo"));

			// Carrega o personagem
			personagem = personagemBo.pesquisar(codigo);

			String nomePersonagem = request.getParameter("nomePersonagem");
			if (nomePersonagem != null && !nomePersonagem.isEmpty() && !nomePersonagem.isBlank()) {
				personagem.setNomePersonagem(nomePersonagem);
			}

			String idadePresente = request.getParameter("idadePresente");
			if (idadePresente != null && !idadePresente.isEmpty() && !idadePresente.isBlank()) {
				personagem.setIdadePresente(Integer.parseInt(idadePresente));
			}

			String idadePassado = request.getParameter("idadePassado");
			if (idadePassado != null && !idadePassado.isEmpty() && !idadePassado.isBlank()) {
				personagem.setIdadePassado(Integer.parseInt(idadePassado));
			}

			String descricao = request.getParameter("descricao");
			if (descricao != null && !descricao.isEmpty() && !descricao.isBlank()) {
				personagem.setDescricao(descricao);
			}

			String nomeAtor = request.getParameter("nomeAtor");
			if (nomeAtor != null && !nomeAtor.isEmpty() && !nomeAtor.isBlank()) {
				personagem.setNomeAtor(nomeAtor);
			}

			String dataNascimento = request.getParameter("dataNascimento");
			if (dataNascimento != null && !dataNascimento.isEmpty() && !dataNascimento.isBlank()) {
				personagem.setDataNascimento(dataNascimento);
			}

			// Cadastra no banco de dados
			personagemBo.atualizar(personagem);

			// Atualiza a página do personagem
			request.getRequestDispatcher("x_admin_3_atualizar_pers.jsp").forward(request, response);

		} catch (Exception e) {

			// Colocando mensagem de erro na página
			request.setAttribute("erro", "Ação não concluída! " + e.getMessage());
			request.getRequestDispatcher("x_admin_3_atualizar_pers.jsp").forward(request, response);
		}

	}
}
