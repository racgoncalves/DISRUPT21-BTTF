package br.com.fiap.tds.bean;

/**
 * Classe que representa um login
 * 
 * @author Rodrigo Chiarelli
 * @version 1.0
 */
public class Login {

	private int codigo;
	private String apelido;
	private String email;
	private String senha;

	public Login() {
	}

	public Login(int codigo, String apelido, String email, String senha) {

		this.codigo = codigo;
		this.apelido = apelido;
		this.email = email;
		this.senha = senha;
	}

	public Login(String apelido, String email, String senha) {

		this.apelido = apelido;
		this.email = email;
		this.senha = senha;
	}

	// Gets e Sets
	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public String getApelido() {
		return apelido;
	}

	public void setApelido(String apelido) {
		this.apelido = apelido;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

}// Classe
