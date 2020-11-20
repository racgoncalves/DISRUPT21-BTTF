
function removerLogin() {

	// Código
	const codigo = $("#codigo");

	$.ajax({
		type: 'POST',
		url: 'http://localhost:8080/BTTF/removerLogin',
		data: {
			codigo: codigo.val()
		}
	}).then(Swal.fire({
		text: 'O login foi removido com sucesso!',
		icon: 'success',
		confirmButtonText: 'Fechar'
	}).then(setTimeout(function() {
		$("#formVoltar").submit()
	}, 1200)));

};

// Remover o Login
$("#botaoRemoverLogin").click(function() {

	removerLogin();

})