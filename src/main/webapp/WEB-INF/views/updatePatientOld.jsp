<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
				<h1 class="text-center mb-3 mt-4">Update Case Record</h1>
					<c:if test="${not empty message}">
    							<div class="alert alert-success">${message}</div>
							</c:if>
				
				<form action="${pageContext.request.contextPath}/handleUpdatePatient/${patient.id}" method="post">
					<button type="submit" disabled style="display: none" aria-hidden="true"></button>
					<%-- <input type="hidden" id="id" name="id" value="${patient.id}"/> --%>
					<b>Name:</b>&nbsp;&nbsp;<input type="text" id="firstName" name="firstName" value="${patient.firstName}"
						>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>Date</b> &nbsp;&nbsp;
					<fmt:formatDate value="${patient.createdDate}" pattern="yyyy-MM-dd'T'HH:mm" var="cDate" />
					<input type="datetime-local"
						name="createdDate" id="createdDate" value="${cDate}" />
					<div></div>
					<b>Date of Birth:</b>&nbsp; 
					<fmt:formatDate value="${patient.dob}" pattern="yyyy-MM-dd" var="dobDate" />
					<input type="date" id="dob" name="dob" value="${dobDate}">&nbsp;&nbsp;&nbsp;<b>Age:</b> &nbsp;
					<input type="text" id="age" name="age" value="${patient.age}">
					<div></div>
					<b>Mobile Number:</b> &nbsp;
					<div></div>
					Client <input type="text" id="clientmobile" name="clientmobile" value="${patient.clientmobile}">
					<div></div>
					Relative: <input type="text" id="relativemobile"
						name="relativemobile" value="${patient.relativemobile}">
					<div></div>
					Relationship Type<input type="text" id="relationtype"
						name="relationtype" value="${patient.relationtype}">
					<div></div>
					<b>Email ID: 1.</b>&nbsp; <input type="text" id="email1"
						name="email1" value="${patient.email1}">&nbsp; <b>2.</b>&nbsp;<input type="text" 
						id="email2" name="email2" value="${patient.email2}">
						<div/>
						<b> Gender: </b>&nbsp; <select name="gender">
						
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
						
					</select> &nbsp;<b>, Religion:</b> &nbsp;<select name="religion">
						<c:forEach var="frm" items="${religions}">
					    	<c:choose>
	    						<c:when test="${fn:contains(patient.religion, frm.religionval)}">
	     							<option value="${frm.religionval}" selected="selected">${frm.religionval}</option>
	    						</c:when>    
	   							<c:otherwise>
								 <option value="${frm.religionval}">${frm.religionval}</option>
								 </c:otherwise>
							</c:choose>
						</c:forEach>
					</select>&nbsp;<b>,Marital Status: </b> &nbsp;<select name="maritalstatus">
						<c:forEach var="frm" items="${maritalStatuslist}">
					    	<c:choose>
	    						<c:when test="${fn:contains(patient.maritalstatus, frm.maritalStatusVal)}">
	     							<option value="${frm.maritalStatusVal}" selected="selected">${frm.maritalStatusVal}</option>
	    						</c:when>    
	   							<c:otherwise>
								 <option value="${frm.maritalStatusVal}">${frm.maritalStatusVal}</option>
								 </c:otherwise>
							</c:choose>
						</c:forEach>
					</select>&nbsp;<b> Educational Qualification: </b>&nbsp; <select name="eduqualification">
						<c:forEach var="frm" items="${educations}">
					    	<c:choose>
	    						<c:when test="${fn:contains(patient.eduqualification, frm.educationDet)}">
	     							<option value="${frm.educationDet}" selected="selected">${frm.educationDet}</option>
	    						</c:when>    
	   							<c:otherwise>
								 <option value="${frm.educationDet}">${frm.educationDet}</option>
								 </c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
					<div/>
					<b> Occupation: </b> &nbsp;<select name="occupation">
						<c:forEach var="frm" items="${occupations}">
					    	<c:choose>
	    						<c:when test="${fn:contains(patient.occupation, frm.occupationDet)}">
	     							<option value="${frm.occupationDet}" selected="selected">${frm.occupationDet}</option>
	    						</c:when>    
	   							<c:otherwise>
								 <option value="${frm.occupationDet}">${frm.occupationDet}</option>
								 </c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
					&nbsp;<b> 
					<div/>Informants: </b> &nbsp;<input type="text" class="form-control"
						id="informants" name="informants" value="${patient.informants}">
						<b>Address:</b>   &nbsp;<input
						type="text" class="form-control" id="address" name="address" value="${patient.address}">
					<b>Referral Source: </b> &nbsp;<select name="referalsource">
					
					<c:forEach var="frm" items="${referrels}">
					    	<c:choose>
	    						<c:when test="${fn:contains(patient.referalsource, frm.referralSourceVal)}">
	     							<option value="${frm.referralSourceVal}" selected="selected">${frm.referralSourceVal}</option>
	    						</c:when>    
	   							<c:otherwise>
								 <option value="${frm.referralSourceVal}">${frm.referralSourceVal}</option>
								 </c:otherwise>
							</c:choose>
					</c:forEach>
					</select>&nbsp; <b>Purpose of Referral: </b>  &nbsp;<select name="puposeofreferral">
						<c:forEach var="frm" items="${purposelist}">
					    	<c:choose>
	    						<c:when test="${fn:contains(patient.puposeofreferral, frm.purposeVal)}">
	     							<option value="${frm.purposeVal}" selected="selected">${frm.purposeVal}</option>
	    						</c:when>    
	   							<c:otherwise>
								 <option value="${frm.purposeVal}">${frm.purposeVal}</option>
								 </c:otherwise>
							</c:choose>
						</c:forEach>
					</select> &nbsp; <div/><b>Place of Consultation: </b> &nbsp;<select name="placeofconsultation">
					<c:forEach var="frm" items="${places}">
					    	<c:choose>
	    						<c:when test="${fn:contains(patient.placeofconsultation, frm.consPlace)}">
	     							<option value="${frm.consPlace}" selected="selected">${frm.consPlace}</option>
	    						</c:when>    
	   							<c:otherwise>
								 <option value="${frm.consPlace}">${frm.consPlace}</option>
								 </c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
					<div></div>
