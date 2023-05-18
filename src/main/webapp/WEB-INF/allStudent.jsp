<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
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
<title>All Student</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
    <nav class="navbar navbar-expand-xl navbar-dark bg-dark p-3">
        <div class="container-fluid">
            <a class="navbar-brand display-1" href="#" style="font-size: 24px;">All Students</a>
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

    <div class="container mt-3">
        <table class="table table-striped">
            <thead class="table-dark">
                <tr>
                    <th>Student Name</th>
                    <th>Dorm Name</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="student" items="${students}">
                    <tr>
                        <td>
                            <a href="/student/show/${student.id}">
                                <c:out value="${student.firstName}"/>
                            </a>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${student.dorm == null}">
                                    Student is not yet in a dorm
                                </c:when>
                                <c:otherwise>
                                    <a href="/dorm/show/${student.dorm.id}">
                                        <c:out value="${student.dorm.name}"/>
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <form action="/student/delete/${student.id}" method="post">
                                <input type="hidden" name="_method" value="delete">
                                <input type="submit" value="Delete" class="btn btn-danger">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>

</html>