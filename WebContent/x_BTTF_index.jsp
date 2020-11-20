<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>xcave | BTTF</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">

<!-- Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

<!-- Custom Theme CSS -->
<link href="css/style.css" rel="stylesheet">
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

</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-custom">
	<!-- Navigation -->
	<nav class="navbar navbar-custom navbar-fixed-top wp1"
		role="navigation">
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

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div
				class="collapse navbar-collapse navbar-right navbar-main-collapse">
				<ul class="nav navbar-nav">
					<!-- Hidden li included to remove active class from about link when scrolled up past about section -->

					<li class="hidden"><a href="#page-top"></a></li>
					<li class="page-scroll"><a href="#about">Sobre</a></li>
					<li class="page-scroll"><a href="#movie-player">Trailer</a></li>
					<li class="page-scroll"><a href="#actors">Personagens</a></li>
					<li class="page-scroll"><a href="#blog">Enredo</a></li>
					<li class="page-scroll"><a href="#arte">DISRUPT21</a></li>
					<li class="page-scroll"><a target="_blank"
						href="x_BTTF_game.jsp">Game</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<!-- Intro Section -->
	<section id="intro">
		<div class="video-content">
			<div class="video-image wp1 delay-1s">
				<img src="./img/hero.jpg" width="100%;">
			</div>
		</div>
	</section>
	<!-- /#intro -->

	<!-- About Section -->
	<section id="about">
		<div class="more page-scroll" id="more">
			<a href="#about"><i class="fa fa-angle-down"></i></a>
		</div>
		<div class="container wp2">
			<h1 class="section-title">Sobre o filme</h1>
			<div class="row">
				<div class="col-lg-6 wp2 delay-05s">
					<img src="./img/poster.jpg" style="height: 550px;">
				</div>
				<!-- /.col-lg-6 -->
				<div class="col-lg-6 wp2 delay-1s">
					<h2>Back to the Future</h2>
					<h4 class="sub-text">
						Lançamento: 3 de Junho, 1985<br>
					</h4>
					<TABLE class="text-dark">
						<TR>
							<TD>Direção</TD>
							<TD>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</TD>
							<TD>Robert Zemeckis</TD>
						</TR>

						<TR>
							<TD>Gênero</TD>
							<TD>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</TD>
							<TD>Ficção Científica</TD>
						</TR>

						<TR>
							<TD>Orçamento</TD>
							<TD>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</TD>
							<TD>US$ 19 milhões</TD>
						</TR>

						<TR>
							<TD>Duração</TD>
							<TD>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</TD>
							<TD>1h 56mins</TD>
						</TR>

						<TR>
							<TD>Idade</TD>
							<TD>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</TD>
							<TD><span class="detailed-text">12+</span></TD>
						</TR>

					</TABLE>
					<br>
					<p>
						Marty McFly, um adolescente de uma pequena cidade californiana, é
						transportado para a década de 1950 quando a experiência do
						excêntrico cientista Doc Brown dá errado. Viajando no tempo em um
						carro modificado, Marty conhece versões jovens de seus pais e
						precisa fazer com que eles se apaixonem, ou então ele deixará de
						existir. Para complicar, Marty precisa voltar para casa a tempo de
						salvar o cientista. <br>
					<div class="detailed">
						Nota:&nbsp;&nbsp; <i class="fa fa-star"></i> <i class="fa fa-star"></i>
						<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star-half-o"></i> <span>IMDb &nbsp;<b>/
								8.5</b></span>
					</div>
					<p></p>
				</div>
				<!-- /.col-lg-6 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</section>
	<!-- /#about -->
	<!-- About-Sub Section -->
	<section id="about-sub">
		<div class="container">
			<div class="row">
				<div id="expand-counters" class="">
					<h2 class="sub-title">Crítica</h2>
					<ul class="features-wrap">
						<li>
							<h6>IMDb</h6>
							<div>
								<span class="expand expand-1"><em><b
										id="expand-counter-1"></b>%</em></span>
							</div>
						</li>
						<li>
							<h6>Rotten Tomatoes</h6>
							<div>
								<span class="expand expand-2"><em><b
										id="expand-counter-2"></b>%</em></span>
							</div>
						</li>
						<li>
							<h6>Metacritic</h6>
							<div>
								<span class="expand expand-3"><em><b
										id="expand-counter-3"></b>%</em></span>
							</div>
						</li>
						<li>
							<h6>Amazon</h6>
							<div>
								<span class="expand expand-4"><em><b
										id="expand-counter-4"></b>%</em></span>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</section>
	<!-- /#about-sub -->
	<!-- Movie-Player Section -->
	<section id="movie-player">
		<div class="overlay"></div>
		<div class="movie-player-element"></div>
		<div class="damper-left"></div>
		<div class="damper-right"></div>
		<div class="container">
			<div class="col-lg-10 col-lg-offset-1 wp5 delay-05s">
				<h1 class="section-title">Assista ao trailer!</h1>
				<!-- 16:9 aspect ratio -->
				<div class="embed-responsive embed-responsive-16by9">
					<iframe width="560" height="315"
						src="https://www.youtube.com/embed/qvsgGtivCgs" frameborder="0"
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe>
				</div>
				<br> <br>
				<p class="text-center">Um jovem é acidentalmente transportado 30
					anos no passado em uma máquina do tempo DeLorean, inventada pelo
					seu amigo, Dr. Emmett Brown, e deve garantir que seus pais se
					apaixonem para salvar sua própria existência.</p>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.container -->
	</section>
	<!-- /#movie-player -->
	<%
		int codigoLogin = 0;
	%>
	<section id="actors">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="section-title">Personagens</h1>
					<div id="owl-actors" class="owl-carousel owl-theme"
						style="cursor: pointer;">
						<form action="x_BTTF_personagem.jsp" method="GET" id="form_marty">
							<div class="item" class="button" id="marty"
								onclick="submitForm_marty()" title="marty">
								<div class="col-md-12 wp6">
									<div class="actor">
										<div class="mouse-hover">
											<img alt="img" src="img/personagens/marty.png">
										</div>
									</div>
									<!-- /.actor -->
									<div class="actor-info">
										<h4 class="heading">Marty McFly</h4>
										<h5 class="sub-heading">
											Ator: Michael J. Fox<br>
										</h5>
									</div>
									<!-- /.actor-info -->
									<input type="hidden" value="1" name="codigo">
									<%
										try {
										codigoLogin = Integer.parseInt(request.getParameter("codigoLogin"));
									} catch (Exception e) {
									}
									if (codigoLogin != 0) {
									%>
									<input style="visibility: hidden; width: 0;" type="text"
										value="<%=codigoLogin%>" name="codigoLogin">
									<%
										}
									%>
								</div>
							</div>
							<!-- /.item -->
						</form>
						<form action="x_BTTF_personagem.jsp" method="GET"
							id="form_doc_brown">
							<div class="item" class="button" id="doc_brown"
								onclick="submitForm_doc_brown()" title="doc_brown">
								<div class="col-md-12 wp6 delay-05s">
									<div class="actor">
										<div class="mouse-hover">
											<img alt="img" src="img/personagens/doc_brown.png">
										</div>
									</div>
									<div class="actor-info">
										<h4 class="heading">Emmett Brown</h4>
										<h5 class="sub-heading">
											Ator: Christopher Lloyd<br>
										</h5>
									</div>
									<!-- /.actor-info -->
									<input type="hidden" value="2" name="codigo">
									<%
										try {
										codigoLogin = Integer.parseInt(request.getParameter("codigoLogin"));
									} catch (Exception e) {
									}
									if (codigoLogin != 0) {
									%>
									<input style="visibility: hidden; width: 0;" type="text"
										value="<%=codigoLogin%>" name="codigoLogin">
									<%
										}
									%>
								</div>
							</div>
							<!-- /.item -->
						</form>
						<form action="x_BTTF_personagem.jsp" method="GET" id="form_george">
							<div class="item" class="button" id="george"
								onclick="submitForm_george()" title="george">
								<div class="col-md-12 wp6 delay-05s">
									<div class="actor">
										<div class="mouse-hover">
											<img alt="img" src="img/personagens/george.png">
										</div>
									</div>
									<div class="actor-info">
										<h4 class="heading">George McFly</h4>
										<h5 class="sub-heading">
											Ator: Crispin Glover<br>
										</h5>
									</div>
									<!-- /.actor-info -->
									<input type="hidden" value="3" name="codigo">
									<%
										try {
										codigoLogin = Integer.parseInt(request.getParameter("codigoLogin"));
									} catch (Exception e) {
									}
									if (codigoLogin != 0) {
									%>
									<input style="visibility: hidden; width: 0;" type="text"
										value="<%=codigoLogin%>" name="codigoLogin">
									<%
										}
									%>
								</div>
							</div>
							<!-- /.item -->
						</form>
						<form action="x_BTTF_personagem.jsp" method="GET"
							id="form_lorraine">
							<div class="item" class="button" id="lorraine"
								onclick="submitForm_lorraine()" title="lorraine">
								<div class="col-md-12 wp6 delay-05s">
									<div class="actor">
										<div class="mouse-hover">
											<img alt="img" src="img/personagens/lorraine.png">
										</div>
									</div>
									<div class="actor-info">
										<h4 class="heading">Lorraine Baines McFly</h4>
										<h5 class="sub-heading">
											Atriz: Lea Thompson<br>
										</h5>
									</div>
									<!-- /.actor-info -->
									<input type="hidden" value="4" name="codigo">
									<%
										try {
										codigoLogin = Integer.parseInt(request.getParameter("codigoLogin"));
									} catch (Exception e) {
									}
									if (codigoLogin != 0) {
									%>
									<input style="visibility: hidden; width: 0;" type="text"
										value="<%=codigoLogin%>" name="codigoLogin">
									<%
										}
									%>
								</div>
							</div>
							<!-- /.item -->
						</form>
						<form action="x_BTTF_personagem.jsp" method="GET" id="form_biff">
							<div class="item" class="button" id="biff"
								onclick="submitForm_biff()" title="biff">
								<div class="col-md-12 wp6 delay-05s">
									<div class="actor">
										<div class="mouse-hover">
											<img alt="img" src="img/personagens/biff.png">
										</div>
									</div>
									<div class="actor-info">
										<h4 class="heading">Biff Tannen</h4>
										<h5 class="sub-heading">
											Ator: Thomas F. Wilson<br>
										</h5>
									</div>
									<!-- /.actor-info -->
									<input type="hidden" value="5" name="codigo">
									<%
										try {
										codigoLogin = Integer.parseInt(request.getParameter("codigoLogin"));
									} catch (Exception e) {
									}
									if (codigoLogin != 0) {
									%>
									<input style="visibility: hidden; width: 0;" type="text"
										value="<%=codigoLogin%>" name="codigoLogin">
									<%
										}
									%>
								</div>
							</div>
							<!-- /.item -->
						</form>
						<form action="x_BTTF_personagem.jsp" method="GET"
							id="form_jennifer">
							<div class="item" class="button" id="jennifer"
								onclick="submitForm_jennifer()" title="jennifer">
								<div class="col-md-12 wp6 delay-05s">
									<div class="actor">
										<div class="mouse-hover">
											<img alt="img" src="img/personagens/jennifer.png">
										</div>
									</div>
									<div class="actor-info">
										<h4 class="heading">Jennifer Parker</h4>
										<h5 class="sub-heading">
											Atriz: Claudia Wells<br>
										</h5>
									</div>
									<!-- /.actor-info -->
									<input type="hidden" value="6" name="codigo">
									<%
										try {
										codigoLogin = Integer.parseInt(request.getParameter("codigoLogin"));
									} catch (Exception e) {
									}
									if (codigoLogin != 0) {
									%>
									<input style="visibility: hidden; width: 0;" type="text"
										value="<%=codigoLogin%>" name="codigoLogin">
									<%
										}
									%>
								</div>
							</div>
							<!-- /.item -->
						</form>
					</div>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
		<!-- Advantages -->
		<div class="advantages">
			<div class="section-sub-title">Prêmios de Maior Destaque</div>
			<div class="colored-line"></div>
			<div class="container">
				<div class="col-md-4 advantages-item wp7 delay-05s">
					<div class="advantages-item-icon">
						<i class="fa fa-star-o"></i>
					</div>
					<h3>People's Choice Award</h3>
					<p>Ano: 1986. Concorrendo à categoria de "Filme Favorito".</p>
				</div>
				<!-- /.col-md-4 -->
				<div class="col-md-4 advantages-item wp7">
					<div class="advantages-item-icon">
						<i class="fa fa-flag-o"></i>
					</div>
					<h3>Oscar</h3>
					<p>Ano: 1986. Ganhador do Oscar de "Melhor Edição de Som".</p>
				</div>
				<!-- /.col-md-4 -->
				<div class="col-md-4 advantages-item wp7 delay-05s">
					<div class="advantages-item-icon">
						<i class="fa fa-thumbs-o-up"></i>
					</div>
					<h3>David di Donatello</h3>
					<p>Ano: 1986. Ganhou o prêmio David di Donatello de "Melhor
						Roteiro Estrangeiro".</p>
				</div>
				<!-- /.col-md-4 -->
			</div>
			<!-- /.advantages -->

		</div>
		<!-- /.container -->
	</section>
	<!-- /#actors -->
	<!-- Blog Section -->
	<section id="blog">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 wp9 delay-05s">
					<h1 class="section-title">Enredo</h1>
					<div id="owl-blog">
						<div class="item">
							<div class="blog-item">
								<img src="./img/historia/foto_1.png" style="width: 80%;">
							</div>
							<div>
								<p>
									<strong>Marty McFly</strong> é um adolescente vivendo com uma
									família sem vida e sem ambição na cidade de Hill Valley,
									Califórnia. Seu pai, <strong>George McFly</strong>, é
									constantemente intimidado por seu supervisor de trabalho, <strong>Biff
										Tannen</strong>, e sua mãe infeliz, <strong>Lorraine Baines
										McFly</strong>, está acima do peso e tem um problema com bebida. Os
									irmãos de Marty, <strong>Dave</strong> e <strong>Linda</strong>,
									vivem ainda na casa dos pais trabalhando em subempregos.
									Almejando alcançar seu sonho de tornar-se um astro de rock,
									Marty e sua banda fazem um teste para tocarem em uma festa da
									escola, no qual acabam sendo rejeitados. Apesar do revés, a
									namorada de Marty, <strong>Jennifer Parker</strong>, o encoraja
									a não desistir de seus objetivos e acreditar em seu futuro. No
									jantar daquela noite, Lorraine conta à família como ela e
									George se apaixonaram quando seu pai o atropelou na rua.
								</p>
							</div>
							<!-- /.prev-blog-item -->
						</div>
						<!-- /.item -->
						<div class="item">
							<div class="blog-item">
								<img src="./img/historia/foto_2.png" style="width: 80%;">
							</div>
							<div>
								<p>
									Na madrugada do dia 26 de outubro de 1985, Marty encontra seu
									amigo, o cientista <strong>Dr. Emmett Brown</strong>, no
									Shopping Pinheiros Gêmeos à 1h15min. a pedido do Doutor. Lá,
									ele revela ao rapaz um DeLorean DMC-12 modificado para
									tornar-se uma máquina do tempo; o deslocamento temporal do
									veículo, que é acionado quando a máquina atinge 88 milhas por
									hora de velocidade, é providenciado por um aparato chamado
									"Capacitor de Fluxo", que exige 1,21 gigawatts providenciados
									por fissão nuclear.
								</p>
							</div>
							<!-- /.prev-blog-item -->
						</div>
						<!-- /.item -->
						<div class="item">
							<div class="blog-item">
								<img src="./img/historia/foto_3.png" style="width: 80%;">
							</div>
							<div>
								<p>Para conseguir o plutônio que abastece o reator, o Doutor
									enganou terroristas líbios que queriam que ele construísse uma
									bomba nuclear. Após um teste com seu cachorro, Dr. Brown se
									prepara para viajar para o futuro, quando os líbios aparecem e
									matam o cientista a tiros de metralhadora, à 1h33min.
									Indefeso, Marty tenta escapar no DeLorean, porém, durante a
									fuga, ele acaba ligando os Circuitos de Tempo (o que programa a
									viagem no tempo do DeLorean) e alcança a velocidade de 88
									milhas por hora e é transportado, à 1h35min., para 5 de
									novembro de 1955, uma data que o Doutor havia programado nos
									Circuitos de Tempo do DeLorean como um exemplo.</p>
							</div>
							<!-- /.prev-blog-item -->
						</div>
						<!-- /.item -->
						<div class="item">
							<div class="blog-item">
								<img src="./img/historia/foto_4.png" style="width: 80%;">
							</div>
							<div>
								<p>No passado, Marty acaba caindo no Rancho Dois Pinheiros,
									um rancho de dois pinheiros em que no futuro vai se tornar o
									Shopping Pinheiros Gêmeos, comandado pelo velho fazendeiro
									Peabody. E acaba assustando o velho e sua família com sua roupa
									de radiação por se parecer um alienígena e a máquina do tempo
									uma nave espacial. Ao escapar do Rancho sem saber que voltou no
									tempo, Marty sem querer derruba um dos pinheiros, deixando
									Peabody muito zangado. Isso acaba fazendo com que o rancho
									tenha o nome alterado para Rancho Pinheiro Solitário e
									posteriormente o shopping como Shopping Pinheiro Solitário. Sem
									plutônio, o carro eventualmente se desliga sozinho e Marty
									agora encontra-se preso em 1955.</p>
							</div>
							<!-- /.prev-blog-item -->
						</div>
						<!-- /.item -->
						<div class="item">
							<div class="blog-item">
								<img src="./img/historia/foto_5.png" style="width: 80%;">
							</div>
							<div>
								<p>Ao explorar a Hill Valley daquela década, Marty
									acidentalmente encontra seu pai, George, como um adolescente
									que é intimidado por Biff. Quando George está prestes a ser
									atropelado pelo carro do pai de Lorraine, Marty o empurra
									salvando-o e recebendo o impacto em seu lugar. Como resultado,
									a jovem Lorraine fica apaixonada por ele e não por George.
									Marty fica perturbado pelos flertes dela e parte da residência
									dos Baines para encontrar o jovem Doutor Brown de 1955. O rapaz
									eventualmente convence o incrédulo Emmett de que ele é
									realmente um viajante do tempo e pede sua ajuda para voltar a
									1985.</p>
							</div>
							<!-- /.prev-blog-item -->
						</div>
						<!-- /.item -->
						<div class="item">
							<div class="blog-item">
								<img src="./img/historia/foto_6.png" style="width: 80%;">
							</div>
							<div>
								<p>O Doutor explica que a única fonte de energia capaz de
									gerar 1,21 Gigawatts é um raio. Marty então mostra a ele um
									panfleto que ele havia recebido no dia anterior na praça do
									relógio da Torre sobre um raio que havia atingido a Torre do
									Relógio da cidade, desativando-o desde então. O panfleto
									indicava que um raio iria atingir o relógio da corte judicial
									de Hill Valley no sábado seguinte às 22h04min. Com esta
									informação, o Doutor cria um plano para fazer a energia do raio
									ser direcionada para o Capacitor de Fluxo do DeLorean. Todavia,
									os dois observam uma complicação ao ver a imagem dos irmãos de
									Marty desaparecendo em uma foto: Marty impediu que seus pais se
									encontrassem e comprometeu a existência dele e de sua família.
								</p>
							</div>
							<!-- /.prev-blog-item -->
						</div>
						<!-- /.item -->
						<div class="item">
							<div class="blog-item">
								<img src="./img/historia/foto_7.png" style="width: 80%;">
							</div>
							<div>
								<p>Durante toda a semana seguinte, Marty tenta consertar o
									paradoxo temporal e salvar seu futuro com seus pais, porém ele
									só consegue que o interesse de Lorraine por ele vá
									gradativamente aumentando. Para poder fazer os dois se
									apaixonarem, Marty planeja fazer George "resgatar" Lorraine dos
									avanços sexuais encenados por ele na noite do baile
									"Encantamento do Fundo-do-Mar". Entretanto, o plano não corre
									exatamente como o planejado, já que Marty é interrompido por um
									embriagado Biff que inesperadamente surge, tirando Marty do
									carro e abusando de Lorraine. George aparece como planejado
									para resgatá-la de Marty, porém acaba encontrado Biff. Apesar
									das ameaças de Biff, George abandona sua costumeira submissão e
									o enfrenta pela primeira vez, lhe dando um forte soco no rosto,
									deixando-o inconsciente.</p>
							</div>
							<!-- /.prev-blog-item -->
						</div>
						<!-- /.item -->
						<div class="item">
							<div class="blog-item">
								<img src="./img/historia/foto_8.png" style="width: 80%;">
							</div>
							<div>
								<p>Lorraine e George vão para o baile onde eles se beijam
									pela primeira vez, assegurando a existência de Marty e seus
									irmãos. Com seu futuro salvo, Marty chega na cena do antecipado
									raio na torre do relógio onde o Doutor está fazendo os
									preparativos finais. Marty tenta avisá-lo sobre seu assassinato
									em 1985 com uma carta, porém o Doutor a rasga sem ler, com medo
									de alterar o futuro. Um enorme galho de árvore acidentalmente
									desconecta o arranjo de fios do Doutor para capturar a energia
									do raio, porém os dois consertam as conexões a tempo de enviar
									Marty e o DeLorean de volta para 1985, com a energia de 1,21
									Gigawatts do raio no Capacitor de Fluxo, exatamente às 22:04
									após o raio atingir e danificar o Relógio da Torre, parando-o.
								</p>
							</div>
							<!-- /.prev-blog-item -->
						</div>
						<!-- /.item -->
						<!-- /.item -->
						<div class="item">
							<div class="blog-item">
								<img src="./img/historia/foto_9.png" style="width: 80%;">
							</div>
							<div>
								<p>Em 1985, após retornar, o DeLorean quebra e Marty é
									forçado a correr ao Lone Pine Mall, chegando bem a tempo de ver
									o Doutor ser baleado novamente. Enquanto Marty sofre ao seu
									lado, o Doutor senta-se revelando que estava usando um colete a
									prova de balas após reconstruir a carta que havia destruido.
									Ele então deixa Marty em casa antes de viajar para o futuro no
									DeLorean.</p>
							</div>
							<!-- /.prev-blog-item -->
						</div>
						<!-- /.item -->
						<div class="item">
							<div class="blog-item">
								<img src="./img/historia/foto_10.png" style="width: 80%;">
							</div>
							<div>
								<p>Marty acorda na manhã seguinte e descobre que seu pai é
									um autor bem-sucedido e confiante, sua mãe está saudável e seus
									irmãos são um sucesso. Biff, no entanto, é o funcionário de
									George responsável por estacionar seus carros. Depois de Marty
									voltar para Jennifer, o Doutor reaparece, insistindo que
									retornem com ele ao futuro para ajudarem seus futuros filhos.</p>
							</div>
							<!-- /.prev-blog-item -->
						</div>
						<!-- /.item -->
						<div class="item">
							<div class="blog-item">
								<img src="./img/historia/foto_11.png" style="width: 80%;">
							</div>
							<div>
								<p>Continua no próximo filme...</p>
							</div>
							<!-- /.prev-blog-item -->
						</div>
					</div>
					<!-- /.owl-blog -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</section>
	<!-- /#blog -->
	<div>
		<img id="arte" src="./img/disrupt_21.png" class="img-fluid responsive"
			style="width: 100%; height: 1000;">
	</div>
	
	<!-- Contact Section -->
	<section id="contact" style="background-color: #3f3f3f;">
		<div class="overlay"></div>
		<div class="container text-center">
			<div class="row">
				<div class="copyright">
