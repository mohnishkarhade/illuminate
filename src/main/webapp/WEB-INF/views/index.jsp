<%@include file="/WEB-INF/views/template/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="">
	<div class="jumbotron">
		<h1 class="display-3">
			Hello&nbsp;
			<c:if test="${not empty welcomeMsg }">
				<p>${welcomeMsg}</p>
			</c:if>
		</h1>
		<p class="lead">This is a simple hero unit, a simple
			jumbotron-style component for calling extra attention to featured
			content or information.</p>
		<hr class="my-4">
		<p>It uses utility classes for typography and spacing to space
			content out within the larger container.</p>
		<p class="lead">
			<a class="btn btn-primary btn-lg" href="#" role="button">Learn
				more</a>
		</p>
	</div>
</div>

<c:if test="${not empty success}">
	<div class="alert alert-success alert-dismissible fade show"
		role="alert" id="notification">
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<strong>Success!</strong> ${success }
	</div>
</c:if>
<c:if test="${not empty error}">
	<div class="alert alert-danger alert-dismissible fade show"
		role="alert" id="notification">
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<strong>Error!</strong> ${error }
	</div>
</c:if>
<%@include file="/WEB-INF/views/template/footer.jsp"%>