<input type="hidden" id="patientsDetails1.patientdetailid" name="patientsDetails1.patientdetailid" value="${patient.patientsDetails1.patientdetailid}"/>
					1.1 Presenting Complaints:<input type="text" class="form-control"
						id="patientsDetails1.presentingcomplaints"
						name="patientsDetails1.presentingcomplaints" value="${patient.patientsDetails1.presentingcomplaints}"> 
						
					1.2 Precipitating Factors: <input type="text" class="form-control"
						id="patientsDetails1.precipitatingfactors"
						name="patientsDetails1.precipitatingfactors" value="${patient.patientsDetails1.precipitatingfactors} ">
						
				    1.3 Duration of Illness: <input type="text" class="form-control"
						id="patientsDetails1.dutaionofillness"
						name="patientsDetails1.dutaionofillness" ${patient.patientsDetails1.dutaionofillness}>
						
						Onset: 
						<c:forEach var="frm" items="${onsetlist}">
							<c:choose>
	    						<c:when test="${fn:contains(patient.patientsDetails1.onset, frm)}">
	     							<input type="checkbox" name="patientsDetails1.onset" value="${frm}" checked="checked"/> ${frm} 
	    						</c:when>    
	   							<c:otherwise>
								 <input type="checkbox" name="patientsDetails1.onset" value="${frm}"/> ${frm} 
								 </c:otherwise>
							</c:choose>
						</c:forEach>	
						
						<c:forEach var="frm" items="${courselist}">
							<c:choose>
	    						<c:when test="${fn:contains(patient.patientsDetails1.course, frm)}">
	     							<input type="checkbox" name="patientsDetails1.course" value="${frm}" checked="checked"/> ${frm} 
	    						</c:when>    
	   							<c:otherwise>
								 <input type="checkbox" name="patientsDetails1.course" value="${frm}"/> ${frm} 
								 </c:otherwise>
							</c:choose>
						</c:forEach>	
						
					2. Recent Treatment History: <input type="text" class="form-control"
						id="patientsDetails1.recenttreatmenthistory"
						name="patientsDetails1.recenttreatmenthistory" value="${patient.patientsDetails1.recenttreatmenthistory}"> 
					3. Negative History: <input type="text" class="form-control"
						id="patientsDetails1.negativehistory" name="patientsDetails1.negativehistory" value="${patient.patientsDetails1.negativehistory}"> 
					4. Past History of Mental Illness&Physical Illness: 
					   <input type="text"
						class="form-control" id="patientsDetails1.pasthistory"
						name="patientsDetails1.pasthistory" value="${patient.patientsDetails1.pasthistory}"> 
					5. Family History: <input type="text" class="form-control"
						id="patientsDetails1.familyhistory"
						name="patientsDetails1.familyhistory" value="${patient.patientsDetails1.familyhistory}"> 
				   6.0 Personal History: 
				       6.1 Birth & Developmental – <input type="text" class="form-control" id="patientsDetails1.birthdevelopment"
						   name="patientsDetails1.birthdevelopment" value="${patient.patientsDetails1.birthdevelopment}">
					   6.2 Scholastic – <input type="text" class="form-control"
								id="patientsDetails1.scholastic" name="patientsDetails1.scholastic" value="${patient.patientsDetails1.scholastic}"> 
						
					   6.3 Occupational – <input type="text" class="form-control" id="patientsDetails1.occupational" 
					       name="patientsDetails1.occupational" value="${patient.patientsDetails1.occupational}"> 
					   6.4 Marital & Sexual	– <input type="text" class="form-control" id="patientsDetails1.maritalsexual"
							name="patientsDetails1.maritalsexual" value="${patient.patientsDetails1.maritalsexual}"> 
					   6.5 Habits (including use of alcohol/tobacco/drug, if any) – 
					        <input type="text" class="form-control" id="patientsDetails1.habits"
							name="patientsDetails1.habits" value="${patient.patientsDetails1.habits}"> 
					   6.6 Social – <input 	type="text" class="form-control" id="patientsDetails1.social"
							name="patientsDetails1.social" value="${patient.patientsDetails1.social}"> 
					   7.  Personality/Adjustment Prior to Illness: <input type="text" class="form-control"
							id="patientsDetails1.personalityadjustment"
							name="patientsDetails1.personalityadjustment" value="${patient.patientsDetails1.personalityadjustment}"> 
							Reliability of Information: 
							
							
							<c:forEach var="frm" items="${reliabilityinfolist}">
								<c:choose>
		    						<c:when test="${fn:contains(patient.patientsDetails1.reliabilityinfo, frm)}">
		     							<input type="checkbox" name="patientsDetails1.reliabilityinfo" value="${frm}" checked="checked"/> ${frm} 
		    						</c:when>    
		   							<c:otherwise>
									 <input type="checkbox" name="patientsDetails1.reliabilityinfo" value="${frm}"/> ${frm} 
									 </c:otherwise>
								</c:choose>
							</c:forEach>
							
								
					Adequacy of Information: 
					<c:forEach var="frm" items="${adequacyinfolist}">
								<c:choose>
		    						<c:when test="${fn:contains(patient.patientsDetails1.adequacyinfo, frm)}">
		     							<input type="checkbox" name="patientsDetails1.adequacyinfo" value="${frm}" checked="checked"/> ${frm} 
		    						</c:when>    
		   							<c:otherwise>
									 <input type="checkbox" name="patientsDetails1.adequacyinfo" value="${frm}"/> ${frm} 
									 </c:otherwise>
								</c:choose>
							</c:forEach>
							
							<input type="hidden" id="patientsDetails2.patientdetailid2" name="patientsDetails2.patientdetailid2" value="${patient.patientsDetails2.patientdetailid2}"/>
					
