<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="./base.jsp"%>
</head>
<body>
	<div class="container mt-5 bg-light">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<h1 class="text-center mb-3 mt-3 text-warning">Add Religion</h1>
				<form action="handleReligion" method="post">

					<div class="form-group">
						<label for="name">Religion: </label> <input type="text"
							class="form-control" id="religionval" name="religionval">
					</div>

					<div class="container text-center mb-4">
						<a href="${pageContext.request.contextPath}/"
							class="btn btn-outline-danger"> Back </a>
						<button type="submit" class="btn btn-primary">Add Religion</button>
					</div>

				</form>
				<table class="table table-light">
					<thead class="thead-dark">
						<tr>
							<th scope="col">Religion</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${religions}" var="p">

							<tr class="table-light">
								<td>${p.religionval}</td>
								<td> <a href="deleteReligion/${p.id}"><i
										class="fa-sharp fa-solid fa-trash text-danger"></i></a>  <a
									href="updateReligion/${p.id}"><i
										class="fa-sharp fa-solid fa-pen-to-square text-success"></i></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	

</body>
</html>