/*******************************************************************************
 * Copyright (c) 2006 - 2011 SJRJ.
 * 
 *     This file is part of SIGA.
 * 
 *     SIGA is free software: you can redistribute it and/or modify
 *     it under the terms of the GNU General Public License as published by
 *     the Free Software Foundation, either version 3 of the License, or
 *     (at your option) any later version.
 * 
 *     SIGA is distributed in the hope that it will be useful,
 *     but WITHOUT ANY WARRANTY; without even the implied warranty of
 *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *     GNU General Public License for more details.
 * 
 *     You should have received a copy of the GNU General Public License
 *     along with SIGA.  If not, see <http://www.gnu.org/licenses/>.
 ******************************************************************************/
package br.gov.jfrj.siga.cp;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.Immutable;

import br.gov.jfrj.siga.dp.CpOrgaoUsuario;
import br.gov.jfrj.siga.model.ContextoPersistencia;

/**
 * A class that represents a row in the CP_ARQUIVO table. You can customize the
 * behavior of this class by editing the class, {@link CpArquivo()}.
 */
@Entity
@Immutable
@Table(name = "CP_ARQUIVO", schema = "CORPORATIVO")
public class CpArquivo implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(sequenceName = "CORPORATIVO.CP_ARQUIVO_SEQ", name = "CP_ARQUIVO_SEQ")
	@GeneratedValue(generator = "CP_ARQUIVO_SEQ")
	@Column(name = "ID_ARQ")
	private java.lang.Long idArq;

	@ManyToOne
	@JoinColumn(name = "ID_ORGAO_USU")
	private CpOrgaoUsuario orgaoUsuario;

	@Column(name = "CONTEUDO_TP_ARQ", length = 128)
	private java.lang.String conteudoTpArq;

	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@PrimaryKeyJoinColumn
	private CpArquivoBlob arquivoBlob;
	
	@Enumerated(EnumType.STRING)
	@Column(name = "TP_ARMAZENAMENTO")
	private CpArquivoTipoArmazenamentoEnum tipoArmazenamento;
	
	@Column(name = "CAMINHO")
	private String caminho;
	
	@Column(name = "TAMANHO_ARQ")
	private Integer tamanho = 0;

	/**
	 * Simple constructor of AbstractExDocumento instances.
	 */
	public CpArquivo() {

	}

	public java.lang.Long getIdArq() {
		return idArq;
	}

	public void setIdArq(java.lang.Long idArq) {
		this.idArq = idArq;
	}

	public java.lang.String getConteudoTpArq() {
		return conteudoTpArq;
	}

	public void setConteudoTpArq(java.lang.String conteudoTpArq) {
		this.conteudoTpArq = conteudoTpArq;
	}

	public CpOrgaoUsuario getOrgaoUsuario() {
		return orgaoUsuario;
	}

	public void setOrgaoUsuario(CpOrgaoUsuario orgaoUsuario) {
		this.orgaoUsuario = orgaoUsuario;
	}

	private CpArquivoBlob getArquivoBlob() {
		return arquivoBlob;
	}

	public void setArquivoBlob(CpArquivoBlob arquivoBlob) {
		this.arquivoBlob = arquivoBlob;
	}

	public byte[] getConteudoBlobArq() {
		if (this.arquivoBlob == null) {
			this.arquivoBlob = new CpArquivoBlob();
			this.arquivoBlob.setArquivo(this);
		}
		return this.arquivoBlob.getConteudoBlobArq();
	}

	public void setConteudoBlobArq(byte[] createBlob) {
		if (this.arquivoBlob == null) {
			this.arquivoBlob = new CpArquivoBlob();
			this.arquivoBlob.setArquivo(this);
		}
		this.arquivoBlob.setConteudoBlobArq(createBlob);
	}

	public static CpArquivo forUpdate(CpArquivo old) {
		if (old != null) {
			if (old.getIdArq() != null) {
				CpArquivo arq = new CpArquivo();
				arq.setConteudoTpArq(old.getConteudoTpArq());
				arq.setOrgaoUsuario(old.getOrgaoUsuario());
				if (old.getArquivoBlob() != null) {
					arq.setArquivoBlob(new CpArquivoBlob());
					arq.getArquivoBlob().setArquivo(arq);
					arq.getArquivoBlob().setConteudoBlobArq(old.getArquivoBlob().getConteudoBlobArq());
				}
				ContextoPersistencia.em().remove(old);
				return arq;
			} else
				return old;
		} else
			return new CpArquivo();
	}

	public static CpArquivo updateConteudoTp(CpArquivo old, String conteudoTp) {
		//TODO: Verificar essa linha
		//if (old == null || !Texto.equals(old.getConteudoTpArq(), conteudoTp)) {
		if (old == null) {
			CpArquivo arq = CpArquivo.forUpdate(old);
			arq.setConteudoTpArq(conteudoTp);
			return arq;
		}
		return old;
	}

	public CpArquivoTipoArmazenamentoEnum getTipoArmazenamento() {
		return tipoArmazenamento;
	}

	public void setTipoArmazenamento(CpArquivoTipoArmazenamentoEnum tipoArmazenamento) {
		this.tipoArmazenamento = tipoArmazenamento;
	}

	public String getCaminho() {
		return caminho;
	}

	public void setCaminho(String caminho) {
		this.caminho = caminho;
	}

	public Integer getTamanho() {
		return tamanho;
	}

	public void setTamanho(Integer tamanho) {
		this.tamanho = tamanho;
	}

	public void gerarCaminho(Date data) {
		String extensao = TipoConteudo.ZIP.getExtensao();
		
		Calendar c = Calendar.getInstance();
		c.set(Calendar.AM_PM, Calendar.PM);
		c.setTime(data);
		this.caminho = c.get(Calendar.YEAR)+"/"+(c.get(Calendar.MONTH)+1)+"/"+c.get(Calendar.DATE)+"/"+c.get(Calendar.HOUR_OF_DAY)+"/"+c.get(Calendar.MINUTE)+"/"+UUID.randomUUID().toString()+"."+extensao;
	}
	
	
}