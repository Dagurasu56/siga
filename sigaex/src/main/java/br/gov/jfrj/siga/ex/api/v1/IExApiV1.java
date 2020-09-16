package br.gov.jfrj.siga.ex.api.v1;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

import com.crivano.swaggerservlet.ISwaggerMethod;
import com.crivano.swaggerservlet.ISwaggerModel;
import com.crivano.swaggerservlet.ISwaggerRequest;
import com.crivano.swaggerservlet.ISwaggerResponse;
import com.crivano.swaggerservlet.ISwaggerResponseFile;

public interface IExApiV1 {
	public class Status implements ISwaggerModel {
		public String mensagem;
		public Double indice;
		public Double contador;
		public Double bytes;
		public String errormsg;
		public String stacktrace;
	}

	public class Error implements ISwaggerModel {
		public String errormsg;
	}

	public class AutenticarPostRequest implements ISwaggerRequest {
	}

	public class AutenticarPostResponse implements ISwaggerResponse {
		public String token;
	}

	public interface IAutenticarPost extends ISwaggerMethod {
		public void run(AutenticarPostRequest req, AutenticarPostResponse resp) throws Exception;
	}

	public class DocumentoSiglaArquivoGetRequest implements ISwaggerRequest {
		public String contenttype;
		public String sigla;
		public Boolean estampa;
		public Boolean completo;
		public Boolean volumes;
		public Boolean exibirReordenacao;
	}

	public class DocumentoSiglaArquivoGetResponse implements ISwaggerResponse {
		public String uuid;
		public String jwt;
	}

	public interface IDocumentoSiglaArquivoGet extends ISwaggerMethod {
		public void run(DocumentoSiglaArquivoGetRequest req, DocumentoSiglaArquivoGetResponse resp) throws Exception;
	}

	public class DownloadJwtFilenameGetRequest implements ISwaggerRequest {
		public String jwt;
		public String filename;
		public String disposition;
	}

	public class DownloadJwtFilenameGetResponse implements ISwaggerResponse, ISwaggerResponseFile {
		public String contenttype = "application/pdf";
		public String contentdisposition = "attachment";
		public Long contentlength;
		public InputStream inputstream;
		public Map<String, List<String>> headerFields;

		public String getContenttype() {
			return contenttype;
		}
		public void setContenttype(String contenttype) {
			this.contenttype = contenttype;
		}
		public String getContentdisposition() {
			return contentdisposition;
		}
		public void setContentdisposition(String contentdisposition) {
			this.contentdisposition = contentdisposition;
		}
		public Long getContentlength() {
			return contentlength;
		}
		public void setContentlength(Long contentlength) {
			this.contentlength = contentlength;
		}
		public InputStream getInputstream() {
			return inputstream;
		}
		public void setInputstream(InputStream inputstream) {
			this.inputstream = inputstream;
		}
		public Map<String, List<String>> getHeaderFields() {
			return headerFields;
		}
		public void setHeaderFields(Map<String, List<String>> headerFields) {
			this.headerFields = headerFields;
		}
	}

	public interface IDownloadJwtFilenameGet extends ISwaggerMethod {
		public void run(DownloadJwtFilenameGetRequest req, DownloadJwtFilenameGetResponse resp) throws Exception;
	}

	public class StatusChaveGetRequest implements ISwaggerRequest {
		public String chave;
	}

	public class StatusChaveGetResponse implements ISwaggerResponse {
		public String mensagem;
		public Double indice;
		public Double contador;
		public Double bytes;
		public String errormsg;
		public String stacktrace;
	}

	public interface IStatusChaveGet extends ISwaggerMethod {
		public void run(StatusChaveGetRequest req, StatusChaveGetResponse resp) throws Exception;
	}

	public class DocumentoSigladocMobilSiglamobJuntarPostRequest implements ISwaggerRequest {
		public String sigladoc;
		public String siglamob;
		public String siglapai;
	}

	public class DocumentoSigladocMobilSiglamobJuntarPostResponse implements ISwaggerResponse {
	}

	public interface IDocumentoSigladocMobilSiglamobJuntarPost extends ISwaggerMethod {
		public void run(DocumentoSigladocMobilSiglamobJuntarPostRequest req, DocumentoSigladocMobilSiglamobJuntarPostResponse resp) throws Exception;
	}

	public class MobilAssinarSiglaPostRequest implements ISwaggerRequest {
		public String sigla;
	}

	public class MobilAssinarSiglaPostResponse implements ISwaggerResponse {
	}

	public interface IMobilAssinarSiglaPost extends ISwaggerMethod {
		public void run(MobilAssinarSiglaPostRequest req, MobilAssinarSiglaPostResponse resp) throws Exception;
	}

	public class MobilAutenticarSiglaPostRequest implements ISwaggerRequest {
		public String sigla;
	}

	public class MobilAutenticarSiglaPostResponse implements ISwaggerResponse {
	}

	public interface IMobilAutenticarSiglaPost extends ISwaggerMethod {
		public void run(MobilAutenticarSiglaPostRequest req, MobilAutenticarSiglaPostResponse resp) throws Exception;
	}

	public class MobilTramitarSiglaPostRequest implements ISwaggerRequest {
		public String sigla;
		public String tipoDestinatario;
		public String destinatario;
		public String observacao;
		public String dataDevolucao;
	}

	public class MobilTramitarSiglaPostResponse implements ISwaggerResponse {
	}

	public interface IMobilTramitarSiglaPost extends ISwaggerMethod {
		public void run(MobilTramitarSiglaPostRequest req, MobilTramitarSiglaPostResponse resp) throws Exception;
	}

}