8. Mental Status:
8.1 Appearance –
General build:

					<c:forEach var="frm" items="${generalbuildlist}">
								<c:choose>
		    						<c:when test="${fn:contains(patient.patientsDetails2.generalbuild, frm)}">
		     							<input type="checkbox" name="patientsDetails2.generalbuild" value="${frm}" checked="checked"/> ${frm} 
		    						</c:when>    
		   							<c:otherwise>
									 <input type="checkbox" name="patientsDetails2.generalbuild" value="${frm}"/> ${frm} 
									 </c:otherwise>
								</c:choose>
					</c:forEach>

<div/>
Grooming & hygiene:

					<c:forEach var="frm" items="${groominglist}">
								<c:choose>
		    						<c:when test="${fn:contains(patient.patientsDetails2.grooming, frm)}">
		     							<input type="checkbox" name="patientsDetails2.grooming" value="${frm}" checked="checked"/> ${frm} 
		    						</c:when>    
		   							<c:otherwise>
									 <input type="checkbox" name="patientsDetails2.grooming" value="${frm}"/> ${frm} 
									 </c:otherwise>
								</c:choose>
					</c:forEach>
					
Dress: 
						<c:forEach var="frm" items="${dresslist}">
								<c:choose>
		    						<c:when test="${fn:contains(patient.patientsDetails2.dress, frm)}">
		     							<input type="checkbox" name="patientsDetails2.dress" value="${frm}" checked="checked"/> ${frm} 
		    						</c:when>    
		   							<c:otherwise>
									 <input type="checkbox" name="patientsDetails2.dress" value="${frm}"/> ${frm} 
									 </c:otherwise>
								</c:choose>
					    </c:forEach>
						<div/>
