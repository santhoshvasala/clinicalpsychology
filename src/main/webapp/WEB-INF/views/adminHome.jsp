<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="./base.jsp"%>
</head>
<body>
<button type="submit" disabled style="display: none" aria-hidden="true"></button>
	<div class="container mt-5 bg-light">
		<div class="row">
			<div class="col-md-12">
			
			<div class="dropdown">
				<h3 align="right" >Welcome ${user.consultantFirstName} <i class="fas fa-cog"></i></h3>
				
			  <div class="dropdown-content">
				    <a href="addConsultant" class="btn btn-outline-success">Add Consultant</a>
				    <a href="viewAllConsultants" class="btn btn-outline-success"> All Consultants </a>
					<a href="addEducation" class="btn btn-outline-success"> Add Education </a>
					<a href="addGender" class="btn btn-outline-success"> Add Gender </a>
					<a href="addMaritalStatus" class="btn btn-outline-success"> Add MaritalStatus </a>
					<a href="addOccupation" class="btn btn-outline-success"> Add Occupation </a>
					<a href="addConsultationPlace" class="btn btn-outline-success"> Add Places of consultation </a>
					<a href="addPurpose" class="btn btn-outline-success"> Add Purpose </a>
					<a href="addReferralSource" class="btn btn-outline-success"> Add Refferal Source </a>
					<a href="addReligion" class="btn btn-outline-success"> Add Religion </a>
					<a href="logout" class="btn btn-outline-success" > Log Out </a>
			  </div>
			  </div>
			</div>	
			<form action="search" method="post">
					<table class="table table-light">
						<td><input type="text" id="searchString" name="searchString" /></td>
						<td><button type="submit" class="btn btn-primary">Search</button></td>
					</table>
				</form>
				<table class="table table-light">
					<thead class="thead-dark">
						<tr>
							<th scope="col">S.NO</th>
							<th scope="col">Patient Name</th>
							<th scope="col">Mobile Number</th>
							<th scope="col">Email</th>
							<th scope="col">Place</th>
							<th scope="col">Consultant ID</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${patients}" var="p">

							<tr class="table-light">
								<th scope="row">${p.id}</th>
								<td>${p.firstName}</td>
								<td>${p.clientmobile}</td>
								<td>${p.email1}</td>
								<td>${p.placeofconsultation}</td>
								<td>${p.consultantId}</td>
								<td> 
								<a href="viewPatient/${p.id}"><i
										class="fa fa-eye"></i></a>
								<a href="deletePatient/${p.id}"><i
										class="fa-sharp fa-solid fa-trash text-danger"></i></a>  <a
									href="updatePatient/${p.id}"><i
										class="fa-sharp fa-solid fa-pen-to-square text-success"></i></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="container text-center mb-3">
					<a href="addConsultant" class="btn btn-outline-success"> Add
						Consultant </a>
				<div class="container text-center mb-3">
					<a href="addSessionNotes" class="btn btn-outline-success"> Add
						Session Notes </a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>