<p>
						Clique <a href="./download-files/Diagrama.pdf" download="Diagrama"
							add target="_blank">aqui</a> para baixar o Diagrama de Classes do
						projeto!
					</p>
					<p>
						Clique <a href="./download-files/Informações-IA.pdf"
							download="Informações-IA" add target="_blank">aqui</a> para
						baixar o Documento explicativo do algoritmo de Machine Learning!
					</p>
					<br><br>
					<p>
						© Desenvolvido por <strong style="color: #3293e2;">xcave</strong>
						<br> <strong>DISRUPT21</strong>
					</p>
				</div>
				<div class="footer-line"></div>
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</section>
	<!-- /#contact -->

	<!-- Core JavaScript Files -->
	<script src="js/jquery-1.10.2.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.min.js"></script>
	<script src="js/personagens.js"></script>
	<!-- JavaScript -->
	<script src="js/lib/jquery.appear.js"></script>
	<script src="js/lib/owl-carousel/owl.carousel.min.js"></script>
	<script src="js/lib/magnific-popup/jquery.magnific-popup.min.js"></script>
	<script src="js/lib/video/jquery.mb.YTPlayer.js"></script>
	<script src="js/lib/flipclock/flipclock.js"></script>
	<script src="js/lib/jquery.animateNumber.js"></script>
	<script src="js/lib/waypoints.min.js"></script>
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