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

	<div class="container mt-2 bg-light">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<h1 class="text-center mb-3 mt-4">Consultant Registration Form:</h1>
				<form action="handleConsultant" method="post">
				
				
				Name Title:<input type="text" id="consultantTitle" name="consultantTitle">
				First Name:<input type="text" id="consultantFirstName" name="consultantFirstName">
				Last Name: <input type="text" id="consultantLastName" name="consultantLastName">
				Date of Birth: <input type="date" name="consultantDob" id="consultantDob" />
				Education: <input type="text" id="consultantEducation" name="consultantEducation">
				Designation: <input type="text" id="consultantDesignation" name="consultantDesignation">
				License Details: <input type="text" id="consultantlicense" name="consultantlicense">
				Organizations Affiliated to: <input type="text" id="consultantOrganization" name="consultantOrganization">

				Contact Number: <input type="text" id="consultantContact" name="consultantContact">
				Email ID: <input type="text" id="consultantEmail" name="consultantEmail">
				Address: <input type="text" id="consultantAddress" name="consultantAddress">
				Emergency Contact: <input type="text" id="consultantEmergencyContact" name="consultantEmergencyContact">
				
				<button class="btn btn-primary" onclick="generateConsultactId()">Generate Consultant ID </button>
				<p id="demo"></p>
				UserName/ConsultantId: <input type="text" id="consultantId" name="consultantId">
				Password: <input type="text" id="consultanPassword" name="consultantPassword">
				
				<div class="container text-center mb-4">
					<a href="${pageContext.request.contextPath}" class="btn btn-outline-danger"> Back </a>
					<button type="submit" class="btn btn-primary">Add Consultant</button>
				</div>

				</form>
				
				<table class="table table-light">
					<thead class="thead-dark">
						<tr>
							<th scope="col">Consultants List</th>
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
								
								<td> <a href="deleteConsultant/${p.consultantId}"><i
										class="fa-sharp fa-solid fa-trash text-danger"></i></a>  <a
									href="updateConsultant/${p.consultantId}"><i
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