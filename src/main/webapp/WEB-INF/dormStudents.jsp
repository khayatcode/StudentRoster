<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dorm students</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand-xl navbar-dark bg-dark p-3">
		<div class="container-fluid">
			<a class="navbar-brand display-1" href="#" style="font-size: 24px;">
				<c:out value="${dorm.name}" /> Students
			</a>
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
	<div class="container d-flex gap-3 mt-3">
			<div class="col-7">
				<table class="table table-striped">
					<thead class="table-dark">
						<tr>
							<th>Student Name</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="student" items="${dorm.students}">
							<tr>
								<td><a href="/student/show/${student.id}"> <c:out
											value="${student.firstName}" />
								</a></td>
								<td>
									<form action="/dorm/remove/student/${student.id}" method="post">
										<input type="hidden" name="dormId" value="${dorm.id}" /> <input
											type="submit" value="Remove Student" class="btn btn-danger">
									</form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="col-5">
				<form action="/dorm/add/student/${dorm.id}" method="post">
					<div class="form-group">
						<input type="hidden" name="dormId" value="${dorm.id}" /> <label
							for="students">Add Student:</label>
						<c:if test="${not empty errorMessage}">
							<div class="mb-2 mt-2">
								<p class="text-danger">
									<c:out value="${errorMessage}" />
								</p>
							</div>
						</c:if>
						<select name="students" class="form-control mt-3">
							<option value="" selected disabled>Select Student</option>
							<c:forEach var="student" items="${students}">
								<option value="${student.id}">
									<c:out value="${student.firstName}" />
								</option>
							</c:forEach>
						</select>
					</div>
					<input type="submit" value="Add Student" class="btn btn-primary mt-3">
				</form>
			</div>
	</div>
</body>
</html>