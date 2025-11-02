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
	<div class="container mt-5 bg-light">
		<div class="row">
			<div class="col-md-12">
				<h1 class="text-center mb-3 mt-4 text-warning">Welcome to Clinical Psychology</h1>
				<table class="table table-light">
					<thead class="thead-dark">
						<tr>
							<th scope="col">S.NO</th>
							<th scope="col">Patient Name</th>
							<th scope="col">Mobile Number</th>
							<th scope="col">Email</th>
							<th scope="col">Place</th>
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
								<td> 
								<a href="viewPatient/${p.id}"><i
										class="fa fa-eye"></i></a
								<a href="delete/${p.id}"><i
										class="fa-sharp fa-solid fa-trash text-danger"></i></a>  <a
									href="update/${p.id}"><i
										class="fa-sharp fa-solid fa-pen-to-square text-success"></i></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="container text-center mb-3">
					<a href="addConsultant" class="btn btn-outline-success"> Add
						Consultant </a>
				<div class="container text-center mb-3">
					<a href="addPatient" class="btn btn-outline-success"> Add
						Patient </a>
				</div>
				<div class="container text-center mb-3">
					<a href="addEducation" class="btn btn-outline-success"> Add
						Education </a>
				</div>
				<div class="container text-center mb-3">
					<a href="addGender" class="btn btn-outline-success"> Add
						Gender </a>
				</div>
				<div class="container text-center mb-3">
					<a href="addMaritalStatus" class="btn btn-outline-success"> Add
						MaritalStatus </a>
				</div>
				<div class="container text-center mb-3">
					<a href="addOccupation" class="btn btn-outline-success"> Add
						Occupation </a>
				</div>
				<div class="container text-center mb-3">
					<a href="addConsultationPlace" class="btn btn-outline-success"> Add
						Places of consultation </a>
				</div>
				<div class="container text-center mb-3">
					<a href="addPurpose" class="btn btn-outline-success"> Add
						Purpose </a>
				</div>
				<div class="container text-center mb-3">
					<a href="addReferralSource" class="btn btn-outline-success"> Add
						Refferal Source </a>
				</div>
				<div class="container text-center mb-3">
					<a href="addReligion" class="btn btn-outline-success"> Add
						Religion </a>
				</div>
				
				<div class="container text-center mb-3">
					<a href="addSessionNotes" class="btn btn-outline-success"> Add
						Session Notes </a>
				</div>
			</div>

		</div>
	</div>

</body>
</html>