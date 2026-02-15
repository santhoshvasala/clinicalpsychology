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
				    <a href="addConsultant" class="btn btn-primary">Add Consultant</a>
				    <a href="viewAllConsultants" class="btn btn-primary"> All Consultants </a>
					<a href="addEducation" class="btn btn-primary"> Add Education </a>
					<a href="addGender" class="btn btn-primary"> Add Gender </a>
					<a href="addMaritalStatus" class="btn btn-primary"> Add MaritalStatus </a>
					<a href="addOccupation" class="btn btn-primary"> Add Occupation </a>
					<a href="addConsultationPlace" class="btn btn-primary"> Add Places of consultation </a>
					<a href="addPurpose" class="btn btn-primary"> Add Purpose </a>
					<a href="addReferralSource" class="btn btn-primary"> Add Refferal Source </a>
					<a href="addReligion" class="btn btn-primary"> Add Religion </a>
					<a href="logout" class="btn btn-primary" > Log Out </a>
			  </div>
			  </div>
			<form action="homePage" method="get">
					<table class="table table-light">
					  <tr>
						<td><input type="text" id="searchName" name="searchName" value="${searchName}" placeholder="enter name" style="width: 180px; "/>
						<input type="text" id="searchMobile" name="searchMobile" value="${searchMobile}" placeholder="enter mobilenumber" style="width: 180px; "/>
						<input type="text" id="searchEmail" name="searchEmail" value="${searchEmail}" placeholder="enter email" style="width: 180px; "/>
						<input type="text" id="searchPlace" name="searchPlace" value="${searchPlace}" placeholder="enter place" style="width: 180px; "/>
						<input type="text" id="searchDiagnosis" name="searchDiagnosis" value="${searchDiagnosis}" placeholder="enter diagnosis" style="width: 180px; "/>
						<button type="submit" class="btn btn-primary">Search</button>
						<button type="button" class="btn btn-primary" onclick="window.location.href='homePage?searchName=&searchMobile=&searchEmail=&searchPlace=&searchDiagnosis=&pageSize=5'">
							 Reset</button></td>
					  </tr>
					</table>
					<table>
					<tr>
					<td>
						<label>Show</label>
					            <select name="pageSize" onchange="this.form.submit()">
					             	<option value="1" ${pageSize == 1 ? 'selected' : ''}>1</option>
							        <option value="5" ${pageSize == 5 ? 'selected' : ''}>5</option>
							        <option value="10" ${pageSize == 10 ? 'selected' : ''}>10</option>
							        <option value="20" ${pageSize == 20 ? 'selected' : ''}>20</option>
							    </select>
				         <label>records</label>
						 <nav aria-label="Page navigation">
				    		<ul class="pagination">
						        <c:if test="${currentPage > 1}">
						            <li class="page-item">
						                <a class="page-link" href="homePage?searchName=${searchName}&searchMobile=${searchMobile}&searchEmail=${searchEmail}&searchAge=${searchAge}&searchDiagnosis=${searchDiagnosis}&page=${currentPage - 1}&pageSize=${pageSize}">Previous</a>
						            </li>
						        </c:if>
						
						        <c:forEach begin="1" end="${totalPages}" var="i">
						            <li class="page-item ${currentPage == i ? 'active' : ''}">
						                <a class="page-link" href="homePage?searchName=${searchName}&searchMobile=${searchMobile}&searchEmail=${searchEmail}&searchAge=${searchAge}&searchDiagnosis=${searchDiagnosis}&page=${i}&pageSize=${pageSize}">${i}</a>
						            </li>
						        </c:forEach>
						        <c:if test="${currentPage < totalPages}">
						            <li class="page-item">
						                <a class="page-link" href="homePage?searchName=${searchName}&searchMobile=${searchMobile}&searchEmail=${searchEmail}&searchAge=${searchAge}&searchDiagnosis=${searchDiagnosis}&page=${currentPage + 1}&pageSize=${pageSize}">Next</a>
						            </li>
						        </c:if>
						    </ul>
						</nav>
					</td>
					</tr> 
				  </table>
				</form>
				
				<input type="hidden" name="page" value="1" />
				<table class="table table-light">
					<thead class="thead-dark">
						<tr>
							<th scope="col" style="width: 100px;">Patient Number</th>
							<th scope="col" style="width: 180px;">Patient Name</th>
							<th scope="col" style="width: 100px;">Mobile Number</th>
							<th scope="col" style="width: 100px;">Email</th>
							<th scope="col" style="width: 100px;">Place</th>
							<th scope="col" style="width: 100px;">Consultant ID</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${patients}" var="p">
							<tr class="table-light">
								<th scope="row" style="width: 100px;">${p.patientNumber}</th>
								<td>${p.firstName}</td>
								<td>${p.clientmobile}</td>
								<td>${p.email1}</td>
								<td>${p.placeofconsultation}</td>
								<td>${p.consultantId}</td>
								<td> 
								<a href="viewPatient/${p.id}"><i
										class="fa fa-eye"></i></a>
								<a href="deletePatient/${p.id}" onclick="return confirm('Are you sure you want to delete? ');"><i
										class="fa-sharp fa-solid fa-trash text-danger"></i></a>  <a
									href="updatePatient/${p.id}"><i
										class="fa-sharp fa-solid fa-pen-to-square text-success"></i></a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
		</div>
	</div>
	</div>
</body>
</html>