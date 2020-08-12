<%@ tag body-content="empty" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://localhost/jeetags" prefix="siga"%>
<%@ taglib uri="http://localhost/libstag" prefix="f"%>
<%@ attribute name="titulo"%>
<%@ attribute name="menu"%>
<%@ attribute name="idpagina"%>
<%@ attribute name="barra"%>
<%@ attribute name="ambiente"%>
<%@ attribute name="popup"%>
<%@ attribute name="meta"%>
<%@ attribute name="pagina_de_erro"%>
<%@ attribute name="onLoad"%>
<%@ attribute name="desabilitarbusca"%>
<%@ attribute name="desabilitarmenu"%>
<%@ attribute name="incluirJs"%>
<%@ attribute name="compatibilidade"%>
<%@ attribute name="desabilitarComplementoHEAD"%>

<c:if test="${not empty titulo}">
	<c:set var="titulo" scope="request" value="${titulo}" />
</c:if>

<c:if test="${not empty pagina_de_erro}">
	<c:set var="pagina_de_erro" scope="request" value="${pagina_de_erro}" />
</c:if>

<c:if test="${not empty menu}">
	<c:set var="menu" scope="request">${menu}</c:set>
</c:if>

<c:if test="${not empty idpagina}">
	<c:set var="idpage" scope="request">${idpagina}</c:set>
</c:if>

<c:if test="${not empty barra}">
	<c:set var="barranav" scope="request">${barra}</c:set>
</c:if>

<c:set var="XUACompatible" scope="request">IE=EDGE</c:set>
<c:if test="${not empty compatibilidade}">
	<c:set var="XUACompatible" scope="request">${compatibilidade}</c:set>
</c:if>

<c:set var="ambiente">
	<c:if test="${f:resource('isVersionTest') eq 'true' or f:resource('isBaseTest') eq 'true'}">
		<c:if test="${f:resource('isVersionTest')}">SISTEMA</c:if>
		<c:if
			test="${f:resource('isVersionTest') eq 'true' and f:resource('isBaseTest') eq 'true'}"> E </c:if>
		<c:if test="${f:resource('isBaseTest') eq 'true'}">BASE</c:if> DE TESTES
	</c:if>
</c:set>
<c:if test="${not empty ambiente}">
	<c:set var="env" scope="request">${ambiente}</c:set>
</c:if>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no">
<c:choose>
	<c:when test="${siga_cliente == 'GOVSP'}">
		<meta name="theme-color" content="#35b44a">
	</c:when>
	<c:otherwise>
		<meta name="theme-color" content="#007bff">
	</c:otherwise>
</c:choose>
<title>SIGA - ${titulo_pagina}</title>
<META http-equiv="X-UA-Compatible" content="${XUACompatible}">
<META HTTP-EQUIV="Expires" CONTENT="0">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<META HTTP-EQUIV="content-type" CONTENT="text/html; charset=UTF-8">
${meta}

<c:set var="path" scope="request">${pageContext.request.contextPath}</c:set>

<link rel="stylesheet" href="/siga/bootstrap/css/bootstrap.min.css"	type="text/css" media="screen, projection" />

<!-- 
<link rel="stylesheet" href="/siga/css/ecoblue/css/ecoblue.css"
	type="text/css" media="screen, projection">
 -->

<link rel="stylesheet" href="/siga/css/ecoblue/css/custom.css"
	type="text/css" media="screen, projection">
	
	
<script src="/siga/public/javascript/jquery/jquery-1.11.2.min.js" type="text/javascript"></script>
	
<link rel="stylesheet" href="/siga/fontawesome/css/all.css"	type="text/css" />

<c:set var="collapse_Expanded" scope="request" value="collapsible expanded" />
	
