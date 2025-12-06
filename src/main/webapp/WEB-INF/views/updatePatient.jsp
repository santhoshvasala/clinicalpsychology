<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Psychological Case Record</title>
<style>
:root {
	--bg: #ffffff;
	--ink: #1a1a1a;
	--muted: #6b7280;
	--primary: #0f766e;
	--border: #e5e7eb;
	--focus: #14b8a6;
}

html, body {
	background: var(--bg);
	color: var(--ink);
	font-family: system-ui, -apple-system, Segoe UI, Roboto, Helvetica,
		Arial, "Noto Sans", "Apple Color Emoji", "Segoe UI Emoji",
		"Segoe UI Symbol";
	line-height: 1.5;
	margin: 0;
	padding: 0;
}

.container {
	max-width: 900px;
	margin: 2rem auto;
	padding: 0 1rem;
}

header {
	text-align: center;
	margin-bottom: 1.5rem;
}

h1 {
	font-size: 1.5rem;
	margin: 0 0 0.25rem 0;
}

.sub {
	color: var(--muted);
	font-size: 0.95rem;
}

form {
	background: #fff;
	border: 1px solid var(--border);
	border-radius: 10px;
	padding: 1.25rem;
}

fieldset {
	border: none;
	padding: 0;
	margin: 0 0 1rem 0;
}

legend {
	font-weight: 600;
	margin-bottom: 0.5rem;
}

.grid {
	display: grid;
	grid-template-columns: repeat(12, 1fr);
	gap: 0.9rem;
}

.col-12 {
	grid-column: span 12;
}

.col-6 {
	grid-column: span 6;
}

.col-4 {
	grid-column: span 4;
}

.col-3 {
	grid-column: span 3;
}

label {
	display: block;
	font-weight: 600;
	margin-bottom: 0.35rem;
}

input, select, textarea {
	width: 100%;
	padding: 0.6rem 0.7rem;
	border: 1px solid var(--border);
	border-radius: 8px;
	font-size: 0.95rem;
	background: #fff;
}

textarea {
	min-height: 100px;
	resize: vertical;
}

input:focus, select:focus, textarea:focus {
	outline: 2px solid var(--focus);
	outline-offset: 1px;
	border-color: var(--focus);
}

.actions {
	display: flex;
	gap: 0.75rem;
	margin-top: 0.5rem;
}

button {
	appearance: none;
	border: none;
	border-radius: 8px;
	padding: 0.65rem 1rem;
	font-weight: 600;
	cursor: pointer;
}

a {
	appearance: none;
	border: none;
	border-radius: 8px;
	padding: 0.65rem 1rem;
	font-weight: 600;
	cursor: pointer;
	text-decoration: none;
	font-size: 0.95rem;
}

.btn-primary {
	background: var(--primary);
	color: #fff;
}

.btn-secondary {
	background: #f3f4f6;
	color: #111827;
	border: 1px solid var(--border);
}

@media print {
	.actions {
		display: none;
	}
	.container {
		margin: 0;
		max-width: 100%;
	}
	form {
		border: none;
		padding: 0;
	}
}
</style>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		const myCheckbox = document.getElementById('chek1');

		if (myCheckbox) {
			myCheckbox.addEventListener('keydown', function(event) {
				if (event.key === 'Enter') {
					event.preventDefault(); // Prevent the default action (toggling the checkbox)
				}
			});
		}
	});

	function calculateAge() {
		const dob = document.getElementById("dob").value;
		if (!dob)
			return;
		const dobDate = new Date(dob);
		const today = new Date();
		let age = today.getFullYear() - dobDate.getFullYear();
		const monthDiff = today.getMonth() - dobDate.getMonth();
		if (monthDiff < 0
				|| (monthDiff === 0 && today.getDate() < dobDate.getDate())) {
			age--;
		}
		document.getElementById("age").value = age;
	}
