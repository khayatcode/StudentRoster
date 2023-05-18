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
<title>Create Class</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
    <nav class="navbar navbar-expand-xl navbar-dark bg-dark p-3">
		<div class="container-fluid">
			<a class="navbar-brand display-1" href="#" style="font-size: 24px;">Create Class</a>
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
        <form:form action="/class/create/new" method="post" modelAttribute="classes">
            <c:if test="${BindingResult.hasErrors()}">
                <div class="alert alert-danger">
                    <form:errors path="name"/>
                </div>
            </c:if>
            <div class="form-group">
                <form:label path="name">Class Name</form:label>
                <form:input path="name" type="text" class="form-control mt-3" placeholder="Enter Class Name"/>
            </div>
            <input type="submit" class="btn btn-primary mt-3" value="Create Class"/>
        </form:form>
    </div>
</body>
</html>