<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	isELIgnored="false" pageEncoding="ISO-8859-1"%>
<%@include file="/WEB-INF/views/template/header.jsp"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<spring:url value="register" var="addUser"></spring:url>

<div class="space"></div>
<div class="container">
	<div class="row">
		<div class="col-2"></div>
		<div class="col-8">
			<div class="card card-outline-primary">
				<div class="card-block">
					<div class="card-title text-center">Enter your Account
						Details</div>

					<c:if test="${not empty emailError}">
						<div class="alert alert-danger" role="alert">
							<strong>Error!</strong> ${emailError }
						</div>
					</c:if>
					<c:if test="${not empty usernameError}">
						<div class="alert alert-danger" role="alert">
							<strong>Error!</strong> ${usernameError }
						</div>
					</c:if>
					<c:if test="${not empty error}">
						<div class="alert alert-danger" role="alert">
							<strong>Error!</strong> ${error }
						</div>
					</c:if>

					<form:form action="${addUser }" method="post" commandName="users" id="registrationForm">
						<div class="form-group">
							<form:label path="name">Name</form:label>
							<form:input path="name" class="form-control"></form:input>
						</div>
						<div class="form-group">
							<form:label path="mobileno">Mobile No.</form:label>
							<form:input path="mobileno" class="form-control"></form:input>
						</div>
						<div class="form-group">
							<form:label path="email">Email</form:label>
							<form:input type="email" path="email" class="form-control"></form:input>
						</div>
						<div class="form-group">
							<form:label path="username">Username</form:label>
							<form:input type="text" path="username" class="form-control"></form:input>
						</div>
						<div class="form-group">
							<form:label path="password">Password</form:label>
							<form:input type="password" path="password" class="form-control"></form:input>
						</div>
						<p>Billing Address</p>
						<div class="form-group">
							<form:label path="billingAddress.streetName">Street Name</form:label>
							<form:input type="text" path="billingAddress.streetName"
								class="form-control"></form:input>
						</div>
						<div class="form-group">
							<form:label path="billingAddress.apartNo">Apartment No</form:label>
							<form:input type="text" path="billingAddress.apartNo"
								class="form-control"></form:input>
						</div>
						<div class="form-group">
							<form:label path="billingAddress.city">City</form:label>
							<form:input type="text" path="billingAddress.city"
								class="form-control"></form:input>
						</div>
						<div class="form-group">
							<form:label path="billingAddress.state">State</form:label>
							<form:input type="text" path="billingAddress.state"
								class="form-control"></form:input>
						</div>
						<div class="form-group">
							<form:label path="billingAddress.country">Country</form:label>
							<form:input type="text" path="billingAddress.country"
								class="form-control"></form:input>
						</div>
						<div class="form-group">
							<form:label path="billingAddress.zipcode">Zipcode</form:label>
							<form:input type="text" path="billingAddress.zipcode"
								class="form-control"></form:input>
						</div>

						<p>Shipping Address</p>
						<div class="form-group">
							<form:label path="shippingAddress.streetName">Street Name</form:label>
							<form:input type="text" path="shippingAddress.streetName"
								class="form-control"></form:input>
						</div>
						<div class="form-group">
							<form:label path="shippingAddress.apartNo">Apartment No</form:label>
							<form:input type="text" path="shippingAddress.apartNo"
								class="form-control"></form:input>
						</div>
						<div class="form-group">
							<form:label path="shippingAddress.city">City</form:label>
							<form:input type="text" path="shippingAddress.city"
								class="form-control"></form:input>
						</div>
						<div class="form-group">
							<form:label path="shippingAddress.state">State</form:label>
							<form:input type="text" path="shippingAddress.state"
								class="form-control"></form:input>
						</div>
						<div class="form-group">
							<form:label path="shippingAddress.country">Country</form:label>
							<form:input type="text" path="shippingAddress.country"
								class="form-control"></form:input>
						</div>
						<div class="form-group">
							<form:label path="shippingAddress.zipcode">Zipcode</form:label>
							<form:input type="text" path="shippingAddress.zipcode"
								class="form-control"></form:input>
						</div>


						<p class="text-right">
							<input type="submit" class="btn btn-success" value="Register">
							<input type="reset" class="btn btn-outline-secondary"
								value="Reset">
						</p>
					</form:form>
				</div>
			</div>
		</div>
		<div class="col-2"></div>
	</div>
</div>
<%@include file="/WEB-INF/views/template/footer.jsp"%>