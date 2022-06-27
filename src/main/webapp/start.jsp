
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Products</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/custom.css">
</head>
<body>
<header class="p-4 bg-dark text-white">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap">
                    <use xlink:href="#bootstrap"></use>
                </svg>
            </a>

            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <li><a href="<c:url value="/products"/>" class="nav-link px-2 text-white">Home</a></li>
                <li><a href="#" class="nav-link px-2 text-white">About</a></li>
                <li><a href="<c:url value="/addTv.jsp"/>" class="nav-link px-2 text-white">Add new model</a></li>
            </ul>

            <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
                <input type="search" class="form-control form-control-dark text-white bg-dark"
                       placeholder="Search..." aria-label="Search">
            </form>
            <div class="text-end">
                <button type="button" class="btn btn-outline-light me-2">Login</button>
                <button type="button" class="btn btn-warning">Sign-up</button>
            </div>
        </div>
    </div>
</header>

<div class="b-divider"></div>

<main class="container text-center my-5">
    <form action="/products">

        <input type="hidden" name="page" value="1">

        <button type="submit" class="btn btn-primary">TVs</button>
        </div>
    </form>
</main>
</body>

<script src="js/bootstrap.min.js"></script>
</html>
