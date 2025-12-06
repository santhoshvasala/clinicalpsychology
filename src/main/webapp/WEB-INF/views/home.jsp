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
				<div class="dropdown">
					<h3 align="right">
						Welcome ${user.consultantFirstName} <i class="fas fa-cog"></i>
					</h3>
					<div class="dropdown-content">
						<a href="viewConsultant/${user.consultantId}"
							class="btn btn-outline-success"> View/Update Profile </a> <a
							href="logout" class="btn btn-outline-success"> Log Out </a>
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
								<td><a href="viewPatient/${p.id}" title="View Patient">
										<i class="fa fa-eye"></i>
								</a> <a href="updatePatient/${p.id}" title="Update Patient"><i
										class="fa-sharp fa-solid fa-pen-to-square text-success"></i></a> <a
									href="deletePatient/${p.id}" title="Delete Patient"><i
										class="fa-sharp fa-solid fa-trash text-danger"></i></a> <a
									href="addSessionNotes/${p.id}" class="btn btn-outline-success">
										Sessions </a> <a href="add-document-${p.id}"
									class="btn btn-outline-success"> Attachments </a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div class="container text-center mb-3">
					<a href="addPatient" class="btn btn-outline-success"> Add
						Patient </a>
				</div>

			</div>

		</div>
	</div>

</body>
</html>