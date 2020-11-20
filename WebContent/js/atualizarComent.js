
function atualizarComent() {

	Swal.fire({
		title: 'Deseja alterar o comentário?',
		showDenyButton: true,
		confirmButtonText: `Alterar`,
		denyButtonText: `Cancelar`,
	}).then((result) => {

		if (result.isConfirmed) {

			$("#form_comentario").submit()

		}
	})

}

// Atualizar o Comentario
$("#botaoAtualizarComent").click(function() {

	atualizarComent();

})