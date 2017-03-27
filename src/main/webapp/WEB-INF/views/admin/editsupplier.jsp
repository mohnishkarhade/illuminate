<%@include file="/WEB-INF/views/template/header.jsp"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="space"></div>

<div class="container">
	<h2 class="heading-one">Edit Supplier</h2>

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
	<c:if test="${not empty duplicateSupplier}">
		<div class="alert alert-danger">
			<strong>Error!</strong> ${duplicateSupplier}
		</div>
	</c:if>

	<spring:url value="/admin/editSupplier" var="formaction"></spring:url>
	<form:form action="${formaction }" method="post" commandName="supplier"
		id="supplier-form">
		<form:input path="id" class="sr-only" value="${supplier.id }" />
		<div class="form-group">
			<form:label path="name">Supplier Name:</form:label>
			<form:input path="name" class="form-control"
				value="${supplier.name }"></form:input>
		</div>
		<div class="form-group">
			<form:label path="address">Description:</form:label>
			<form:textarea path="address" class="form-control"
				value="${supplier.address }" />
		</div>
		<input type="submit" class="btn btn-success" value="Update Supplier">
		<a href="<spring:url value="/" />" class="btn btn-secondary">Cancel</a>
	</form:form>
</div>
<%@include file="/WEB-INF/views/template/footer.jsp"%>