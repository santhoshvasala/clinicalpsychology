<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
      font-family: system-ui, -apple-system, Segoe UI, Roboto, Helvetica, Arial, "Noto Sans", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
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
    .col-12 { grid-column: span 12; }
    .col-6  { grid-column: span 6; }
    .col-4  { grid-column: span 4; }
    .col-3  { grid-column: span 3; }

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
      .actions { display: none; }
      .container { margin: 0; max-width: 100%; }
      form { border: none; padding: 0; }
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
  
  
  
  function calculateAge()
  {
	const dob = document.getElementById("dob").value;
	if(!dob) return;
	const dobDate = new Date(dob);
	const today = new Date();
	let age = today.getFullYear() - dobDate.getFullYear();
	const monthDiff = today.getMonth()-dobDate.getMonth();
	if(monthDiff < 0 || (monthDiff === 0 && today.getDate()<dobDate.getDate()))
	{
		age--;
	}
	document.getElementById("age").value=age;
}
  </script>
</head>
<body>
  <div class="container">
    <header>
      <h1>View Psychological Case Record</h1>
    </header>
	<c:if test="${not empty errMessage}">
    	<div style="color:red;">${errMessage}</div>
	</c:if>
	<c:if test="${not empty message}">
		<div class="alert alert-success">${message}</div>
	</c:if>
 <form aria-label="Psychological Case Record" action="${pageContext.request.contextPath}/viewPatient" method="post" id="addPatientForm">
    <button type="submit" disabled style="display: none" aria-hidden="true"></button>
    <input type="hidden" value="${patient.id}" name="id">
      <fieldset>
        <div class="grid">
           <div class="col-4">
              <label>Name : </label> ${patient.firstName}
           </div>
           <div class="col-4">
           <label>Date :</label> ${patient.createdDate}
           </div>
           <div class="col-4">
           <label>Date of Birth:</label> ${patient.dob}
           </div>
            <div class="col-4">
           <label>Age  :</label> ${patient.age}
           </div>
            <div class="col-4">
           <label>Mobile Number :</label> ${patient.clientmobile}
           </div>
            <div class="col-4">
           <label>Relative :</label> ${patient.relativemobile}
           </div>
            <div class="col-4">
           <label>Relationship Type :</label> ${patient.relationtype}
           </div>
           <div class="col-6">
           <label>Email ID: </label> 1.${patient.email1} &nbsp; 2.${patient.email2}
           </div>
            <div class="col-4">
           <label>Gender :</label> ${patient.gender}
           </div>
           <div class="col-4">
           <label>Religion :</label> ${patient.religion}
           </div>
           <div class="col-4">
           <label>Marital Status :</label> ${patient.maritalstatus}
           </div>
           <div class="col-6">
           <label>Educational Qualification :</label> ${patient.eduqualification}
           </div>
           <div class="col-6">
           <label>Occupation :</label> ${patient.occupation}
           </div>
            <div class="col-6">
           <label>Informants :</label> ${patient.informants}
           </div>
           <div class="col-6">
           <label>Address :</label> ${patient.address}
           </div>
           <div class="col-4">
           <label>Referral Source :</label> ${patient.referalsource}
           </div>
		   <div class="col-4">
           <label>Purpose of Referral: </label>   ${patient.puposeofreferral} 
           </div>
           <div class="col-4">
           <label>Place of Consultation:  </label>   ${patient.placeofconsultation} 
           </div>
           <div class="col-12">
           <label>1.1 Presenting Complaints: </label>   ${patient.patientsDetails1.presentingcomplaints}
           </div>
           <div class="col-12">
           <label>1.2 Precipitating Factors: </label>   ${patient.patientsDetails1.precipitatingfactors}
           </div>
           <div class="col-12">
           <label>1.3 Duration of Illness : </label>   ${patient.patientsDetails1.dutaionofillness}
           </div>
           <div class="col-6">
           <label>1.4	 Onset: </label>  ${patient.patientsDetails1.onset} 
           </div>
           <div class="col-6">
           <label> Course: </label>  ${patient.patientsDetails1.course}
           </div>
           <div class="col-12">
           <label>2.   Recent Treatment History: </label>  ${patient.patientsDetails1.recenttreatmenthistory}
           </div>
           <div class="col-12">
           <label>3.   Negative History: </label>  ${patient.patientsDetails1.negativehistory}
           </div>
           <div class="col-12">
           <label>4. Past History of Mental Illness&Physical Illness: </label>  ${patient.patientsDetails1.pasthistory}
           </div>
           <div class="col-12">
           <label>5. Family History:  </label>  ${patient.patientsDetails1.familyhistory}
           </div>
           <div class="col-12">
           <label>6.0 Personal History: </label>
           </div>
           <div class="col-12">
           <label>6.1 Birth & Developmental : </label> ${patient.patientsDetails1.birthdevelopment}
           </div>
           <div class="col-12">
           <label>6.2 Scholastic : </label> ${patient.patientsDetails1.scholastic}
           </div>
           <div class="col-12">
           <label>6.3 Occupational : </label> ${patient.patientsDetails1.occupational}
           </div>
           <div class="col-12">
           <label>6.4 Marital & Sexual : </label> ${patient.patientsDetails1.maritalsexual}
           </div>
           <div class="col-12">
           <label>6.5 Habits (including use of alcohol/tobacco/drug, if any) : </label> ${patient.patientsDetails1.habits}
           </div>
           <div class="col-12">
           <label>6.6 Social : </label> ${patient.patientsDetails1.social}
           </div>
						
				<div class="col-12">
           <label>    7.Personality/Adjustment Prior to Illness:</label> &nbsp; ${patient.patientsDetails1.personalityadjustment} </div>
				<div class="col-12">
           <label>	  Reliability of Information:</label> &nbsp; ${patient.patientsDetails1.reliabilityinfo} </div>
    			<div class="col-12">
           <label>	  Adequacy of Information:</label> &nbsp; ${patient.patientsDetails1.adequacyinfo} </div>
				<div class="col-12">
           <label>	8. Mental Status: </label></div>
					   <div class="col-12">
           <label> 8.1 Appearance –</label> </div>
							<div class="col-12">
           <label>  General build:</label>&nbsp; ${patient.patientsDetails2.generalbuild} </div>
		  					<div class="col-12">
           <label>	 Grooming & hygiene:</label>&nbsp; ${patient.patientsDetails2.grooming}</div>
							<div class="col-12">
           <label>	 Dress:</label> &nbsp; ${patient.patientsDetails2.dress}  </div>
							<div class="col-12">
           <label>	 Facial expression:</label> &nbsp; ${patient.patientsDetails2.facialexpression} </div>					
							<div class="col-12">
           <label>  Eye contact: </label> &nbsp; ${patient.patientsDetails2.eycontact} </div>
							<div class="col-12">
           <label> Age-appropriateness: </label> &nbsp;Appears stated age or not </div>
							<div class="col-12">
           <label>  Notable physical features:</label> &nbsp; ${patient.patientsDetails2.notablephysicalfeatures} </div>						 
							<div class="col-12">
           <label>  Posture: </label> &nbsp; ${patient.patientsDetails2.posture} </div>
						<div class="col-12">
           <label>	8.2 Movement and Behavior–</label> </div>
							<div class="col-12">
           <label>  Increased activity: </label> &nbsp; ${patient.patientsDetails2.increasedactivity} </div>
							<div class="col-12">
           <label>  Decreased activity: </label>&nbsp; ${patient.patientsDetails2.decreasedactivity} </div>
							<div class="col-12">
           <label>  Abnormal movements: </label>&nbsp; ${patient.patientsDetails2.abnormalmovements} </div>
						<div class="col-12">
           <label> 8.3 Speech – </label></div>
							<div class="col-12">
           <label>  Quantity: </label>&nbsp; ${patient.patientsDetails2.quantity} </div>
							<div class="col-12">
           <label>  Rate and rhythm: </label> &nbsp; ${patient.patientsDetails2.rateandrhythm} </div>
							<div class="col-12">
           <label>  Form and structure: </label>&nbsp; ${patient.patientsDetails2.formandstructure} </div>
						<div class="col-12">
           <label> 8.4 Thought – </label></div>
							<div class="col-12">
           <label>  Disorders of stream: </label>&nbsp; ${patient.patientsDetails2.disorderofstream} </div>
							<div class="col-12">
           <label>	 Disorders of form: </label>&nbsp; ${patient.patientsDetails2.disorderofform} </div>
							<div class="col-12">
           <label>	 Content of Thought: </label>&nbsp; ${patient.patientsDetails2.contentofthought} </div>
							<div class="col-12">
           <label>  Possession of Thought: </label>&nbsp; ${patient.patientsDetails2.possessionofthought} </div>
						<div class="col-12">
           <label> 8.5	Mood and Affect – </label></div>
							<div class="col-12">
           <label>  Mood (subjective): </label>&nbsp; ${patient.patientsDetails2.mood}</div>
							<div class="col-12">
           <label>	 Affect (objective):</label> &nbsp; ${patient.patientsDetails2.affect}</div>
						<div class="col-12">
           <label> 8.6	Perception – </label> &nbsp; ${patient.patientsDetails2.perception} </div>
						<div class="col-12">
           <label> 8.7	Cognition – </label> </div>
							<div class="col-12">
           <label>  Consciousness: </label>&nbsp; ${patient.patientsDetails2.consciousness} </div>						
							<div class="col-12">
           <label>	 Orientation: </label></div>
								 &nbsp;&nbsp;<b>  Time:	</b>&nbsp; ${patient.patientsDetails2.time} 
								 &nbsp;&nbsp;<b>  Place:	</b>&nbsp; ${patient.patientsDetails2.place}	 
								 &nbsp;&nbsp;<b>  Person:	</b>&nbsp; ${patient.patientsDetails2.person} 
							<div class="col-6">
           <label>  Attention and concentration: </label>&nbsp; ${patient.patientsDetails2.attentionconcentration} </div>
							<div class="col-12">
           <label>  Memory: </label></div>
								 &nbsp;&nbsp;<b>  Immediate: </b>&nbsp; ${patient.patientsDetails2.immediate} <div></div>
								 &nbsp;&nbsp;<b>  Recent:	</b>&nbsp; ${patient.patientsDetails2.recent} <div></div>
								 &nbsp;&nbsp;<b>  Remote:	</b>&nbsp; ${patient.patientsDetails2.remote} <div></div>
								 &nbsp;&nbsp;<b>  Amnesia:	</b>&nbsp; ${patient.patientsDetails2.amnesia}  <div></div>						
								&nbsp; ${patient.patientsDetails2.memory}   <div></div>      
						<div class="col-12">
           <label>  Thinking: </label>	&nbsp; ${patient.patientsDetails2.thinking} </div>
							<div class="col-12">
           <label>  Emotion: </label> &nbsp; ${patient.patientsDetails2.emotion}</div>
							<div class="col-12">
           <label>  Judgment: </label> </div>
								<b>  Personal:</b>&nbsp; ${patient.patientsDetails2.judgementpersonal} <div></div>
								<b>  Social:</b>&nbsp; ${patient.patientsDetails2.judgementsocial} <div></div>
								<b>  Test: </b>&nbsp; ${patient.patientsDetails2.judgementtest} <div></div>								
						<div class="col-12">
           <label> 8.8	Insight –</label> &nbsp; ${patient.patientsDetails2.insight} 
								<label>  Other Observations on MSE: </label>&nbsp; ${patient.patientsDetails2.otherobservations} </div>
						<div class="col-12">
           <label> 9.  Provisional Diagnosis: </label>	&nbsp; ${patient.patientsDetails2.provisionalDiagnosis} </div>
						<div class="col-12">
           <label> 10. Psychological assessment Conducted: </label>&nbsp; ${patient.patientsDetails2.psychologicalassessmentconducted} </div>
						<div class="col-12">
           <label> 11. Psychological Report:</label> &nbsp; ${patient.patientsDetails2.psychologicalreport}  </div>
						<div class="col-12">
           <label> 12. Management Plan:</label> &nbsp; ${patient.patientsDetails2.managementplan} </div>
						<div class="col-12">
           <label> Sessions :</label>
							<c:forEach var="frm" items="${sessions}">
								<table>
									<tr>
										<td style="width:350px"> Date: ${frm.sessionoccuredon}</td>
										<td style="width:750px"> Session Notes : ${frm.sessionnote}</td>
									</tr>
								</table>
							</c:forEach>
						</div>					
					</div>
					</fieldset>
					<div align="center">
						<a href="${pageContext.request.contextPath}/homePage"
							class="btn btn-primary"> HOME </a> &nbsp;
						<a href="${pageContext.request.contextPath}/updatePatient/${patient.id}" class="btn btn-primary"> Update Patient Details</a>
					</div>
				</form>
			</div>
</body>
</html>