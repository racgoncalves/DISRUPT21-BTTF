<%@page import="br.com.fiap.tds.bo.LoginBo"%>
<%@page import="br.com.fiap.tds.bean.Login"%>
<%@page import="br.com.fiap.tds.bo.PersonagemBo"%>
<%@page import="br.com.fiap.tds.bean.Personagem"%>
<%@page import="br.com.fiap.tds.bo.ComentarioBo"%>
<%@page import="br.com.fiap.tds.bean.Comentario"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	int alegria = 0;
int surpresa = 0;
int desgosto = 0;
int medo = 0;
int raiva = 0;
int tristeza = 0;
int codigo = 0;
PersonagemBo personagemBo = new PersonagemBo();
Personagem p = new Personagem();
if (request.getAttribute("codigo") != null) {
	String objeto = request.getAttribute("codigo").toString();
	codigo = Integer.parseInt(objeto);
} else {
	codigo = Integer.parseInt(request.getParameter("codigo"));
}

p = personagemBo.pesquisar(codigo);
String naoNascido = "Não nasceu ainda";
%>

<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>xcave | Personagem</title>

<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">

<!-- Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

<!-- Custom Theme CSS -->
<link href="css/style.css" rel="stylesheet">
<link href="css/foto_<%=codigo%>.css" rel="stylesheet">
<link href="css/google.css" rel="stylesheet">

<!-- Advanced CSS -->
<link href="css/animate.css" rel="stylesheet">
<link href="js/lib/owl-carousel/owl.carousel.css" rel="stylesheet">
<link href="js/lib/owl-carousel/owl.theme.css" rel="stylesheet">
<link href="js/lib/owl-carousel/owl.transitions.css" rel="stylesheet">
<link href="js/lib/magnific-popup/magnific-popup.css" rel="stylesheet">
<link href="js/lib/video/YTPlayer.css" rel="stylesheet">
<link href="js/lib/flipclock/flipclock.css" rel="stylesheet">
<link rel="icon" href="./img/xcave.png">

<!-- Local CSS -->
<link href="css/botao.css" rel="stylesheet">

