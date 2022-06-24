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

<main class="container">
    <c:forEach items="${tvs}" var="tv" begin="0" end="${tvs.size()}" step="2" varStatus="status">

        <c:if test="${status.count  < tvs.size()}">
            <div class="row">
                <div class="col-sm-1"></div>
                <div class="col-sm-5">
                    <div class="card">
                        <div class="card-body row">
                            <div class="col-sm-6 col-md-6 img-thumbnail my-1 mx-1">
                                <img src="1.jpg" alt="tv1" class="img-fluid">
                            </div>
                            <div class="col-sm-5 col-dm-5 my-1 mx-1">
                                <h5 class="card-title">${tvs[status.index].brand}</h5>
                                <h6 class="card-title">${tvs[status.index].model}</h6>
                                <p class="card-text">${tvs[status.index].brand}</p>
                                <a href="#" class="btn btn-primary">Order</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-5">
                    <div class="card">
                        <div class="card-body row">
                            <div class="col-sm-6 col-md-6 img-thumbnail my-1 mx-1">
                                <img src="2.jpg" alt="tv1" class="img-fluid">
                            </div>
                            <div class="col-sm-5 col-dm-5 my-1 mx-1">
                                <h5 class="card-title">${tvs[status.index+1].brand}</h5>
                                <h6 class="card-title">${tvs[status.index+1].model}</h6>
                                <p class="card-text">${tvs[status.index+1].info}</p>
                                <a href="#" class="btn btn-primary">Order</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${status.count == tvs.size()}">
            <div class="row">
                <div class="col-sm-1"></div>
                <div class="col-sm-5">
                    <div class="card">
                        <div class="card-body row">
                            <div class="col-sm-6 col-md-6 img-thumbnail my-1 mx-1">
                                <img src="1.jpg" alt="tv1" class="img-fluid">
                            </div>
                            <div class="col-sm-5 col-dm-5 my-1 mx-1">
                                <h5 class="card-title">${tvs[status.index].brand}</h5>
                                <h6 class="card-title">${tvs[status.index].model}</h6>
                                <p class="card-text">${tvs[status.index].brand}</p>
                                <a href="#" class="btn btn-primary">Order</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>



        <%--        </c:if>--%>

        <%--        <c:if test="${status.last}">--%>
        <%--            <div class="row">--%>
        <%--                <div class="col-sm-1"></div>--%>
        <%--                <div class="col-sm-5">--%>
        <%--                    <div class="card">--%>
        <%--                        <div class="card-body row">--%>
        <%--                            <div class="col-sm-6 col-md-6 img-thumbnail my-1 mx-1">--%>
        <%--                                <img src="1.jpg" alt="tv1" class="img-fluid">--%>
        <%--                            </div>--%>
        <%--                            <div class="col-sm-5 col-dm-5 my-1 mx-1">--%>
        <%--                                <h5 class="card-title">${tvs[status.index].brand}</h5>--%>
        <%--                                <h6 class="card-title">${tvs[status.index].model}</h6>--%>
        <%--                                <p class="card-text">${tvs[status.index].brand}</p>--%>
        <%--                                <a href="#" class="btn btn-primary">Order</a>--%>
        <%--                            </div>--%>
        <%--                        </div>--%>
        <%--                    </div>--%>
        <%--                </div>--%>
        <%--            </div>--%>
        <%--        </c:if>--%>
        <div class="b-example-divider"></div>
    </c:forEach>

</main>
</body>
</html>
