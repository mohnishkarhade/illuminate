<%@include file="/WEB-INF/views/template/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="space"></div>
<div class="container">
	<h2 class="heading-one">Manage Product</h2>
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
				<th>Actions</th>
			</tr>
			
			<c:forEach items="${productList}" var="product">
				<tr>
					<td><img alt="" src="<c:url value="/resources/images/${product.id }.jpg" />" class="img-responsive" width="100"></td>
					<td>${product.id}</td>
					<td>${product.name}</td>
					<td>${product.description}</td>
					<td>${product.price }</td>
					<td>${product.category.name }</td>
					<td>${product.supplier.name }</td>
					<td><a
						href="<c:url value='/admin/editProduct/${product.id}' />"><i
							class="fa fa-pencil btn btn-info btn-xs"></i></a> &nbsp; <a
						href="<c:url value='/admin/deleteProduct/${product.id}' />"><i
							class="fa fa-trash btn btn-danger btn-xs"></i></a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</div>
<%@include file="/WEB-INF/views/template/footer.jsp"%>