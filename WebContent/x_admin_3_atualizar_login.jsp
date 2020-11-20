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

<title>xcave Solution - Atualizar Login</title>

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

			<!-- Atualizar Login -->
			<li class="nav-item active my-4"><a style="cursor: pointer"
				id="atualizarLogin" class="nav-link"><i style="font-size: 30px;"
					class="fas fa-save"></i><span style="font-size: 15px;">Salvar</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Voltar -->
			<form method="get" id="formVoltar" action="x_admin_2_logins.jsp">

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

					<!-- Modal Dados do Colaborador -->
					<div>
						<div class="modal-dialog modal-xl" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title ml-2 mt-2" id="exampleModalLabel">Dados
										de login</h5>
									<%
										LoginBo loginBo = new LoginBo();
									int codigo = Integer.parseInt(request.getParameter("codigo"));
									Login l = loginBo.pesquisar(codigo);
									%>
								</div>
								<div class="card-body">
									<form id="form_login" method="post" action="atualizarLogin">
										<div class="form-group mx-3">
											<div class="row">
												<!-- Apelido -->
												<div class="col-12 col-md-4 mt-4">
													<label for="apelido">Apelido:</label> <input
														class="form-control" type="text" id="apelido"
														name="apelido" placeholder="<%=l.getApelido()%>">
												</div>

												<!-- E-mail -->
												<div class="col-12 col-md-4 mt-4">
													<label for="email">Email:</label> <input
														class="form-control" id="email" name="email" type="text"
														placeholder="<%=l.getEmail()%>">
												</div>

												<!-- Senha -->
												<div class="col-12 col-md-4 mt-4">
													<label for="senha">Senha:</label> <input
														class="form-control" id="senha" name="senha" type="text"
														placeholder="<%=l.getSenha()%>">
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

	<!-- JS Local -->
	<script src="js/atualizarLogin.js"></script>

</body>

</html>