<%@include file="/WEB-INF/views/template/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="space"></div>
<div class="container">
	<h2 class="heading-one">Manage Category</h2>
	<c:if test="${empty categoryList }">
		<div class="alert alert-warning">No data available in database</div>
	</c:if>
	<c:if test="${not empty error }">
		<div class="alert alert-danger">${error }</div>
	</c:if>
	<c:if test="${not empty success }">
		<div class="alert alert-success">${success }</div>
	</c:if>
	<c:if test="${not empty categoryList}">
		<table class="table table-bordered">
			<tr>
				<th>Category ID</th>
				<th>Category Name</th>
				<th>Category Description</th>
				<th>Actions</th>
			</tr>
			<c:forEach items="${categoryList}" var="category">
				<tr>
					<td>${category.id}</td>
					<td>${category.name}</td>
					<td>${category.description}</td>
					<td><a
						href="<c:url value='/admin/editCategory/${category.id}' />"><i
							class="fa fa-pencil btn btn-info btn-xs"></i></a> &nbsp; <a
						href="<c:url value='/admin/deleteCategory/${category.id}' />"><i
							class="fa fa-trash btn btn-danger btn-xs"></i></a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</div>
<%@include file="/WEB-INF/views/template/footer.jsp"%>