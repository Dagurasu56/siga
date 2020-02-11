<%@ page language="java" contentType="text/html; charset=UTF-8"
	buffer="64kb"%>
<%@ taglib uri="/WEB-INF/tld/func.tld" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://localhost/jeetags" prefix="siga"%>
<%@ taglib uri="http://localhost/libstag" prefix="fx"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

	<li>
		<a href="/sigaex/app/expediente/doc/editar"><i class="fas fa-plus-circle mr-1"></i>
			<span class="nav-label"><fmt:message key="documento.novo"/></span></a>
	</li>
	<li>
		<a href="/sigaex/app/expediente/doc/listar?primeiraVez=sim"><i class="fas fa-search mr-1"></i>
			<span class="nav-label"><fmt:message key="documento.pesquisar"/></span> 
		</a>
	</li>
<c:if
	test="${f:podeUtilizarServicoPorConfiguracao(titular,lotaTitular,'SIGA;DOC:Módulo de Documentos')}">
	<li>
		<a href="#"><i class="far fa-file"></i>
			<span class="nav-label">Documentos </span><span class="fa arrow"></span>
		</a>
		<ul class="nav nav-second-level collapse" aria-expanded="false">				
			<li><a
				href="/sigaex/app/expediente/doc/editar">Novo</a></li>
			<li><a
				href="/sigaex/app/expediente/doc/listar?primeiraVez=sim">Pesquisar</a></li>

			<li><a href="/sigaex/app/mesa">Mesa
					Virtual </a></li>
			<c:if test="${not empty meusDelegados && fx:podeDelegarVisualizacao(cadastrante, cadastrante.lotacao)}">
				<li><a href="#"
					>Mesa Virtual Delegada</a>
					<ul class="nav nav-third-level collapse" aria-expanded="false">	
						<c:forEach var="visualizacao" items="${meusDelegados}">
							<li><a
								href="/siga/app/visualizacao/visualizacaoGravar?idVisualizacao=${visualizacao.idVisualizacao}">
											${f:maiusculasEMinusculas(visualizacao.titular.nomePessoa)}
							</a></li>
						</c:forEach>
		
					</ul>
				</li>
			</c:if>
			<div class="dropdown-divider"></div>
			<c:catch>
				<c:if
					test="${f:podeUtilizarServicoPorConfiguracao(titular,lotaTitular,'SIGA:Sistema Integrado de Gestão Administrativa;DOC:Módulo de Documentos;TRAMITE:Trâmite;LOTE:Em Lote')}">
					<li><a
						href="/sigaex/app/expediente/mov/transferir_lote">Transferir
							em lote</a></li>
					<li><a
						href="/sigaex/app/expediente/mov/receber_lote">Receber em lote</a></li>
					<li><a
						href="/sigaex/app/expediente/mov/anotar_lote">Anotar em lote</a></li>
					<li><a
						href="/sigaex/app/expediente/mov/assinar_tudo">Assinar em lote</a></li>
				</c:if>
			</c:catch>


		<!--  Retirado pois já não funcionava desta forma	<c:catch>
				<c:if
					test="${f:podeUtilizarServicoPorConfiguracao(titular,lotaTitular,'SIGA:Sistema Integrado de Gestão Administrativa;DOC:Módulo de Documentos;ASS:Assinatura digital;EXT:Extensão')}">
					<li><a
						href="/sigaex/app/expediente/mov/assinar_lote">Assinar em lote</a></li>
				</c:if>
			</c:catch> 
			<c:catch>
				<c:if
					test="${f:podeUtilizarServicoPorConfiguracao(titular,lotaTitular,'SIGA:Sistema Integrado de Gestão Administrativa;DOC:Módulo de Documentos;ASS:Assinatura digital;EXT:Extensão')}">
					<span class="${hide_only_GOVSP}"><li><a
							class="dropdown-item"
							href="/sigaex/app/expediente/mov/assinar_despacho_lote">Assinar
								Despacho em lote</a></li></span>
				</c:if>
			</c:catch> -->
			<c:catch>
				<c:if
					test="${f:podeUtilizarServicoPorConfiguracao(titular,lotaTitular,'SIGA:Sistema Integrado de Gestão Administrativa;DOC:Módulo de Documentos;TRAMITE:Trâmite;LOTE:Em Lote')}">
					<li><a
						href="/sigaex/app/expediente/mov/arquivar_corrente_lote">Arquivar
							em lote</a></li>
				</c:if>
			</c:catch>
			<c:catch>
				<c:if
					test="${f:podeArquivarPermanentePorConfiguracao(titular,lotaTitular)}">
					<li><a
						href="/sigaex/app/expediente/mov/arquivar_intermediario_lote">Arquivar
							Intermediário em lote</a></li>
				</c:if>
			</c:catch>
			<c:catch>
				<c:if
					test="${f:podeArquivarPermanentePorConfiguracao(titular,lotaTitular)}">
					<li><a
						href="/sigaex/app/expediente/mov/arquivar_permanente_lote">Arquivar
							Permanente em lote</a></li>
				</c:if>
			</c:catch>
			<c:catch>
				<c:if
					test="${f:testaCompetencia('atenderPedidoPublicacao',titular,lotaTitular,null)}">
					<li><a
						href="/sigaex/app/expediente/mov/atender_pedido_publicacao">Gerenciar
							Publicação DJE</a></li>
				</c:if>
			</c:catch>

			<c:catch>
				<c:if
					test="${f:testaCompetencia('gerenciarPublicacaoBoletimPorConfiguracao',titular,lotaTitular,null)}">
					<li><a
						href="/sigaex/app/expediente/configuracao/gerenciar_publicacao_boletim">Definir
							Publicadores Boletim</a></li>
				</c:if>
			</c:catch>
		</ul>
	</li>
