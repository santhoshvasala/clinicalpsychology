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
				<h1 class="text-center mb-3 mt-3 text-warning">Add Referrel Source</h1>
				<form action="handleReferralSource" method="post">

					<div class="form-group">
						<label for="name">Referrel Source: </label> <input type="text"
							class="form-control" id="referralSourceVal" name="referralSourceVal">
					</div>

					<div class="container text-center mb-4">
						<a href="${pageContext.request.contextPath}/"
							class="btn btn-outline-danger"> Back </a>
						<button type="submit" class="btn btn-primary">Add Referrel Source</button>
					</div>

				</form>
				<table class="table table-light">
					<thead class="thead-dark">
						<tr>
							<th scope="col">Referrel Source</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${referralSources}" var="p">

							<tr class="table-light">
								<td>${p.referralSourceVal}</td>
								<td> <a href="deleteReferralSource/${p.id}"><i
										class="fa-sharp fa-solid fa-trash text-danger"></i></a>  <a
									href="updateReferralSource/${p.id}"><i
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