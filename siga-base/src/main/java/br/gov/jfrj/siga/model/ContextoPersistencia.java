package br.gov.jfrj.siga.model;

import javax.persistence.EntityManager;

public class ContextoPersistencia {

	private final static ThreadLocal<EntityManager> emByThread = new ThreadLocal<EntityManager>();
	private final static ThreadLocal<String> userPrincipalByThread = new ThreadLocal<String>();

	static public void setEntityManager(EntityManager em) {
		emByThread.set(em);
	}

	static public EntityManager em() {
		return emByThread.get();
	}

	static public void flushTransaction() {
		System.out.println("ContextoPersistencia : Committando Transação e flushing");
		em().flush();
		em().getTransaction().commit();
		em().getTransaction().begin();
	}

	static public void setUserPrincipal(String userPrincipal) {
		userPrincipalByThread.set(userPrincipal);
	}

	static public String getUserPrincipal() {
		return userPrincipalByThread.get();
	}

	static public void removeUserPrincipal() {
		userPrincipalByThread.remove();
	}
}