Facial expression: 
						<c:forEach var="frm" items="${facialexpressionlist}">
								<c:choose>
		    						<c:when test="${fn:contains(patient.patientsDetails2.facialexpression, frm)}">
		     							<input type="checkbox" name="patientsDetails2.facialexpression" value="${frm}" checked="checked"/> ${frm} 
		    						</c:when>    
		   							<c:otherwise>
									 <input type="checkbox" name="patientsDetails2.facialexpression" value="${frm}"/> ${frm} 
									 </c:otherwise>
								</c:choose>
					    </c:forEach>
						
<div/>Eye contact: 
						<c:forEach var="frm" items="${eycontactlist}">
								<c:choose>
		    						<c:when test="${fn:contains(patient.patientsDetails2.eycontact, frm)}">
		     							<input type="checkbox" name="patientsDetails2.eycontact" value="${frm}" checked="checked"/> ${frm} 
		    						</c:when>    
		   							<c:otherwise>
									 <input type="checkbox" name="patientsDetails2.eycontact" value="${frm}"/> ${frm} 
									 </c:otherwise>
								</c:choose>
					    </c:forEach>
<div/>
Age-appropriateness: piercingAppears stated age or not
Notable physical features: 
						<c:forEach var="frm" items="${notablephysicalfeatureslist}">
								<c:choose>
		    						<c:when test="${fn:contains(patient.patientsDetails2.notablephysicalfeatures, frm)}">
		     							<input type="checkbox" name="patientsDetails2.notablephysicalfeatures" value="${frm}" checked="checked"/> ${frm} 
		    						</c:when>    
		   							<c:otherwise>
									 <input type="checkbox" name="patientsDetails2.notablephysicalfeatures" value="${frm}"/> ${frm} 
									 </c:otherwise>
								</c:choose>
					    </c:forEach>

Posture:
						<c:forEach var="frm" items="${posturelist}">
								<c:choose>
		    						<c:when test="${fn:contains(patient.patientsDetails2.posture, frm)}">
		     							<input type="checkbox" name="patientsDetails2.posture" value="${frm}" checked="checked"/> ${frm} 
		    						</c:when>    
		   							<c:otherwise>
									 <input type="checkbox" name="patientsDetails2.posture" value="${frm}"/> ${frm} 
									 </c:otherwise>
								</c:choose>
					    </c:forEach>

8.2 Movement and Behavior–
Increased activity:

						<c:forEach var="frm" items="${increasedactivitylist}">
								<c:choose>
		    						<c:when test="${fn:contains(patient.patientsDetails2.increasedactivity, frm)}">
		     							<input type="checkbox" name="patientsDetails2.increasedactivity" value="${frm}" checked="checked"/> ${frm} 
		    						</c:when>    
		   							<c:otherwise>
									 <input type="checkbox" name="patientsDetails2.increasedactivity" value="${frm}"/> ${frm} 
									 </c:otherwise>
								</c:choose>
					    </c:forEach>
Decreased activity:

						<c:forEach var="frm" items="${decreasedactivitylist}">
								<c:choose>
		    						<c:when test="${fn:contains(patient.patientsDetails2.decreasedactivity, frm)}">
		     							<input type="checkbox" name="patientsDetails2.decreasedactivity" value="${frm}" checked="checked"/> ${frm} 
		    						</c:when>    
		   							<c:otherwise>
									 <input type="checkbox" name="patientsDetails2.decreasedactivity" value="${frm}"/> ${frm} 
									 </c:otherwise>
								</c:choose>
					    </c:forEach>
Abnormal movements:
						<c:forEach var="frm" items="${abnormalmovementslist}">
								<c:choose>
		    						<c:when test="${fn:contains(patient.patientsDetails2.abnormalmovements, frm)}">
		     							<input type="checkbox" name="patientsDetails2.abnormalmovements" value="${frm}" checked="checked"/> ${frm} 
		    						</c:when>    
		   							<c:otherwise>
									 <input type="checkbox" name="patientsDetails2.abnormalmovements" value="${frm}"/> ${frm} 
									 </c:otherwise>
								</c:choose>
					    </c:forEach>
