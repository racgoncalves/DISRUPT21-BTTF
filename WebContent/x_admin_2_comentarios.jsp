<%@page import="br.com.fiap.tds.bo.ComentarioBo"%>
<%@page import="br.com.fiap.tds.bean.Comentario"%>
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

<title>xcave Solution - Comentários</title>

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

			<!-- Nav Item - Tables -->

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

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">Comentários</h1>
					<p class="mb-4">Aqui você pode visualizar todos os comentários
						do personagem.</p>

					<!-- Comentários -->
					<div class="card shadow mb-4">
						<div class="form-group mt-2">

							<div class="card-body">
								<div class="table-responsive">

									<table class="table table-bordered display" id="dataTable">
										<thead>
											<tr>
												<th>Comentário</th>
												<th>Emoção</th>
												<th>Timestamp</th>
												<th>Remover</th>
											</tr>
										</thead>
										<tbody>
											<%
												int codigo = 0;
											ComentarioBo comentBo = new ComentarioBo();
											if (request.getAttribute("codigo") != null) {
												String objeto = request.getAttribute("codigo").toString();
												codigo = Integer.parseInt(objeto);
											} else {
												codigo = Integer.parseInt(request.getParameter("codigo"));
											}
											List<Comentario> listaComent = comentBo.listar(codigo);
											for (Comentario c : listaComent) {
											%>
											<tr>
												<td><%=c.getComentario()%></td>
												<td><%=c.getEmocao()%></td>
												<td><%=c.getTimestamp()%></td>

												<td><form method="get"
														action="x_admin_4_remover_coment.jsp">
														<input style="visibility: hidden; width: 0" type="text"
															value="<%=c.getCodigo()%>" name="codigo"> <input
															style="visibility: hidden; width: 0;" type="text"
															value="<%=c.getComentario()%>" name="comentario">
														<input style="visibility: hidden; width: 0;" type="text"
															value="<%=codigo%>" name="codigoPersonagem">
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

	<!-- Data Table -->
	<%@ include file="./modulos/scripts_table.jsp"%>
	<script src="js/tabela-coment.js"></script>
</body>

</html>