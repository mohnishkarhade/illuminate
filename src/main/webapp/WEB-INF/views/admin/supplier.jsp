<%@include file="/WEB-INF/views/template/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="space"></div>
<div class="container">
	<h2 class="heading-one">Manage Supplier</h2>
	<c:if test="${empty supplierList }">
		<div class="alert alert-warning">No data available in database</div>
	</c:if>
	<c:if test="${not empty error }">
		<div class="alert alert-danger">${error }</div>
	</c:if>
	<c:if test="${not empty success }">
		<div class="alert alert-success">${success }</div>
	</c:if>
	<c:if test="${not empty supplierList}">
		<table class="table table-bordered">
			<tr>
				<th>Supplier ID</th>
				<th>Supplier Name</th>
				<th>Address</th>
				<th>Actions</th>
			</tr>
			<c:forEach items="${supplierList}" var="supplier">
				<tr>
					<td>${supplier.id}</td>
					<td>${supplier.name}</td>
					<td>${supplier.address}</td>
					<td><a
						href="<c:url value='/admin/editSupplier/${supplier.id}' />"><i
							class="fa fa-pencil btn btn-info btn-xs"></i></a> &nbsp; <a
						href="<c:url value='/admin/deleteSupplier/${supplier.id}' />"><i
							class="fa fa-trash btn btn-danger btn-xs"></i></a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</div>
<%@include file="/WEB-INF/views/template/footer.jsp"%>