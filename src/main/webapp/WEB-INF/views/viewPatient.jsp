<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
	

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<style><%@include file="./styles.css"%></style>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1" />
 <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
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
				
					<img alt="img" width="200" height="200"  src="data:image/jpeg;base64,${patient.base64imageFile}"/>
					<br>

					<b>Name:</b>&nbsp;&nbsp;${patient.firstName}
					<fmt:formatDate value="${patient.createdDate}"
							pattern="dd-MM-yyyy hh:mm:ss a" var="cDate" />
					<b>Date</b> &nbsp;&nbsp;${cDate}
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
					 Languages Known: </b> &nbsp;${patient.languagesKnown}<div></div>
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
				<b>	 5. Family History: </b>&nbsp; ${patient.patientsDetails1.familyhistory}  
				<img alt="img" width="200" height="200"  src="data:image/jpeg;base64,${patient.base64FamilyFile}"/>
				<div></div>
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
							<b>	 Content of Thought: </b>
							<div>
							<c:if test="${fn:contains(patient.patientsDetails2.contentofthought, 'Obsessions& compulsions')}">
		     							<input type="checkbox" name="patientsDetails2.contentofthought"
								value="Obsessions& compulsions" checked="checked" disabled="disabled"> Obsessions& compulsions 
								<input type="text" id="obsessioncompulsionstext" name="patientsDetails2.obsessioncompulsionstext" value="${patient.patientsDetails2.obsessioncompulsionstext}" disabled="disabled">
		    						</c:if>    
						</div>

						<div>
							<c:if test="${fn:contains(patient.patientsDetails2.contentofthought, 'Thought alienation')}">
		     							<input type="checkbox" name="patientsDetails2.contentofthought"
								value="Thought alienation" checked="checked" disabled="disabled"> Thought alienation  
								<input
								type="text" id="thoughtalienation" name="patientsDetails2.thoughtalienation" value="${patient.patientsDetails2.thoughtalienation}" disabled="disabled">
		    						</c:if>    
						</div>
						<div>
							<c:if test="${fn:contains(patient.patientsDetails2.contentofthought, 'Delusions (primary and secondary; persecutory, grandiose, referential, guilt, poverty, infidelity, love, illhealth, nihilisticetc.)')}">
		     							<input type="checkbox" name="patientsDetails2.contentofthought" checked="checked" disabled="disabled"
								value="Delusions (primary and secondary; persecutory, grandiose, referential, guilt, poverty, infidelity, love, illhealth, nihilisticetc.)">
							Delusions (primary and secondary; persecutory, grandiose,referential, guilt, poverty, <br>
							<span style="margin-left: 210px;"> infidelity, love, illhealth,nihilisticetc.) </span>  
							<input type="text" id="delusionstext" name="patientsDetails2.delusionstext" value="${patient.patientsDetails2.delusionstext}" disabled="disabled">
		    						</c:if>    
						</div>
						<div>
							
								
						<c:if test="${fn:contains(patient.patientsDetails2.contentofthought, 'Overvalued ideas')}">
		     							<input type="checkbox" name="patientsDetails2.contentofthought" checked="checked" disabled="disabled"
								value="Overvalued ideas"> Overvalued ideas
								 <input
								type="text" id="overvaluedideastext" name="patientsDetails2.overvaluedideastext" value="${patient.patientsDetails2.overvaluedideastext}" disabled="disabled">
						
		    						</c:if>    
						</div>
						<div>
							<c:if test="${fn:contains(patient.patientsDetails2.contentofthought, 'Phobias')}">
		     							<input type="checkbox" name="patientsDetails2.contentofthought" checked="checked" disabled="disabled"
								value="Phobias"> Phobias
									<input type="text"
								id="phobiastext" name="patientsDetails2.phobiastext" value="${patient.patientsDetails2.phobiastext}" disabled="disabled">
						
		    						</c:if>    
					    </div>
						<div>
							 
							
							<c:if test="${fn:contains(patient.patientsDetails2.contentofthought, 'Depressive Cognitions (hopelessness, helplessness, worthlessness):')}">
		     							<input type="checkbox" name="patientsDetails2.contentofthought" checked="checked" disabled="disabled"
								value="Depressive Cognitions (hopelessness, helplessness, worthlessness):">
							Depressive Cognitions (hopelessness, helplessness,
							worthlessness):
							<input type="text" id="deressivecongnitionstext"
								name="patientsDetails2.deressivecongnitionstext" value="${patient.patientsDetails2.deressivecongnitionstext}" style="width:150px;" disabled="disabled">
						
		    						</c:if>    
							</div>
						<div>
							
							<c:if test="${fn:contains(patient.patientsDetails2.contentofthought, 'Guilt')}">
		     							<input type="checkbox" name="patientsDetails2.contentofthought" disabled="disabled"
								value="Guilt" checked="checked"> Guilt
								<input type="text" id="guilttext"
								name="patientsDetails2.guilttext" value="${patient.patientsDetails2.guilttext}" disabled="disabled">
		    						</c:if>    
						</div>
						<div>
							 
							<c:if test="${fn:contains(patient.patientsDetails2.contentofthought, 'Worries')}">
		     							<input type="checkbox" name="patientsDetails2.contentofthought" disabled="disabled"
								value="Worries" checked="checked"> Worries
								<input type="text"
								id="patientsDetails2.worriestext" name="worriestext" value="${patient.patientsDetails2.worriestext}">
		    						</c:if>    
						</div>
						<div>
							<c:if test="${fn:contains(patient.patientsDetails2.contentofthought, 'Catastrophic')}">
		     							<input type="checkbox" name="patientsDetails2.contentofthought"
								value="Catastrophic" checked="checked"> Catastrophic
								 <input type="text"
								id="catastrophictext" name="patientsDetails2.catastrophictext" value="${patient.patientsDetails2.catastrophictext}" disabled="disabled">
		    						</c:if>    
						</div>
						<div>
							
							<c:if test="${fn:contains(patient.patientsDetails2.contentofthought, 'Suicidal')}">
		     							<input type="checkbox" name="patientsDetails2.contentofthought" disabled="disabled"
								value="Suicidal" checked="checked"> Suicidal
								 <input type="text"
								id="suicidaltext" name="patientsDetails2.suicidaltext" value="${patient.patientsDetails2.suicidaltext}" disabled="disabled">
		    						</c:if>    
						</div>
						<div>
							
							<c:if test="${fn:contains(patient.patientsDetails2.contentofthought, 'homicidal ideation')}">
		     							<input type="checkbox" name="patientsDetails2.contentofthought" disabled="disabled"
								value="homicidal ideation" checked="checked"> homicidal ideation
								<input
								type="text" id="homicidalideationtext"
								name="patientsDetails2.homicidalideationtext" value="${patient.patientsDetails2.homicidalideationtext}" disabled="disabled">
						
		    						</c:if>    
							</div>
						<div>
							
							<c:if test="${fn:contains(patient.patientsDetails2.contentofthought, 'Magical thinking')}">
		     							<input type="checkbox" name="patientsDetails2.contentofthought" disabled="disabled"
								value="Magical thinking" checked="checked"> Magical thinking
								<input
								type="text" id="magicalthinkingtext" name="patientsDetails2.magicalthinkingtext" value="${patient.patientsDetails2.magicalthinkingtext}" disabled="disabled">
						
		    						</c:if>    
							 </div>
						<div>
							
							<c:if test="${fn:contains(patient.patientsDetails2.contentofthought, 'Ideas of reference')}">
		     							<input type="checkbox" name="patientsDetails2.contentofthought" disabled="disabled"
								value="Ideas of reference" checked="checked"> Ideas of reference
								 <input
								type="text" id="ideasofreferencetext"
								name="patientsDetails2.ideasofreferencetext" value="${patient.patientsDetails2.ideasofreferencetext}" disabled="disabled">
							</c:if>		
						   
						</div>
						<div>
							
							<c:if test="${fn:contains(patient.patientsDetails2.contentofthought, 'Persecutory ideas')}">
		     							<input type="checkbox" name="patientsDetails2.contentofthought" disabled="disabled"
								value="Persecutory ideas" checked="checked"> Persecutory ideas
								<input
								type="text" id="persecutoryidastext" name="patientsDetails2.persecutoryidastext" value="${patient.patientsDetails2.persecutoryidastext}" disabled="disabled">
						
		    						</c:if>    
		   				
							</div>
						<div>
							
							<c:if test="${fn:contains(patient.patientsDetails2.contentofthought, 'Others')}">
		     							<input type="checkbox" name="patientsDetails2.contentofthought" disabled="disabled"
								value="Others" checked="checked"> Others 
								<input type="text"
								id="othersText" name="patientsDetails2.othersText" value="${patient.patientsDetails2.othersText}" disabled="disabled">
		    						</c:if>    
						</div>
							<div></div>
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
						<a href="${pageContext.request.contextPath}/updatePatient/${patient.id}" class="btn btn-primary"> Update Patient Details</a>
					</div>

				</form>
			</div>
		</div>
	</div>

</body>
</html>