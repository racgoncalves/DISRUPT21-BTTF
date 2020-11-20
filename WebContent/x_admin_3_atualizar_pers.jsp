<%@page import="br.com.fiap.tds.bo.PersonagemBo"%>
<%@page import="br.com.fiap.tds.bean.Personagem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="img/xcave.png">

<title>xcave Solution - Atualizar Personagem</title>

<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<link href="css/style_upload.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion toggled"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a style="pointer-events: none;"
				class="sidebar-brand d-flex align-items-center justify-content-center">
				xcave </a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Tables -->

			<!-- Atualizar Personagem -->
			<li class="nav-item active my-4"><a style="cursor: pointer"
				id="atualizarPers" class="nav-link"><i style="font-size: 30px;"
					class="fas fa-save"></i><span style="font-size: 15px;">Salvar</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Voltar -->
			<form method="get" id="formVoltar" action="x_admin_2_personagens.jsp">

				<li class="nav-item active my-4"
					onClick="document.getElementById('formVoltar').submit();"><a
					style="cursor: pointer" class="nav-link"><i
						style="font-size: 30px;" class="fas fa-arrow-circle-left"></i><span
						style="font-size: 16px;">Voltar</span></a></li>
			</form>

		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="container">

				<!-- Topbar -->
				<%@ include file="./modulos/topbar_admin.jsp"%>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Modal Dados do Personagem -->
					<div>
						<div class="modal-dialog modal-xl" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title ml-2 mt-2" id="exampleModalLabel">Dados
										do personagem</h5>
									<%
										PersonagemBo personagemBo = new PersonagemBo();
									int codigo = Integer.parseInt(request.getParameter("codigo"));
									Personagem p = personagemBo.pesquisar(codigo);
									%>
								</div>
								<div class="card-body">
									<form id="form_personagem" method="post"
										action="atualizarPersonagem">
										<div class="form-group mx-3">
											<div class="row">
												<!-- Nome do Personagem -->
												<div class="col-12 col-md-4 mt-3">
													<label for="nomePersonagem">Nome do personagem:</label> <input
														class="form-control" type="text" id="nomePersonagem"
														name="nomePersonagem"
														placeholder="<%=p.getNomePersonagem()%>">
												</div>
												<!-- Idade 1985 -->
												<div class="col-12 col-md-4 mt-3">
													<label for="idadePresente">Idade 1985:</label> <input
														class="form-control" type="text" id="idadePresente"
														name="idadePresente"
														placeholder="<%=p.getIdadePresente()%>">
												</div>
												<!-- Idade 1955 -->
												<div class="col-12 col-md-4 mt-3">
													<label for="idadePassado">Idade 1955:</label> <input
														class="form-control" type="text" id="idadePassado"
														name="idadePassado" placeholder="<%=p.getIdadePassado()%>">
												</div>
												<!-- Descrição -->
												<div class="col-12  mt-3">
													<label for="descricao">Descrição:</label>
													<textarea class="form-control" id="descricao"
														name="descricao" rows="8" style="resize: none;"
														placeholder="<%=p.getDescricao()%>"></textarea>
												</div>
												<!-- Nome do Ator -->
												<div class="col-12 col-md-4 mt-3">
													<label for="nomeAtor">Nome do ator:</label> <input
														class="form-control" id="nomeAtor" name="nomeAtor"
														nomeAtor""
														type="text"
														placeholder="<%=p.getNomeAtor()%>">
												</div>
												<!-- Data de Nascimento -->
												<div class="col-12 col-md-4 mt-3">
													<label for="dataNascimento">Data de nascimento:</label> <input
														class="form-control" id="dataNascimento"
														name="dataNascimento" type="text"
														onkeypress="$(this).mask('00/00/0000')"
														placeholder="<%=p.getDataNascimento()%>">
												</div>
											</div>
										</div>
										<input style="visibility: hidden; width: 0;" type="text"
											id="codigo" value="<%=codigo%>" name="codigo">
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<%@ include file="./modulos/footer_admin.jsp"%>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Logout Modal-->
	<%@ include file="./modulos/logout_admin.jsp"%>

	<!-- Scripts Gerais -->
	<%@ include file="./modulos/scripts_admin.jsp"%>

	<!-- Máscaras Jquery -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>

	<!-- JS Local -->
	<script src="js/atualizarPers.js"></script>

</body>

</html>