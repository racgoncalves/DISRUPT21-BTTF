
function removerPers() {

	// Código
	const codigo = $("#codigo");

	$.ajax({
		type: 'POST',
		url: 'http://localhost:8080/BTTF/removerPersonagem',
		data: {
			codigo: codigo.val()
		}
	}).then(Swal.fire({
		text: 'O personagem foi removido com sucesso!',
		icon: 'success',
		confirmButtonText: 'Fechar'
	}).then(setTimeout(function() {
		$("#formVoltar").submit()
	}, 1200)));

}

// Remover o Personagem
$("#botaoRemoverPers").click(function () {

	removerPers();

})