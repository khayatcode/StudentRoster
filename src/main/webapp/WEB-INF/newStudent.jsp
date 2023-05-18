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
<title>Create Student</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
    <nav class="navbar navbar-expand-xl navbar-dark bg-dark p-3">
		<div class="container-fluid">
			<a class="navbar-brand display-1" href="#" style="font-size: 24px;">Create Student</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarBasic"
				aria-controls="navbarBasic" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarBasic">
				<ul class="navbar-nav me-auto">
					<li class="nav-item"><a class="nav-link" href="/dorm/show/all">Home</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="/dorm/create/page">Create Dorm</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/student/create/page">Create Student</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/class/create/page">Create Class</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/class/show/all">View All Classes</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/student/show/all">View All Students</a></li>
				</ul>
			</div>
		</div>
	</nav>

    <div class="container mt-3">
        <!-- Create Student with firstName and lastName using form:form with modelAttribute -->
        <form:form action="/student/create/new" method="post" modelAttribute="student">
            <c:if test="${BindingResult.hasErrors()}">
                <div class="alert alert-danger d-block">
                	<div class="mb-3">
	                    <form:errors path="firstName"/>
                	</div>
                    <form:errors path="lastName"/>
                </div>
            </c:if>
            <div class="form-group mb-3">
                <form:label path="firstName">First Name</form:label>
                <form:input path="firstName" type="text" class="form-control mt-3" id="firstName" placeholder="Enter First Name"/>
            </div>
            <div class="form-group mb-3">
                <form:label path="lastName">Last Name</form:label>
                <form:input path="lastName" type="text" class="form-control mt-3" id="lastName" placeholder="Enter Last Name"/>
            </div>
            <input type="submit" class="btn btn-primary" value="Create Student"/>
        </form:form>
    </div>
</body>
</html>