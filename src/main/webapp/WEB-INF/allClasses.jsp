<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show All Classes</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
    <nav class="navbar navbar-expand-xl navbar-dark bg-dark p-3">
        <div class="container-fluid">
            <a class="navbar-brand display-1" href="#" style="font-size: 24px;">All Classes</a>
            <button class="navbar-toggler" type="button"
                data-bs-toggle="collapse" data-bs-target="#navbarBasic"
                aria-controls="navbarBasic" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarBasic">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item"><a class="nav-link" href="/dorm/show/all">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="/dorm/create/page">Create Dorm</a></li>
                    <li class="nav-item"><a class="nav-link" href="/student/create/page">Create Student</a></li>
                    <li class="nav-item"><a class="nav-link" href="/class/create/page">Create Class</a></li>
                    <li class="nav-item"><a class="nav-link" href="/class/show/all">View All Classes</a></li>
                    <li class="nav-item"><a class="nav-link" href="/student/show/all">View All Students</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="row">
            <div class="col">
                <div class="card mt-3">
                    <div class="card-header">
                        <h3>Classes</h3>
                    </div>
                    <div class="card-body">
                        <c:forEach var="course" items="${courses}">
                            <ul class="list-unstyled">
                                <li>
                                    <a href="/class/show/${course.id}">
                                        <c:out value="${course.name}"/>
                                    </a>
                                </li>
                            </ul>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>