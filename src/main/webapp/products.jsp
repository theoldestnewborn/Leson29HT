<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.leson29ht.Entities.TVset" %>
<%@ page import="java.util.ArrayList" %>
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
                <li><a href="products?page=1" class="nav-link px-2 text-white">Home</a></li>
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

<main class="container">
    <c:forEach items="${tvs}" var="tv" begin="0" end="3" step="2" varStatus="status">
    <c:if test="${status.index+1 < tvs.size()}">
        <div class="row">
            <div class="col-sm-1"></div>
            <div class="col-sm-5">
                <div class="card">
                    <div class="card-body row">
                        <div class="col-sm-6 col-md-6 img-thumbnail my-1 mx-1">
                            <img src="${tvs[status.index].pathImage}" alt="tv1" class="img-fluid">
                        </div>
                        <div class="col-sm-5 col-dm-5 my-1 mx-1">
                            <h5 class="card-title">${tvs[status.index].brand}</h5>
                            <h6 class="card-title">${tvs[status.index].model}</h6>
                            <p class="card-text">${tvs[status.index].price}$</p>
                            <p>
                                <button class="btn btn-primary" type="button" data-bs-toggle="collapse"
                                        data-bs-target=".${tvs[status.index].model}" aria-expanded="false"
                                        aria-controls="${tvs[status.index].model}">
                                    More info
                                </button>
                            </p>
                            <div style="min-height: 0px;">
                                <div class="collapse collapse-horizontal ${tvs[status.index].model}"
                                     id="${tvs[status.index].model}">
                                    <div class="card card-body" style="width: auto;">
                                            ${tvs[status.index].info}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-5">
                <div class="card">
                    <div class="card-body row">
                        <div class="col-sm-6 col-md-6 img-thumbnail my-1 mx-1">
                            <img src="${tvs[status.index+1].pathImage}" alt="tv1" class="img-fluid">
                        </div>
                        <div class="col-sm-5 col-dm-5 my-1 mx-1">
                            <h5 class="card-title">${tvs[status.index+1].brand}</h5>
                            <h6 class="card-title">${tvs[status.index+1].model}</h6>
                            <p class="card-text">${tvs[status.index+1].price}$</p>
                            <p>
                                <button class="btn btn-primary" type="button" data-bs-toggle="collapse"
                                        data-bs-target=".${tvs[status.index+1].model}" aria-expanded="false"
                                        aria-controls="${tvs[status.index+1].model}">
                                    More info
                                </button>
                            </p>
                            <div style="min-height: 0px;">
                                <div class="collapse collapse-horizontal
                                ${tvs[status.index+1].model}" id="${tvs[status.index+1].model}">
                                    <div class="card card-body" style="width: auto;">
                                        muuuuuuuuuuuuuuuuuuch mooooooooooooooooore o ${tvs[status.index+1].info}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="b-divider my-2"></div>
    </c:if>

    <c:if test="${status.index+1 == tvs.size()}">
    <div class="row">
        <div class="col-sm-1"></div>
        <div class="col-sm-5">
            <div class="card">
                <div class="card-body row">
                    <div class="col-sm-6 col-md-6 img-thumbnail my-1 mx-1">
                        <img src="${tvs[status.index].pathImage}" alt="tv1" class="img-fluid">
                    </div>
                    <div class="col-sm-5 col-dm-5 my-1 mx-1">
                        <h5 class="card-title">${tvs[status.index].brand}</h5>
                        <h6 class="card-title">${tvs[status.index].model}</h6>
                        <p class="card-text">${tvs[status.index].price}$</p>
                        <p>
                            <button class="btn btn-primary" type="button" data-bs-toggle="collapse"
                                    data-bs-target=".${tvs[status.index].model}" aria-expanded="false"
                                    aria-controls="${tvs[status.index].model}">
                                More info
                            </button>
                        </p>
                        <div style="min-height: 0px;">
                            <div class="collapse collapse-horizontal ${tvs[status.index].model}"
                                 id="${tvs[status.index].model}">
                                <div class="card card-body" style="width: auto;">
                                    muuuuuuuuuuuuuuuuuuch mooooooooooooooooore of ${tvs[status.index].info}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-5"></div>
        </div>
        <div class="b-divider my-2"></div>
        </c:if>
        </c:forEach>

        <nav aria-label="Page navigation">
            <ul class="pagination justify-content-center">
                <c:if test="${page != 1}">
                    <li class="page-item">
                        <a class="page-link"
                            href="products?page=${page-1}">Previous</a>
                    </li>
                </c:if>

                <c:forEach begin="1" end="3" var="i">
                    <c:choose>
                        <c:when test="${page eq i}">
                            <li class="page-item active"><a class="page-link"
                                href="products?page=${i}">
                                    ${i} <span class="sr-only"></span></a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item">
                                <a class="page-link"
                                   href="products?page=${i}">${i}</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:if test="${page lt noOfPages}">
                    <li class="page-item">
                        <a class="page-link"
                           href="products?page=${page+1}">Next</a>
                    </li>
                </c:if>
            </ul>
        </nav>

</main>
</body>

<script src="js/bootstrap.min.js"></script>
</html>
