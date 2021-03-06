<%@include file="/WEB-INF/views/template/header.jsp"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="space"></div>

<div class="container">
	<h2 class="heading-one">Add New Category</h2>
	
	<c:if test="${not empty error}">
		<div class="alert alert-danger">
			<strong>Error!</strong> ${error}
		</div>
	</c:if>

	<c:if test="${not empty duplicateCategory}">
		<div class="alert alert-danger">
			<strong>Error!</strong> ${duplicateCategory}
		</div>
	</c:if>

	<c:if test="${not empty success}">
		<div class="alert alert-success">
			<strong>Success!</strong> ${success }
		</div>
	</c:if>


	<spring:url value="/admin/addCategory" var="addCategory"></spring:url>
	<form:form action="${addCategory }" method="post"
		commandName="category" id="category-form">
		<div class="form-group">
			<form:label path="name">Category Name:</form:label>
			<form:input path="name" class="form-control"></form:input>
		</div>
		<div class="form-group">
			<form:label path="description">Description:</form:label>
			<form:textarea path="description" class="form-control" />
		</div>
		<input type="submit" class="btn btn-success" value="Add Category">
		<input type="reset" class="btn btn-secondary" value="Reset">
	</form:form>
</div>
<%@include file="/WEB-INF/views/template/footer.jsp"%>