<c:choose>
	<c:when test="${siga_cliente == 'GOVSP'}">
		<meta name="theme-color" content="#35b44">
		<link rel="stylesheet" href="/siga/css/style_siga_govsp.css" type="text/css" media="screen, projection">
		
		<c:set var="body_color" value="body_color" scope="request" />
		
		<c:if test="${desabilitarmenu == 'sim'}">
			<c:set var="body_color" value="login_body_color" scope="request" />
		</c:if>
		
		<c:set var="ico_siga" value="siga-doc.ico" />
		<c:set var="menu_class" value="menusp" />
		<c:set var="sub_menu_class" value="submenusp" />
		<c:set var="navbar_class" value="navbar-light" />
		<c:set var="navbar_logo" value="logo-sem-papel-cor.png" />
		<c:set var="navbar_logo_size" value="50" />
		<c:set var="button_class_busca" value="btn-primary" />
		<c:set var="collapse_Tramitacao" scope="request" value="collapsible closed" />
		<c:set var="collapse_NivelAcesso" scope="request" value="collapsible closed" />
		<c:set var="collapse_ArqAuxiliares" scope="request" value="not collapsible" />
		<c:set var="hide_only_GOVSP" scope="request"> d-none </c:set>
		<c:set var="hide_only_TRF2" scope="request"> </c:set>
	</c:when>
	<c:otherwise>
		<meta name="theme-color" content="bg-primary">
		<c:set var="ico_siga" value="siga.ico" />
		<c:set var="menu_class" value="bg-primary" /> 
		<c:set var="sub_menu_class" value="bg-secondary text-white" />
		
		<c:set var="navbar_class" value="navbar-dark bg-primary" />
		<c:if test="${f:resource('isBaseTest')}">
			<c:set var="navbar_class" value="navbar-dark bg-secondary" />
		</c:if>
		
		<c:set var="navbar_logo" value="logo-siga-novo-38px.png" />
		<c:set var="navbar_logo2" value="${f:resource('siga.cabecalho.logo')}" />
		<c:if test="${empty navbar_logo2}">
			<c:set var="navbar_logo2" value="/siga/imagens/logo-trf2-38px.png" />
		</c:if>
		
		<c:set var="navbar_logo_size" value="38" />
		<c:set var="button_class_busca" value="btn-outline-light" />
		<c:set var="collapse_Tramitacao" scope="request" value="collapsible expanded" />
		<c:set var="collapse_NivelAcesso" scope="request" value="collapsible expanded" />
		<c:set var="collapse_ArqAuxiliares" scope="request" value="not collapsible" />
		<c:set var="hide_only_GOVSP" scope="request"> </c:set>
		<c:set var="hide_only_TRF2" scope="request"> d-none </c:set>
	</c:otherwise>
</c:choose>

<link rel="stylesheet" href="/siga/css/style_siga.css" type="text/css" media="screen, projection">
<link rel="shortcut icon" href="/siga/imagens/${ico_siga}" />


<c:catch>
	<c:if test="${desabilitarComplementoHEAD != 'sim'}">
		<c:if test="${not empty titular}">
			${f:getComplementoHead(cadastrante.orgaoUsuario)}
		</c:if>
	</c:if>
</c:catch>
</head>