</script>
</head>
<body>
	<div class="container">
		<header>
			<h1>Update Case Record</h1>
		</header>
		<c:if test="${not empty errMessage}">
			<div style="color: red;">${errMessage}</div>
		</c:if>
		<c:if test="${not empty message}">
			<div class="alert alert-success">${message}</div>
		</c:if>
		<form aria-label="Update Case Record"
			action="${pageContext.request.contextPath}/handleUpdatePatient/${patient.id}"
			method="post" id="addPatientForm">
			<button type="submit" disabled style="display: none"
				aria-hidden="true"></button>
			<fieldset>
				<div class="grid">
					<div class="col-6">
						<label for="firstName">Name</label> <input id="firstName"
							name="firstName" type="text" autocomplete="firstName"
							required="required" value="${patient.firstName}" />
					</div>
					<div class="col-6">
						<label for="date">Date</label>
						<fmt:formatDate value="${patient.createdDate}"
							pattern="yyyy-MM-dd'T'HH:mm" var="cDate" />
						<input id="createdDate" name="createdDate" type="datetime-local"
							required="required" value="${cDate}" />
					</div>

					<div class="col-6">
						<label for="dob">Date of birth</label>
						<fmt:formatDate value="${patient.dob}" pattern="yyyy-MM-dd"
							var="dobDate" />
						<input id="dob" name="dob" type="date" required="required"
							onchange="calculateAge()" value="${dobDate}" />
					</div>
					<div class="col-6">
						<label for="age">Age</label> <input id="age" name="age"
							type="text" value="${patient.age}" readonly />
					</div>
				</div>
			</fieldset>

			<fieldset>
				<legend>Contact</legend>
				<div class="grid">
					<div class="col-4">
						<label for="clientmobile">Mobile number (client)</label> <input
							id="clientmobile" name="clientmobile" type="tel" inputmode="tel"
							required="required" value="${patient.clientmobile}" />
					</div>
					<div class="col-4">
						<label for="relativemobile">Mobile number (relative)</label> <input
							id="relativemobile" name="relativemobile" type="tel"
							inputmode="tel" value="${patient.relativemobile}" />
					</div>
					<div class="col-4">
						<label for="relationtype">Relationship type</label> <input
							id="relationtype" name="relationtype" type="text"
							value="${patient.relationtype}" />
					</div>

					<div class="col-6">
						<label for="email1">Email ID 1</label> <input id="email1"
							name="email1" type="email" autocomplete="email"
							required="required" value="${patient.email1}" />
					</div>
					<div class="col-6">
						<label for="email2">Email ID 2</label> <input id="email2"
							name="email2" type="email" autocomplete="email"
							value="${patient.email2}" />
					</div>
				</div>
			</fieldset>

			<fieldset>
				<div class="grid">
					<div class="col-4">
						<label for="gender">Gender</label> <select name="gender">
							<c:forEach var="frm" items="${genders}">
								<c:choose>
									<c:when test="${fn:contains(patient.gender, frm.gendertype)}">
										<option value="${frm.gendertype}" selected="selected">${frm.gendertype}</option>
									</c:when>
									<c:otherwise>
										<option value="${frm.gendertype}">${frm.gendertype}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</div>
					<div class="col-4">
						<label for="religion">Religion</label> <select name="religion">
							<c:forEach var="frm" items="${religions}">
								<c:choose>
									<c:when
										test="${fn:contains(patient.religion, frm.religionval)}">
										<option value="${frm.religionval}" selected="selected">${frm.religionval}</option>
									</c:when>
									<c:otherwise>
										<option value="${frm.religionval}">${frm.religionval}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</div>
					<div class="col-4">
						<label for="maritalStatus">Marital status</label> <select
							name="maritalstatus">
							<c:forEach var="frm" items="${maritalStatuslist}">
								<c:choose>
									<c:when
										test="${fn:contains(patient.maritalstatus, frm.maritalStatusVal)}">
										<option value="${frm.maritalStatusVal}" selected="selected">${frm.maritalStatusVal}</option>
									</c:when>
									<c:otherwise>
										<option value="${frm.maritalStatusVal}">${frm.maritalStatusVal}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</div>

					<div class="col-6">
						<label for="eduqualification">Educational qualification</label> <select
							name="eduqualification">
							<c:forEach var="frm" items="${educations}">
								<c:choose>
									<c:when
										test="${fn:contains(patient.eduqualification, frm.educationDet)}">
										<option value="${frm.educationDet}" selected="selected">${frm.educationDet}</option>
									</c:when>
									<c:otherwise>
										<option value="${frm.educationDet}">${frm.educationDet}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</div>
					<div class="col-6">
						<label for="occupation">Occupation</label> <select
							name="occupation">
							<c:forEach var="frm" items="${occupations}">
								<c:choose>
									<c:when
										test="${fn:contains(patient.occupation, frm.occupationDet)}">
										<option value="${frm.occupationDet}" selected="selected">${frm.occupationDet}</option>
									</c:when>
									<c:otherwise>
										<option value="${frm.occupationDet}">${frm.occupationDet}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</div>
				</div>
			</fieldset>

			<fieldset>
				<legend>Informants and address</legend>
				<div class="grid">
					<div class="col-12">
						<label for="informants">Informants</label>
						<textarea id="informants" name="informants">${patient.informants}</textarea>
					</div>
					<div class="col-12">
						<label for="address">Address</label>
						<textarea id="address" name="address">${patient.address}</textarea>
					</div>
				</div>
			</fieldset>

			<fieldset>
				<legend>Referral</legend>
				<div class="grid">
					<div class="col-6">
						<label for="referalsource">Referral source</label> <select
							name="referalsource">

							<c:forEach var="frm" items="${referrels}">
								<c:choose>
									<c:when
										test="${fn:contains(patient.referalsource, frm.referralSourceVal)}">
										<option value="${frm.referralSourceVal}" selected="selected">${frm.referralSourceVal}</option>
									</c:when>
									<c:otherwise>
										<option value="${frm.referralSourceVal}">${frm.referralSourceVal}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</div>
					<div class="col-6">
						<label for="placeofconsultation">Place of consultation</label> <select
							name="puposeofreferral">
							<c:forEach var="frm" items="${purposelist}">
								<c:choose>
									<c:when
										test="${fn:contains(patient.puposeofreferral, frm.purposeVal)}">
										<option value="${frm.purposeVal}" selected="selected">${frm.purposeVal}</option>
									</c:when>
									<c:otherwise>
										<option value="${frm.purposeVal}">${frm.purposeVal}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</div>
					<div class="col-12">
						<label for="puposeofreferral">Purpose of referral</label> <select
							name="placeofconsultation">
							<c:forEach var="frm" items="${places}">
								<c:choose>
									<c:when
										test="${fn:contains(patient.placeofconsultation, frm.consPlace)}">
										<option value="${frm.consPlace}" selected="selected">${frm.consPlace}</option>
									</c:when>
									<c:otherwise>
										<option value="${frm.consPlace}">${frm.consPlace}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</div>
					<input type="hidden" id="patientsDetails1.patientdetailid"
						name="patientsDetails1.patientdetailid"
						value="${patient.patientsDetails1.patientdetailid}" />
				</div>
			</fieldset>
			<fieldset>
				<div class="grid">
					<div class="col-12">
						<label for="patientsDetails1.presentingcomplaints">1.1
							Presenting Complaints:</label>
						<textarea id="patientsDetails1.presentingcomplaints"
							name="patientsDetails1.presentingcomplaints">${patient.patientsDetails1.presentingcomplaints}</textarea>
					</div>
					<div class="col-12">
						<label for="patientsDetails1.precipitatingfactors">1.2
							Precipitating Factors: </label>
						<textarea id="patientsDetails1.precipitatingfactors"
							name="patientsDetails1.precipitatingfactors">${patient.patientsDetails1.precipitatingfactors}</textarea>
					</div>
					<div class="col-12">
						<label for="patientsDetails1.dutaionofillness">1.3
							Duration of Illness: </label>
						<textarea id="patientsDetails1.dutaionofillness"
							name="patientsDetails1.dutaionofillness">${patient.patientsDetails1.dutaionofillness}</textarea>
					</div>
					<div class="col-6">
						<label>Onset:</label>
					</div>
					<c:forEach var="frm" items="${onsetlist}">
						<c:choose>
							<c:when
								test="${fn:contains(patient.patientsDetails1.onset, frm)}">
								<input type="checkbox" name="patientsDetails1.onset"
									value="${frm}" checked="checked" /> ${frm} 
	    						</c:when>
							<c:otherwise>
								<input type="checkbox" name="patientsDetails1.onset"
									value="${frm}" /> ${frm} 
								 </c:otherwise>
						</c:choose>
					</c:forEach>
					<div class="col-6">
						<label>Course: </label>
					</div>
					<c:forEach var="frm" items="${courselist}">
						<c:choose>
							<c:when
								test="${fn:contains(patient.patientsDetails1.course, frm)}">
								<input type="checkbox" name="patientsDetails1.course"
									value="${frm}" checked="checked" /> ${frm} 
	    						</c:when>
							<c:otherwise>
								<input type="checkbox" name="patientsDetails1.course"
									value="${frm}" /> ${frm} 
								 </c:otherwise>
						</c:choose>
					</c:forEach>
					<div class="col-12">
						<label for="patientsDetails1.recenttreatmenthistory">2.
							Recent Treatment History: </label>
						<textarea id="patientsDetails1.recenttreatmenthistory"
							name="patientsDetails1.recenttreatmenthistory">${patient.patientsDetails1.recenttreatmenthistory}</textarea>
					</div>
					<div class="col-12">
						<label for="patientsDetails1.negativehistory">3. Negative
							History: </label>
						<textarea id="patientsDetails1.negativehistory"
							name="patientsDetails1.negativehistory">${patient.patientsDetails1.negativehistory}</textarea>
					</div>
					<div class="col-12">
						<label for="patientsDetails1.pasthistory">4. Past History
							of Mental Illness & Physical Illness:</label>
						<textarea id="patientsDetails1.pasthistory"
							name="patientsDetails1.pasthistory">${patient.patientsDetails1.pasthistory}</textarea>
					</div>
					<div class="col-12">
						<label for="patientsDetails1.familyhistory">5. Family
							History:</label>
						<textarea id="patientsDetails1.familyhistory"
							name="patientsDetails1.familyhistory">${patient.patientsDetails1.familyhistory}</textarea>
					</div>
					<div class="col-12">
						<label>6.0 Personal History: </label> <label
							for="patientsDetails1.birthdevelopment">6.1 Birth &
							Developmental –</label>
						<textarea id="patientsDetails1.birthdevelopment"
							name="patientsDetails1.birthdevelopment">${patient.patientsDetails1.birthdevelopment}</textarea>
					</div>
					<div class="col-12">
						<label for="patientsDetails1.scholastic">6.2 Scholastic –</label>
						<textarea id="patientsDetails1.scholastic"
							name="patientsDetails1.scholastic">${patient.patientsDetails1.scholastic}</textarea>
					</div>
					<div class="col-12">
						<label for="patientsDetails1.occupational">6.3
							Occupational –</label>
						<textarea id="patientsDetails1.occupational"
							name="patientsDetails1.occupational">${patient.patientsDetails1.occupational}</textarea>
					</div>
					<div class="col-12">
						<label for="patientsDetails1.maritalsexual">6.4 Marital &
							Sexual –</label>
						<textarea id="patientsDetails1.maritalsexual"
							name="patientsDetails1.maritalsexual">${patient.patientsDetails1.maritalsexual}</textarea>
					</div>
					<div class="col-12">
						<label for="patientsDetails1.habits"> 6.5 Habits
							(including use of alcohol/tobacco/drug, if any) –</label>
						<textarea id="patientsDetails1.habits"
							name="patientsDetails1.habits">${patient.patientsDetails1.habits}</textarea>
					</div>
					<div class="col-12">
						<label for="patientsDetails1.social"> 6.6 Social –</label>
						<textarea id="patientsDetails1.social"
							name="patientsDetails1.social" placeholder="">${patient.patientsDetails1.social}</textarea>
					</div>
					<div class="col-12">
						<label for="patientsDetails1.personalityadjustment">
							7.Personality/Adjustment Prior to Illness:</label>
						<textarea id="patientsDetails1.personalityadjustment"
							name="patientsDetails1.personalityadjustment" placeholder="">${patient.patientsDetails1.personalityadjustment}</textarea>
					</div>
					</div>
					</fieldset>
					<fieldset>
					<div class="grid">
						<div class="col-3" style="white-space: nowrap;">
							<label> Reliability of Information:</label>
							<c:forEach var="frm" items="${reliabilityinfolist}">
								<c:choose>
									<c:when
										test="${fn:contains(patient.patientsDetails1.reliabilityinfo, frm)}">
										<div>
											<input type="checkbox"
												name="patientsDetails1.reliabilityinfo" value="${frm}"
												checked="checked" /> ${frm}
										</div>
									</c:when>
									<c:otherwise>
										<div>
											<input type="checkbox"
												name="patientsDetails1.reliabilityinfo" value="${frm}" />
											${frm}
										</div>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
					</div>
					<div class="grid">
						<div class="col-3" style="white-space: nowrap;">
							<label> Adequacy of Information: </label>
							<c:forEach var="frm" items="${adequacyinfolist}">
								<c:choose>
									<c:when
										test="${fn:contains(patient.patientsDetails1.adequacyinfo, frm)}">
										<div>
											<input type="checkbox" name="patientsDetails1.adequacyinfo"
												value="${frm}" checked="checked" /> ${frm}
										</div>
									</c:when>
									<c:otherwise>
										<div>
											<input type="checkbox" name="patientsDetails1.adequacyinfo"
												value="${frm}" /> ${frm}
										</div>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
					</div>
			</fieldset>
			<fieldset>
				<legend>8. Mental Status:</legend>
				<legend>8.1 Appearance –</legend>
				<div class="grid">
					<div class="col-3" style="white-space: nowrap;">
						<label for="patientsDetails2.generalbuild"> General build:
						</label>

						<c:forEach var="frm" items="${generalbuildlist}">
							<c:choose>
								<c:when
									test="${fn:contains(patient.patientsDetails2.generalbuild, frm)}">
									<div>
										<input type="checkbox" name="patientsDetails2.generalbuild"
											value="${frm}" checked="checked" /> ${frm}
									</div>
								</c:when>
								<c:otherwise>
									<div>
										<input type="checkbox" name="patientsDetails2.generalbuild"
											value="${frm}" /> ${frm}
									</div>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
				</div>
				<div class="grid">
					<div class="col-3" style="white-space: nowrap;">
						<label for="patientsDetails2.grooming"> Grooming &
							hygiene: </label>
						<c:forEach var="frm" items="${groominglist}">
							<div>
								<c:choose>
									<c:when
										test="${fn:contains(patient.patientsDetails2.grooming, frm)}">
										<input type="checkbox" name="patientsDetails2.grooming"
											value="${frm}" checked="checked" /> ${frm} 
		    						</c:when>
									<c:otherwise>
										<input type="checkbox" name="patientsDetails2.grooming"
											value="${frm}" /> ${frm} 
									 </c:otherwise>
								</c:choose>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="grid">
					<div class="col-3" style="white-space: nowrap;">
						<label for="patientsDetails2.dress"> Dress: </label>
						<c:forEach var="frm" items="${dresslist}">
							<div>
								<c:choose>
									<c:when
										test="${fn:contains(patient.patientsDetails2.dress, frm)}">
										<input type="checkbox" name="patientsDetails2.dress"
											value="${frm}" checked="checked" /> ${frm} 
		    						</c:when>
									<c:otherwise>
										<input type="checkbox" name="patientsDetails2.dress"
											value="${frm}" /> ${frm} 
									 </c:otherwise>
								</c:choose>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="grid">
					<div class="col-3" style="white-space: nowrap;">
						<label for="patientsDetails2.facialexpression"> Facial
							expression: </label>
						<c:forEach var="frm" items="${facialexpressionlist}">
							<div>
								<c:choose>
									<c:when
										test="${fn:contains(patient.patientsDetails2.facialexpression, frm)}">
										<input type="checkbox"
											name="patientsDetails2.facialexpression" value="${frm}"
											checked="checked" /> ${frm} 
		    						</c:when>
									<c:otherwise>
										<input type="checkbox"
											name="patientsDetails2.facialexpression" value="${frm}" /> ${frm} 
									 </c:otherwise>
								</c:choose>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="grid">
					<div class="col-3" style="white-space: nowrap;">
						<label for="patientsDetails2.eycontact">Eye contact: </label>
						<c:forEach var="frm" items="${eycontactlist}">
							<div>
								<c:choose>
									<c:when
										test="${fn:contains(patient.patientsDetails2.eycontact, frm)}">
										<input type="checkbox" name="patientsDetails2.eycontact"
											value="${frm}" checked="checked" /> ${frm} 
		    						</c:when>
									<c:otherwise>
										<input type="checkbox" name="patientsDetails2.eycontact"
											value="${frm}" /> ${frm} 
									 </c:otherwise>
								</c:choose>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="grid">
					<div class="col-3" style="white-space: nowrap;">
						<label for="patientsDetails2.notablephysicalfeatures">Notable
							physical marks: </label>
						<c:forEach var="frm" items="${notablephysicalfeatureslist}">
							<div>
								<c:choose>
									<c:when
										test="${fn:contains(patient.patientsDetails2.notablephysicalfeatures, frm)}">
										<input type="checkbox"
											name="patientsDetails2.notablephysicalfeatures"
											value="${frm}" checked="checked" /> ${frm} 
		    						</c:when>
									<c:otherwise>
										<input type="checkbox"
											name="patientsDetails2.notablephysicalfeatures"
											value="${frm}" /> ${frm} 
									 </c:otherwise>
								</c:choose>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="grid">
					<div class="col-3" style="white-space: nowrap;">
						<label for="patientsDetails2.posture">Posture: </label>
						<c:forEach var="frm" items="${posturelist}">
							<div>
								<c:choose>
									<c:when
										test="${fn:contains(patient.patientsDetails2.posture, frm)}">
										<input type="checkbox" name="patientsDetails2.posture"
											value="${frm}" checked="checked" /> ${frm} 
		    						</c:when>
									<c:otherwise>
										<input type="checkbox" name="patientsDetails2.posture"
											value="${frm}" /> ${frm} 
									 </c:otherwise>
								</c:choose>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="grid">
					<div class="col-3" style="white-space: nowrap;">
						<label>8.2 Movement and Behavior– </label> <label
							for="patientsDetails2.increasedactivity">Increased
							activity: </label>
						<c:forEach var="frm" items="${increasedactivitylist}">
							<div>
								<c:choose>
									<c:when
										test="${fn:contains(patient.patientsDetails2.increasedactivity, frm)}">
										<input type="checkbox"
											name="patientsDetails2.increasedactivity" value="${frm}"
											checked="checked" /> ${frm} 
		    						</c:when>
									<c:otherwise>
										<input type="checkbox"
											name="patientsDetails2.increasedactivity" value="${frm}" /> ${frm} 
									 </c:otherwise>
								</c:choose>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="grid">
					<div class="col-3" style="white-space: nowrap;">
						<label for="patientsDetails2.decreasedactivity">Decreased
							activity: </label>
						<c:forEach var="frm" items="${decreasedactivitylist}">
							<div>
								<c:choose>
									<c:when
										test="${fn:contains(patient.patientsDetails2.decreasedactivity, frm)}">
										<input type="checkbox"
											name="patientsDetails2.decreasedactivity" value="${frm}"
											checked="checked" /> ${frm} 
		    						</c:when>
									<c:otherwise>
										<input type="checkbox"
											name="patientsDetails2.decreasedactivity" value="${frm}" /> ${frm} 
									 </c:otherwise>
								</c:choose>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="grid">
					<div class="col-3" style="white-space: nowrap;">
						<label for="patientsDetails2.abnormalmovements">Abnormal
							movements: </label>
						<c:forEach var="frm" items="${abnormalmovementslist}">
							<div>
								<c:choose>
									<c:when
										test="${fn:contains(patient.patientsDetails2.abnormalmovements, frm)}">
										<input type="checkbox"
											name="patientsDetails2.abnormalmovements" value="${frm}"
											checked="checked" /> ${frm} 
		    						</c:when>
									<c:otherwise>
										<input type="checkbox"
											name="patientsDetails2.abnormalmovements" value="${frm}" /> ${frm} 
									 </c:otherwise>
								</c:choose>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="grid">
					<div class="col-3" style="white-space: nowrap;">
						<label>8.3 Speech – </label> <label
							for="patientsDetails2.quantity">Quantity: </label>
						<div>
							<input type="checkbox" name="patientsDetails2.quantity"
								value="Tempo (high/moderate/low)"> Tempo <input
								type="radio" name="patientsDetails2.quantityTempo" value="high">high
							<input type="radio" name="patientsDetails2.quantityTempo"
								value="moderate">moderate <input type="radio"
								name="patientsDetails2.quantityTempo" value="low">low
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.quantity"
								value="Volume (high/moderate/ low)"> Volume <input
								type="radio" name="patientsDetails2.quantityValume" value="high">high
							<input type="radio" name="patientsDetails2.quantityValume"
								value="moderate">moderate <input type="radio"
								name="patientsDetails2.quantityValume" value="low">low

						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.quantity"
								value="Pressure of speech"> Pressure of speech
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.quantity"
								value="Poverty of speech"> Poverty of speech
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.quantity"
								value="Mutism"> Mutism
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.quantity"
								value="Monosyllabic replies"> Monosyllabic replies
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.quantity"
								value="Verbosity"> Verbosity
						</div>
					</div>
				</div>
				<div class="grid">
					<div class="col-3" style="white-space: nowrap;">
						<label for="patientsDetails2.rateandrhythm">Rate and
							rhythm: </label>
						<c:forEach var="frm" items="${rateandrhythmlist}">
							<div>
								<c:choose>
									<c:when
										test="${fn:contains(patient.patientsDetails2.rateandrhythm, frm)}">
										<input type="checkbox" name="patientsDetails2.rateandrhythm"
											value="${frm}" checked="checked" /> ${frm} 
		    						</c:when>
									<c:otherwise>
										<input type="checkbox" name="patientsDetails2.rateandrhythm"
											value="${frm}" /> ${frm} 
									 </c:otherwise>
								</c:choose>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="grid">
					<div class="col-3" style="white-space: nowrap;">
						<label for="patientsDetails2.formandstructure">Form and
							structure: </label>
						<div>
							<input type="checkbox" name="patientsDetails2.formandstructure"
								value="Nil">Nil
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.formandstructure"
								value="Neologisms"> Neologisms
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.formandstructure"
								value="Talking past the point (Vorbeireden)"> Talking
							past the point (Vorbeireden)
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.formandstructure"
								value="Aphasia (receptive/intermediate/expressive)">
							Aphasia (receptive/intermediate/expressive) <input type="text"
								name="patientsDetails2.aphasiaText" value="">

						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.formandstructure"
								value="Word salad"> Word salad
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.formandstructure"
								value="Clang associations"> Clang associations
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.formandstructure"
								value="Echolalia"> Echolalia
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.formandstructure"
								value="Perseveration"> Perseveration
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.formandstructure"
								value="Flight of ideas"> Flight of ideas
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.formandstructure"
								value="Incoherence"> Incoherence
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.formandstructure"
								value="Derailment"> Derailment
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.formandstructure"
								value="Cluttering"> Cluttering
						</div>
					</div>
				</div>
				<div class="grid">
					<div class="col-3" style="white-space: nowrap;">
						<label>8.4 Thought – </label> <label
							for="patientsDetails2.disorderofstream">Disorders of
							stream: </label>
						<div>
							<input type="checkbox" name="patientsDetails2.disorderofstream"
								value="Nil">Nil
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.disorderofstream"
								value="Flight of ideas"> Flight of ideas
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.disorderofstream"
								value="Thought blocking"> Thought blocking
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.disorderofstream"
								value="Inhibited / Slowing of thinking"> Inhibited /
							Slowing of thinking
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.disorderofstream"
								value="Pressure of thought"> Pressure of thought
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.disorderofstream"
								value="perseveration"> perseveration
						</div>
					</div>
				</div>
				<div class="grid">
					<div class="col-3" style="white-space: nowrap;">
						<label for="patientsDetails2.disorderofform">Disorders of
							form: </label>
						<div>
							<input type="checkbox" name="patientsDetails2.disorderofform"
								value="Nil">Nil
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.disorderofform"
								value="Loosening of associations"> Loosening of
							associations
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.disorderofform"
								value="Incoherence"> Incoherence
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.disorderofform"
								value="Derailment"> Derailment
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.disorderofform"
								value="Circumstantiality"> Circumstantiality
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.disorderofform"
								value="Tangentiality"> Tangentiality
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.disorderofform"
								value="Perseveration"> Perseveration
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.disorderofform"
								value="Verbigeration"> Verbigeration
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.disorderofform"
								value="Thought fragmentation"> Thought fragmentation
						</div>
					</div>
				</div>
				<div class="grid">
					<div class="col-3" style="white-space: nowrap;">
						<label for="patientsDetails2.contentofthought">Content of
							Thought:</label>
						<div>
							<input type="checkbox" name="patientsDetails2.contentofthought"
								value="Obsessions& compulsions"> Obsessions& compulsions
							<input type="text" id="contentofthought" name="contentofthought">
						</div>

						<div>
							<input type="checkbox" name="patientsDetails2.contentofthought"
								value="Thought alienation"> Thought alienation <input
								type="text" id="thoughtalienation" name="thoughtalienation">
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.contentofthought"
								value="Delusions (primary and secondary; persecutory, grandiose, referential, guilt, poverty, infidelity, love, illhealth, nihilisticetc.)">
							Delusions (primary and secondary; persecutory, grandiose,
							referential, guilt, poverty, infidelity, love, illhealth,
							nihilisticetc.)
							<input type="text" id="delusionstext" name="delusionstext">
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.contentofthought"
								value="Overvalued ideas"> Overvalued ideas <input
								type="text" id="overvaluedideastext" name="overvaluedideastext">
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.contentofthought"
								value="Phobias"> Phobias <input type="text"
								id="phobiastext" name="phobiastext">
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.contentofthought"
								value="Overvalued ideas"> Overvalued ideas <input
								type="text" id="overvaluedideastext" name="overvaluedideastext">
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.contentofthought"
								value="Depressive Cognitions (hopelessness, helplessness, worthlessness):">
							Depressive Cognitions (hopelessness, helplessness,
							worthlessness): <input type="text" id="deressivecongnitionstext"
								name="deressivecongnitionstext">
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.contentofthought"
								value="Guilt"> Guilt <input type="text" id="guilttext"
								name="guilttext">
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.contentofthought"
								value="Worries"> Worries <input type="text"
								id="worriestext" name="worriestext">
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.contentofthought"
								value="Catastrophic"> Catastrophic <input type="text"
								id="catastrophictext" name="catastrophictext">
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.contentofthought"
								value="Suicidal"> Suicidal <input type="text"
								id="suicidaltext" name="suicidaltext">
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.contentofthought"
								value="homicidal ideation"> homicidal ideation <input
								type="text" id="homicidalideationtext"
								name="homicidalideationtext">
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.contentofthought"
								value="Magical thinking"> Magical thinking <input
								type="text" id="magicalthinkingtext" name="magicalthinkingtext">
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.contentofthought"
								value="Ideas of reference"> Ideas of reference <input
								type="text" id="ideasofreferencetext"
								name="ideasofreferencetext">
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.contentofthought"
								value="Persecutory ideas"> Persecutory ideas <input
								type="text" id="persecutoryidastext" name="persecutoryidastext">
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.contentofthought"
								value="Others"> Others <input type="text"
								id="persecutoryidastext" name="othersText">
						</div>
					</div>
				</div>
				<div class="grid">
					<div class="col-3" style="white-space: nowrap;">
						<label for="patientsDetails2.possessionofthought">Possession
							of Thought:</label>
						<div>
							<input type="checkbox"
								name="patientsDetails2.possessionofthought" value="Nil">
							Nil
						</div>
						<div>
							<input type="checkbox"
								name="patientsDetails2.possessionofthought"
								value="Thought insertion"> Thought insertion
						</div>
						<div>
							<input type="checkbox"
								name="patientsDetails2.possessionofthought"
								value="Thought withdrawal"> Thought withdrawal
						</div>
						<div>
							<input type="checkbox"
								name="patientsDetails2.possessionofthought"
								value="Thought broadcasting"> Thought broadcasting
						</div>
						<div>
							<input type="checkbox"
								name="patientsDetails2.possessionofthought" value="Thought echo">
							Thought echo
						</div>
					</div>
				</div>
				<div class="grid">
					<div class="col-3" style="white-space: nowrap;">
						<label>8.5 Mood and Affect –</label> <label
							for="patientsDetails2.mood">Mood (subjective):</label>
						<div>
							<input type="checkbox" name="patientsDetails2.mood"
								value="Depressive"> Depressive
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.mood"
								value="Elated / euphoric"> Elated / euphoric
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.mood"
								value="Anxious"> Anxious
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.mood"
								value="Irritable"> Irritable
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.mood"
								value="Apathy"> Apathy
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.mood"
								value="Fearful"> Fearful
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.mood"
								value="Dysphoria"> Dysphoria
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.mood"
								value="Lability"> Lability
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.mood"
								value="Euthymic"> euthymic
						</div>
					</div>
				</div>
				<div class="grid">
					<div class="col-3" style="white-space: nowrap;">
						<label for="patientsDetails2.affect">Affect (objective):</label>
						<div>
							<input type="checkbox" name="patientsDetails2.affect"
								value="Blunted"> Blunted
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.affect"
								value="Flat"> Flat
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.affect"
								value="Inappropriate"> Inappropriate
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.affect"
								value="Restricted"> Restricted
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.affect"
								value="Labile"> Labile
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.affect"
								value="Congruent / incongruent with mood"> Congruent /
							incongruent with mood
						</div>
					</div>
				</div>
				<div class="grid">
					<div class="col-3" style="white-space: nowrap;">
						<label for="patientsDetails2.perception">8.7 Perception –
						</label>
						<div>
							<input type="checkbox" name="patientsDetails2.perception"
								value="Auditory Hallucinations"> Auditory Hallucinations
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.perception"
								value="Visual Hallucinations"> Visual Hallucinations
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.perception"
								value="Olfactory Hallucinations"> Olfactory
							Hallucinations
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.perception"
								value="Gustatory Hallucinations"> Gustatory
							Hallucinations
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.perception"
								value="Tactile Hallucinations"> Tactile Hallucinations
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.perception"
								value="Pseudo-hallucinations"> Pseudo-hallucinations
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.perception"
								value="Illusions"> Illusions
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.perception"
								value="Depersonalization"> Depersonalization
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.perception"
								value="Derealization"> Derealization
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.perception"
								value="Functional hallucinations/"> Functional
							hallucinations/
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.perception"
								value="Reflex hallucinations"> Reflex hallucinations
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.perception"
								value="Nil"> Nil
						</div>
					</div>
				</div>
				<div class="grid">
					<div class="col-3" style="white-space: nowrap;">
						<label>8.7 Cognition –</label> <label
							for="patientsDetails2.consciousness">Consciousness: </label>
						<div>
							<input type="checkbox" name="patientsDetails2.consciousness"
								value="Alert"> Alert
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.consciousness"
								value="Drowsy"> Drowsy
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.consciousness"
								value="Stuporous"> Stuporous
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.consciousness"
								value="Conscious"> Conscious
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.consciousness"
								value="Clouding"> Clouding
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.consciousness"
								value="Confusion"> Confusion
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.consciousness"
								value="Coma / stupor"> Coma / stupor
						</div>
					</div>
				</div>
				<div class="grid">
					<div class="col-12">
						<label>Orientation: </label>
						<table>
							<tr style="width: 758px; height: 25px;">
								<td style="width: 150px; height: 25px">&nbsp;&nbsp;<b>Time:
								</b></td>
								<td style="width: 231px; height: 25px"><input
									type="checkbox" name="patientsDetails2.time" value="Intact"
									style="width: 45px;">Intact</td>
								<td style="width: 322px; height: 25px"><input
									type="checkbox" name="patientsDetails2.time" value="Impaired"
									style="width: 45px;">Impaired</td>
							</tr>

							<tr style="width: 758px; height: 25px;">
								<td style="width: 150px; height: 25px">&nbsp;&nbsp;<b>Place
										: </b></td>
								<td style="width: 231px; height: 25px"><input
									type="checkbox" name="patientsDetails2.place" value="Intact"
									style="width: 45px;">Intact</td>
								<td style="width: 322px; height: 25px"><input
									type="checkbox" name="patientsDetails2.place" value="Impaired"
									style="width: 45px;">Impaired</td>
							</tr>
							<tr style="width: 758px; height: 25px;">
								<td style="width: 150px; height: 25px">&nbsp;&nbsp;<b>Person
										: </b></td>
								<td style="width: 231px; height: 25px"><input
									type="checkbox" name="patientsDetails2.person" value="Intact"
									style="width: 45px;">Intact</td>
								<td style="width: 322px; height: 25px"><input
									type="checkbox" name="patientsDetails2.person" value="Impaired"
									style="width: 45px;">Impaired</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="grid">
					<div class="col-3" style="white-space: nowrap;">
						<label for="patientsDetails2.attentionconcentration">Attention
							and concentration: </label>
						<div>
							<input type="checkbox"
								name="patientsDetails2.attentionconcentration" value="Adequate">Adequate
						</div>
						<div>
							<input type="checkbox"
								name="patientsDetails2.attentionconcentration"
								value="Distractibility">Distractibility
						</div>
						<div>
							<input type="checkbox"
								name="patientsDetails2.attentionconcentration"
								value="Impaired concentration">Impaired concentration
						</div>
						<div>
							<input type="checkbox"
								name="patientsDetails2.attentionconcentration"
								value="Hypervigilance">Hypervigilance
						</div>
					</div>
				</div>
				<div class="grid">
					<div class="col-12">
						<label>Memory: </label>
						<table>
							<tr style="width: 758px; height: 25px;">
								<td style="width: 150px; height: 25px">&nbsp;&nbsp;<b>Immediate:
								</b></td>
								<td style="width: 231px; height: 25px"><input
									type="checkbox" name="patientsDetails2.immediate"
									value="Intact" style="width: 45px;">Intact</td>
								<td style="width: 322px; height: 25px"><input
									type="checkbox" name="patientsDetails2.immediate"
									value="Impaired" style="width: 45px;">Impaired</td>
							</tr>

							<tr style="width: 758px; height: 25px;">
								<td style="width: 150px; height: 25px">&nbsp;&nbsp;<b>Recent
										: </b></td>
								<td style="width: 231px; height: 25px"><input
									type="checkbox" name="patientsDetails2.recent" value="Intact"
									style="width: 45px;">Intact</td>
								<td style="width: 322px; height: 25px"><input
									type="checkbox" name="patientsDetails2.recent" value="Impaired"
									style="width: 45px;">Impaired</td>
							</tr>
							<tr style="width: 758px; height: 25px;">
								<td style="width: 150px; height: 25px">&nbsp;&nbsp;<b>Remote
										: </b></td>
								<td style="width: 231px; height: 25px"><input
									type="checkbox" name="patientsDetails2.remote" value="Intact"
									style="width: 45px;">Intact</td>
								<td style="width: 322px; height: 25px"><input
									type="checkbox" name="patientsDetails2.remote" value="Impaired"
									style="width: 45px;">Impaired</td>
							</tr>
							<tr style="width: 758px; height: 25px;">
								<td style="width: 150px; height: 25px">&nbsp;&nbsp;<b>Amnesia
										: </b></td>
								<td style="width: 231px; height: 25px"><input
									type="checkbox" name="patientsDetails2.amnesia"
									value="Anterograde" style="width: 45px;">Anterograde</td>
								<td style="width: 322px; height: 25px"><input
									type="checkbox" name="patientsDetails2.amnesia"
									value="Retrograde" style="width: 45px;">Retrograde</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="grid">
					<div class="col-3" style="white-space: nowrap;">
						<div>
							<input type="checkbox" name="patientsDetails2.memory"
								value="Confabulation">Confabulation
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.memory"
								value="Paramnesia (déjà vu, jamais vu)">Paramnesia (déjà
							vu, jamais vu)
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.memory"
								value="Hypermnesia">Hypermnesia
						</div>
					</div>
				</div>
				<div class="grid">
					<div class="col-3" style="white-space: nowrap;">
						<label for="patientsDetails2.thinking">Thinking: </label>
						<div>
							<input type="checkbox" name="patientsDetails2.thinking"
								value="Abstract Level">Abstract Level
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.thinking"
								value="Concrete thinking">Concrete thinking
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.thinking"
								value="Impaired reasoning">Impaired reasoning
						</div>
					</div>
				</div>
				<div class="grid">
					<div class="col-3" style="white-space: nowrap;">
						<label for="patientsDetails2.emotion">Emotion: </label>
						<div>
							<input type="checkbox" name="patientsDetails2.emotion"
								value="Normal Emotional reactions">Normal Emotional
							reactions
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.emotion"
								value="Abnormal emotional reactions">Abnormal emotional
							reactions
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.emotion"
								value="Abnormal expressions of emotion">Abnormal
							expressions of emotion
						</div>
						<div>
							<input type="checkbox" name="patientsDetails2.emotion"
								value="Morbid expressions of emotion">Morbid expressions
							of emotion
						</div>
					</div>
				</div>
				<div class="grid">
					<div class="col-12">
						<label>Judgment: </label>
						<table>
							<tr style="width: 758px; height: 25px;">
								<td style="width: 150px; height: 25px">&nbsp;&nbsp;<b>Personal:
								</b></td>
								<td style="width: 231px; height: 25px"><input
									type="checkbox" name="patientsDetails2.judgementpersonal"
									value="Intact" style="width: 45px;">&nbsp;Intact</td>
								<td style="width: 322px; height: 25px"><input
									type="checkbox" name="patientsDetails2.judgementpersonal"
									value="Impaired" style="width: 45px;">Impaired</td>
							</tr>

							<tr style="width: 758px; height: 25px;">
								<td style="width: 150px; height: 25px">&nbsp;&nbsp;<b>Social
										: </b></td>
								<td style="width: 231px; height: 25px"><input
									type="checkbox" name="patientsDetails2.judgementsocial"
									value="Intact" style="width: 45px;">Intact</td>
								<td style="width: 322px; height: 25px"><input
									type="checkbox" name="patientsDetails2.judgementsocial"
									value="Impaired" style="width: 45px;">Impaired</td>
							</tr>
							<tr style="width: 758px; height: 25px;">
								<td style="width: 150px; height: 25px">&nbsp;&nbsp;<b>Test
										: </b></td>
								<td style="width: 231px; height: 25px"><input
									type="checkbox" name="patientsDetails2.judgementtest"
									value="Intact" style="width: 45px;">Intact</td>
								<td style="width: 322px; height: 25px"><input
									type="checkbox" name="patientsDetails2.judgementtest"
									value="Impaired" style="width: 45px;">Impaired</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="grid">
					<div class="col-12">
						<label for="patientsDetails2.thinking">8.8 Insight – </label>
						<table>
							<tr>
								<td><input type="checkbox" name="patientsDetails2.insight"
									value="Level 1. Complete denial of illness
								The individual totally denies being ill, even when clear symptoms or dysfunction are present. Common in psychosis or anosognosia."
									style="width: 50px;"></td>
								<td style="width: 750px;"><b>Level 1.</b> Complete denial
									of illness <br /> The individual totally denies being ill,
									even when clear symptoms or dysfunction are present. Common in
									psychosis or anosognosia.</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="patientsDetails2.insight"
									value="Level 2. Slight awareness of being sick and needing help, but denying it at the same time
							The person may express minor doubts or complaints but immediately dismisses the idea of needing psychiatric help."
									style="width: 50px;"></td>
								<td style="width: 750px;"><b>Level 2.</b> Slight awareness
									of being sick and needing help, but denying it at the same time
									The person may express minor doubts or complaints but
									immediately dismisses the idea of needing psychiatric help.</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="patientsDetails2.insight"
									value="Level 3. Awareness of being sick but blaming it on external factors
							The illness is acknowledged, but the cause is attributed to external stressors, people, or circumstances—e.g., “It’s because of my boss.."
									style="width: 50px;"></td>
								<td style="width: 750px;"><b>Level 3.</b> Awareness of
									being sick but blaming it on external factors The illness is
									acknowledged, but the cause is attributed to external
									stressors, people, or circumstances—e.g., “It’s because of my
									boss.”</td>
							<tr>
								<td><input type="checkbox" name="patientsDetails2.insight"
									value="Level 4. Awareness that illness is due to something unknown in oneself
							The individual admits that the problem may be internal but cannot clearly define or understand what it is."
									style="width: 50px;"></td>
								<td style="width: 750px;"><b>Level 4.</b> Awareness that
									illness is due to something unknown in oneself The individual
									admits that the problem may be internal but cannot clearly
									define or understand what it is.</td>
							<tr>
								<td><input type="checkbox" name="patientsDetails2.insight"
									value="Level 5. Intellectual insight
							Recognizes the illness, its psychological nature, and causes, but this understanding is not integrated into emotional or behavioral change."
									style="width: 50px;"></td>
								<td style="width: 750px;"><b>Level 5.</b> Intellectual
									insight Recognizes the illness, its psychological nature, and
									causes, but this understanding is not integrated into emotional
									or behavioral change.</td>
							<tr>
								<td><input type="checkbox" name="patientsDetails2.insight"
									value="Level 6. True emotional insight
							Full recognition and emotional acceptance of the illness, leading to meaningful change in behavior, attitude, and coping mechanisms.">
								<td style="width: 750px;"><b>Level 6.</b> True emotional
									insight Full recognition and emotional acceptance of the
									illness, leading to meaningful change in behavior, attitude,
									and coping mechanisms.</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="grid">
					<div class="col-12">
						<label for="patientsDetails2.otherobservations">Other
							Observations on MSE: </label>
						<textarea id="patientsDetails2.otherobservations"
							name="patientsDetails2.otherobservations">${patient.patientsDetails2.otherobservations}</textarea>
					</div>
					<div class="col-12">
						<label for="patientsDetails2.provisionalDiagnosis">9.
							Diagnosis: </label>
						<textarea id="patientsDetails2.provisionalDiagnosis"
							name="patientsDetails2.provisionalDiagnosis">${patient.patientsDetails2.provisionalDiagnosis}</textarea>
					</div>
					<div class="col-12">
						<label for="patientsDetails2.psychologicalassessmentconducted">10.
							Psychological assessment Conducted:</label>
						<textarea id="patientsDetails2.psychologicalassessmentconducted"
							name="patientsDetails2.psychologicalassessmentconducted">${patient.patientsDetails2.psychologicalassessmentconducted}</textarea>
					</div>
					<div class="col-12">
						<label for="patientsDetails2.psychologicalreport">11.
							Psychological Report:</label>
						<textarea id="patientsDetails2.psychologicalreport"
							name="patientsDetails2.psychologicalreport">${patient.patientsDetails2.psychologicalreport}</textarea>
					</div>
					<div class="col-12">
						<label for="patientsDetails2.managementplan">12.
							Management Plan:</label>
						<textarea id="patientsDetails2.managementplan"
							name="patientsDetails2.managementplan">${patient.patientsDetails2.managementplan}</textarea>
					</div>
				</div>
			</fieldset>

			<div align="center">
				<a href="${pageContext.request.contextPath}/homePage"
					class="btn btn-primary"> HOME </a> &nbsp;
				<button type="submit" class="btn btn-primary">UPDATE</button>&nbsp;
				<a href="${pageContext.request.contextPath}/viewPatient/${patient.id}"
					class="btn btn-primary"> View </a>&nbsp; 
				<a href="${pageContext.request.contextPath}/addSessionNotes/${patient.id}"
					class="btn btn-primary"> Sessions </a>
			</div>
		</form>
	</div>
</body>
</html>