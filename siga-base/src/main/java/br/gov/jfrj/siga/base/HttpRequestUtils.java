package br.gov.jfrj.siga.base;

import javax.servlet.http.HttpServletRequest;

public class HttpRequestUtils {
	public static String getIpAudit(HttpServletRequest req) {
		if (req == null)
			return null;
		String ip = "";
		try {
			ip = req.getHeader("X-Forwarded-For");
			if (ip == null)
				ip = req.getRemoteHost();
		} catch (Exception e) {
			ip = "Webservice";
		}
		return ip;
	}
}
