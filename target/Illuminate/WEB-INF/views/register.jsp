<%@include file="/WEB-INF/views/template/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="space"></div>
<div class="container">
	<div class="row">
		<div class="col-2"></div>
		<div class="col-8">
			<div class="card card-outline-primary">
				<div class="card-block">
					<div class="card-title text-center">Enter your Account
						Details</div>
					<div class="form-group">
						<label for="Name" class="sr-only">Name</label> <input type="text"
							name="name" id="Name" class="form-control"
							placeholder="Your Name" required="true" autofocus>
					</div>
					<div class="form-group">
						<label for="Mobile" class="sr-only">Mobile No.</label> <input
							type="text" name="mobile" id="Mobile" class="form-control"
							placeholder="Mobile Number" required="true">
					</div>
					<div class="form-group">
						<label for="Email" class="sr-only">Email</label> <input
							type="email" name="email" id="Email" class="form-control"
							placeholder="Email address" required="true">
					</div>
					<div class="form-group">
						<label for="inputPassword" class="sr-only">Password</label> <input
							type="password" name="password" id="inputPassword"
							class="form-control" placeholder="Password" required="true">
					</div>
					
					<p class="text-right">
						<input type="submit" class="btn btn-success" value="Register">
						<input type="reset" class="btn btn-outline-secondary"
							value="Reset">
					</p>
				</div>
			</div>
		</div>
		<div class="col-2"></div>
	</div>
</div>
<%@include file="/WEB-INF/views/template/footer.jsp"%>