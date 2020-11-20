
function cadastrarLogin() {

	const senha = $("#senha");
	const senhaConfirmacao = $("#senhaConfirmacao");

	if (senha.val() !== senhaConfirmacao.val()) {

		Swal.fire({
			icon: 'error',
			title: 'A senha e a senha de confirmação não estão iguais!',
		})
		
	}

	else {

		$("#form_cadastrarLogin").submit();

	}

}

// Cadastra o login
$("#botaoCadastrarLogin").click(function() {
	
	cadastrarLogin();

})