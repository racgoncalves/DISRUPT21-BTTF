package br.com.fiap.tds.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.fiap.tds.bean.Comentario;
import br.com.fiap.tds.bean.Login;
import br.com.fiap.tds.bean.Personagem;
import br.com.fiap.tds.bo.LoginBo;
import br.com.fiap.tds.exception.AtualizacaoNaoRealizadaException;
import br.com.fiap.tds.exception.ItemNaoEncontradoException;
import br.com.fiap.tds.factory.ConnectionFactory;

/**
 * Classe responsável por acessar o banco de dados, realiza as operações básicas
 * (CRUD) dos dados do comentario
 * 
 * @author Rodrigo Chiarelli
 * @version 1.0
 */
public class ComentarioDao {

	// CADASTRAR >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

	/**
	 * Cadastra o comentario no banco de dados
	 * 
	 * @param comentario Objeto contendo o comentario
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public void cadastrar(Comentario comentario) throws ClassNotFoundException, SQLException {

		// Conexão com o banco de dados
		Connection conexao = ConnectionFactory.getConnection();

		// Cria a query para executar no banco
		PreparedStatement stmt = conexao.prepareStatement(
				"INSERT INTO T_BTTF_COMENTARIO (CD_COMENTARIO, CD_PERSONAGEM, CD_LOGIN, DS_COMENTARIO, DS_EMOCAO, "
						+ "TS_COMENTARIO) VALUES (SQ_BTTF_COMENTARIO.NEXTVAL,?,?,?,?,CURRENT_TIMESTAMP)");

		// Coloca os valores na query
		stmt.setInt(1, comentario.getPersonagem().getCodigo());
		stmt.setInt(2, comentario.getLogin().getCodigo());
		stmt.setString(3, comentario.getComentario());
		stmt.setString(4, comentario.getEmocao());

		// Executar a query
		stmt.executeUpdate();

		// Fechar a conexão
		stmt.close();
		conexao.close();

	}

	// PESQUISAR >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

	/**
	 * Recupera o comentario
	 * 
	 * @param codigoComentario Código do comentario
	 * @return comentario Objeto contendo o dados do comentario
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws ItemNaoEncontradoException
	 */
	public Comentario pesquisar(int codigo) throws ClassNotFoundException, SQLException, ItemNaoEncontradoException {

		Comentario comentario = null;

		// Conexão com o banco de dados
		Connection conexao = ConnectionFactory.getConnection();

		// Criar o PreparedStatement
		PreparedStatement stmt = conexao.prepareStatement("SELECT * FROM T_BTTF_COMENTARIO WHERE CD_COMENTARIO = ?");

		// Coloca os valores na query
		stmt.setInt(1, codigo);

		// Obter o resultado da pesquisa
		ResultSet resultado = stmt.executeQuery();

		// Verificar se encontrou resultado
		if (resultado.next()) {

			comentario = parse(resultado);

		}

		// Valida se encontrou os dados
		if (comentario == null)
			throw new ItemNaoEncontradoException("\nO comentário não foi encontrado");

		// Fechar a conexão
		stmt.close();
		conexao.close();

		return comentario;
	}

	/**
	 * Recupera todos os comentarios cadastrados
	 * 
	 * @param codigoComentario Código do comentario
	 * @return List<Comentario> Lista com todos os comentarios cadastrados
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws ItemNaoEncontradoException 
	 */
	public List<Comentario> listar(int codigo) throws ClassNotFoundException, SQLException, ItemNaoEncontradoException {

		List<Comentario> lista = new ArrayList<Comentario>();

		// Conexão com o banco de dados
		Connection conexao = ConnectionFactory.getConnection();

		// Criar o PreparedStatement
		PreparedStatement stmt = conexao.prepareStatement(
				"SELECT DISTINCT * FROM T_BTTF_COMENTARIO WHERE CD_PERSONAGEM = ? ORDER BY TS_COMENTARIO DESC");

		// Coloca os valores na query
		stmt.setInt(1, codigo);

		// Obter o resultado da pesquisa
		ResultSet resultado = stmt.executeQuery();

		while (resultado.next()) {

			Comentario comentario = parse(resultado);

			lista.add(comentario);
		}

		// Fechar a conexão
		stmt.close();
		conexao.close();

		return lista;
	}

	// ATUALIZAR >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

	/**
	 * Atualiza os dados do comentario
	 * 
	 * @param colaborador Objeto contendo os dados do colaborador
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws AtualizacaoNaoRealizadaException
	 */
	public void atualizar(Comentario comentario)
			throws ClassNotFoundException, SQLException, AtualizacaoNaoRealizadaException {

		// Conexão com o banco de dados
		Connection conexao = ConnectionFactory.getConnection();

		// Cria a query para executar no banco
		PreparedStatement stmt = conexao.prepareStatement(
				"UPDATE T_BTTF_COMENTARIO SET DS_COMENTARIO = ?, DS_EMOCAO = ? WHERE CD_COMENTARIO = ?");

		// Coloca os valores na query
		stmt.setString(1, comentario.getComentario());
		stmt.setString(2, comentario.getEmocao());
		stmt.setInt(3, comentario.getCodigo());

		// Executar a query
		int qtd = stmt.executeUpdate();

		// Valida se atualizou o dado
		if (qtd == 0)
			throw new AtualizacaoNaoRealizadaException();

		// Fechar a conexão
		stmt.close();
		conexao.close();

	}

	// REMOVER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

	/**
	 * Remove um comentario
	 * 
	 * @param codigo Código do comentario
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws ItemNaoEncontradoException
	 */
	public void remover(int codigo) throws ClassNotFoundException, SQLException, ItemNaoEncontradoException {

		// Conexão com o banco de dados
		Connection conexao = ConnectionFactory.getConnection();

		// Cria a query para executar no banco
		PreparedStatement stmt = conexao.prepareStatement("DELETE FROM T_BTTF_COMENTARIO WHERE CD_COMENTARIO = ?");

		// Coloca os valores na query
		stmt.setInt(1, codigo);

		// Executar a query
		int qtd = stmt.executeUpdate();

		// Valida se removeu alguma linha no banco de dados
		if (qtd == 0)
			throw new ItemNaoEncontradoException("\nO comentário não foi encontrado!");

		// Fechar a conexão
		stmt.close();
		conexao.close();

	}

	// OUTROS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

	/**
	 * Preenche a classe bean do comentario
	 * 
	 * @param resultado ResultSet com a pesquisa realizada
	 * @return comentario Objeto contendo o comentario
	 * @throws SQLException
	 * @throws ItemNaoEncontradoException 
	 * @throws ClassNotFoundException 
	 */
	private Comentario parse(ResultSet resultado) throws SQLException, ClassNotFoundException, ItemNaoEncontradoException {

		Comentario comentario = new Comentario();
		Personagem personagem = new Personagem();
		LoginBo loginBo = new LoginBo();
		Login login = new Login();
		
		login = loginBo.pesquisar(resultado.getInt("CD_LOGIN"));

		personagem.setCodigo(resultado.getInt("CD_PERSONAGEM"));
		
		comentario.setPersonagem(personagem);
		comentario.setLogin(login);
		comentario.setCodigo(resultado.getInt("CD_COMENTARIO"));
		comentario.setComentario(resultado.getString("DS_COMENTARIO"));
		comentario.setEmocao(resultado.getString("DS_EMOCAO"));
		comentario.setTimestamp(comentario.getDataHoraBD(resultado.getString("TS_COMENTARIO")));

		return comentario;

	}

}