<div/>
8.3 Speech –
Quantity:
						<c:forEach var="frm" items="${quantitylist}">
								<c:choose>
		    						<c:when test="${fn:contains(patient.patientsDetails2.quantity, frm)}">
		     							<input type="checkbox" name="patientsDetails2.quantity" value="${frm}" checked="checked"/> ${frm} 
		    						</c:when>    
		   							<c:otherwise>
									 <input type="checkbox" name="patientsDetails2.quantity" value="${frm}"/> ${frm} 
									 </c:otherwise>
								</c:choose>
					    </c:forEach>
Rate and rhythm:
						<c:forEach var="frm" items="${rateandrhythmlist}">
								<c:choose>
		    						<c:when test="${fn:contains(patient.patientsDetails2.rateandrhythm, frm)}">
		     							<input type="checkbox" name="patientsDetails2.rateandrhythm" value="${frm}" checked="checked"/> ${frm} 
		    						</c:when>    
		   							<c:otherwise>
									 <input type="checkbox" name="patientsDetails2.rateandrhythm" value="${frm}"/> ${frm} 
									 </c:otherwise>
								</c:choose>
					    </c:forEach>
Form and structure:
						<c:forEach var="frm" items="${formandstructurelist}">
								<c:choose>
		    						<c:when test="${fn:contains(patient.patientsDetails2.formandstructure, frm)}">
		     							<input type="checkbox" name="patientsDetails2.formandstructure" value="${frm}" checked="checked"/> ${frm} 
		    						</c:when>    
		   							<c:otherwise>
									 <input type="checkbox" name="patientsDetails2.formandstructure" value="${frm}"/> ${frm} 
									 </c:otherwise>
								</c:choose>
					    </c:forEach>
8.4 Thought –
Disorders of stream:
<input type="checkbox"
						name="patientsDetails2.disorderofstream" value="Flight of ideas"> Flight of ideas
						<input type="checkbox"
						name="patientsDetails2.disorderofstream" value="Thought blocking"> Thought blocking
						<input type="checkbox"
						name="patientsDetails2.disorderofstream" value="Inhibited / Slowing of thinking"> Inhibited / Slowing of thinking
						<input type="checkbox"
						name="patientsDetails2.disorderofstream" value="Pressure of thought"> Pressure of thought
						<input type="checkbox"
						name="patientsDetails2.disorderofstream" value="perseveration"> perseveration<div/>
Disorders of form:
<input type="checkbox"
						name="patientsDetails2.disorderofform" value="Loosening of associations"> Loosening of associations
						<input type="checkbox"
						name="patientsDetails2.disorderofform" value="Incoherence"> Incoherence
						<input type="checkbox"
						name="patientsDetails2.disorderofform" value="Derailment"> Derailment
						<input type="checkbox"
						name="patientsDetails2.disorderofform" value="Circumstantiality"> Circumstantiality
						<input type="checkbox"
						name="patientsDetails2.disorderofform" value="Tangentiality"> Tangentiality
						<input type="checkbox"
						name="patientsDetails2.disorderofform" value="Perseveration"> Perseveration
						<input type="checkbox"
						name="patientsDetails2.disorderofform" value="Verbigeration"> Verbigeration
						<input type="checkbox"
						name="patientsDetails2.disorderofform" value="Thought fragmentation"> Thought fragmentation
	Content of Thought:
	<input type="checkbox"
						name="patientsDetails2.contentofthought" value="Obsessions& compulsions"> Obsessions& compulsions
						<input type="text" id="contentofthought "
						name="contentofthought">
	<input type="checkbox"
						name="patientsDetails2.contentofthought" value="Thought alienation"> Thought alienation
						<input type="text" id="thoughtalienation "
						name="thoughtalienation">
	<input type="checkbox"
						name="patientsDetails2.contentofthought" value="Delusions (primary and secondary; persecutory, grandiose, referential, guilt, poverty, infidelity, love, illhealth, nihilisticetc.)"> Delusions (primary and secondary; persecutory, grandiose, referential, guilt, poverty, infidelity, love, illhealth, nihilisticetc.)
						<input type="text" id="delusionstext"
						name="delusionstext">
	<input type="checkbox"
						name="patientsDetails2.contentofthought" value="Overvalued ideas"> Overvalued ideas
						<input type="text" id="overvaluedideastext"
						name="overvaluedideastext">
	<input type="checkbox"
						name="patientsDetails2.contentofthought" value="Phobias"> Phobias
						<input type="text" id="phobiastext"
						name="phobiastext">
	<input type="checkbox"
						name="patientsDetails2.contentofthought" value="Overvalued ideas"> Overvalued ideas
						<input type="text" id="overvaluedideastext"
						name="overvaluedideastext">
	<input type="checkbox"
						name="patientsDetails2.contentofthought" value="Depressive Cognitions (hopelessness, helplessness, worthlessness):"> Depressive Cognitions (hopelessness, helplessness, worthlessness):
						<input type="text" id="deressivecongnitionstext"
						name="deressivecongnitionstext">			
		<input type="checkbox"
						name="patientsDetails2.contentofthought" value="Guilt"> Guilt
						<input type="text" id="guilttext"
						name="guilttext">
		<input type="checkbox"
						name="patientsDetails2.contentofthought" value="Worries"> Worries
						<input type="text" id="worriestext"
						name="worriestext">	
			<input type="checkbox"
						name="patientsDetails2.contentofthought" value="Catastrophic"> Catastrophic
						<input type="text" id="catastrophictext"
						name="catastrophictext">	
		<input type="checkbox"
						name="patientsDetails2.contentofthought" value="Suicidal"> Suicidal
						<input type="text" id="suicidaltext"
						name="suicidaltext">	
		<input type="checkbox"
						name="patientsDetails2.contentofthought" value="homicidal ideation"> homicidal ideation
						<input type="text" id="homicidalideationtext"
						name="homicidalideationtext">	
		<input type="checkbox"
						name="patientsDetails2.contentofthought" value="Magical thinking"> Magical thinking
						<input type="text" id="magicalthinkingtext"
						name="magicalthinkingtext">																																										
		<input type="checkbox"
						name="patientsDetails2.contentofthought" value="Ideas of reference"> Ideas of reference
						<input type="text" id="ideasofreferencetext"
						name="ideasofreferencetext">	
		<input type="checkbox"
						name="patientsDetails2.contentofthought" value="Persecutory ideas"> Persecutory ideas
						<input type="text" id="persecutoryidastext"
						name="persecutoryidastext">	


