package br.gov.jfrj.siga.util;

import javax.persistence.EntityManager;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.core.InterceptorStack;
import br.com.caelum.vraptor.interceptor.Interceptor;
import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.resource.ResourceMethod;
import br.com.caelum.vraptor.util.jpa.JPATransactionInterceptor;
import br.gov.jfrj.siga.model.ContextoPersistencia;

@Component
@Intercepts(before = JPATransactionInterceptor.class)
public class GiInterceptor implements Interceptor {

	private final EntityManager manager;
	private final Validator validator;
	private HttpServletRequest request;
	private HttpServletResponse response;
	private ServletContext context;

	public GiInterceptor(EntityManager manager, Validator validator,
			ServletContext context, HttpServletRequest request,
			HttpServletResponse response) {
		this.manager = manager;
		this.validator = validator;
		this.request = request;
		this.response = response;
		this.context = context;
	}

	public void intercept(InterceptorStack stack, ResourceMethod method,
			Object instance) {

		ContextoPersistencia.setEntityManager(this.manager);

		try {
			System.out.println("GIInterceptor Url que abre conexao: " + request.getRequestURI() + " Classe: " + method.getClass().getName());
			stack.next(method, instance);
			System.out.println("GIInterceptor Url que fecha conexao: " + request.getRequestURI() + " Classe: " + method.getClass().getName());
		} finally {
			ContextoPersistencia.setEntityManager(null);
		}
	}

	public boolean accepts(ResourceMethod method) {
		return true; // Will intercept all requests
	}
}