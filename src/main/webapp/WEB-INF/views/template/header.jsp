<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	isELIgnored="false" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Illuminate</title>
<!-- Bootstrap CSS -->

<link href="<spring:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<link href="<spring:url value="/resources/css/font-awesome.min.css" />"
	rel="stylesheet">
<link href="<spring:url value="/resources/css/custom.css" />"
	rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-toggleable-md navbar-light"
		id="main-navigation">
		<div class="container">
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#main-navigation-menu"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<a class="navbar-brand" href="<spring:url value="/" />"><i
				class="fa fa-lightbulb-o"></i> Illuminate</a>

			<div class="collapse navbar-collapse" id="main-navigation-menu">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a class="nav-link"
						href="<spring:url value="/" />">Home <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<spring:url value="/login" />">Login</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<spring:url value="/register" />">Register</a></li>
				</ul>
				<form class="form-inline my-2 my-lg-0">
					<div class="input-group">
						<input type="text" class="form-control"
							placeholder="Search for..."> <span
							class="input-group-btn">
							<button class="btn btn-primary" type="submit">Go!</button>
						</span>
					</div>
				</form>
			</div>
		</div>
	</nav>

	<nav class="navbar navbar-toggleable-md bg-primary navbar-inverse"
		id="admin-navigation">
		<div class="container">
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#admin-navigation-menu"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<a class="navbar-brand" href="<spring:url value="/" />"><i
				class="fa fa-user fa-lg"></i></a>

			<div class="collapse navbar-collapse" id="admin-navigation-menu">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a class="nav-link"
						href="<spring:url value="/admin" />">Dashboard</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> Category </a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item"
								href="<c:url value="/admin/addCategory" />">Add Category</a> <a
								class="dropdown-item" href="<c:url value="/admin/category" />">All
								Category</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> Supplier </a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item"
								href="<c:url value="/admin/addSupplier" />">Add Supplier</a> <a
								class="dropdown-item" href="<c:url value="/admin/supplier" />">All
								Supplier</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> Product </a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item"
								href="<c:url value="/admin/addProduct" />">Add Product</a> <a
								class="dropdown-item" href="<c:url value="/admin/product" />">All
								Products</a>
						</div></li>
				</ul>
			</div>
		</div>
	</nav>