Possession of Thought:
<input type="checkbox"
						name="patientsDetails2.possessionofthought" value="Thought insertion"> Thought insertion
						<input type="checkbox"
						name="patientsDetails2.possessionofthought" value="Thought withdrawal"> Thought withdrawal
						<input type="checkbox"
						name="patientsDetails2.possessionofthought" value="Thought broadcasting"> Thought broadcasting
						<input type="checkbox"
						name="patientsDetails2.possessionofthought" value="Thought echo"> Thought echo

8.5	Mood and Affect –
Mood (subjective):
<input type="checkbox"
						name="patientsDetails2.mood" value="Depressive"> Depressive
						<input type="checkbox"
						name="patientsDetails2.mood" value="Elated / euphoric"> Elated / euphoric
						<input type="checkbox"
						name="patientsDetails2.mood" value="Anxious"> Thught echo
						<input type="checkbox"
						name="patientsDetails2.mood" value="Irritable"> Irritable
						<input type="checkbox"
						name="patientsDetails2.mood" value="Apathy"> Apathy
						<input type="checkbox"
						name="patientsDetails2.mood" value="Fearful"> Fearful
						<input type="checkbox"
						name="patientsDetails2.mood" value="DysphoriaLability"> DysphoriaLability

Affect (objective):
<input type="checkbox"
						name="patientsDetails2.affect" value="Blunted"> Blunted
						<input type="checkbox"
						name="patientsDetails2.affect" value="Flat"> Flat
						<input type="checkbox"
						name="patientsDetails2.affect" value="Inappropriate"> Inappropriate
						<input type="checkbox"
						name="patientsDetails2.affect" value="Restricted"> Restricted
						<input type="checkbox"
						name="patientsDetails2.affect" value="Labile"> Labile
						<input type="checkbox"
						name="patientsDetails2.affect" value="Congruent / incongruent with mood"> Congruent / incongruent with mood

8.7	Perception –
<input type="checkbox"
						name="patientsDetails2.perception" value="Auditory Hallucinations"> Auditory Hallucinations
						<input type="checkbox"
						name="patientsDetails2.perception" value="Visual Hallucinations"> Visual Hallucinations
						<input type="checkbox"
						name="patientsDetails2.perception" value="Olfactory Hallucinations"> Olfactory Hallucinations
						<input type="checkbox"
						name="patientsDetails2.perception" value="Gustatory Hallucinations"> Gustatory Hallucinations
						<input type="checkbox"
						name="patientsDetails2.perception" value="Tactile Hallucinations"> Tactile Hallucinations
						<input type="checkbox"
						name="patientsDetails2.perception" value="Pseudo-hallucinations"> Pseudo-hallucinations
						<input type="checkbox"
						name="patientsDetails2.perception" value="Illusions"> Illusions
						<input type="checkbox"
						name="patientsDetails2.perception" value="Depersonalization"> Depersonalization
						<input type="checkbox"
						name="patientsDetails2.perception" value="Derealization"> Derealization
						<input type="checkbox"
						name="patientsDetails2.perception" value="Functional hallucinations/"> Functional hallucinations/
						<input type="checkbox"
						name="patientsDetails2.perceptionue="Reflex hallucinations"> Reflex hallucinations
