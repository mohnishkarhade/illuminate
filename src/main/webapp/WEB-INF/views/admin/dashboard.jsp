<%@include file="/WEB-INF/views/template/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="space"></div>
<div class="container">
	<h1>Hello</h1>
	<c:if test="${not empty welcomeMsg }">
		<p>${welcomeMsg}</p>
	</c:if>
</div>
<%@include file="/WEB-INF/views/template/footer.jsp"%>