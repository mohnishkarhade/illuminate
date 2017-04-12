<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	isELIgnored="false" pageEncoding="ISO-8859-1"%>
<%@include file="/WEB-INF/views/template/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="space"></div>
<div class="container">

	<c:if test="${empty customer }">
		<div class="alert alert-warning">No data available in database</div>
	</c:if>
	<c:if test="${not empty error }">
		<div class="alert alert-danger">${error }</div>
	</c:if>
	<c:if test="${not empty success }">
		<div class="alert alert-success">${success }</div>
	</c:if>
	<c:if test="${not empty customer}">
		<div class="row">
			<div class="col">
				<div class="card">
					<div class="card-header">Personal Details</div>
					<div class="card-block">
						<h4 class="text-danger">
							<b>${customer.name }</b>
						</h4>
						<p class="card-text">
							<b>Username:</b> ${customer.username }
						</p>
						<p class="card-text">
							<b>Email:</b> ${customer.email}
						</p>
						<p class="card-text">
							<b>Mobile No:</b> ${customer.mobileno }
						</p>
						<c:if test="${customer.users.enabled }">
							<h4 class="text-success">Enabled</h4>
						</c:if>
						<c:if test="${!customer.users.enabled }">
							<h4 class="text-danger">Disabled</h4>
						</c:if>
						<c:if test="${isAdmin}">
							<form
								action="<c:url value="/admin/changeStatus/${customer.id}?${_csrf.parameterName}=${_csrf.token}" />"
								method="POST">
								<input type="submit" class="btn btn-outline-primary"
									value="Change Status" />
							</form>
						</c:if>
						<c:if test="${!isAdmin }">
							<a
								href="<c:url value="/customer/editCustomer/${customer.id }" />"
								class="btn btn-secondary pull-right">Edit</a>
						</c:if>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card">
					<div class="card-header">Address</div>
					<div class="card-block">
						<address>
							<strong>Billing Address</strong><br>
							${customer.billingAddress.apartNo},
							${customer.billingAddress.streetName} <br>
							${customer.billingAddress.city}, ${customer.billingAddress.state}
							<br> ${customer.billingAddress.country},
							${customer.billingAddress.zipcode} <br>
						</address>
						<br>
						<address>
							<strong>Shipping Address</strong><br>
							${customer.shippingAddress.apartNo},
							${customer.shippingAddress.streetName} <br>
							${customer.shippingAddress.city},
							${customer.shippingAddress.state} <br>
							${customer.shippingAddress.country},
							${customer.shippingAddress.zipcode} <br>
						</address>
					</div>
				</div>
			</div>
		</div>
	</c:if>
</div>
<%@include file="/WEB-INF/views/template/footer.jsp"%>