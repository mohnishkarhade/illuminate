<%@ include file="/WEB-INF/views/template/header.jsp"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="space"></div>
<div class="container">
	<div class="row justify-content-center">
		<div class="card">
			<div class="card-block">
				<div class="card-title text-center">
					<h2 class="text-uppercase">Illuminate</h2>
					Sign in with Email and Password
				</div>
				<c:if test="${not empty success}">
					<div class="alert alert-success" role="alert">
						<strong>Success!</strong> ${success }
					</div>
				</c:if>
				<form class="form-signin" action="<spring:url value="/login" />"
					method="POST">

					<%-- <c:if test="${not empty error }">
						<div class="alert alert-danger">${error }</div>
					</c:if> --%>

					<label for="Email" class="sr-only">Email</label> <input
						type="email" name="email" id="Email" class="form-control"
						placeholder="Email address" required="true" autofocus> <label
						for="inputPassword" class="sr-only">Password</label> <input
						type="password" name="password" id="inputPassword"
						class="form-control" placeholder="Password" required="true">
					<div class="checkbox">
						<label> <input type="checkbox" value="remember-me">
							Keep me Signed in
						</label>
					</div>
					<button class="btn btn-lg btn-success btn-block" type="submit">
						<i class="fa fa-sign-in"></i> Sign in
					</button>
				</form>
			</div>
			<div class="card-footer text-muted">
				Don't have an account? <a href="#">Sign Up</a>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/template/footer.jsp"%>