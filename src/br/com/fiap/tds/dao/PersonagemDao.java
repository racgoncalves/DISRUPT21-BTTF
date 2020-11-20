package br.com.fiap.tds.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.com.fiap.tds.bean.Personagem;
import br.com.fiap.tds.exception.AtualizacaoNaoRealizadaException;
import br.com.fiap.tds.exception.ItemNaoEncontradoException;
import br.com.fiap.tds.factory.ConnectionFactory;

/**
 * Classe responsável por acessar o banco de dados, realiza as operações básicas
 * (CRUD) dos dados do personagem
 * 
 * @author Rodrigo Chiarelli
 * @version 1.0
 */
public class PersonagemDao {

	// CADASTRAR >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

	/**
	 * Cadastra o personagem no banco de dados
	 * 
	 * @param personagem Objeto contendo o personagem
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public void cadastrar(Personagem personagem) throws ClassNotFoundException, SQLException {

		// Conexão com o banco de dados
		Connection conexao = ConnectionFactory.getConnection();

		// Cria a query para executar no banco
		PreparedStatement stmt = conexao
				.prepareStatement("INSERT INTO T_BTTF_PERSONAGEM (CD_PERSONAGEM, NM_PERSONAGEM, NR_IDADE_PRESENTE, "
						+ "NR_IDADE_PASSADO, DS_PERSONAGEM, NM_ATOR, DT_NASCIMENTO) "
						+ "VALUES (SQ_BTTF_PERSONAGEM.NEXTVAL,?,?,?,?,?,?)");

		// Coloca os valores na query
		stmt.setString(1, personagem.getNomePersonagem());
		stmt.setInt(2, personagem.getIdadePresente());
		stmt.setInt(3, personagem.getIdadePassado());
		stmt.setString(4, personagem.getDescricao());
		stmt.setString(5, personagem.getNomeAtor());
		stmt.setString(6, personagem.getDataNascimento());

		// Executar a query
		stmt.executeUpdate();

		// Fechar a conexão
		stmt.close();
		conexao.close();

	}

	// PESQUISAR >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

	/**
	 * Recupera os dados do personagem
	 * 
	 * @param codigo Codigo do personagem
	 * @return personagem Objeto contendo o personagem
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws ItemNaoEncontradoException
	 */
	public Personagem pesquisar(int codigo) throws ClassNotFoundException, SQLException, ItemNaoEncontradoException {

		Personagem personagem = null;

		// Conexão com o banco de dados
		Connection conexao = ConnectionFactory.getConnection();

		// Criar o PreparedStatement
		PreparedStatement stmt = conexao.prepareStatement("SELECT * FROM T_BTTF_PERSONAGEM WHERE CD_PERSONAGEM = ?");

		// Coloca os valores na query
		stmt.setInt(1, codigo);

		// Obter o resultado da pesquisa
		ResultSet resultado = stmt.executeQuery();

		// Verificar se encontrou resultado
		if (resultado.next()) {

			personagem = parse(resultado);

		}

		// Valida se encontrou os dados
		if (personagem == null)
			throw new ItemNaoEncontradoException("\nO personagem não foi encontrado");

		// Fechar a conexão
		stmt.close();
		conexao.close();

		return personagem;
	}

	/**
	 * Recupera todos os personagens cadastrados
	 * 
	 * @return List<Personagem> Lista com todos os personagens cadastrados
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public List<Personagem> listar() throws ClassNotFoundException, SQLException {

		List<Personagem> lista = new ArrayList<Personagem>();

		// Conexão com o banco de dados
		Connection conexao = ConnectionFactory.getConnection();

		// Criar o objeto para executar um comando SQL
		Statement stmt = conexao.createStatement();

		// Realizar a pesquisa de todos os personagens
		ResultSet resultado = stmt.executeQuery("SELECT * FROM T_BTTF_PERSONAGEM");

		while (resultado.next()) {

			Personagem personagem = parse(resultado);

			lista.add(personagem);
		}

		// Fechar a conexão
		stmt.close();
		conexao.close();

		return lista;
	}	

	// ATUALIZAR >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

	/**
	 * Atualiza os dados do personagem
	 * 
	 * @param personagem Objeto contendo os dados do personagem
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws AtualizacaoNaoRealizadaException
	 */
	public void atualizar(Personagem personagem)
			throws ClassNotFoundException, SQLException, AtualizacaoNaoRealizadaException {

		// Conexão com o banco de dados
		Connection conexao = ConnectionFactory.getConnection();

		// Cria a query para executar no banco
		PreparedStatement stmt = conexao.prepareStatement(
				"UPDATE T_BTTF_PERSONAGEM SET NM_PERSONAGEM = ?, NR_IDADE_PRESENTE = ?, NR_IDADE_PASSADO = ?, "
						+ "DS_PERSONAGEM = ?, NM_ATOR = ?, DT_NASCIMENTO = ? WHERE CD_PERSONAGEM = ?");

		// Coloca os valores na query
		stmt.setString(1, personagem.getNomePersonagem());
		stmt.setInt(2, personagem.getIdadePresente());
		stmt.setInt(3, personagem.getIdadePassado());
		stmt.setString(4, personagem.getDescricao());
		stmt.setString(5, personagem.getNomeAtor());
		stmt.setString(6, personagem.getDataNascimento());
		stmt.setInt(7, personagem.getCodigo());

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
	 * Remove um personagem
	 * 
	 * @param codigo Código do personagem
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws ItemNaoEncontradoException
	 */
	public void remover(int codigo) throws ClassNotFoundException, SQLException, ItemNaoEncontradoException {

		// Conexão com o banco de dados
		Connection conexao = ConnectionFactory.getConnection();

		// Cria a query para executar no banco
		PreparedStatement stmt = conexao.prepareStatement("DELETE FROM T_BTTF_PERSONAGEM WHERE CD_PERSONAGEM = ?");

		// Coloca os valores na query
		stmt.setInt(1, codigo);

		// Executar a query
		int qtd = stmt.executeUpdate();

		// Valida se removeu alguma linha no banco de dados
		if (qtd == 0)
			throw new ItemNaoEncontradoException("\nO personagem não foi encontrado!");

		// Fechar a conexão
		stmt.close();
		conexao.close();

	}

	// OUTROS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

	/**
	 * Preenche a classe bean do personagem
	 * 
	 * @param resultado ResultSet com a pesquisa realizada
	 * @return personagem Objeto contendo os dados do personagem
	 * @throws SQLException
	 */
	private Personagem parse(ResultSet resultado) throws SQLException {

		Personagem personagem = new Personagem();

		personagem.setCodigo(resultado.getInt("CD_PERSONAGEM"));
		personagem.setNomePersonagem(resultado.getString("NM_PERSONAGEM"));
		personagem.setIdadePresente(resultado.getInt("NR_IDADE_PRESENTE"));
		personagem.setIdadePassado(resultado.getInt("NR_IDADE_PASSADO"));
		personagem.setDescricao(resultado.getString("DS_PERSONAGEM"));
		personagem.setNomeAtor(resultado.getString("NM_ATOR"));
		personagem.setDataNascimento(personagem.getDataBD(resultado.getString("DT_NASCIMENTO")));

		return personagem;

	}

}