<c:if
	test="${f:podeUtilizarServicoPorConfiguracao(titular,lotaTitular,'SIGA:Sistema Integrado de Gestão Administrativa;DOC:Módulo de Documentos;FE:Ferramentas')}">
	<li>
		<a href="#"><i class="fas fa-tools"></i>
			<span class="nav-label">Ferramentas </span><span class="fa arrow"></span>
		</a>
		<ul class="nav nav-second-level collapse" aria-expanded="false">
			<li><a href="/sigaex/app/forma/listar">Cadastro
					de Espécies</a></li>
			<li><a href="/sigaex/app/modelo/listar">Cadastro
					de modelos</a></li>
			<c:if
				test="${f:podeUtilizarServicoPorConfiguracao(titular,lotaTitular,'SIGA:Sistema Integrado de Gestão Administrativa;DOC:Módulo de Documentos;FE:Ferramentas;DESP:Tipos de despacho')}">
				<li><a
					href="/sigaex/app/despacho/tipodespacho/listar">Cadastro de
						tipos de despacho</a></li>
			</c:if>
			<c:if
				test="${f:podeUtilizarServicoPorConfiguracao(titular,lotaTitular,'SIGA:Sistema Integrado de Gestão Administrativa;DOC:Módulo de Documentos;FE:Ferramentas;CFG:Configurações')}">
				<li><a
					href="/sigaex/app/expediente/configuracao/listar">Cadastro de
						configurações</a></li>
			</c:if>

			<c:if
				test="${f:podeUtilizarServicoPorConfiguracao(titular,lotaTitular,'SIGA:Sistema Integrado de Gestão Administrativa;DOC:Módulo de Documentos;FE:Ferramentas;EMAIL:Email de Notificação')}">
				<li><a
					href="/sigaex/app/expediente/emailNotificacao/listar">Cadastro
						de email de notificação</a></li>
			</c:if>

			<c:if
				test="${f:podeUtilizarServicoPorConfiguracao(titular,lotaTitular,'SIGA:Sistema Integrado de Gestão Administrativa;DOC:Módulo de Documentos;FE:Ferramentas;PC:Plano de Classificação')}">
				<li><a
					href="/sigaex/app/expediente/classificacao/listar">Classificação
						Documental</a></li>
			</c:if>
			<c:if
				test="${f:podeUtilizarServicoPorConfiguracao(titular,lotaTitular,'SIGA:Sistema Integrado de Gestão Administrativa;DOC:Módulo de Documentos;FE:Ferramentas;TT:Tabela de Temporalidade')}">
				<li><a
					href="/sigaex/app/expediente/temporalidade/listar">Temporalidade
						Documental</a></li>
			</c:if>

		</ul>
	</li>
