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
				<h1 class="text-center mb-3 mt-3 text-warning">Session Notes</h1>
				<form action="handleSessionNotes" method="post">

					<div class="form-group">
						<label for="name">Date: </label> <input type="date" name="sessionOccuredOn" id="sessionOccuredOn" />
					</div>
					<div class="form-group">
						<label for="name">Session Notes: </label> <input type="text"
							 id="sessionNotes" name="sessionNotes">
					</div>
					<div class="form-group">
						<label for="name">Select File: </label> 
					 <input type="file" name="file" />
					
					
					<div class="container text-center mb-4">
						<a href="${pageContext.request.contextPath}/"
							class="btn btn-outline-danger"> Back </a>
							 <button type="submit" class="btn btn-primary">Add Session Notes</button>
					
				</div>
					</div>

				</form>
				<%-- <table class="table table-light">
					<thead class="thead-dark">
						<tr>
							<th scope="col">Education</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${educations}" var="p">

							<tr class="table-light">
								<td>${p.educationDet}</td>
								<td> <a href="deleteEducation/${p.id}"><i
										class="fa-sharp fa-solid fa-trash text-danger"></i></a>  <a
									href="updateEducation/${p.id}"><i
										class="fa-sharp fa-solid fa-pen-to-square text-success"></i></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table> --%>
			</div>
		</div>
	</div>
	
	

</body>
</html>