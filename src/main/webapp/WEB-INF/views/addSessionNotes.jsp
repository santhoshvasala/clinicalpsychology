<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="./base.jsp"%>
<style>
textarea {
      width: 100%;
      padding: 0.6rem 0.7rem;
      border: 1px solid var(--border);
      border-radius: 8px;
      font-size: 0.95rem;
      background: #fff;
    }
</style>
</head>
<body>
	<div class="container mt-5 bg-light">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<h1 class="text-center mb-3 mt-3 text-warning">Session Notes</h1>
				<form action="${pageContext.request.contextPath}/handleSessionNotes/${pid}" method="post">
				    <button type="submit" disabled style="display: none" aria-hidden="true"></button>
					<div class="form-group">
						<label for="name">Date: </label> <input type="datetime-local" name="sessionoccuredon" id="sessionoccuredon" />
					</div>
					<div class="form-group">
						<label for="name">Session Notes: </label> <textarea
							 id="sessionnote" name="sessionnote"> </textarea>
					</div>
				<!-- 	<div class="form-group">
						<label for="name">Select File: </label> 
					 <input type="file" name="file" />
					 -->
					
					<div class="container text-center mb-4">
						<a href="${pageContext.request.contextPath}/homePage"
							class="btn btn-outline-danger">HOME</a>
							 <button type="submit" class="btn btn-primary">Add Session Notes</button>
					
				</div>

				</form>
				<table class="table table-light">
					<thead class="thead-dark">
						<tr>
							<th scope="col">Session Date</th>
							<th scope="col">Session Notes</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${sessions}" var="p">
							<tr class="table-light">
								<td>${p.sessionoccuredon}</td>
								<td>${p.sessionnote}</td>
								<td> <a href="${pageContext.request.contextPath}/deleteSessionNotes/${p.id}" onclick="return confirm('Are you sure you want to delete? ');"><i
										class="fa-sharp fa-solid fa-trash text-danger"></i></a>  <a
									href="${pageContext.request.contextPath}/updateSessionNotes/${p.id}"><i
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