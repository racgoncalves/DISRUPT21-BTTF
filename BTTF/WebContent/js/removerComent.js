
function removerComent() {

	// Código
	const codigo = $("#codigo");

	$.ajax({
		type: 'POST',
		url: 'http://localhost:8080/BTTF/removerComentario',
		data: {
			codigo: codigo.val(),
		}
	}).then(Swal.fire({
		text: 'O comentário foi removido com sucesso!',
		icon: 'success',
		confirmButtonText: 'Fechar'
	}).then(setTimeout(function() {
		$("#formVoltar").submit()
	}, 1200)));

}

// Remover o Comentario
$("#botaoRemoverComent").click(function() {

	removerComent();

})