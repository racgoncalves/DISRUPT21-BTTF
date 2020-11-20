<%@page import="br.com.fiap.tds.bo.LoginBo"%>
<%@page import="br.com.fiap.tds.bean.Login"%>
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

<title>xcave Solution - Logins</title>

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
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark toggled"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<li class="nav-item active"><a style="pointer-events: none;"
				class="sidebar-brand d-flex align-items-center justify-content-center">
					xcave </a></li>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Tables -->

			<!-- Cadastrar Login -->
			<li class="nav-item active mt-4 my-4"><a data-toggle="modal"
				data-target="#cadastrarLogin" style="cursor: pointer"
				class="nav-link"><i style="font-size: 30px;"
					class="fas fa-user-plus"></i><span style="font-size: 15px;">Cadastrar</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Voltar -->
			<form method="get" action="x_admin_2_personagens.jsp" id="formVoltar">

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

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">Logins</h1>
					<p class="mb-4">Aqui você pode visualizar todos os logins
						cadastrados.</p>

					<!-- Dados de login dos Matriculados -->
					<div class="card shadow mb-4">
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered display" id="dataTable">
									<thead>
										<tr>
											<th>Código</th>
											<th>Apelido</th>
											<th>E-mail</th>
											<th>Senha</th>
											<th>Editar</th>
											<th>Remover</th>
										</tr>
									</thead>
									<tbody>
										<%
											LoginBo loginBo = new LoginBo();
										List<Login> lista = loginBo.listar();
										for (Login l : lista) {
										%>
										<tr>

											<td><%=l.getCodigo()%></td>
											<td><%=l.getApelido()%></td>
											<td><%=l.getEmail()%></td>
											<td><%=l.getSenha()%></td>

											<td><form method="GET"
													action="x_admin_3_atualizar_login.jsp">
													<input style="visibility: hidden; width: 0;" type="text"
														value="<%=l.getCodigo()%>" name="codigo">
													<button type="submit" class="btn btn-info ml-2">
														<i class="fas fa-pen"></i>
													</button>
												</form></td>
											<td><form method="GET"
													action="x_admin_4_remover_login.jsp">
													<input style="visibility: hidden; width: 0;" type="text"
														value="<%=l.getCodigo()%>" name="codigo"> <input
														style="visibility: hidden; width: 0;" type="text"
														value="<%=l.getApelido()%>" name="apelido">
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

	<!-- Modal Adicionar Login -->
	<div class="modal fade" id="cadastrarLogin" role="dialog"
		aria-labelledby="adicionarLogin" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Cadastrar
						Login</h5>
				</div>
				<div class="modal-body">
					<form id="form_login" method="post" action="cadastrarLogin">
						<div class="form-group">
							<div class="row">

								<!-- Apelido -->
								<div class="col-12 col-md-4 mt-4">
									<label for="apelidoCadastro">Apelido:</label> <input
										class="form-control" type="text" id="apelidoCadastro"
										name="apelidoCadastro">
								</div>

								<!-- E-mail -->
								<div class="col-12 col-md-4 mt-4">
									<label for="emailCadastro">Email:</label> <input
										class="form-control" id="emailCadastro" name="emailCadastro"
										type="text">
								</div>

								<!-- Senha -->
								<div class="col-12 col-md-4 mt-4">
									<label for="senhaCadastro">Senha:</label> <input
										class="form-control" id="senhaCadastro" name="senhaCadastro"
										type="text">
								</div>
							</div>
							<div class="modal-footer">
								<button id="botaoCadastrarLogin" type="submit"
									class="btn btn-primary mt-3 mr-3">Cadastrar</button>
								<button type="button" class="btn btn-secondary mt-3"
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

	<!-- JS Local -->
	<script src="js/cadastrarLogin.js"></script>

	<!-- Data Table -->
	<%@ include file="./modulos/scripts_table.jsp"%>
	<script src="js/tabela-logins.js"></script>
</body>

</html>