package br.com.fiap.tds.bean;

/**
 * Classe que representa um personagem
 * 
 * @author Rodrigo Chiarelli
 * @version 1.0
 */
public class Personagem {

	private int codigo;
	private String nomePersonagem;
	private int idadePresente;
	private int idadePassado;
	private String descricao;
	private String nomeAtor;
	private String dataNascimento;

	public Personagem(int codigo, String nomePersonagem, int idadePresente, int idadePassado, String descricao,
			String nomeAtor, String dataNascimento) {

		this.codigo = codigo;
		this.nomePersonagem = nomePersonagem;
		this.idadePresente = idadePresente;
		this.idadePassado = idadePassado;
		this.descricao = descricao;
		this.nomeAtor = nomeAtor;
		this.dataNascimento = dataNascimento;
	}

	public Personagem(String nomePersonagem, int idadePresente, int idadePassado, String descricao, String nomeAtor,
			String dataNascimento) {

		this.nomePersonagem = nomePersonagem;
		this.idadePresente = idadePresente;
		this.idadePassado = idadePassado;
		this.descricao = descricao;
		this.nomeAtor = nomeAtor;
		this.dataNascimento = dataNascimento;
	}

	public Personagem(int codigo, String nomePersonagem, int idadePresente, String descricao, String nomeAtor,
			String dataNascimento) {

		this.codigo = codigo;
		this.nomePersonagem = nomePersonagem;
		this.idadePresente = idadePresente;
		this.descricao = descricao;
		this.nomeAtor = nomeAtor;
		this.dataNascimento = dataNascimento;
	}

	public Personagem() {
	}

	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public String getNomePersonagem() {
		return nomePersonagem;
	}

	public void setNomePersonagem(String nomePersonagem) {
		this.nomePersonagem = nomePersonagem;
	}

	public int getIdadePresente() {
		return idadePresente;
	}

	public void setIdadePresente(int idadePresente) {
		this.idadePresente = idadePresente;
	}

	public int getIdadePassado() {
		return idadePassado;
	}

	public void setIdadePassado(int idadePassado) {
		this.idadePassado = idadePassado;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getNomeAtor() {
		return nomeAtor;
	}

	public void setNomeAtor(String nomeAtor) {
		this.nomeAtor = nomeAtor;
	}

	public String getDataNascimento() {
		return dataNascimento;
	}

	public void setDataNascimento(String dataNascimento) {
		this.dataNascimento = dataNascimento;
	}

	// Pega a data que vem do banco de dados
	public String getDataBD(String data) {
		String ano = data.substring(0, 4);
		String mes = data.substring(5, 7);
		String dia = data.substring(8, 10);

		return dia + "/" + mes + "/" + ano;
	}

}
