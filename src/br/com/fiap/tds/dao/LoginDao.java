package br.com.fiap.tds.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.com.fiap.tds.bean.Login;
import br.com.fiap.tds.exception.AtualizacaoNaoRealizadaException;
import br.com.fiap.tds.exception.DadoInvalidoException;
import br.com.fiap.tds.exception.ItemNaoEncontradoException;
import br.com.fiap.tds.factory.ConnectionFactory;

/**
 * Classe responsável por acessar o banco de dados e realizar as operações
 * básicas (CRUD) de login
 * 
 * @author Rodrigo Chiarelli
 * @version 1.0
 */
public class LoginDao {

	// CADASTRAR >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

	/**
	 * Cadastra um login no banco de dados
	 * 
	 * @param colaborador
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public void cadastrar(Login login) throws ClassNotFoundException, SQLException {

		// Conexão com o banco de dados
		Connection conexao = ConnectionFactory.getConnection();

		// Cria a query para executar no banco
		PreparedStatement stmt = conexao.prepareStatement("INSERT INTO T_BTTF_LOGIN"
				+ " (CD_LOGIN, NM_APELIDO, NM_EMAIL, NM_SENHA)" + " VALUES (SQ_BTTF_LOGIN.NEXTVAL, ?, ?, ?)",
				new String[] { "CD_LOGIN" });

		// Coloca os valores na query
		stmt.setString(1, login.getApelido());
		stmt.setString(2, login.getEmail());
		stmt.setString(3, login.getSenha());

		// Executar a query
		stmt.executeUpdate();

		// Recuperar a PK gerada no insert
		ResultSet chave = stmt.getGeneratedKeys();
		if (chave.next()) {
			int codigo = chave.getInt(1);
			login.setCodigo(codigo);
		}

		// Fechar a conexão
		stmt.close();
		conexao.close();

	}

	// PESQUISAR >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

	/**
	 * Recupera o login
	 * 
	 * @param email E-mail de login
	 * @param senha Senha de login
	 * @return boolean
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws DadoInvalidoException
	 */
	public Login pesquisar(String email, String senha)
			throws ClassNotFoundException, SQLException, DadoInvalidoException {

		Login login = null;

		// Conexão com o banco de dados
		Connection conexao = ConnectionFactory.getConnection();

		// Cria a query para executar no banco
		PreparedStatement stmt = conexao
				.prepareStatement("SELECT * FROM T_BTTF_LOGIN WHERE NM_EMAIL = ? AND NM_SENHA = ?");

		// Coloca os valores na query
		stmt.setString(1, email);
		stmt.setString(2, senha);

		// Obter o resultado da pesquisa
		ResultSet resultado = stmt.executeQuery();

		// Verificar se encontrou resultado
		if (resultado.next()) {

			login = parse(resultado);

		}

		// Valida se encontrou o login
		if (login == null)
			throw new DadoInvalidoException("\nO e-mail ou senha estão incorretos!");

		// Fechar a conexão
		stmt.close();
		conexao.close();

		return login;
	}

	/**
	 * Recupera um login pelo codigo
	 * 
	 * @param codigo Código de login
	 * @return login Objeto com os dados de login
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws ItemNaoEncontradoException
	 */
	public Login pesquisar(int codigo) throws ClassNotFoundException, SQLException, ItemNaoEncontradoException {

		Login login = null;

		// Conexão com o banco de dados
		Connection conexao = ConnectionFactory.getConnection();

		// Criar o PreparedStatement
		PreparedStatement stmt = conexao.prepareStatement("SELECT * FROM T_BTTF_LOGIN WHERE CD_LOGIN = ?");

		// Coloca os valores na query
		stmt.setInt(1, codigo);

		// Obter o resultado da pesquisa
		ResultSet resultado = stmt.executeQuery();

		// Verificar se encontrou resultado
		if (resultado.next()) {

			login = parse(resultado);

		}

		// Valida se encontrou o colaborador
		if (login == null)
			throw new ItemNaoEncontradoException("\nO login não foi encontrado!");

		// Fechar a conexão
		stmt.close();
		conexao.close();

		return login;
	}

