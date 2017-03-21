<%@include file="/WEB-INF/views/template/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set value="/register/add" var="formUser"></c:set>
<div class="space"></div>
<div class="container">
	<div class="row">
		<div class="col-2"></div>
		<div class="col-8">
			<div class="card card-outline-primary">
				<div class="card-block">
					<div class="card-title text-center">Enter your Account
						Details</div>
					<form:form action="${formUser}" method="post" commandName="users">
						<div class="form-group">
							<form:label path="name" class="sr-only">Name</form:label>
							<form:input path="name" class="form-control"
								placeholder="Your name" required="true" autofocus></form:input>
						</div>
						<div class="form-group">
							<form:label path="mobileno" class="sr-only">Mobile No.</form:label>
							<form:input path="mobileno" class="form-control"
								placeholder="Mobile Number" required="true"></form:input>
						</div>
						<div class="form-group">
							<form:label path="email" class="sr-only">Email</form:label>
							<form:input type="email" path="email" class="form-control"
								placeholder="Email address" required="true"></form:input>
						</div>
						<div class="form-group">
							<form:label path="username" class="sr-only">Username</form:label>
							<form:input type="text" path="username" class="form-control"
								placeholder="Username" required="true"></form:input>
						</div>
						<div class="form-group">
							<form:label path="password" class="sr-only">Password</form:label>
							<form:input type="password" path="password" class="form-control"
								placeholder="Password" required="true"></form:input>
						</div>
						<p>Billing Address</p>
						<div class="form-group">
							<form:label path="billingAddress.streetName" class="sr-only">Street Name</form:label>
							<form:input type="text" path="billingAddress.streetName" class="form-control"
								placeholder="Street Name" ></form:input>
						</div>
						<div class="form-group">
							<form:label path="billingAddress.appartNo" class="sr-only">Apartment No</form:label>
							<form:input type="text" path="billingAddress.apartNo" class="form-control"
								placeholder="Apartment No"></form:input>
						</div>
						<div class="form-group">
							<form:label path="billingAddress.city" class="sr-only">City</form:label>
							<form:input type="text" path="billingAddress.city" class="form-control"
								placeholder="City"></form:input>
						</div>
						<div class="form-group">
							<form:label path="billingAddress.state" class="sr-only">State</form:label>
							<form:input type="text" path="billingAddress.state" class="form-control"
								placeholder="State"></form:input>
						</div>
						<div class="form-group">
							<form:label path="billingAddress.country" class="sr-only">Country</form:label>
							<form:input type="text" path="billingAddress.country" class="form-control"
								placeholder="Country"></form:input>
						</div>
						<div class="form-group">
							<form:label path="billingAddress.zipcode" class="sr-only">Zipcode</form:label>
							<form:input type="text" path="billingAddress.zipcode" class="form-control"
								placeholder="Zipcode"></form:input>
						</div>
						
						<p>Shipping Address</p>
						<div class="form-group">
							<form:label path="shippingAddress.streetName" class="sr-only">Street Name</form:label>
							<form:input type="text" path="billingAddress.streetName" class="form-control"
								placeholder="Street Name" ></form:input>
						</div>
						<div class="form-group">
							<form:label path="shippingAddress.appartNo" class="sr-only">Apartment No</form:label>
							<form:input type="text" path="billingAddress.apartNo" class="form-control"
								placeholder="Apartment No"></form:input>
						</div>
						<div class="form-group">
							<form:label path="shippingAddress.city" class="sr-only">City</form:label>
							<form:input type="text" path="billingAddress.city" class="form-control"
								placeholder="City"></form:input>
						</div>
						<div class="form-group">
							<form:label path="shippingAddress.state" class="sr-only">State</form:label>
							<form:input type="text" path="billingAddress.state" class="form-control"
								placeholder="State"></form:input>
						</div>
						<div class="form-group">
							<form:label path="shippingAddress.country" class="sr-only">Country</form:label>
							<form:input type="text" path="billingAddress.country" class="form-control"
								placeholder="Country"></form:input>
						</div>
						<div class="form-group">
							<form:label path="shippingAddress.zipcode" class="sr-only">Zipcode</form:label>
							<form:input type="text" path="billingAddress.zipcode" class="form-control"
								placeholder="Zipcode"></form:input>
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