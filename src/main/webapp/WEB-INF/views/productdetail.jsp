<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	isELIgnored="false" pageEncoding="ISO-8859-1"%>
<%@include file="/WEB-INF/views/template/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="space"></div>
<div class="container">

	<c:if test="${empty product }">
		<div class="alert alert-warning">No data available in database</div>
	</c:if>
	<c:if test="${not empty error }">
		<div class="alert alert-danger">${error }</div>
	</c:if>
	<c:if test="${not empty success }">
		<div class="alert alert-success">${success }</div>
	</c:if>
	<c:if test="${not empty product}">
		<div class="row">
			<div class="col-sm-4">
				<div class="prod-img">
					<img alt=""
						src="<c:url value="/resources/images/${product.id }.jpg" />"
						class="rounded float-left img-fluid" />
				</div>
			</div>
			<div class="col-sm-6">
				<div class="space"></div>
				<div class="card">
					<div class="card-header">Product Details</div>
					<div class="card-block">
						<h4 class="text-danger">
							<b>${product.name }</b>
						</h4>
						<p class="card-text">${product.description }</p>
						<p class="card-text">
							<b>Category:</b> ${product.category.name }
						</p>
						<p class="card-text">
							<b>Supplier:</b> ${product.supplier.name }
						</p>
						<h4 class="text-success">Rs ${product.price }</h4>
						<form action="<c:url value="/myCart/addToCart/${product.id}?${_csrf.parameterName}=${_csrf.token}" />"
							method="POST">
							<input type="submit" class="btn btn-outline-primary pull-right"
								value="Add To Cart" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</c:if>
</div>
<%@include file="/WEB-INF/views/template/footer.jsp"%>