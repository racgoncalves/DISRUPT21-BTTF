package br.com.fiap.tds.bo;

import java.sql.SQLException;
import java.util.List;

import br.com.fiap.tds.bean.Personagem;
import br.com.fiap.tds.dao.PersonagemDao;
import br.com.fiap.tds.exception.AtualizacaoNaoRealizadaException;
import br.com.fiap.tds.exception.DadoInvalidoException;
import br.com.fiap.tds.exception.ItemNaoEncontradoException;

/**
 * Classe responsável pela lógica de negócio e validações do personagem
 * 
 * @author Rodrigo Chiarelli
 * @version 1.0
 *
 */
public class PersonagemBo {

	// Classe Dao
	private PersonagemDao personagemDao = new PersonagemDao();

	/**
	 * Valida os dados do personagem e aciona a camada de Dao para cadastrá-lo
	 * 
	 * @param personagem Objeto contendo o personagem
	 * @throws ClassNotFoundException
	 * @throws DadoInvalidoException
	 * @throws SQLException
	 */
	public void cadastrar(Personagem personagem) throws ClassNotFoundException, DadoInvalidoException, SQLException {

		validar(personagem);
		personagemDao.cadastrar(personagem);
	}

	/**
	 * Valida os dados do personagem e aciona a camada de Dao para atualizá-lo
	 * 
	 * @param personagem Objeto contendo o personagem
	 * @throws ClassNotFoundException
	 * @throws DadoInvalidoException
	 * @throws SQLException
	 * @throws AtualizacaoNaoRealizadaException
	 */
	public void atualizar(Personagem personagem)
			throws ClassNotFoundException, DadoInvalidoException, SQLException, AtualizacaoNaoRealizadaException {

		validar(personagem);
		personagemDao.atualizar(personagem);
	}

	/**
	 * Recupera os dados do personagem
	 * 
	 * @param codigo Código do personagem
	 * @return personagem Objeto contendo o dados do personagem
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws ItemNaoEncontradoException
	 */
	public Personagem pesquisar(int codigo) throws ClassNotFoundException, SQLException, ItemNaoEncontradoException {
		return personagemDao.pesquisar(codigo);
	}

	/**
	 * Recupera todos os personagens cadastrados
	 * 
	 * @return List<Personagem> Lista com todos os personagens cadastrados
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public List<Personagem> listar() throws ClassNotFoundException, SQLException {
		return personagemDao.listar();
	}

	/**
	 * Remove o personagem
	 * 
	 * @param codigo Código do personagem
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws ItemNaoEncontradoException
	 */
	public void remover(int codigo) throws ClassNotFoundException, SQLException, ItemNaoEncontradoException {
		personagemDao.remover(codigo);
	}

	/**
	 * Método que valida de acordo com as regras os dados de um personagem
	 * 
	 * @param personagem Objeto contendo o dados do personagem
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws DadoInvalidoException
	 */
	private void validar(Personagem personagem) throws ClassNotFoundException, SQLException, DadoInvalidoException {

		if (personagem.getNomePersonagem() == null || personagem.getNomePersonagem().isEmpty()
				|| personagem.getNomePersonagem().isBlank())
			throw new DadoInvalidoException("\nNome do personagem é obrigatório!");

		if (personagem.getNomePersonagem().length() > 70)
			throw new DadoInvalidoException("\nNome do personagem pode ter no máximo 70 caracteres!");

		if (personagem.getIdadePresente() < 0)
			throw new DadoInvalidoException("\nA idade do presente não pode ser negativa!");

		if (personagem.getDescricao() == null || personagem.getDescricao().isEmpty()
				|| personagem.getDescricao().isBlank())
			throw new DadoInvalidoException("\nDescrição é obrigatório!");

		if (personagem.getDescricao().length() > 1200)
			throw new DadoInvalidoException("\nDescrição pode ter no máximo 1200 caracteres!");

		if (personagem.getNomeAtor() == null || personagem.getNomeAtor().isEmpty()
				|| personagem.getNomeAtor().isBlank())
			throw new DadoInvalidoException("\nNome do ator é obrigatório!");

		if (personagem.getNomeAtor().length() > 70)
			throw new DadoInvalidoException("\nNome do ator pode ter no máximo 70 caracteres!");
	}

}
