package br.com.fiap.tds.bean;

/**
 * Classe que representa um comentario
 * 
 * @author Rodrigo Chiarelli
 * @version 1.0
 */
public class Comentario {

	private int codigo;
	private Personagem personagem;
	private Login login;
	private String comentario;
	private String emocao;
	private String timestamp;

	public Comentario(int codigo, Personagem personagem, Login login, String comentario, String emocao,
			String timestamp) {

		this.codigo = codigo;
		this.personagem = personagem;
		this.login = login;
		this.comentario = comentario;
		this.emocao = emocao;
		this.timestamp = timestamp;
	}

	public Comentario(Personagem personagem, Login login, String comentario, String emocao) {

		this.personagem = personagem;
		this.login = login;
		this.comentario = comentario;
		this.emocao = emocao;
	}

	public Comentario() {
	}

	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public Personagem getPersonagem() {
		return personagem;
	}

	public void setPersonagem(Personagem personagem) {
		this.personagem = personagem;
	}

	public Login getLogin() {
		return login;
	}

	public void setLogin(Login login) {
		this.login = login;
	}

	public String getComentario() {
		return comentario;
	}

	public void setComentario(String comentario) {
		this.comentario = comentario;
	}

	public String getEmocao() {
		return emocao;
	}

	public void setEmocao(String emocao) {
		this.emocao = emocao;
	}

	public String getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}

	// Pega a data e hora que vem do banco de dados
	public String getDataHoraBD(String dataHora) {
		String ano = dataHora.substring(0, 4);
		String mes = dataHora.substring(5, 7);
		String dia = dataHora.substring(8, 10);
		
		String hora = dataHora.substring(11,19);

		return dia + "/" + mes + "/" + ano + " " + hora;
	}

}
