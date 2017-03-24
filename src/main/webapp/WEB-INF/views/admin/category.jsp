<%@include file="/WEB-INF/views/template/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h1>Category Manage</h1>

<c:if test="${empty categoryList }">
	<div class="alert alert-warning">No data available in database</div>
</c:if>
<c:if test="${not empty categoryList}">
	<table class="table">
		<c:forEach var="category" items="${categoyList}">
			<tr>
				<td>${category.id}</td>
				<td>${category.name}</td>
				<td>${category.description}</td>
			</tr>
		</c:forEach>
	</table>
</c:if>

<%@include file="/WEB-INF/views/template/footer.jsp"%>