</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-custom">
	<!-- Navigation -->
	<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
		<!-- Google Translate -->
		<div style="float: left;" id="google_translate_element"></div>
		<div class="container">
			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-main-collapse">
					<i class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand" href="#page-top"> <i
					class="fa fa-video-camera"></i> xcave <span class="font-light">
						Back to the Future</span>
				</a>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<!-- Page-name Section -->
	<section id="page-name">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2 wp1 delay-05s">
					<h1><%=p.getNomePersonagem()%></h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</section>
	<!-- /#page-name -->
	<!-- Blog Section -->
	<section id="blog">
		<div class="container">
			<div class="row">
				<div class="col-lg-9 wp2 delay-05s">
				<!-- Mensagem de erro -->
					<p style="color: red; font-weight: bolder;">${erro}</p>
					<!-- Voltar -->
					<form method="get" action="x_BTTF_index.jsp" id="form_voltar">
						<a style="cursor: pointer" type="submit" class="back-to-main"
							onClick="document.getElementById('form_voltar').submit();"><i
							class="fa fa-chevron-left"></i> &nbsp; Voltar </a>
						<%
							int codigoLogin = 0;
						if (request.getAttribute("codigoLogin") != null) {
							String objeto = request.getAttribute("codigoLogin").toString();
							codigoLogin = Integer.parseInt(objeto);
						} else {
							try {
								codigoLogin = Integer.parseInt(request.getParameter("codigoLogin"));
							} catch (Exception e) {
							}
						}

						if (codigoLogin != 0) {
						%>
						<input style="visibility: hidden; width: 0;" type="text"
							value="<%=codigoLogin%>" name="codigoLogin">
						<%
							}
						%>
					</form>
					<!-- 01 -->
					<div>
						<div class="col-lg-6">
							<h5>
								<strong>Idade em 1985: </strong><%=p.getIdadePresente()%>
							</h5>
							<%
								if (p.getIdadePassado() != 0) {
							%>

							<h5>
								<strong>Idade em 1955: </strong><%=p.getIdadePassado()%>
							</h5>
							<%
								} else {
							%>
							<h5>
								<strong>Idade em 1955: </strong><%=naoNascido%>
							</h5>
							<%
								}
							%>
						</div>
						<!-- /sidebar-->
						<div class="col-lg-6" style="float: right;">
							<h5>
								<strong>Nome do ator: </strong><%=p.getNomeAtor()%>
							</h5>
							<h5>
								<strong>Data de nascimento do ator: </strong><%=p.getDataNascimento()%>
							</h5>
						</div>
					</div>
					<hr>
					<!-- Content -->
					<p><%=p.getDescricao()%></p>
					<div class="blog-extra"></div>
					<!-- Comment Area -->
					<%
						ComentarioBo comentBo = new ComentarioBo();
					List<Comentario> listaComent = comentBo.listar(codigo);
					%>
					<div class="comments-area wp3" id="comments-area">
						<h2 class="sub-title">
							Comentários <span class="text-color">(<%=listaComent.size()%>)
							</span>
						</h2>
						<br>
						<ul class="commentlist">
							<%
								for (Comentario c : listaComent) {
							%>

							<li>
								<div class="comment">
									<div style="display: flex; margin-top: 15px;">

										<span class="comment-info"> <a><%=c.getLogin().getApelido()%></a>
											<span><%=c.getTimestamp()%> <img
												src="./img/emotion_icons/<%=c.getEmocao()%>.png"
												style="margin-left: 10px; width: 4%;"> </span>

										</span>
										<%
											if (codigoLogin != 0 && codigoLogin == c.getLogin().getCodigo()) {
										%>

										<form method="POST" action="removerComentarioSite">
											<input style="visibility: hidden; width: 0;" type="text"
												value="<%=c.getCodigo()%>" name="codigoComentario">
											<input style="visibility: hidden; width: 0;" type="text"
												value="<%=codigoLogin%>" name="codigoLogin"> <input
												style="visibility: hidden; width: 0;" type="text"
												value="<%=codigo%>" name="codigoPersonagem">
											<button class="btn btn-danger">
												<i class="fas fa-trash"></i>
											</button>

										</form>

										<%
											}
										%>

									</div>

									<p><%=c.getComentario()%></p>

								</div>
							</li>
							<%
								if (c.getEmocao().equals("alegria"))
								alegria++;
							if (c.getEmocao().equals("surpresa"))
								surpresa++;
							if (c.getEmocao().equals("desgosto"))
								desgosto++;
							if (c.getEmocao().equals("medo"))
								medo++;
							if (c.getEmocao().equals("raiva"))
								raiva++;
							if (c.getEmocao().equals("tristeza"))
								tristeza++;
							}
							%>
						</ul>
						<%
							if (codigoLogin != 0) {
							Login usuario = new Login();
							LoginBo loginBo = new LoginBo();
							usuario = loginBo.pesquisar(codigoLogin);
						%>
						<div class="comment-form wp4 delay-05s">
							<h2 class="sub-title">
								Deixe um comentário <span style="color: red;"><%=usuario.getApelido()%></span>
							</h2>
							<form class="comment-form-wrapper" method="POST"
								action="cadastrarComentario">
								<div class="row">
									<div class="col-md-12">
										<textarea id="comment-text-area" placeholder="Mensagem"
											rows="5" name="comentario" Required></textarea>
										<div class="col-md-3">
											<button type="submit">
												Publicar<i class="fa fa-chevron-right"></i>
											</button>
											<input style="visibility: hidden; width: 0;" type="text"
												value="<%=codigo%>" name="codigo"> <input
												style="visibility: hidden; width: 0;" type="text"
												value="<%=codigoLogin%>" name="codigoLogin">
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
					<!--/.comments-area-->
					<%
						} else {
					%>

					<div class="comment-form wp4 delay-05s">
						<h2 class="sub-title">Faça o login para comentar</h2>
						<form class="comment-form-wrapper" method="POST"
							action="logarSite">
							<div class="row">
								<div class="col-md-12 no-padding">
									<div class="col-lg-6">
										<input type="email" name="email" placeholder="E-mail" Required>
									</div>
									<div class="col-lg-6">
										<input type="password" name="senha" placeholder="Senha"
											Required>
									</div>
								</div>
								<div class="col-md-12">
									<div class="col-md-3">
										<button type="submit">
											Enviar<i class="fa fa-chevron-right"></i>
										</button>

									</div>
								</div>
							</div>
							<div class="comment-form wp4 delay-05s">
								<h2 class="sub-title">
									Ou clique <a type="button" data-toggle="modal"
										data-target="#exampleModalLong" style="cursor: pointer;">aqui</a>
									para fazer o cadastro!
								</h2>
							</div>
							<input style="visibility: hidden; width: 0;" type="text"
								value="<%=codigo%>" name="codigo">
						</form>
					</div>
				</div>
				<!--/.comments-area-->
				<%
					}
				%>
			</div>
			<!-- /.col-lg-8 -->
			<!-- Sidebar -->
			<div class="col-lg-3">
				<div class="sidebar-widget">
					<h4>Emoções dos Comentários</h4>
					<ul class="sidebar-categories">
						<li><a>Alegria</a><span class="counter-list"><%=alegria%></span><img
							src="./img/emotion_icons/alegria.png" style="width: 8%;"></li>
						<li><a>Surpresa</a><span class="counter-list"><%=surpresa%></span><img
							src="./img/emotion_icons/surpresa.png" style="width: 8%;"></li>
						<li><a>Desgosto</a><span class="counter-list"><%=desgosto%></span><img
							src="./img/emotion_icons/desgosto.png" style="width: 8%;"></li>
						<li><a>Medo</a><span class="counter-list"><%=medo%></span><img
							src="./img/emotion_icons/medo.png" style="width: 8%;"></li>
						<li><a>Raiva</a><span class="counter-list"><%=raiva%></span><img
							src="./img/emotion_icons/raiva.png" style="width: 8%;"></li>
						<li><a>Tristeza</a><span class="counter-list"><%=tristeza%></span><img
							src="./img/emotion_icons/tristeza.png" style="width: 8%;"></li>
					</ul>
				</div>
			</div>
			<!-- /sidebar-->
		</div>
		<!-- /.row -->
		<!-- /.container -->
	</section>
	<!-- /#blog -->
	<section id="contact" style="background-color: #3f3f3f;">
		<div class="overlay"></div>
		<div class="container text-center">
			<div class="row">
				<div class="copyright">
					© Desenvolvido por <strong style="color: #3293e2;">xcave</strong> <br>
					<strong>DISRUPT21</strong>
				</div>
				<div class="footer-line"></div>
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</section>
	<!-- /#contact -->
	<div class="modal fade" id="exampleModalLong" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLongTitle"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style="background: #3c3c3c;">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Cadastro de
						usuário</h5>
				</div>
				<div class="modal-body">
					<!-- Comment Form -->
					<div class="comment-form wp4 delay-05s">
						<h2 class="sub-title">Cadastre-se</h2>
						<form class="comment-form-wrapper" method="POST"
							action="cadastrarLoginSite" id="form_cadastrarLogin">
							<div class="row">
								<div class="col-md-12 no-padding">
									<div class="col-lg-6">
										<input type="text" placeholder="Apelido" name="apelido"
											Required>
									</div>
									<div class="col-lg-6">
										<input type="text" placeholder="E-mail" name="email" Required>
									</div>
									<div class="col-lg-6">
										<input type="password" placeholder="Senha" name="senha"
											id="senha" Required>
									</div>
									<div class="col-lg-6">
										<input type="password" placeholder="Confirme a senha"
											id="senhaConfirmacao" Required>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<div class="comment-form wp4 delay-05s">
									<div class="col-md-12">
										<div class="col-md-6">
											<input class="botao" style="border: 2px solid red;"
												type="button" id="botaoCadastrarLogin" value="CADASTRAR">
										</div>
										<div class="col-md-6">
											<input class="botao" style="border: 2px solid red;"
												type="button" data-dismiss="modal" value="FECHAR"> <input
												style="visibility: hidden; width: 0;" type="text"
												value="<%=codigo%>" name="codigo">
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Core JavaScript Files -->
	<script src="js/jquery-1.10.2.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.min.js"></script>
	<!-- JavaScript -->
	<script src="js/lib/jquery.appear.js"></script>
	<script src="js/lib/owl-carousel/owl.carousel.min.js"></script>
	<script src="js/lib/magnific-popup/jquery.magnific-popup.min.js"></script>
	<script src="js/lib/video/jquery.mb.YTPlayer.js"></script>
	<script src="js/lib/flipclock/flipclock.js"></script>
	<script src="js/lib/jquery.animateNumber.js"></script>
	<script src="js/lib/waypoints.min.js"></script>
	<!-- Custom Theme JavaScript -->
	<script src="js/main.js"></script>
	<!-- Local JS -->
	<script src="js/cadastrarLoginSite.js"></script>
	<!-- Google JavaScript -->
	<script src="js/main.js"></script>
	<script type="text/javascript">
		function googleTranslateElementInit() {
			new google.translate.TranslateElement({
				pageLanguage : 'pt-br'
			}, 'google_translate_element');
		}
	</script>
	<script type="text/javascript"
		src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>

</body>

</html>