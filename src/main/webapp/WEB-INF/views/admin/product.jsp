<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	isELIgnored="false" pageEncoding="ISO-8859-1"%>
<%@include file="/WEB-INF/views/template/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="space"></div>
<div class="container">
	<h2 class="heading-one">Manage Product</h2>

	<div class="filter pull-right">
		<form class="form-inline" action="<c:url value="/admin/product?${_csrf.parameterName}=${_csrf.token}" />"
			method="POST">
			<label for="inlineFormCustomSelect">Filter:</label> <select
				class="custom-select" id="inlineFormCustomSelect" name="filter"
				required="true">
				<option value="">Select</option>
				<option value="Running">Running</option>
				<option value="Discontinued">Discontinued</option>
			</select>&nbsp;
			<button type="submit" class="btn btn-primary">Go!</button>
		</form>
	</div>
	<div class="clearfix"></div>
	<br>
	<c:if test="${empty productList }">
		<div class="alert alert-warning">No data available in database</div>
	</c:if>
	<c:if test="${not empty error }">
		<div class="alert alert-danger">${error }</div>
	</c:if>
	<c:if test="${not empty success }">
		<div class="alert alert-success">${success }</div>
	</c:if>
	<c:if test="${not empty productList}">
		<table class="table table-bordered">
			<tr>
				<th></th>
				<th>Product ID</th>
				<th>Product Name</th>
				<th>Product Description</th>
				<th>Price</th>
				<th>Category</th>
				<th>Supplier</th>
				<th>Status</th>
				<th width="145">Actions</th>
			</tr>

			<c:forEach items="${productList}" var="product">
				<tr>
					<td><img alt=""
						src="<c:url value="/resources/images/${product.id }.jpg" />"
						class="img-responsive" width="100"></td>
					<td>${product.id}</td>
					<td>${product.name}</td>
					<td>${product.description}</td>
					<td>${product.price }</td>
					<td>${product.category.name }</td>
					<td>${product.supplier.name }</td>
					<td>${product.status }</td>
					<td><a
						href="<c:url value='/admin/editProduct/${product.id}' />"><i
							class="fa fa-pencil btn btn-info btn-xs"></i></a> &nbsp; <c:if
							test="${product.status == 'Running' }">
							<a href="<c:url value='/admin/changeStatus/${product.id }' />"><i
								class="fa fa-times-rectangle btn btn-danger btn-xs"></i></a>
						</c:if> <c:if test="${product.status == 'Discontinued' }">
							<a href="<c:url value='/admin/changeStatus/${product.id }' />"><i
								class="fa fa-check-square btn btn-success btn-xs"></i></a>
						</c:if></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</div>
<%@include file="/WEB-INF/views/template/footer.jsp"%>