<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	isELIgnored="false" pageEncoding="ISO-8859-1"%>
<%@include file="/WEB-INF/views/template/header.jsp"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="space"></div>

<div class="container">
	<h2 class="heading-one">Add New Product</h2>

	<c:if test="${not empty error}">
		<div class="alert alert-danger">
			<strong>Error!</strong> ${error}
		</div>
	</c:if>

	<c:if test="${not empty duplicateProduct}">
		<div class="alert alert-danger">
			<strong>Error!</strong> ${duplicateProduct}
		</div>
	</c:if>

	<c:if test="${not empty success}">
		<div class="alert alert-success">
			<strong>Success!</strong> ${success }
		</div>
	</c:if>


	<spring:url value="/admin/addProduct" var="addProduct"></spring:url>
	<form:form action="${addProduct }" method="post" commandName="product"
		enctype="multipart/form-data" id="product-form" >
		<div class="form-group">
			<form:label path="name">Product Name:</form:label>
			<form:input path="name" class="form-control"></form:input>
		</div>
		<div class="form-group">
			<form:label path="description">Description:</form:label>
			<form:textarea path="description" class="form-control" />
		</div>
		<div class="form-group">
			<form:label path="price">Price:</form:label>
			<form:input path="price" class="form-control"></form:input>
		</div>
		<div class="form-group">
			<form:label path="categoryId">Category</form:label>
			<form:select path="categoryId" class="form-control">
				<c:forEach items="${categoryList }" var="category">
					<form:option value="${category.id }">${category.name} </form:option>
				</c:forEach>
			</form:select>
		</div>
		<div class="form-group">
			<form:label path="supplierId">Supplier</form:label>
			<form:select path="supplierId" class="form-control">
				<c:forEach items="${supplierList }" var="supplier">
					<form:option value="${supplier.id }">${supplier.name} </form:option>
				</c:forEach>
			</form:select>
		</div>
		<div class="form-group">
			<form:label path="file">Upload Image</form:label>
			<form:input path="file" type="file" class="form-control input-sm" />			
		</div>

		<input type="submit" class="btn btn-success" value="Add Product">
		<input type="reset" class="btn btn-secondary" value="Reset">
	</form:form>
</div>
<%@include file="/WEB-INF/views/template/footer.jsp"%>