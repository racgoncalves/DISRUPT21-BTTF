
function atualizarPersonagem() {

	Swal.fire({
		title: 'Deseja alterar o personagem?',
		showDenyButton: true,
		confirmButtonText: `Alterar`,
		denyButtonText: `Cancelar`,
	}).then((result) => {

		if (result.isConfirmed) {

			$("#form_personagem").submit()

		}
	})

}

// Atualizar o Personagem
$("#atualizarPers").click(function() {

	atualizarPersonagem();

})