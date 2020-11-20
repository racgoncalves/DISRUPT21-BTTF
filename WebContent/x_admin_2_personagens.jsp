<%@page import="br.com.fiap.tds.bo.PersonagemBo"%>
<%@page import="br.com.fiap.tds.bean.Personagem"%>
<%@page import="java.util.List"%>
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

<title>xcave Solution - Personagens</title>

<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark toggled nav-wrapper"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a style="pointer-events: none;"
				class="sidebar-brand d-flex align-items-center justify-content-center">
				xcave </a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Tables -->

			<!-- Adicionar Personagem -->
			<li class="nav-item active my-4"><a data-toggle="modal"
				data-target="#adicionarPersonagem" style="cursor: pointer"
				class="nav-link"><i style="font-size: 30px;"
					class="fas fa-user-plus"></i><span style="font-size: 15px;">Adicionar</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Ir para Logins -->
			<form method="get" id="formLogins" action="x_admin_2_logins.jsp">
				<li class="nav-item active my-4"><a
					onClick="document.getElementById('formLogins').submit();"
					style="cursor: pointer" class="nav-link"><i
						style="font-size: 30px;" class="fas fa-user-circle"></i><span
						style="font-size: 15px;">Logins</span></a></li>
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

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">Personagens</h1>
					<p class="mb-4">Aqui você pode visualizar todos os personagens
						cadastrados.</p>

					<!-- Dados Principais dos Colaboradores -->
					<div class="card shadow mb-4">
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered display" id="dataTable"
									cellspacing="0">
									<thead>
										<tr>
											<th>Código</th>
											<th>Nome Personagem</th>
											<th>Idade 1985</th>
											<th>Nome Ator</th>
											<th>Visualizar</th>
											<th>Comentarios</th>
											<th>Remover</th>
										</tr>
									</thead>
									<tbody>
										<%
											PersonagemBo colabBo = new PersonagemBo();
										List<Personagem> lista = colabBo.listar();
										for (Personagem p : lista) {
										%>
										<tr>

											<td><%=p.getCodigo()%></td>
											<td><%=p.getNomePersonagem()%></td>
											<td><%=p.getIdadePresente()%></td>
											<td><%=p.getNomeAtor()%></td>

											<td><form method="GET"
													action="x_admin_3_atualizar_pers.jsp">
													<input style="visibility: hidden; width: 0;" type="text"
														value="<%=p.getCodigo()%>" name="codigo">
													<button type="submit" class="btn btn-success ml-1">
														<i class="fas fa-search"></i>
													</button>
												</form></td>
											<td><form method="GET"
													action="x_admin_2_comentarios.jsp">
													<input style="visibility: hidden; width: 0;" type="text"
														value="<%=p.getCodigo()%>" name="codigo">
													<button type="submit" class="btn btn-info ml-4">
														<i class="fas fa-comment-dots"></i>
													</button>
												</form></td>
											<td><form method="GET"
													action="x_admin_4_remover_pers.jsp">
													<input style="visibility: hidden; width: 0;" type="text"
														value="<%=p.getCodigo()%>" name="codigo"> <input
														style="visibility: hidden; width: 0;" type="text"
														value="<%=p.getNomePersonagem()%>" name="nomePersonagem">
													<button type="submit" class="btn btn-danger">
														<i class="fas fa-trash"></i>
													</button>
												</form></td>
										</tr>
										<%
											}
										%>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<%@ include file="./modulos/footer_admin.jsp"%>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Modal Adicionar Personagem -->
	<div class="modal fade" id="adicionarPersonagem" role="dialog"
		aria-labelledby="adicionarPersonagem" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Adicionar
						personagem</h5>
				</div>
				<div class="modal-body">
					<form id="form_personagem" method="post"
						action="cadastrarPersonagem">
						<div class="form-group mx-3">
							<div class="row">
								<!-- Nome do Personagem -->
								<div class="col-12 col-md-4 mt-3">
									<label for="nomePersonagem">Nome do personagem:</label> <input
										class="form-control" type="text" id="nomePersonagem"
										name="nomePersonagem">
								</div>
								<!-- Idade 1985 -->
								<div class="col-12 col-md-4 mt-3">
									<label for="idadePresente">Idade 1985:</label> <input
										class="form-control" type="text" id="idadePresente"
										name="idadePresente">
								</div>
								<!-- Idade 1955 -->
								<div class="col-12 col-md-4 mt-3">
									<label for="idadePassado">Idade 1955:</label> <input
										class="form-control" type="text" id="idadePassado"
										name="idadePassado">
								</div>
								<!-- Descrição -->
								<div class="col-12  mt-3">
									<label for="descricao">Descrição:</label>
									<textarea class="form-control" id="descricao" name="descricao"
										rows="8" style="resize: none;"></textarea>
								</div>
								<!-- Nome do Ator -->
								<div class="col-12 col-md-4 mt-3">
									<label for="nomeAtor">Nome do ator:</label> <input
										class="form-control" id="nomeAtor" name="nomeAtor" type="text">
								</div>
								<!-- Data de Nascimento -->
								<div class="col-12 col-md-4 mt-3 mb-4">
									<label for="dataNascimento">Data de nascimento:</label> <input
										class="form-control" id="dataNascimento" name="dataNascimento"
										type="text" onkeypress="$(this).mask('00/00/0000')">
								</div>
							</div>
							<div class="modal-footer">
								<button id="botaoCadastrarPers" type="submit"
									class="btn btn-primary mt-2 mr-3">Adicionar</button>
								<button type="button" class="btn btn-secondary mt-2"
									data-dismiss="modal">Fechar</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Logout Modal-->
	<%@ include file="./modulos/logout_admin.jsp"%>

	<!-- Scripts Gerais -->
	<%@ include file="./modulos/scripts_admin.jsp"%>

	<!-- Máscaras Jquery -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>

	<!-- Data Table -->
	<%@ include file="./modulos/scripts_table.jsp"%>
	<script src="js/tabela-pers.js"></script>
</body>

</html>