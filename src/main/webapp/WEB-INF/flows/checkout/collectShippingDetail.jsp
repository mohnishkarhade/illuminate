<%@include file="/WEB-INF/views/template/header.jsp"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="space"></div>
<div class="container">
	<h2 class="heading-one">Customer Details</h2>

	<form:form modelAttribute="order">

		<h3>Shipping Address</h3>

		<div class="form-group">
			<label for="shippingStreet">Street Name</label>
			<form:input path="customer.shippingAddress.streetName"
				id="shippingStreet" class="form-control" />
		</div>

		<div class="form-group">
			<label for="shippingApartmentNumber">Apartment Number</label>
			<form:input path="customer.shippingAddress.apartNo"
				id="shippingApartmentNumber" class="form-control" />
		</div>

		<div class="form-group">
			<label for="shippingCity">City</label>
			<form:input path="customer.shippingAddress.city"
				id="shippingCity" class="form-control" />
		</div>

		<div class="form-group">
			<label for="shippingState">State</label>
			<form:input path="customer.shippingAddress.state"
				id="shippingState" class="form-control" />
		</div>

		<div class="form-group">
			<label for="shippingCountry">Country</label>
			<form:input path="customer.shippingAddress.country"
				id="shippingCountry" class="form-control" />
		</div>

		<div class="form-group">
			<label for="shippingZip">Zipcode</label>
			<form:input path="customer.shippingAddress.zipcode"
				id="shippingZip" class="form-control" />
		</div>

		<input type="hidden" name="_flowExecutionKey" />

		<br>
		<br>
		<button class="btn btn-outline-warning"
			name="_eventId_backToCollectCustomerInfo">Back</button>
		<input type="submit" value="Next" class="btn btn-outlint-primary"
			name="_eventId_shippingDetailCollected" />
		<button class="btn btn-default" name="_eventId_cancel">Cancel</button>
	</form:form>

</div>
<%@include file="/WEB-INF/views/template/footer.jsp"%>