<body onload="${onLoad}" class="${body_color}">
	<c:if test="${popup!='true'}">
   		<nav class="navbar navbar-expand-lg ${navbar_class} ${menu_class}">
			<a class="navbar-brand pt-0 pb-0" href="/siga"> <img
				src="/siga/imagens/${navbar_logo}" height="${navbar_logo_size}">
			</a>
			
			<c:if test="${siga_cliente != 'GOVSP'}">
				<img id="logo-header2"
					 src="${navbar_logo2}"
				 	 alt="${f:resource('siga.cabecalho.titulo')}" height="${navbar_logo_size}" class="ml-2" />
			</c:if>
			
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<c:if test="${siga_cliente != 'GOVSP' or f:podeUtilizarServicoPorConfiguracao(titular,lotaTitular,'SIGA')}">
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mr-auto">
						<!-- navigation -->
						<siga:menuprincipal />
						<!-- / navigation -->
					</ul>
	
	
					<c:if test="${desabilitarmenu != 'sim'}">
						<!-- search -->
						<c:if test="${desabilitarbusca != 'sim'}">
							<form class="form-inline my-2 my-lg-0">
								<siga:selecao propriedade="buscar" tipo="generico" tema="simple"
									ocultardescricao="sim" buscar="nao" siglaInicial=""
									modulo="siga/public" urlAcao="buscar" urlSelecionar="selecionar"
									matricula="${titular.siglaCompleta}" />
								<button class="btn ${button_class_busca} ml-2 my-2 my-sm-0" type="button" onclick="javascript:buscarDocumentoPorCodigo();">Buscar</button>
								<script type="text/javascript">
									if (false) {
										var lis = document
												.getElementsByTagName('li');
	
										for (var i = 0, li; li = lis[i]; i++) {
											var link = li.getElementsByTagName('a')[0];
	
											if (link) {
												link.onfocus = function() {
													var ul = this.parentNode
															.getElementsByTagName('ul')[0];
													if (ul) {
														ul.style.display = 'block';
													}
												}
												var ul = link.parentNode
														.getElementsByTagName('ul')[0];
												if (ul) {
													var ullinks = ul
															.getElementsByTagName('a');
													var ullinksqty = ullinks.length;
													var lastItem = ullinks[ullinksqty - 1];
													if (lastItem) {
														lastItem.onblur = function() {
															this.parentNode.parentNode.style.display = 'none';
															if (this.id == "relclassificados") {
																var rel = document
																		.getElementById("relatorios");
																rel.style.display = 'none';
															}
														}
														lastItem.parentNode.onblur = function() {
															this.parentNode.style.display = '';
														}
													}
												}
											}
										}
									}
	
									var fld = document
											.getElementsByName('buscar_genericoSel.sigla')[0];
									fld.placeholder = 'Número de Documento';
									fld.onblur = '';
									fld.onkeypress = function(event) {
										var fid = document
												.getElementsByName('buscar_genericoSel.id')[0];
	
										event = (event) ? event : window.event
										var keyCode = (event.which) ? event.which
												: event.keyCode;
										if (keyCode == 13) {
											if (fid.value == null
													|| fid.value == "") {
												buscarDocumentoPorCodigo();
											}
											return false;
										} else {
											fid.value = '';
											return true;
										}
									};

									function buscarDocumentoPorCodigo() {
										if (this.value == '') {
											this.value = placeholder;
											return;
										}
										ajax_buscar_generico();
									};
	
									self.resposta_ajax_buscar_generico = function(
											response, d1, d2, d3) {
										var sigla = document
												.getElementsByName('buscar_genericoSel.sigla')[0].value;
										var data = response.split(';');
										if (data[0] == '1') {
											retorna_buscar_generico(data[1],
													data[2], data[3]);
											if (data[1] != null && data[1] != "") {
												window.location.href = data[3];
											}
											return;
										}
										retorna_buscar_generico('', '', '');
										return;
									}
								</script>
							</form>
						</c:if>
					</c:if>
				</div>
			</c:if>
		</nav>

		<div class="container-fluid content">
			<div class="row pt-2 pb-2 mb-3 ${sub_menu_class}" >
				<!-- usuário -->
				<div class="col col-sm-6">
					<div class="gt-company">
						<strong><span>${f:resource('siga.cabecalho.titulo')}</span> </strong>
						 <c:catch>
								<c:if test="${not empty titular.orgaoUsuario.descricao}"><span style="white-space: nowrap;"> <i class="fa fa-angle-right"></i> ${titular.orgaoUsuario.descricao}</span></h6></c:if>
						 </c:catch>
					</div>
					
					<!-- 
					<div class="gt-version">
						Sistema Integrado de Gest&atilde;o Administrativa
						<c:if test="${not empty env}"> - <span style="color: red">${env}</span>
						</c:if>
					</div>
					 -->
				</div>
				<c:if test="${not empty cadastrante}">
					<div class="col col-sm-6 text-right">
								<span class="align-middle">Olá, <i class="fa fa-user"></i> <strong><c:catch>
										<c:out default="Convidado"
											value="${f:maiusculasEMinusculas(cadastrante.nomePessoa)}" />
										<c:choose>
											<c:when test="${not empty cadastrante.lotacao}">
						 						<span style="white-space: nowrap;"><i class="fa fa-building"></i> ${cadastrante.lotacao.sigla}</span>
						 					</c:when>
										</c:choose>
									</c:catch> </strong> 
									<a class="ml-3" onclick="javascript:location.href='/siga/public/app/logout'"><i class="fas fa-sign-out-alt"></i> Sair</a>
								</span>
							<div>
								<c:catch>
									<c:choose>
										<c:when
											test="${not empty titular && titular.idPessoa!=cadastrante.idPessoa}">Substituindo: <strong>${f:maiusculasEMinusculas(titular.nomePessoa)}</strong>
											<span class="gt-util-separator">|</span>
											<a href="/siga/app/substituicao/finalizar">finalizar</a>
										</c:when>
										<c:when
											test="${not empty lotaTitular && lotaTitular.idLotacao!=cadastrante.lotacao.idLotacao}">Substituindo: <strong>${f:maiusculasEMinusculas(lotaTitular.nomeLotacao)}</strong>
											<span class="gt-util-separator">|</span>
											<a href="/siga/app/substituicao/finalizar">finalizar</a>
										</c:when>
										<c:otherwise></c:otherwise>
									</c:choose>
								</c:catch>
							</div>
					</div>
				</c:if>
			</div>
		</div>


		<div id="quadroAviso"
			style="position: absolute; font-weight: bold; padding: 4px; color: white; visibility: hidden">-</div>

	</c:if>

	<div id="carregando"
		style="position: absolute; top: 0px; right: 0px; background-color: red; font-weight: bold; padding: 4px; color: white; display: none">Carregando...</div>