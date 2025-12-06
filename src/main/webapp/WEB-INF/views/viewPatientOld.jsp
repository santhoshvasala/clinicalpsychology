<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style><%@include file="./styles.css"%></style>
<meta charset="UTF-8">
<%@include file="./base.jsp"%>
</head>
<body>

	<div class="container mt-2 bg-light">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<h1 class="text-center mb-3 mt-4"> View Psychological Case Record</h1>
				<form action="${pageContext.request.contextPath}/viewPatient" method="post" >
				<button type="submit" disabled style="display: none" aria-hidden="true"></button>
				<input type="hidden" value="${patient.id}" name="id"class="form-control" >

					<b>Name:</b>&nbsp;&nbsp;${patient.firstName}
					<b>Date</b> &nbsp;&nbsp;${patient.createdDate}
					<div></div>
					<b>Date of Birth:</b>&nbsp; ${patient.dob}
					<b>Age: </b>&nbsp; ${patient.age}
					<div></div>
					<b>Mobile Number:</b> &nbsp;${patient.clientmobile}
					<div></div>
					<b>Relative:</b> &nbsp;${patient.relativemobile}
					<div></div>
					<b>Relationship Type:</b>&nbsp;${patient.relationtype}
					<div></div>
					<b>Email ID: 1.</b>${patient.email1}
					&nbsp; 2.${patient.email2}
						<div/>
						<b> Gender: </b>&nbsp; ${patient.gender}<div></div>
					&nbsp;<b>Religion:</b> &nbsp;${patient.religion}<div></div>
					
					&nbsp;<b>Marital Status: </b> &nbsp;${patient.maritalstatus}<div></div>
					
					&nbsp;<b> Educational Qualification: </b>&nbsp;${patient.eduqualification}<div></div>
				
					<b> Occupation: </b> &nbsp;${patient.occupation}<div></div>
					&nbsp;<b> 
					Informants: </b> &nbsp;${patient.informants}<div></div>					
					<b>Address:</b>  &nbsp; ${patient.address}<div></div>
					<b>Referral Source: </b> &nbsp;${patient.referalsource} <div></div>
					<b>Purpose of Referral: </b>  &nbsp; ${patient.puposeofreferral} <div></div>
 					<b>Place of Consultation: </b> &nbsp; ${patient.placeofconsultation}<div></div>

					<b>1.1 Presenting Complaints:</b>&nbsp; ${patient.patientsDetails1.presentingcomplaints} <div></div>
 <b>1.2
					Precipitating Factors:</b> &nbsp; ${patient.patientsDetails1.precipitatingfactors} <div></div>
 <b>1.3 Duration
					of Illness:</b> &nbsp; ${patient.patientsDetails1.dutaionofillness} <div></div>
						
				<b>	1.4	 Onset:</b> &nbsp; ${patient.patientsDetails1.onset} <div></div>
					<b>    Course:</b> &nbsp; ${patient.patientsDetails1.course} <div></div>
				<b>	 2.   Recent Treatment History:</b>  &nbsp; ${patient.patientsDetails1.recenttreatmenthistory} <div></div>
					
				<b>	 3.	Negative History:</b> &nbsp; ${patient.patientsDetails1.negativehistory} <div></div>
						
				<b>	 4. Past History of Mental Illness&Physical Illness:</b> &nbsp; ${patient.patientsDetails1.pasthistory} <div></div>
				<b>	 5. Family History: </b>&nbsp; ${patient.patientsDetails1.familyhistory} <div></div>
				<b>	 6.0 Personal History:</b><div></div>
				<b>	  6.1 Birth & Developmental –</b> &nbsp; ${patient.patientsDetails1.birthdevelopment} <div></div>
				<b>	  6.2 Scholastic –</b> &nbsp; ${patient.patientsDetails1.scholastic} <div></div>
				<b>	  6.3 Occupational –</b> &nbsp; ${patient.patientsDetails1.occupational} <div></div>
				<b>	  6.4 Marital & Sexual–</b> &nbsp; ${patient.patientsDetails1.maritalsexual} <div></div>
				<b>	  6.5 Habits (including use of alcohol/tobacco/drug, if any) –</b> &nbsp; ${patient.patientsDetails1.habits} <div></div>
				<b>	  6.6 Social –</b> &nbsp; ${patient.patientsDetails1.social} <div></div>
				<b>    7.Personality/Adjustment Prior to Illness:</b> &nbsp; ${patient.patientsDetails1.personalityadjustment} <div></div>
				<b>	  Reliability of Information:</b> &nbsp; ${patient.patientsDetails1.reliabilityinfo} <div></div>
    			<b>	  Adequacy of Information:</b> &nbsp; ${patient.patientsDetails1.adequacyinfo} <div></div>
				<b>	8. Mental Status: </b><div></div>
					    <b> 8.1 Appearance –</b> <div></div>
							<b>  General build:</b>&nbsp; ${patient.patientsDetails2.generalbuild} <div></div>
		  					<b>	 Grooming & hygiene:</b>&nbsp; ${patient.patientsDetails2.grooming} <div></div>
							<b>	 Dress:</b> &nbsp; ${patient.patientsDetails2.dress}  <div></div>
							<b>	 Facial expression:</b> &nbsp; ${patient.patientsDetails2.facialexpression} <div></div>					
							<b>  Eye contact: </b> &nbsp; ${patient.patientsDetails2.eycontact} <div></div>
							<b>  Age-appropriateness: </b> &nbsp;Appears stated age or not <div></div>
							<b>  Notable physical features:</b> &nbsp; ${patient.patientsDetails2.notablephysicalfeatures} <div></div>						 
							<b>  Posture: </b> &nbsp; ${patient.patientsDetails2.posture} <div></div>
						<b>	8.2 Movement and Behavior–</b> <div></div>
							<b>  Increased activity: </b> &nbsp; ${patient.patientsDetails2.increasedactivity} <div></div>
							<b>  Decreased activity: </b>&nbsp; ${patient.patientsDetails2.decreasedactivity} <div></div>
							<b>  Abnormal movements: </b>&nbsp; ${patient.patientsDetails2.abnormalmovements} <div></div>
						<b> 8.3 Speech – </b><div></div>
							<b>  Quantity: </b>&nbsp; ${patient.patientsDetails2.quantity} <div></div>
							<b>  Rate and rhythm: </b> &nbsp; ${patient.patientsDetails2.rateandrhythm} <div></div>
							<b>  Form and structure: </b>&nbsp; ${patient.patientsDetails2.formandstructure} <div></div>
						<b> 8.4 Thought – </b>
							<b>  Disorders of stream: </b>&nbsp; ${patient.patientsDetails2.disorderofstream} <div></div>
							<b>	 Disorders of form: </b>&nbsp; ${patient.patientsDetails2.disorderofform} <div></div>
							<b>	 Content of Thought: </b>&nbsp; ${patient.patientsDetails2.contentofthought} <div></div>
							<b>  Possession of Thought: </b>&nbsp; ${patient.patientsDetails2.possessionofthought} <div></div>
						<b> 8.5	Mood and Affect – </b><div></div>
							<b>  Mood (subjective): </b>&nbsp; ${patient.patientsDetails2.mood} <div></div>
							<b>	 Affect (objective):</b> &nbsp; ${patient.patientsDetails2.affect} <div></div>
						<b> 8.6	Perception – </b> &nbsp; ${patient.patientsDetails2.perception} <div></div>
						<b> 8.7	Cognition – </b> <div></div>
							<b>  Consciousness: </b>&nbsp; ${patient.patientsDetails2.consciousness} <div></div>						
							<b>	 Orientation: </b><div></div>
								 &nbsp;&nbsp;<b>  Time:	</b>&nbsp; ${patient.patientsDetails2.time} <div></div>
								 &nbsp;&nbsp;<b>  Place:	</b>&nbsp; ${patient.patientsDetails2.place}	 <div></div>
								 &nbsp;&nbsp;<b>  Person:	</b>&nbsp; ${patient.patientsDetails2.person} <div></div>
							<b>  Attention and concentration: </b>&nbsp; ${patient.patientsDetails2.attentionconcentration} <div></div>
							<b>  Memory: </b><div></div>
								 &nbsp;&nbsp;<b>  Immediate: </b>&nbsp; ${patient.patientsDetails2.immediate} <div></div>
								 &nbsp;&nbsp;<b>  Recent:	</b>&nbsp; ${patient.patientsDetails2.recent} <div></div>
								 &nbsp;&nbsp;<b>  Remote:	</b>&nbsp; ${patient.patientsDetails2.remote} <div></div>
								 &nbsp;&nbsp;<b>  Amnesia:	</b>&nbsp; ${patient.patientsDetails2.amnesia}  <div></div>						
								&nbsp; ${patient.patientsDetails2.memory}   <div></div>      
							<b>  Thinking: </b>	&nbsp; ${patient.patientsDetails2.thinking} <div></div>
							<b>  Emotion: </b> &nbsp; ${patient.patientsDetails2.emotion} <div></div>
							<b>  Judgment: </b> <div></div>
								<b>  Personal:</b>&nbsp; ${patient.patientsDetails2.judgementpersonal} <div></div>
								<b>  Social:</b>&nbsp; ${patient.patientsDetails2.judgementsocial} <div></div>
								<b>  Test: </b>&nbsp; ${patient.patientsDetails2.judgementtest} <div></div>								
						<b> 8.8	Insight –</b> &nbsp; ${patient.patientsDetails2.insight} 
								<b>  Other Observations on MSE: </b>&nbsp; ${patient.patientsDetails2.otherobservations} <div></div>
						<b> 9.  Provisional Diagnosis: </b>	&nbsp; ${patient.patientsDetails2.provisionalDiagnosis} <div></div>
						<b> 10. Psychological assessment Conducted: </b>&nbsp; ${patient.patientsDetails2.psychologicalassessmentconducted} <div></div>
						<b> 11. Psychological Report:</b> &nbsp; ${patient.patientsDetails2.psychologicalreport}  <div></div>
						<b> 12. Management Plan:</b> &nbsp; ${patient.patientsDetails2.managementplan} <div></div>
						<b> Sessions :</b>
							<c:forEach var="frm" items="${sessions}">
								<table>
									<tr>
										<td style="width:350px"> Date: ${frm.sessionoccuredon}</td>
										<td style="width:750px"> Session Notes : ${frm.sessionnote}</td>
									</tr>
								</table>
							</c:forEach>
											
					<div class="container text-center mb-4">
						<a href="${pageContext.request.contextPath}/homePage"
							class="btn btn-primary"> HOME </a>
						<a href="${pageContext.request.contextPath}/updatePatient/${patient.id}" class="btn btn-outline-success"> Update Patient Details</a>
					</div>

				</form>
			</div>
		</div>
	</div>

</body>
</html>