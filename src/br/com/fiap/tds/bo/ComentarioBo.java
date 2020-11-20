package br.com.fiap.tds.bo;

import java.sql.SQLException;
import java.util.List;
import br.com.fiap.tds.bean.Comentario;
import br.com.fiap.tds.dao.ComentarioDao;
import br.com.fiap.tds.exception.AtualizacaoNaoRealizadaException;
import br.com.fiap.tds.exception.DadoInvalidoException;
import br.com.fiap.tds.exception.ItemNaoEncontradoException;

/**
 * Classe respons�vel pela l�gica de neg�cio e valida��es do comentario
 * 
 * @author Rodrigo Chiarelli
 * @version 1.0
 *
 */
public class ComentarioBo {

	// Classe Dao
	private ComentarioDao comentarioDao = new ComentarioDao();

	/**
	 * Valida os dados do comentario e aciona a camada de Dao para cadastr�-lo
	 * 
	 * @param comentario Objeto contendo o comentario
	 * @throws ClassNotFoundException
	 * @throws DadoInvalidoException
	 * @throws SQLException
	 */
	public void cadastrar(Comentario comentario) throws ClassNotFoundException, DadoInvalidoException, SQLException {

		validar(comentario);
		comentarioDao.cadastrar(comentario);
	}

	/**
	 * Valida os dados do comentario e aciona a camada de Dao para atualiz�-lo
	 * 
	 * @param comentario Objeto contendo o comentario
	 * @throws ClassNotFoundException
	 * @throws DadoInvalidoException
	 * @throws SQLException
	 * @throws AtualizacaoNaoRealizadaException
	 */
	public void atualizar(Comentario comentario)
			throws ClassNotFoundException, DadoInvalidoException, SQLException, AtualizacaoNaoRealizadaException {

		validar(comentario);
		comentarioDao.atualizar(comentario);
	}
	
	/**
	 * Recupera os dados do comentario
	 * 
	 * @param codigoComentario C�digo do comentario
	 * @return comentario Objeto contendo o dados do comentario
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws ItemNaoEncontradoException
	 */
	public Comentario pesquisar(int codigo) throws ClassNotFoundException, SQLException, ItemNaoEncontradoException {
		return comentarioDao.pesquisar(codigo);
	}

	/**
	 * Recupera todos os comentarios cadastrados do personagem
	 * 
	 * @param codigo C�digo do personagem
	 * @return List<Comentario> Lista com todos os comentarios cadastrados
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws ItemNaoEncontradoException 
	 */
	public List<Comentario> listar(int codigo) throws ClassNotFoundException, SQLException, ItemNaoEncontradoException {
		return comentarioDao.listar(codigo);
	}

	/**
	 * Remove o comentario
	 * 
	 * @param codigo C�digo do comentario
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws ItemNaoEncontradoException
	 */
	public void remover(int codigo) throws ClassNotFoundException, SQLException, ItemNaoEncontradoException {
		comentarioDao.remover(codigo);
	}

	/**
	 * M�todo que valida de acordo com as regras os dados de um comentario
	 * 
	 * @param personagem Objeto contendo o dados do comentario
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws DadoInvalidoException
	 */
	private void validar(Comentario comentario) throws ClassNotFoundException, SQLException, DadoInvalidoException {

		if (comentario.getComentario() == null || comentario.getComentario().isEmpty()
				|| comentario.getComentario().isBlank())
			throw new DadoInvalidoException("\nComent�rio � obrigat�rio!");

		if (comentario.getComentario().length() > 1200)
			throw new DadoInvalidoException("\nComent�rio pode ter no m�ximo 1200 caracteres!");

		if (comentario.getEmocao() == null || comentario.getEmocao().isEmpty() || comentario.getEmocao().isBlank())
			throw new DadoInvalidoException("\nEmo��o � obrigat�rio!");

		if (comentario.getEmocao().length() > 20)
			throw new DadoInvalidoException("\nEmo��o pode ter no m�ximo 20 caracteres!");
	}

}
