<%@include file="/WEB-INF/views/template/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="carouselExampleIndicators" class="carousel slide"
	data-ride="carousel">
	<ol class="carousel-indicators">
		<li data-target="#carouselExampleIndicators" data-slide-to="0"
			class="active"></li>
		<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
		<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
	</ol>
	<div class="carousel-inner" role="listbox">
		<div class="carousel-item active">
			<img class="d-block img-fluid"
				src="<c:url value="/resources/images/carousel1.jpg" />"
				alt="First slide">
		</div>
		<div class="carousel-item">
			<img class="d-block img-fluid"
				src="<c:url value="/resources/images/carousel2.jpg" />"
				alt="Second slide">
		</div>
		<div class="carousel-item">
			<img class="d-block img-fluid"
				src="<c:url value="/resources/images/carousel3.jpg" />"
				alt="Third slide">
		</div>
	</div>
	<a class="carousel-control-prev" href="#carouselExampleIndicators"
		role="button" data-slide="prev"> <span
		class="carousel-control-prev-icon" aria-hidden="true"></span> <span
		class="sr-only">Previous</span>
	</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
		role="button" data-slide="next"> <span
		class="carousel-control-next-icon" aria-hidden="true"></span> <span
		class="sr-only">Next</span>
	</a>
</div>
<br>
<div class="container">
	<c:if test="${not empty categoryList}">
		<h3 class="text-center">Featured Categories</h3>
		<div class="clearfix"></div>
		<br>
		<div class="row">
			<c:forEach items="${categoryList}" var="category">
				<div class="col-3 text-center" style="margin-bottom: 10px">
					<div class="card card-default">
						<div class="card-block">
							<h3 class="card-title">${category.name }</h3>
							<a class="card-link"
								href="<c:url value="/getProductByCategory/${category.id }" />">View</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</c:if>
</div>
<c:if test="${not empty success}">
	<div class="alert alert-success alert-dismissible fade show"
		role="alert" id="notification">
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<strong>Success!</strong> ${success }
	</div>
</c:if>
<c:if test="${not empty error}">
	<div class="alert alert-danger alert-dismissible fade show"
		role="alert" id="notification">
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<strong>Error!</strong> ${error }
	</div>
</c:if>
<%@include file="/WEB-INF/views/template/footer.jsp"%>