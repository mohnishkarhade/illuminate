<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	isELIgnored="false" pageEncoding="ISO-8859-1"%>
<%@include file="/WEB-INF/views/template/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="space"></div>
<div class="container">
	<h2 class="heading-one">Products</h2>

	<c:if test="${empty productList }">
		<div class="alert alert-warning">No data available in database</div>
	</c:if>
	<c:if test="${not empty error }">
		<div class="alert alert-danger">${error }</div>
	</c:if>
	<c:if test="${not empty success }">
		<div class="alert alert-success">${success }</div>
	</c:if>
	<c:if test="${not empty productList}">
		<div class="row">
			<c:forEach items="${productList}" var="product">
				<div class="col-sm-3 ">
					<div class="thumbnail">
						<img alt=""
							src="<c:url value="/resources/images/${product.id }.jpg" />"
							class="img-responsive">
						<div class="caption">
							<h4>
								<a
									href="<c:url value="/product/productDetail/${product.id }" />">${product.name}</a>
							</h4>

							<p>
								<b>Category: </b>${product.category.name } <br /> <b>Supllier:
								</b>${product.supplier.name }
							</p>
							<h4 class="text-success pull-right">Rs ${product.price }</h4>
							<a href="<c:url value="/product/productDetail/${product.id }" />"
								class="btn btn-primary">View Details</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</c:if>
</div>
<%@include file="/WEB-INF/views/template/footer.jsp"%>