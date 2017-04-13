<%@include file="/WEB-INF/views/template/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="space"></div>
<div class="container">
	<div class="row">
		<div class="col text-center">
			<div class="card card-inverse card-primary">
				<div class="card-block">
					<h4 class="card-title">Products</h4>
					<h1>${products }</h1>
					<a href="<c:url value="/admin/product" />" class="card-link">View
						All</a>
				</div>
			</div>
		</div>
		<div class="col text-center">
			<div class="card card-inverse card-info">
				<div class="card-block">
					<h4 class="card-title">Categories</h4>
					<h1>${categories }</h1>
					<a href="<c:url value="/admin/category" />" class="card-link">View
						All</a>
				</div>
			</div>
		</div>
		<div class="col text-center">
			<div class="card card-inverse card-danger">
				<div class="card-block">
					<h4 class="card-title">Suppliers</h4>
					<h1>${suppliers }</h1>
					<a href="<c:url value="/admin/supplier" />" class="card-link">View
						All</a>
				</div>
			</div>
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-sm-4 text-center">
			<div class="card card-inverse card-warning">
				<div class="card-block">
					<h4 class="card-title">Customers</h4>
					<h1>${customers }</h1>
					<a href="<c:url value="/admin/customer" />" class="card-link">View
						All</a>
				</div>
			</div>
		</div>
		<div class="col-sm-4 text-center">
			<div class="card card-inverse card-success">
				<div class="card-block">
					<h4 class="card-title">Orders</h4>
					<h1>${orders }</h1>
					<a href="<c:url value="/admin/orders" />" class="card-link">View
						All</a>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="/WEB-INF/views/template/footer.jsp"%>