<%@include file="/WEB-INF/views/template/header.jsp"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="space"></div>

<div class="container">
	<h2 class="heading-one">Edit Category</h2>

	<c:if test="${not empty error}">
		<div class="alert alert-danger">
			<strong>Error!</strong> ${error}
		</div>
	</c:if>
	<c:if test="${not empty success}">
		<div class="alert alert-success">
			<strong>Success!</strong> ${success }
		</div>
	</c:if>
	<c:if test="${not empty duplicateCategory}">
		<div class="alert alert-danger">
			<strong>Error!</strong> ${duplicateCategory}
		</div>
	</c:if>

	<spring:url value="/admin/editCategory" var="formaction"></spring:url>
	<form:form action="${formaction }" method="post" commandName="category"
		id="category-form">
		<form:input path="id" class="sr-only" value="${category.id }" />
		<div class="form-group">
			<form:label path="name">Category Name:</form:label>
			<form:input path="name" class="form-control"
				value="${category.name }"></form:input>
		</div>
		<div class="form-group">
			<form:label path="description">Description:</form:label>
			<form:textarea path="description" class="form-control"
				value="${category.description }" />
		</div>
		<input type="submit" class="btn btn-success" value="Update Category">
		<a href="<spring:url value="/" />" class="btn btn-secondary">Cancel</a>
	</form:form>
</div>
<%@include file="/WEB-INF/views/template/footer.jsp"%>