	/**
	 * Recupera um login pelo email
	 * 
	 * @param email E-mail de login
	 * @return login Objeto com os dados de login
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws ItemNaoEncontradoException
	 */
	public Login pesquisar(String email) throws ClassNotFoundException, SQLException, ItemNaoEncontradoException {

		Login login = null;

		// Conexão com o banco de dados
		Connection conexao = ConnectionFactory.getConnection();

		// Criar o PreparedStatement
		PreparedStatement stmt = conexao.prepareStatement("SELECT * FROM T_BTTF_LOGIN WHERE NM_EMAIL = ?");

		// Coloca os valores na query
		stmt.setString(1, email);

		// Obter o resultado da pesquisa
		ResultSet resultado = stmt.executeQuery();

		// Verificar se encontrou resultado
		if (resultado.next()) {

			login = parse(resultado);

		}

		// Valida se encontrou o login
		if (login == null)
			throw new ItemNaoEncontradoException("\nO login não foi encontrado!");

		// Fechar a conexão
		stmt.close();
		conexao.close();

		return login;
	}

	/**
	 * Recupera todos os logins cadastrados
	 * 
	 * @return List<Login> Lista com todos os logins cadastrados
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public List<Login> listar() throws ClassNotFoundException, SQLException {

		List<Login> lista = new ArrayList<Login>();

		// Conexão com o banco de dados
		Connection conexao = ConnectionFactory.getConnection();

		// Criar o objeto para executar um comando SQL
		Statement stmt = conexao.createStatement();

		// Realizar a pesquisa de todos os funcionários
		ResultSet resultado = stmt.executeQuery("SELECT * FROM T_BTTF_LOGIN ORDER BY NM_APELIDO");

		while (resultado.next()) {

			Login login = parse(resultado);

			lista.add(login);
		}

		// Fechar a conexão
		stmt.close();
		conexao.close();

		return lista;
	}

	/**
	 * Verifica se o email já foi cadastrado
	 * 
	 * @param email Email de login
	 * @return boolean
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public boolean isEmailCadastrado(String email) throws ClassNotFoundException, SQLException {

		boolean x = false;

		// Conexão com o banco de dados
		Connection conexao = ConnectionFactory.getConnection();

		// Criar o PreparedStatement
		PreparedStatement stmt = conexao.prepareStatement("SELECT CD_LOGIN FROM T_BTTF_LOGIN WHERE NM_EMAIL = ?");

		// Coloca os valores na query
		stmt.setString(1, email);

		// Obter o resultado da pesquisa
		ResultSet resultado = stmt.executeQuery();

		// Verificar se encontrou resultado
		if (resultado.next()) {

			x = true;

		}

		// Fechar a conexão
		stmt.close();
		conexao.close();

		return x;
	}

	/**
	 * Verifica se o email é o mesmo para atualizar
	 * 
	 * @param email  Email do login
	 * @param codigo Código do login
	 * @return boolean
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public boolean isMesmoEmail(String email, int codigo) throws ClassNotFoundException, SQLException {

		boolean x = false;

		// Conexão com o banco de dados
		Connection conexao = ConnectionFactory.getConnection();

		// Criar o PreparedStatement
		PreparedStatement stmt = conexao
				.prepareStatement("SELECT CD_LOGIN FROM T_BTTF_LOGIN WHERE NM_EMAIL = ? AND CD_LOGIN = ?");

		// Coloca os valores na query
		stmt.setString(1, email);
		stmt.setInt(2, codigo);

		// Obter o resultado da pesquisa
		ResultSet resultado = stmt.executeQuery();

		// Verificar se encontrou resultado
		if (resultado.next()) {

			x = true;

		}

		// Fechar a conexão
		stmt.close();
		conexao.close();

		return x;
	}

	/**
	 * Verifica se o apelido já foi cadastrado
	 * 
	 * @param apelido Apelido de login
	 * @return boolean
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public boolean isApelidoCadastrado(String apelido) throws ClassNotFoundException, SQLException {

		boolean x = false;

		// Conexão com o banco de dados
		Connection conexao = ConnectionFactory.getConnection();

		// Criar o PreparedStatement
		PreparedStatement stmt = conexao.prepareStatement("SELECT CD_LOGIN FROM T_BTTF_LOGIN WHERE NM_APELIDO = ?");

		// Coloca os valores na query
		stmt.setString(1, apelido);

		// Obter o resultado da pesquisa
		ResultSet resultado = stmt.executeQuery();

		// Verificar se encontrou resultado
		if (resultado.next()) {

			x = true;

		}

		// Fechar a conexão
		stmt.close();
		conexao.close();

		return x;
	}

	/**
	 * Verifica se o apelido é o mesmo para atualizar
	 * 
	 * @param apelido Apelido do login
	 * @param codigo  Código do login
	 * @return boolean
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public boolean isMesmoApelido(String apelido, int codigo) throws ClassNotFoundException, SQLException {

		boolean x = false;

		// Conexão com o banco de dados
		Connection conexao = ConnectionFactory.getConnection();

		// Criar o PreparedStatement
		PreparedStatement stmt = conexao
				.prepareStatement("SELECT CD_LOGIN FROM T_BTTF_LOGIN WHERE NM_APELIDO = ? AND CD_LOGIN = ?");

		// Coloca os valores na query
		stmt.setString(1, apelido);
		stmt.setInt(2, codigo);

		// Obter o resultado da pesquisa
		ResultSet resultado = stmt.executeQuery();

		// Verificar se encontrou resultado
		if (resultado.next()) {

			x = true;

		}

		// Fechar a conexão
		stmt.close();
		conexao.close();

		return x;
	}

	// ATUALIZAR >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

	/**
	 * Atualiza um login no banco de dados
	 * 
	 * @param login Objeto contendo os dados de um login
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws AtualizacaoNaoRealizadaException
	 */
	public void atualizar(Login login) throws ClassNotFoundException, SQLException, AtualizacaoNaoRealizadaException {

		// Conexão com o banco de dados
		Connection conexao = ConnectionFactory.getConnection();

		// Cria a query para executar no banco
		PreparedStatement stmt = conexao.prepareStatement(
				"UPDATE T_BTTF_LOGIN SET NM_APELIDO = ?, NM_EMAIL = ?, NM_SENHA = ? WHERE CD_LOGIN = ?");

		// Coloca os valores na query
		stmt.setString(1, login.getApelido());
		stmt.setString(2, login.getEmail());
		stmt.setString(3, login.getSenha());
		stmt.setInt(4, login.getCodigo());

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
	 * Remove um login
	 * 
	 * @param codigo Código do login
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws ItemNaoEncontradoException
	 */
	public void remover(int codigo) throws ClassNotFoundException, SQLException, ItemNaoEncontradoException {

		// Conexão com o banco de dados
		Connection conexao = ConnectionFactory.getConnection();

		// Cria a query para executar no banco
		PreparedStatement stmt = conexao.prepareStatement("DELETE FROM T_BTTF_LOGIN WHERE CD_LOGIN = ?");

		// Coloca os valores na query
		stmt.setInt(1, codigo);

		// Executar a query
		int qtd = stmt.executeUpdate();

		// Valida se removeu alguma linha no banco de dados
		if (qtd == 0)
			throw new ItemNaoEncontradoException("\nO login não foi encontrado!");

		// Fechar a conexão
		stmt.close();
		conexao.close();

	}

	// OUTROS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

	/**
	 * Preenche a classe bean do login
	 * 
	 * @param resultado ResultSet com a pesquisa realizada
	 * @return login Objeto com o login
	 * @throws SQLException
	 */
	private Login parse(ResultSet resultado) throws SQLException {

		Login login = new Login();

		login.setCodigo(resultado.getInt("CD_LOGIN"));
		login.setApelido(resultado.getString("NM_APELIDO"));
		login.setEmail(resultado.getString("NM_EMAIL"));
		login.setSenha(resultado.getString("NM_SENHA"));

		return login;

	}

}// Classe