</c:if>

<c:if
	test="${f:podeUtilizarServicoPorConfiguracao(titular,lotaTitular,'SIGA:Sistema Integrado de Gestão Administrativa;DOC:Módulo de Documentos;REL:Gerar relatórios')}">
	<li id="menuRelatorios">
		<a href="#"><i class="far fa-list-alt"></i>
			<span class="nav-label">Relatórios </span><span class="fa arrow"></span>
		</a>
		<ul id="subMenuRelatorios" class="nav nav-second-level collapse" aria-expanded="false">
			<c:if
				test="${f:podeUtilizarServicoPorConfiguracao(titular,lotaTitular,'SIGA:Sistema Integrado de Gestão Administrativa;DOC:Módulo de Documentos;REL:Gerar relatórios;FORMS:Relação de formulários')}">
				<li><a
					href="/sigaex/app/expediente/rel/relRelatorios?nomeArquivoRel=relFormularios.jsp">
						Relação de formulários </a></li>
			</c:if>

			<c:if
				test="${f:podeUtilizarServicoPorConfiguracao(titular,lotaTitular,'SIGA:Sistema Integrado de Gestão Administrativa;DOC:Módulo de Documentos;REL:Gerar relatórios;DATAS:Relação de documentos entre datas')}">
				<li><a
					href="/sigaex/app/expediente/rel/relRelatorios?nomeArquivoRel=relConsultaDocEntreDatas.jsp">
						Relação de documentos entre datas </a></li>
			</c:if>

			<c:if
				test="${f:podeUtilizarServicoPorConfiguracao(titular,lotaTitular,'SIGA:Sistema Integrado de Gestão Administrativa;DOC:Módulo de Documentos;REL:Gerar relatórios;SUBORD:Relatório de documentos em setores subordinados')}">
				<li><a
					href="/sigaex/app/expediente/rel/relRelatorios?nomeArquivoRel=relDocumentosSubordinados.jsp">
						Relatório de Documentos em Setores Subordinados </a></li>
			</c:if>

			<c:if
				test="${f:podeUtilizarServicoPorConfiguracao(titular,lotaTitular,'SIGA:Sistema Integrado de Gestão Administrativa;DOC:Módulo de Documentos;REL:Gerar relatórios;MVSUB:Relatório de movimentação de documentos em setores subordinados')}">
				<li><a
					href="/sigaex/app/expediente/rel/relRelatorios?nomeArquivoRel=relMovimentacaoDocSubordinados.jsp">
						Relatório de Movimentação de Documentos em Setores Subordinados </a></li>
			</c:if>

			<c:if
				test="${f:podeUtilizarServicoPorConfiguracao(titular,lotaTitular,'SIGA:Sistema Integrado de Gestão Administrativa;DOC:Módulo de Documentos;REL:Gerar relatórios;RELMVP:Relatório de movimentações de processos')}">
				<li><a
					href="/sigaex/app/expediente/rel/relRelatorios?nomeArquivoRel=relMovProcesso.jsp">
						Relatório de Movimentações de Processos </a></li>
			</c:if>

			<c:if
				test="${f:podeUtilizarServicoPorConfiguracao(titular,lotaTitular,'SIGA:Sistema Integrado de Gestão Administrativa;DOC:Módulo de Documentos;REL:Gerar relatórios;CRSUB:Relatório de documentos criados em setores subordinados')}">
				<li><a
					href="/sigaex/app/expediente/rel/relRelatorios?nomeArquivoRel=relCrDocSubordinados.jsp">
						Relatório de Criação de Documentos em Setores Subordinados </a></li>
			</c:if>


			<c:if
				test="${f:podeUtilizarServicoPorConfiguracao(titular,lotaTitular,'SIGA:Sistema Integrado de Gestão Administrativa;DOC:Módulo de Documentos;REL:Gerar relatórios;MOVLOT:Relação de movimentações')}">
				<li><a
					href="/sigaex/app/expediente/rel/relRelatorios?nomeArquivoRel=relMovimentacao.jsp">
						Relatório de Movimentações </a></li>
			</c:if>

			<c:if
				test="${f:podeUtilizarServicoPorConfiguracao(titular,lotaTitular,'SIGA:Sistema Integrado de Gestão Administrativa;DOC:Módulo de Documentos;REL:Gerar relatórios;MOVCAD:Relação de movimentações por cadastrante')}">
				<li><a
					href="/sigaex/app/expediente/rel/relRelatorios?nomeArquivoRel=relMovCad.jsp">
						Relatório de Movimentações por Cadastrante </a></li>
			</c:if>

			<c:if
				test="${f:podeUtilizarServicoPorConfiguracao(titular,lotaTitular,'SIGA:Sistema Integrado de Gestão Administrativa;DOC:Módulo de Documentos;REL:Gerar relatórios;DSPEXP:Relação de despachos e transferências')}">
				<li><a
					href="/sigaex/app/expediente/rel/relRelatorios?nomeArquivoRel=relOrgao.jsp">
						Relatório de Despachos e Transferências </a></li>
			</c:if>

			<c:if
				test="${f:podeUtilizarServicoPorConfiguracao(titular,lotaTitular,'SIGA:Sistema Integrado de Gestão Administrativa;DOC:Módulo de Documentos;REL:Gerar relatórios;DOCCRD:Relação de documentos criados')}">
				<li><a
					href="/sigaex/app/expediente/rel/relRelatorios?nomeArquivoRel=relTipoDoc.jsp">
						Relação de Documentos Criados </a></li>
			</c:if>


			<c:if
				test="${f:podeUtilizarServicoPorConfiguracao(titular,lotaTitular,'SIGA:Sistema Integrado de Gestão Administrativa;DOC:Módulo de Documentos;REL:Gerar relatórios;CLSD:Classificação Documental')}">
				<li><a href="#"
					>Classificação Documental</a>
					<ul>
						<c:if
							test="${f:podeUtilizarServicoPorConfiguracao(titular,lotaTitular,'SIGA:Sistema Integrado de Gestão Administrativa;DOC:Módulo de Documentos;REL:Gerar relatórios;CLSD:Classificação Documental;CLASS:Relação de classificações')}">
							<li><a
								href="/sigaex/app/expediente/rel/relRelatorios?nomeArquivoRel=relClassificacao.jsp">
									Relação de Classificações </a></li>
						</c:if>

						<c:if
							test="${f:podeUtilizarServicoPorConfiguracao(titular,lotaTitular,'SIGA:Sistema Integrado de Gestão Administrativa;DOC:Módulo de Documentos;REL:Gerar relatórios;CLSD:Classificação Documental;DOCS:Relação de documentos classificados')}">
							<li><a id="relclassificados"
								href="/sigaex/app/expediente/rel/relRelatorios?nomeArquivoRel=relDocsClassificados.jsp">
									Relação de Documentos Classificados </a></li>
						</c:if>

					</ul></li>
			</c:if>
		</ul>
	</li>
