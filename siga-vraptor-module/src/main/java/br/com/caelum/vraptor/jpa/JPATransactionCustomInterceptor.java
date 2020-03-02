package br.com.caelum.vraptor.jpa;

import javax.enterprise.inject.Alternative;
import javax.enterprise.inject.Any;
import javax.enterprise.inject.Specializes;
import javax.enterprise.inject.spi.BeanManager;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.servlet.http.HttpServletRequest;

import org.hibernate.FlushMode;
import org.hibernate.Session;

import br.com.caelum.vraptor.Accepts;
import br.com.caelum.vraptor.AroundCall;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.controller.ControllerMethod;
import br.com.caelum.vraptor.http.MutableResponse;
import br.com.caelum.vraptor.interceptor.SimpleInterceptorStack;
import br.com.caelum.vraptor.jpa.event.AfterCommit;
import br.com.caelum.vraptor.jpa.event.AfterRollback;
import br.com.caelum.vraptor.jpa.event.BeforeCommit;
import br.com.caelum.vraptor.proxy.CDIProxies;
import br.com.caelum.vraptor.validator.Validator;
import br.gov.jfrj.siga.vraptor.Transacional;

/**
 * An interceptor that manages Entity Manager Transaction. All requests are
 * intercepted and a transaction is created before execution. If the request has
 * no erros, the transaction will commited, or a rollback occurs otherwise.
 * 
 * @author Lucas Cavalcanti
 */
@Specializes
@Intercepts
public class JPATransactionCustomInterceptor extends br.com.caelum.vraptor.jpa.JPATransactionInterceptor {

	private final BeanManager beanManager;
	private final EntityManager manager;
	private final Validator validator;
	private final MutableResponse response;
	private HttpServletRequest request;
	private ControllerMethod method;
	EntityTransaction transaction = null;

	private final static ThreadLocal<JPATransactionCustomInterceptor> current = new ThreadLocal<JPATransactionCustomInterceptor>();

	/**
	 * @deprecated CDI eyes only.
	 */
	protected JPATransactionCustomInterceptor() {
		this(null, null, null, null, null);
	}

	@SuppressWarnings("deprecation")
	@Inject
	public JPATransactionCustomInterceptor(BeanManager beanManager, EntityManager manager,  @Any Validator validator,
			MutableResponse response, HttpServletRequest request) {
		this.beanManager = beanManager;
		this.manager = manager;
		this.validator = validator;
		this.response = response;
		this.request = request;
		current.set(this);
	}

	@Accepts
	public boolean accepts(ControllerMethod method) {
		this.method = method;
		return true;
	}

	@AroundCall
	public void intercept(SimpleInterceptorStack stack) {
		addRedirectListener();

		try {
			if (this.method.containsAnnotation(Transacional.class)
					&& !(this.request.getRequestURI().startsWith("app/sigawf"))) {
				transaction = manager.getTransaction();
				transaction.begin();
			} else {
				disableAutoFlush();
			}
			
			System.out.println("*** " + this.method.toString() + " - " + (transaction == null ? "NÃO" : "") + " Transacional");

			stack.next();
			
			if (this.method.containsAnnotation(Transacional.class)
					&& !(this.request.getRequestURI().startsWith("app/sigawf"))) {
				commit(transaction);
			}

		} finally {
			if (transaction != null && transaction.isActive()) {
				transaction.rollback();
				beanManager.fireEvent(new AfterRollback());
			}
		}
	}

	private void commit(EntityTransaction trn) {
		if (trn == null)
			return;

		if (trn.isActive())
			beanManager.fireEvent(new BeforeCommit());

		if (!validator.hasErrors() && trn.isActive()) {
			trn.commit();
			beanManager.fireEvent(new AfterCommit());
		}
	}

	/**
	 * We force the commit before the redirect, this way we can abort the redirect
	 * if a database error occurs.
	 */
	private void addRedirectListener() {
		response.addRedirectListener(new MutableResponse.RedirectListener() {
			@Override
			public void beforeRedirect() {
				commit(manager.getTransaction());
			}
		});
	}

	public static void upgradeParaTransacional() {
		JPATransactionCustomInterceptor thiz = current.get();
		if (thiz != null && thiz.transaction == null) {
			System.out.println("*** UPGRADE para Transacional - " + thiz.method.toString());
			enableAutoFlush();
			thiz.transaction = thiz.manager.getTransaction();
			thiz.transaction.begin();
		}
	}

	public static void downgradeParaNaoTransacional() {
		JPATransactionCustomInterceptor thiz = current.get();
		if (thiz != null && thiz.transaction != null) {
			thiz.commit(thiz.transaction);
			System.out.println("*** DOWNGRADE para NÃO Transacional - " + thiz.method.toString());
			disableAutoFlush();
			thiz.transaction = thiz.manager.getTransaction();
			thiz.transaction.begin();
		}
	}

	public static void disableAutoFlush() {
		JPATransactionCustomInterceptor thiz = current.get();
		Session session = CDIProxies.unproxifyIfPossible(thiz.manager).unwrap(org.hibernate.Session.class);
		session.setFlushMode(FlushMode.MANUAL);
	}

	public static void enableAutoFlush() {
		JPATransactionCustomInterceptor thiz = current.get();
		Session session = CDIProxies.unproxifyIfPossible(thiz.manager).unwrap(org.hibernate.Session.class);
		session.setFlushMode(FlushMode.AUTO);
	}
}