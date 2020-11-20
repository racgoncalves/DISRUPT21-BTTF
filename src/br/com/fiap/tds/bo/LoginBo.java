package br.com.fiap.tds.bo;

import java.sql.SQLException;
import java.util.List;

import br.com.fiap.tds.bean.Login;
import br.com.fiap.tds.dao.LoginDao;
import br.com.fiap.tds.exception.AtualizacaoNaoRealizadaException;
import br.com.fiap.tds.exception.DadoInvalidoException;
import br.com.fiap.tds.exception.ItemNaoEncontradoException;

/**
 * Classe responsável pela lógica de negócio e validações do Login
 * 
 * @author Rodrigo Chiarelli
 * @version 4.0
 *
 */
public class LoginBo {

	// Classe Dao
	private LoginDao loginDao = new LoginDao();

	/**
	 * Valida os dados do login e aciona a camada de Dao para cadastrá-lo
	 * 
	 * @param login
	 * @throws ClassNotFoundException
	 * @throws DadoInvalidoException
	 * @throws SQLException
	 * @throws ItemNaoEncontradoException
	 */
	public void cadastrar(Login login)
			throws ClassNotFoundException, DadoInvalidoException, SQLException, ItemNaoEncontradoException {

		validar(login);
		loginDao.cadastrar(login);
	}

	/**
	 * Valida os dados do login e aciona a camada de Dao para atualizá-lo
	 * 
	 * @param login
	 * @throws ClassNotFoundException
	 * @throws DadoInvalidoException
	 * @throws SQLException
	 * @throws ItemNaoEncontradoException
	 * @throws AtualizacaoNaoRealizadaException
	 */
	public void atualizar(Login login) throws ClassNotFoundException, DadoInvalidoException, SQLException,
			ItemNaoEncontradoException, AtualizacaoNaoRealizadaException {

		validarAtualizacao(login);
		loginDao.atualizar(login);
	}

	/**
	 * Recupera o login
	 * 
	 * @param email E-mail do login
	 * @param senha Senha do login
	 * @return boolean
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws DadoInvalidoException
	 */
	public Login pesquisar(String email, String senha)
			throws ClassNotFoundException, SQLException, DadoInvalidoException {
		return loginDao.pesquisar(email, senha);
	}

	/**
	 * Recupera um login pelo codigo
	 * 
	 * @param codigo Código do login
	 * @return login Objeto com os dados de login
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws ItemNaoEncontradoException
	 */
	public Login pesquisar(int codigo) throws ClassNotFoundException, SQLException, ItemNaoEncontradoException {
		return loginDao.pesquisar(codigo);
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
		return loginDao.pesquisar(email);
	}

	/**
	 * Recupera todos os logins cadastrados
	 * 
	 * @return List<Login> Lista com todos os logins cadastrados
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public List<Login> listar() throws ClassNotFoundException, SQLException {
		return loginDao.listar();
	}

	/**
	 * Remove um login
	 * 
	 * @param codigo Código do login
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws ItemNaoEncontradoException
	 */
	public void remover(int codigo) throws ClassNotFoundException, SQLException, ItemNaoEncontradoException {
		loginDao.remover(codigo);
	}

	/**
	 * Método que valida de acordo com as regras os dados de um login
	 * 
	 * @param login
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws ItemNaoEncontradoException
	 * @throws DadoInvalidoException
	 */
	private void validar(Login login)
			throws ClassNotFoundException, SQLException, ItemNaoEncontradoException, DadoInvalidoException {

		if (login.getApelido() == null || login.getApelido().isEmpty())
			throw new DadoInvalidoException("\nApelido é obrigatório!");

		if (login.getApelido().length() > 60)
			throw new DadoInvalidoException("\nApelido pode ter no máximo 60 caracteres!");

		if (loginDao.isApelidoCadastrado(login.getApelido()))
			throw new DadoInvalidoException("\nApelido já cadastrado!");

		if (login.getEmail() == null || login.getEmail().isEmpty())
			throw new DadoInvalidoException("\nEmail é obrigatório!");

		if (login.getEmail().length() > 60)
			throw new DadoInvalidoException("\nEmail pode ter no máximo 60 caracteres!");

		if (loginDao.isEmailCadastrado(login.getEmail()))
			throw new DadoInvalidoException("\nE-mail já cadastrado!");

		if (login.getSenha() == null || login.getSenha().isEmpty())
			throw new DadoInvalidoException("\nSenha é obrigatório!");

		if (login.getSenha().length() > 60)
			throw new DadoInvalidoException("\nSenha pode ter no máximo 60 caracteres!");
	}

	/**
	 * Método que valida de acordo com as regras os dados de um login na atualização
	 * 
	 * @param login
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws ItemNaoEncontradoException
	 * @throws DadoInvalidoException
	 */
	private void validarAtualizacao(Login login)
			throws ClassNotFoundException, SQLException, ItemNaoEncontradoException, DadoInvalidoException {

		if (login.getApelido() == null || login.getApelido().isEmpty())
			throw new DadoInvalidoException("\nApelido é obrigatório!");

		if (login.getApelido().length() > 60)
			throw new DadoInvalidoException("\nApelido pode ter no máximo 60 caracteres!");

		if (!loginDao.isMesmoApelido(login.getApelido(), login.getCodigo())) {
			if (loginDao.isApelidoCadastrado(login.getApelido()))
				throw new DadoInvalidoException("\nApelido já cadastrado!");
		}

		if (login.getEmail() == null || login.getEmail().isEmpty())
			throw new DadoInvalidoException("\nEmail é obrigatório!");

		if (login.getEmail().length() > 60)
			throw new DadoInvalidoException("\nEmail pode ter no máximo 60 caracteres!");

		if (!loginDao.isMesmoEmail(login.getEmail(), login.getCodigo())) {
			if (loginDao.isEmailCadastrado(login.getEmail()))
				throw new DadoInvalidoException("\nEmail já cadastrado!");
		}

		if (login.getSenha() == null || login.getSenha().isEmpty())
			throw new DadoInvalidoException("\nSenha é obrigatório!");

		if (login.getSenha().length() > 60)
			throw new DadoInvalidoException("\nSenha pode ter no máximo 60 caracteres!");

	}

}// Classe
