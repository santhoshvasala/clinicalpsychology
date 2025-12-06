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
				<h1 class="text-center mb-3 mt-3 text-warning">ADD PURPOSE</h1>
				<form action="${pageContext.request.contextPath}/handlePurpose" method="post">
					<button type="submit" disabled style="display: none" aria-hidden="true"></button>
					<div class="form-group">
						<label for="name">Purpose: </label> <input type="text"
							class="form-control" id="purposeVal" name="purposeVal">
					</div>

					<div class="container text-center mb-4">
						<a href="${pageContext.request.contextPath}/homePage"
							class="btn btn-primary"> HOME </a>
						<button type="submit" class="btn btn-primary">ADD</button>
					</div>

				</form>
				<table class="table table-light">
					<thead class="thead-dark">
						<tr>
							<th scope="col">Purpose</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${purposes}" var="p">

							<tr class="table-light">
								<td>${p.purposeVal}</td>
								<td> <a href="deletePurpose/${p.id}"><i
										class="fa-sharp fa-solid fa-trash text-danger"></i></a>  <a
									href="updatePurpose/${p.id}"><i
										class="fa-sharp fa-solid fa-pen-to-square text-success" hidden="true"></i></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	

</body>
</html>