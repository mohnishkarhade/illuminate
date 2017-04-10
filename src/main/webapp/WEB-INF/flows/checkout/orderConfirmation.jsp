<%@include file="/WEB-INF/views/template/header.jsp"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />

<div class="space"></div>
<div class="container">
	<h2 class="heading-one">Order Confirmation</h2>
	<div class="space"></div>
	<form:form modelAttribute="order">

		<div
			class="well col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 co-md-offset-3">

			<div class="text-center">
				<h1>Receipt</h1>
			</div>
			<div class="row">
				<div class="col-xs-6 col-sm-6 col-md-6">
					<address>
						<strong>Shipping Address</strong><br>
						${order.customer.shippingAddress.streetName} <br>
						${order.customer.shippingAddress.apartNo} <br>
						${order.customer.shippingAddress.city},
						${order.customer.shippingAddress.state} <br>
						${order.customer.shippingAddress.country},
						${corder.ustomer.shippingAddress.zipcode} <br>
					</address>
				</div>
				<div class="col-xs-6 col-sm-6 col-md-6 text-right">
					<p>
						Shipping Date:
						<fmt:formatDate type="date" value="${now}" />
					</p>
				</div>
			</div>

			<div class="row">
				<div class="col-xs-6 col-sm-6 col-md-6">
					<address>
						<strong>Billing Address</strong><br>
						${order.customer.billingAddress.streetName} <br>
						${order.customer.billingAddress.apartNo} <br>
						${order.customer.billingAddress.city},
						${order.customer.billingAddress.state} <br>
						${order.customer.billingAddress.country},
						${order.customer.billingAddress.zipcode} <br>
					</address>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Product</th>
							<th class="text-center">Quantity</th>
							<th class="text-center">Price/Unit</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="cartItem" items="${order.customer.cartItems}">
							<tr>
								<td class="col-md-9"><em>${cartItem.productName}</em></td>
								<td class="col-md-1" style="text-align: center">${cartItem.quantity}</td>
								<td class="col-md-1" style="text-align: center">${cartItem.price}</td>
							</tr>
						</c:forEach>

						<tr>							
							<td class="text-right" >
								<h4>
									<strong>Grand Total: </strong>
								</h4>
							</td>
							<td class="text-center text-danger" colspan="2">
								<h4>
									<strong>Rs ${totalAmount } </strong>
								</h4>
							</td>
						</tr>
					</tbody>
				</table>
			</div>

			<input type="hidden" name="_flowExecutionKey" /> <br> <br>
			<button class="btn btn-outline-warning"
				name="_eventId_backToCollectShippingDetail">Back</button>
			<input type="submit" value="Submit Order"
				class="btn btn-outline-primary" name="_eventId_orderConfirmed" />
			<button class="btn btn-default" name="_eventId_cancel">Cancel</button>
		</div>
	</form:form>
</div>


<%@include file="/WEB-INF/views/template/footer.jsp"%>