8.7	Cognition –
Consciousness:
<input type="checkbox"
						name="patientsDetails2.consciousness" value="Alert"> Alert
						<input type="checkbox"
						name="patientsDetails2.consciousness" value="Drowsy"> Drowsy
						<input type="checkbox"
						name="patientsDetails2.consciousness" value="Stuporous"> Stuporous
						<input type="checkbox"
						name="patientsDetails2.consciousness" value="Conscious"> Conscious
						<input type="checkbox"
						name="patientsDetails2.consciousness" value="Clouding"> Clouding
						<input type="checkbox"
						name="patientsDetails2.consciousness" value="Confusion"> Confusion
						<input type="checkbox"
						name="patientsDetails2.consciousness" value="Coma / stupor"> Coma / stupor
						
	Orientation:
Time:	<input type="checkbox"
						name="patientsDetails2.time" value="Intact">Intact
						<input type="checkbox"
						name="patientsDetails2.time" value="Impaired">	Impaired	
Place:	<input type="checkbox"
						name="patientsDetails2.place" value="Intact">Intact
						<input type="checkbox"
						name="patientsDetails2.place" value="Impaired">	Impaired	
Person:	<input type="checkbox"
						name="patientsDetails2.person" value="Intact">Intact
						<input type="checkbox"
						name="patientsDetails2.person" value="Impaired">	Impaired	

Attention and concentration:
<input type="checkbox"
						name="patientsDetails2.attentionconcentration" value="Adequate">Adequate
						<input type="checkbox"
						name="patientsDetails2.attentionconcentration" value="Distractibility">Distractibility
						<input type="checkbox"
						name="patientsDetails2.attentionconcentration" value="Impaired concentration">Impaired concentration
						<input type="checkbox"
						name="patientsDetails2.attentionconcentration" value="Hypervigilance">Hypervigilance

Memory:
Immediate:
<input type="checkbox"
						name="patientsDetails2.immediate" value="Intact">Intact
						<input type="checkbox"
						name="patientsDetails2.immediate" value="Impaired">	Impaired
Recent:		<input type="checkbox"
						name="patientsDetails2.recent" value="Intact">Intact
						<input type="checkbox"
						name="patientsDetails2.recent" value="Impaired">	Impaired
Remote:		<input type="checkbox"
						name="patientsDetails2.remote" value="Intact">Intact
						<input type="checkbox"
						name="patientsDetails2.remote" value="Impaired">	Impaired
Amnesia:	<input type="checkbox"
						name="patientsDetails2.amnesia" value="Anterograde">Anterograde
						<input type="checkbox"
						name="patientsDetails2.amnesia" value="Retrograde">	Retrograde	    
						
						<input type="checkbox"
						name="patientsDetails2.memory" value="Confabulation">Confabulation
						<input type="checkbox"
						name="patientsDetails2.memory" value="Paramnesia (déjà vu, jamais vu)">Paramnesia (déjà vu, jamais vu)
						<input type="checkbox"
						name="patientsDetails2.memory" value="Hypermnesia">Hypermnesia          
Thinking:
<input type="checkbox"
						name="patientsDetails2.thinking" value="Abstract Level">Abstract Level
						<input type="checkbox"
						name="patientsDetails2.thinking" value="Concrete thinking">Concrete thinking
						<input type="checkbox"
						name="patientsDetails2.thinking" value="Impaired reasoning">Impaired reasoning
Emotion:
<input type="checkbox"
						name="patientsDetails2.emotion" value="Normal Emotional reactions">Normal Emotional reactions
						<input type="checkbox"
						name="patientsDetails2.emotion" value="Abnormal emotional reactions">Abnormal emotional reactions
						<input type="checkbox"
						name="patientsDetails2.emotion" value="Abnormal expressions of emotion">Abnormal expressions of emotion
						<input type="checkbox"
						name="patientsDetails2.emotion" value="Morbid expressions of emotion">Morbid expressions of emotion
