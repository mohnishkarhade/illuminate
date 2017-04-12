<%@include file="/WEB-INF/views/template/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="space"></div>
<div class="container">
	<h2 class="heading-one">Manage Orders</h2>
	<c:if test="${empty orderList }">
		<div class="alert alert-warning">No data available in database</div>
	</c:if>
	<c:if test="${not empty error }">
		<div class="alert alert-danger">${error }</div>
	</c:if>
	<c:if test="${not empty success }">
		<div class="alert alert-success">${success }</div>
	</c:if>
	<c:if test="${not empty orderList}">
		<table class="table table-bordered">
			<tr>
				<th>Order ID</th>
				<th>Customer Name</th>								
				<th width="135">Actions</th>
			</tr>
			<c:forEach items="${orderList}" var="order">
				<tr>
					<td>${order.id}</td>
					<td>${order.customer.name}</td>										
					<td></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</div>
<%@include file="/WEB-INF/views/template/footer.jsp"%>