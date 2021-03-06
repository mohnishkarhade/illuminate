<%@include file="/WEB-INF/views/template/header.jsp"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="">
	<div class="jumbotron">
		<h1 class="display-3">Something Wrong!</h1>
		<hr class="my-4">
		<p>We track these errors automatically, but if the problem
			persists feel free to contact us. In the meantime, try refreshing.</p>
		<c:if test="${not empty catchError }">
			<div class="alert alert-danger">${catchError }</div>
		</c:if>
		<c:if test="${not empty error }">
			<div class="alert alert-danger">${error }</div>
		</c:if>
		<c:if test="${not empty errorMessage }">
			<div class="alert alert-danger">${errorMessage }</div>
		</c:if>
		<a class="btn btn-primary btn-lg" href="<spring:url value="/" />"
			role="button">Back To Home</a>
	</div>
</div>
<%@include file="/WEB-INF/views/template/footer.jsp"%>