Judgment:
Personal:		<input type="checkbox"
						name="patientsDetails2.judgementpersonal" value="Intact">Intact	<input type="checkbox"
						name="patientsDetails2.judgementpersonal" value="Impaired">	Impaired 
Social:		<input type="checkbox"
						name="patientsDetails2.judgementsocial" value="Intact">Intact
						<input type="checkbox"
						name="patientsDetails2.judgementsocial" value="Impaired">	Impaired
Test:		<input type="checkbox"
						name="patientsDetails2.judgementtest" value="Intact">Intact	<input type="checkbox"
						name="patientsDetails2.judgementtest" value="Impaired">	Impaired

8.8	Insight –
<input type="checkbox"
						name="patientsDetails2.insight" value="Level 1. Complete denial of illness
The individual totally denies being ill, even when clear symptoms or dysfunction are present. Common in psychosis or anosognosia.">
•	Level 1. Complete denial of illness
The individual totally denies being ill, even when clear symptoms or dysfunction are present. Common in psychosis or anosognosia.
<input type="checkbox"
						name="patientsDetails2.insight" value="Level 2. Slight awareness of being sick and needing help, but denying it at the same time
The person may express minor doubts or complaints but immediately dismisses the idea of needing psychiatric help.">
•	Level 2. Slight awareness of being sick and needing help, but denying it at the same time
The person may express minor doubts or complaints but immediately dismisses the idea of needing psychiatric help.

<input type="checkbox"
						name="patientsDetails2.insight" value="Level 3. Awareness of being sick but blaming it on external factors
The illness is acknowledged, but the cause is attributed to external stressors, people, or circumstances—e.g., “It’s because of my boss..">
•	Level 3. Awareness of being sick but blaming it on external factors
The illness is acknowledged, but the cause is attributed to external stressors, people, or circumstances—e.g., “It’s because of my boss.”
<input type="checkbox"
						name="patientsDetails2.insight" value="Level 4. Awareness that illness is due to something unknown in oneself
The individual admits that the problem may be internal but cannot clearly define or understand what it is.">
•	Level 4. Awareness that illness is due to something unknown in oneself
The individual admits that the problem may be internal but cannot clearly define or understand what it is.
<input type="checkbox"
						name="patientsDetails2.insight" value="Level 5. Intellectual insight
Recognizes the illness, its psychological nature, and causes, but this understanding is not integrated into emotional or behavioral change.">
•	Level 5. Intellectual insight
Recognizes the illness, its psychological nature, and causes, but this understanding is not integrated into emotional or behavioral change.

<input type="checkbox"
						name="patientsDetails2.insight" value="Level 6. True emotional insight
Full recognition and emotional acceptance of the illness, leading to meaningful change in behavior, attitude, and coping mechanisms.">
•	Level 6. True emotional insight
Full recognition and emotional acceptance of the illness, leading to meaningful change in behavior, attitude, and coping mechanisms.
Other Observations on MSE:
<input type="text"
						class="form-control" id="patientsDetails2.otherobservations"
						name="patientsDetails2.otherobservations" value="${patient.patientsDetails2.otherobservations}"> 

9.   Provisional Diagnosis:
<input type="text"
						class="form-control" id="patientsDetails2.provisionalDiagnosis"
						name="patientsDetails2.provisionalDiagnosis" value="${patient.patientsDetails2.provisionalDiagnosis}"> 
10. Psychological assessment Conducted:
<input type="text"
						class="form-control" id="patientsDetails2.psychologicalassessmentconducted"
						name="patientsDetails2.psychologicalassessmentconducted" value="${patient.patientsDetails2.psychologicalassessmentconducted}"> 
11. Psychological Report:
<input type="text"
						class="form-control" id="patientsDetails2.psychologicalreport"
						name="patientsDetails2.psychologicalreport" value="${patient.patientsDetails2.psychologicalreport}"> 
11. Management Plan:
<input type="text"
						class="form-control" id="patientsDetails2.managementplan"
						name="patientsDetails2.managementplan" value="${patient.patientsDetails2.managementplan}"> 
					
					<div class="container text-center mb-4">
						<a href="${pageContext.request.contextPath}/homePage"
							class="btn btn-primary"> HOME </a>
						<button type="submit" class="btn btn-primary">UPDATE</button>
						<a href="${pageContext.request.contextPath}/viewPatient/${patient.id}"
							class="btn btn-primary"> View </a>
						<a href="${pageContext.request.contextPath}/addSessionNotes/${patient.id}" class="btn btn-outline-success">
										Sessions </a>
					</div>

				</form>
			</div>
		</div>
	</div>

</body>
</html>