</c:if>

<c:if
	test="${f:podeUtilizarServicoPorConfiguracao(titular,lotaTitular,'SIGA:Sistema Integrado de Gestão Administrativa;DOC:Módulo de Documentos;REL:Gerar relatórios')}">
	<li id="menuGestao">
		<a href="#"><i class="fas fa-user-cog"></i>
			<span class="nav-label">Gestão </span><span class="fa arrow"></span>
		</a>
		<ul id="subMenuGestao" class="nav nav-second-level collapse" aria-expanded="false">
			<c:if
				test="${f:podeUtilizarServicoPorConfiguracao(titular,lotaTitular,'SIGA:Sistema Integrado de Gestão Administrativa;DOC:Módulo de Documentos;REL:Gerar relatórios;IGESTAO: Relatório de Indicadores de Gestão')}">
				<li><a
					href="/sigaex/app/expediente/rel/relIndicadoresGestao?primeiraVez=true">
						Indicadores de Gestão</a></li>
			</c:if>
			<c:if
				test="${f:podeUtilizarServicoPorConfiguracao(titular,lotaTitular,'SIGA:Sistema Integrado de Gestão Administrativa;DOC:Módulo de Documentos;REL:Gerar relatórios;RELDOCVOL: Relatório de documentos por volume')}">
				<li><a
					href="/sigaex/app/expediente/rel/relDocumentosPorVolume?primeiraVez=true">
						Documentos por Volume </a></li>
			</c:if>
			<c:if
				test="${f:podeUtilizarServicoPorConfiguracao(titular,lotaTitular,'SIGA:Sistema Integrado de Gestão Administrativa;DOC:Módulo de Documentos;REL:Gerar relatórios;RELFORAPRAZO:Relatório de documentos fora do prazo')}">
				<li><a
					href="/sigaex/app/expediente/rel/relDocumentosForaPrazo?primeiraVez=true">
						Documentos Fora do Prazo </a></li>
			</c:if>
			<c:if
				test="${f:podeUtilizarServicoPorConfiguracao(titular,lotaTitular,'SIGA:Sistema Integrado de Gestão Administrativa;DOC:Módulo de Documentos;REL:Gerar relatórios;RELDEVPROGRAMADA:Relatório de documentos devolção programada')}">
				<li><a
					href="/sigaex/app/expediente/rel/relDocumentosDevolucaoProgramada?primeiraVez=true">
						Documentos por Devolução Programada </a></li>
			</c:if>
			<c:if
				test="${f:podeUtilizarServicoPorConfiguracao(titular,lotaTitular,'SIGA:Sistema Integrado de Gestão Administrativa;DOC:Módulo de Documentos;REL:Gerar relatórios;RELTEMPOMEDIOSITUACAO:Tempo médio por Situação')}">
				<li><a
					href="/sigaex/app/expediente/rel/relTempoMedioSituacao?primeiraVez=true">
						Tempo médio por Situação </a></li>
			</c:if>

			<!-- 				<li><a href="#"> Tempo médio -->
			<!-- 						Tramitação por Espécie Documental </a></li> -->

			<!-- 				<li><a href="#"> Volume de Tramitação -->
			<!-- 						por Nome de documento </a></li> -->
			<c:if
				test="${f:podeUtilizarServicoPorConfiguracao(titular,lotaTitular,'SIGA:Sistema Integrado de Gestão Administrativa;DOC:Módulo de Documentos;REL:Gerar relatórios;ORGAOINT: Relatório de Documentos Por Órgão Interessado')}">
				<li><a
					href="/sigaex/app/expediente/rel/relDocsOrgaoInteressado?primeiraVez=true">
						Total de documentos por Órgão Interessado</a></li>
			</c:if>
			<c:if
					test="${f:podeUtilizarServicoPorConfiguracao(titular,lotaTitular,'SIGA:Sistema Integrado de Gestão Administrativa;DOC:Módulo de Documentos;REL:Gerar relatórios;TRAMESP: Tempo Médio de Tramitação Por Espécie Documental')}">
				<li><a 
					href="/sigaex/app/expediente/rel/relTempoTramitacaoPorEspecie?primeiraVez=true">
						Tempo Médio de Tramitação Por Espécie Documental</a></li>
			</c:if>
			<c:if
					test="${f:podeUtilizarServicoPorConfiguracao(titular,lotaTitular,'SIGA:Sistema Integrado de Gestão Administrativa;DOC:Módulo de Documentos;REL:Gerar relatórios;VOLTRAMMOD: Volume de Tramitação Por Nome do Documento')}">
				<li><a 
					href="/sigaex/app/expediente/rel/relVolumeTramitacaoPorModelo?primeiraVez=true">
						Volume de Tramitação Por Nome do Documento</a></li>
			</c:if>
		</ul>
	</li>
</c:if>
	<script type="text/javascript" language="Javascript1.1">
		ulRel = document.getElementById('subMenuGestao');
		if (ulRel !== null && ulRel.children.length == 0) {
			$('#menuGestao').addClass('d-none');
		}
		ulRel = document.getElementById('subMenuRelatorios');
		if (ulRel !== null && ulRel.children.length == 0) { 
			$('#menuRelatorios').addClass('d-none');
		}
	</script>
</c:if>