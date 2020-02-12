
<%@ tag body-content="scriptless" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://localhost/jeetags" prefix="siga"%>
<%@ taglib uri="http://localhost/libstag" prefix="f"%>
<%@ attribute name="popup"%>
<%@ attribute name="pagina_de_erro"%>
<%@ attribute name="incluirJs"%>

<!--[if gte IE 5.5]><script language="JavaScript" src="/siga/javascript/jquery.ienav.js" type="text/javascript"></script><![endif]-->


<script src="/siga/javascript/jquery/jquery-migrate-1.2.1.min.js"
	type="text/javascript"></script>

<script src="/siga/javascript/siga.js"
	type="text/javascript" charset="utf-8"></script>

<script src="/siga/javascript/picketlink.js" type="text/javascript" charset="utf-8"></script>

<script
	src="/siga/javascript/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"
	type="text/javascript"></script>
<link rel="stylesheet" href="/siga/javascript/jquery-ui-1.10.3.custom/css/ui-lightness/jquery-ui-1.10.3.custom.min.css" type="text/css" media="screen, projection">
<script src="/siga/popper-1-14-3/popper.min.js"></script>
<script language="JavaScript" src="/siga/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script language="JavaScript" src="/siga/javascript/datepicker-pt-BR.js" type="text/javascript"></script>

<c:if test="${not empty incluirJs}">
	<script src="${incluirJs}" type="text/javascript"></script>
</c:if>
		</div>
	</div>
</body>
</html>