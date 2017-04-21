<%@include file="/WEB-INF/views/template/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="space"></div>
<div class="container">
	<h2 class="heading-one">Cart</h2>
	<c:if test="${not empty success }">
		<div class="alert alert-success">${success }</div>
	</c:if>
	<c:if test="${empty cartList }">
		<div class="alert alert-warning">You have not added any product
			into cart.</div>
	</c:if>
	<c:if test="${not empty error }">
		<div class="alert alert-danger">${error }</div>
	</c:if>
	<c:if test="${not empty cartList}">
		<table class="table table-bordered">
			<tr>
				<th>Product Name</th>
				<th>Price</th>
				<th>Quantity</th>
				<th width="135">Actions</th>
			</tr>
			<c:forEach items="${cartList}" var="cart">
				<tr>
					<td>${cart.productName}</td>
					<td>${cart.price}</td>
					<td>${cart.quantity }</td>
					<td><a href="<c:url value='/myCart/deleteItem/${cart.id}' />"><i
							class="fa fa-trash btn btn-danger btn-xs"></i></a></td>
				</tr>
			</c:forEach>
		</table>
		<hr>
		<div class="pull-right">
			Total Amount: <em><b class="text-success">Rs ${totalAmount }</b></em>
			&nbsp; <a href="<c:url value="/order" /> "
				class="btn btn-outline-primary">Checkout</a>
		</div>
		<a href="<c:url value="/myCart/clearCart" />"
			class="btn btn-outline-danger">Clear Cart</a>
	</c:if>
</div>
<%@include file="/WEB-INF/views/template/footer.jsp"%>