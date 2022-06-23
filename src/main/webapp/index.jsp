<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/custom.css">
    <title>TV-sets SHOP</title>
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
                <li><a href="#" class="nav-link px-2 text-secondary">Home</a></li>
                <li><a href="#" class="nav-link px-2 text-white">About</a></li>
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

<main class="container-fluid">
    <c:forEach var="tv" items="${tv}">
        <div class="row">
            <div class="col-sm-1"></div>
            <div class="col-sm-5">
                <div class="card">
                    <div class="card-body row">
                        <div class="col-sm-4">
                            <img src="1.jpg" alt="tv1" height="150 px" width="auto">
                        </div>
                        <div class="col-sm-7">
                            <h5 class="card-title">${tvSet.brand}</h5>
                            <h6 class="card-title">${tvSet.model}</h6>
                            <p class="card-text"> ${tvSet.info}</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-5">
                <div class="card">
                    <div class="card-body row">
                        <div class="col-sm-4">
                            <img src="2.jpg" alt="tv1" height="150 px" width="auto">
                        </div>
                        <div class="col-sm-7">
                            <h5 class="card-title">${tvSet.next.brand}</h5>
                            <h6 class="card-title">${tvSet.next.model}</h6>
                            <p class="card-text"> ${tvSet.next.info}</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="b-example-divider"></div>
    </c:forEach>

</main>

<script src="js/bootstrap.min.js"></script>
</body>
</html>