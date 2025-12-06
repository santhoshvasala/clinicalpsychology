<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<style><%@include file="./styles.css"%></style>
<meta charset="UTF-8">
<%@include file="./base.jsp"%>
<script>
function generateConsultactId() {
  var title = document.getElementById("consultantTitle").value;
  var fname = document.getElementById("consultantFirstName").value;
  var lname = document.getElementById("consultantLastName").value;
  var dob =   document.getElementById("consultantDob").value;
      var dateParts = dob.split('-');
      var year = dateParts[0];
      var month = dateParts[1];
      var day = dateParts[2];
  var cid = title+fname+lname+day+month+year;
  document.getElementById("demo").innerHTML = "You selected: " + cid;
  document.getElementById("consultantId").value = cid;
  event.preventDefault();
}
</script>
</head>
<body>
<button type="submit" disabled style="display: none" aria-hidden="true"></button>
	<div class="container mt-2 bg-light">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<h1 class="text-center mb-3 mt-4">All Consultants</h1>
				<table class="table table-light">
					<thead class="thead-dark">
						<tr>
							<th>Title</th>
								<th>FirstName</th>
								<th>LastName</th>
								<th>Education</th>
								<th>license</th>
								<th>Contact no</th>
								<th>Consultant Id</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${consultants}" var="p">

							<tr class="table-light">
								<td>${p.consultantTitle}</td>
								<td>${p.consultantFirstName}</td>
								<td>${p.consultantLastName}</td>
								<td>${p.consultantEducation}</td>
								<td>${p.consultantlicense}</td>
								<td>${p.consultantContact}</td>
								<td>${p.consultantId}</td>
								
								<td> <a href="deleteConsultant/${p.consultantId}"><i
										class="fa-sharp fa-solid fa-trash text-danger"></i></a> </td> 
								<td> <a href="viewConsultant/${p.consultantId}"><i
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