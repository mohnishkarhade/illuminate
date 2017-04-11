<%@include file="/WEB-INF/views/template/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="space"></div>
<div class="container">
	<h2 class="heading-one">Manage Customer</h2>
	<c:if test="${empty customerList }">
		<div class="alert alert-warning">No data available in database</div>
	</c:if>
	<c:if test="${not empty error }">
		<div class="alert alert-danger">${error }</div>
	</c:if>
	<c:if test="${not empty success }">
		<div class="alert alert-success">${success }</div>
	</c:if>
	<c:if test="${not empty customerList}">
		<table class="table table-bordered">
			<tr>
				<th>Customer ID</th>
				<th>Customer Name</th>
				<th>Mobile Number</th>
				<th>Status</th>
				<th width="135">Actions</th>
			</tr>
			<c:forEach items="${customerList}" var="customer">
				<tr>
					<td>${customer.id}</td>
					<td>${customer.name}</td>
					<td>${customer.mobileno}</td>
					<td><c:if test="${customer.users.enabled }">
							<span class="text-success">Enabled</span>
						</c:if> <c:if test="${!customer.users.enabled }">
							<span class="text-danger">Disabled</span>
						</c:if></td>
					<td><a
						href="<c:url value='/admin/viewCustomer/${customer.id}' />"><i
							class="fa fa-info-circle btn btn-info btn-xs"></i></a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</div>
<%@include file="/WEB-INF/views/template/footer.jsp"%>