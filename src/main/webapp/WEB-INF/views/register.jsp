<%@include file="/WEB-INF/views/template/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set value="/register" var="formUser"></c:set>
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
						<div class="form-group">
							<form:label path="billingAddress" class="sr-only">Billing Address</form:label>
							<form:input type="text" path="billingAddress" class="form-control"
								placeholder="Billing Address" ></form:input>
						</div>
						<div class="form-group">
							<form:label path="shippingAddress" class="sr-only">Shipping Address</form:label>
							<form:input type="text" path="shippingAddress" class="form-control"
								placeholder="Shipping Address"></form:input>
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