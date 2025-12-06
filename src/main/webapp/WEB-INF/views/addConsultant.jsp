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
  /* var cid = title+fname+lname+day+month+year; */
  var cid = title+lname+day;
  document.getElementById("consultantId").value = cid;
  event.preventDefault();
}

function myFunction() {
	  var x = document.getElementById("consultanPassword");
	  if (x.type === "password") {
	    x.type = "text";
	  } else {
	    x.type = "password";
	  }
	}
</script>
</head>
<body>

	<div class="container mt-2 bg-light">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<h1 class="text-center mb-3 mt-4">Consultant Registration Form</h1>
							<c:if test="${not empty message}">
    							<div class="alert alert-success">${message}</div>
							</c:if>
				<form action="handleConsultant" method="post">
				<button type="submit" disabled style="display: none" aria-hidden="true"></button>
				
				Name Title:<input type="text" id="consultantTitle" name="consultantTitle" required="required">
				First Name:<input type="text" id="consultantFirstName" name="consultantFirstName" required="required">
				Last Name: <input type="text" id="consultantLastName" name="consultantLastName" required="required">
				Date of Birth: <input type="datetime-local" name="consultantDob" id="consultantDob" required="required"/>
				Education: <input type="text" id="consultantEducation" name="consultantEducation" required="required">
				Designation: <input type="text" id="consultantDesignation" name="consultantDesignation" required="required">
				License Details: <input type="text" id="consultantlicense" name="consultantlicense" required="required">
				Organizations Affiliated to: <input type="text" id="consultantOrganization" name="consultantOrganization" required="required">

				Contact Number: <input type="text" id="consultantContact" name="consultantContact" required="required">
				Email ID: <input type="text" id="consultantEmail" name="consultantEmail" required="required">
				Address: <input type="text" id="consultantAddress" name="consultantAddress" required="required">
				Emergency Contact: <input type="text" id="consultantEmergencyContact" name="consultantEmergencyContact" required="required">
				
				<button class="btn btn-primary" onclick="generateConsultactId()">Generate Consultant ID </button>
				UserName/ConsultantId: <input type="text" id="consultantId" name="consultantId" required="required">
				Password: <input type="password" id="consultanPassword" name="consultantPassword" required="required">
				<input type="checkbox" onclick="myFunction()">Show Password
				
				<div class="container text-center mb-4">
					<a href="${pageContext.request.contextPath}/homePage" class="btn btn-primary"> HOME </a>
					<button type="submit" class="btn btn-primary">ADD</button>
				</div>

				</form>
				
							</div>
		</div>
	</div>

</body>
</html>