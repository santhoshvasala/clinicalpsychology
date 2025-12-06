<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<style><%@include file="./styles.css"%>
textarea {
      width: 100%;
      padding: 0.6rem 0.7rem;
      border-radius: 8px;
      font-size: 0.95rem;
      background: #fff;
    }

</style>
<meta charset="UTF-8">
<%@include file="./base.jsp"%>
</head>
<body>

	<div class="container mt-2 bg-light">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<h1 class="text-center mb-3 mt-4">Psychological Case Record</h1>
				<c:if test="${not empty requestScope.message}">
    							<div class="alert alert-success">${requestScope.message}</div>
							</c:if>
				<form action="handleAddPatient" method="post">
					<button type="submit" disabled style="display: none" aria-hidden="true"></button>

					<b>Name:</b>&nbsp;&nbsp;<input type="text" id="firstName" name="firstName"
						>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>Date</b> &nbsp;&nbsp;<input type="date"
						name="createdDate" id="createdDate" />
					<div></div>
					<b>Date of Birth:</b>&nbsp; <input type="date" id="dob" name="dob">&nbsp;&nbsp;&nbsp;<b>Age:</b> &nbsp;
					<input type="number" min="0" inputmode="numeric" id="age" name="age">
					<div></div>
					<b>Mobile Number:</b> &nbsp;
					<div></div>
					<b>Client</b> <input type="text" id="clientmobile" name="clientmobile">
					<div></div>
					<b>Relative:</b> <input type="text" id="relativemobile"
						name="relativemobile">
					<div></div>
					<b>Relationship Type</b><input type="text" id="relationtype"
						name="relationtype">
					<div></div>
					<b>Email ID: 1.</b>&nbsp; <input type="text" id="email1"
						name="email1">&nbsp; <b>2.</b>&nbsp;<input type="text" 
						id="email2" name="email2">
						<div/>
						<b> Gender: </b>&nbsp; <select name="gender">
						<!-- <option value="Male">Male</option>
						<option value="female">Female</option> -->
						<c:forEach items="${genders}" var="gen">
						<option value="${gen.gendertype}">${gen.gendertype}</option>
						</c:forEach>
					</select> &nbsp;<b>, Religion:</b> &nbsp;<select name="religion">
						<c:forEach items="${religions}" var="rel">
						<option value="${rel.religionval}">${rel.religionval}</option>
						</c:forEach>
					</select>&nbsp;<b>,Marital Status: </b> &nbsp;<select name="maritalstatus">
						<!-- <option value="Married">Married</option>
						<option value="UnMarried">UnMarried</option>
						<option value="Widow">Widow</option> -->
						<c:forEach items="${maritalStatuslist}" var="mstatus">
						<option value="${mstatus.maritalStatusVal}">${mstatus.maritalStatusVal}</option>
						</c:forEach>
					</select>&nbsp;<b> Educational Qualification: </b>&nbsp; <select name="eduqualification">
						<!-- <option value="10th">10th</option>
						<option value="Graduate">Graduate</option>
						<option value="Post Graduate">Post Graduate</option> -->
						<c:forEach items="${educations}" var="educate">
						<option value="${educate.educationDet}">${educate.educationDet}</option>
						</c:forEach>
					</select>
					<div/>
					<b> Occupation: </b> &nbsp;<select name="occupation">
						<!-- <option value="self employed">self employed</option>
						<option value="govt job">govt job</option> -->
						<c:forEach items="${occupations}" var="occup">
						<option value="${occup.occupationDet}">${occup.occupationDet}</option>
						</c:forEach>
					</select>
					&nbsp;<b> 
					<div/>Informants: </b> <!-- &nbsp;<input type="text" class="form-control"
						id="informants" name="informants"> -->
						<textarea id="informants" name="informants" placeholder=""></textarea>
						
						
						<b>Address:</b>   &nbsp;<textarea  id="address" name="address"></textarea>
					<b>Referral Source: </b> &nbsp;<select name="referalsource" >
					
					<c:forEach items="${referrels}" var="reff">
						<option value="${reff.referralSourceVal}">${reff.referralSourceVal}</option>
						</c:forEach>
					</select>&nbsp; <b>Purpose of Referral: </b>  &nbsp;<select name="puposeofreferral">
						<!-- <option value="consultation">consultation</option>
						<option value="sessions">sessions</option> -->
						<c:forEach items="${purposelist}" var="purp">
						<option value="${purp.purposeVal}">${purp.purposeVal}</option>
						</c:forEach>
					</select> &nbsp; <div/><b>Place of Consultation: </b> &nbsp;<select name="placeofconsultation">
					<c:forEach items="${places}" var="placelist">
						<option value="${placelist.consPlace}">${placelist.consPlace}</option>
						</c:forEach>
						<!-- <option value="Hyderabad">Hyderabad</option>
						<option value="Karimnagar">Karimnagar</option>
						<option value="Warangal">Warangal</option> -->
					</select>
					<div></div>

					1.1 Presenting Complaints:<input type="text" class="form-control"
						id="patientsDetails1.presentingcomplaints"
						name="patientsDetails1.presentingcomplaints"> 1.2
					Precipitating Factors: <input type="text" class="form-control"
						id="patientsDetails1.precipitatingfactors"
						name="patientsDetails1.precipitatingfactors"> 1.3 Duration
					of Illness: <input type="text" class="form-control"
						id="patientsDetails1.dutaionofillness"
						name="patientsDetails1.dutaionofillness"> Onset: <input
						type="checkbox" name="patientsDetails1.onset" value="Acute">Acute
					<input type="checkbox" name="patientsDetails1.onset"
						value="Insidious">Insidious Course: <input type="checkbox"
						name="patientsDetails1.course" value="Continuous">Continuous
					<input type="checkbox" name="patientsDetails1.course"
						value="Episodic">Episodic </br>
						2. Recent Treatment History: <input
						type="text" class="form-control"
						id="patientsDetails1.recenttreatmenthistory"
						name="patientsDetails1.recenttreatmenthistory"> 3.
					Negative History: <input type="text" class="form-control"
						id="patientsDetails1.negativehistory"
						name="patientsDetails1.negativehistory"> 4. Past History
					of Mental Illness&Physical Illness: <input type="text"
						class="form-control" id="patientsDetails1.pasthistory"
						name="patientsDetails1.pasthistory"> 5. Family History: <input
						type="text" class="form-control"
						id="patientsDetails1.familyhistory"
						name="patientsDetails1.familyhistory"> 6.0 Personal
					History: 6.1 Birth & Developmental – <input type="text"
						class="form-control" id="patientsDetails1.birthdevelopment"
						name="patientsDetails1.birthdevelopment"> 6.2 Scholastic –
					<input type="text" class="form-control"
						id="patientsDetails1.scholastic"
						name="patientsDetails1.scholastic"> 6.3 Occupational – <input
						type="text" class="form-control"
						id="patientsDetails1.occupational"
						name="patientsDetails1.occupational"> 6.4 Marital & Sexual
					– <input type="text" class="form-control"
						id="patientsDetails1.maritalsexual"
						name="patientsDetails1.maritalsexual"> 6.5 Habits
					(including use of alcohol/tobacco/drug, if any) – <input
						type="text" class="form-control" id="patientsDetails1.habits"
						name="patientsDetails1.habits"> 6.6 Social – <input
						type="text" class="form-control" id="patientsDetails1.social"
						name="patientsDetails1.social"> </br>7.Personality/Adjustment
					Prior to Illness: <input type="text" class="form-control"
						id="patientsDetails1.personalityadjustment"
						name="patientsDetails1.personalityadjustment"> Reliability
					of Information: <input type="checkbox"
						name="patientsDetails1.reliabilityinfo" value="Reliable">Reliable
					<input type="checkbox" name="patientsDetails1.reliabilityinfo"
						value="Partially Reliable">Partially Reliable <input
						type="checkbox" name="patientsDetails1.reliabilityinfo"
						value="Unreliable">Unreliable
					<div />
					Adequacy of Information: <input type="checkbox"
						name="patientsDetails1.adequacyinfo" value="Adequate">
					Adequate <input type="checkbox"
						name="patientsDetails1.adequacyinfo" value="Inadequate">Inadequate</br>
8. Mental Status:</br>
8.1 Appearance –</br>
General build:
<input type="checkbox"
						name="patientsDetails2.generalbuild" value="Thin"> Thin 
						<input type="checkbox"
						name="patientsDetails2.generalbuild" value="Obese"> Obese
						<input type="checkbox"
						name="patientsDetails2.generalbuild" value="well-nourished"> well-nourished
						<input type="checkbox"
						name="patientsDetails2.generalbuild" value="frail"> frail </br>
<div/>
Grooming & hygiene: </br>
<input type="checkbox"
						name="patientsDetails2.grooming" value="Clean"> Clean 
						<input type="checkbox"
						name="patientsDetails2.grooming" value="well-groomed"> well-groomed 
						<input type="checkbox"
						name="patientsDetails2.grooming" value="disheveled"> disheveled 
						<input type="checkbox"
						name="patientsDetails2.grooming" value="neglected"> neglected 
						<div/> </br>
Dress: 
						<input type="checkbox"
						name="patientsDetails2.dress" value="Appropriate"> Appropriate 
						<input type="checkbox"
						name="patientsDetails2.dress" value="Inappropriate"> Inappropriate   </br>
						<div/>
Facial expression: 
<input type="checkbox"
						name="patientsDetails2.facialexpression" value="Anxious"> Anxious
						<input type="checkbox"
						name="patientsDetails2.facialexpression" value="Sad"> Sad
						<input type="checkbox"
						name="patientsDetails2.facialexpression" value="Blunted"> Blunted
						<input type="checkbox"
						name="patientsDetails2.facialexpression" value="Suspicious"> Suspicious
						<input type="checkbox"
						name="patientsDetails2.facialexpression" value="Smiling inappropriately"> Smiling inappropriately</br>
						
<div/>Eye contact: 
<input type="checkbox"
						name="patientsDetails2.eycontact" value="Good"> Good
						<input type="checkbox"
						name="patientsDetails2.eycontact" value="fleeting"> fleeting
						<input type="checkbox"
						name="patientsDetails2.eycontact" value="avoidant"> avoidant
						<input type="checkbox"
						name="patientsDetails2.eycontact" value="piercing"> piercing </br>
<div/>
Age-appropriateness: piercingAppears stated age or not  </br>
Notable physical features: 
<input type="checkbox"
						name="patientsDetails2.notablephysicalfeatures" value="Scars"> Scars
						<input type="checkbox"
						name="patientsDetails2.notablephysicalfeatures" value="tattoos"> tattoos
						<input type="checkbox"
						name="patientsDetails2.notablephysicalfeatures" value="signs of self-harm"> signs of self-harm
						<input type="checkbox"
						name="patientsDetails2.notablephysicalfeatures" value="tremors"> tremors <div/> </br>
						  
Posture:
<input type="checkbox"
						name="patientsDetails2.posture" value="Upright"> Upright
						<input type="checkbox"
						name="patientsDetails2.posture" value="slouched"> slouched
						<input type="checkbox"
						name="patientsDetails2.posture" value="tense"> tense
						<input type="checkbox"
						name="patientsDetails2.posture" value="rigid"> rigid<div/> </br>

	8.2 Movement and Behavior– </br>
Increased activity:
<input type="checkbox"
						name="patientsDetails2.increasedactivity" value="Psychomotor agitation"> Psychomotor agitation
						<input type="checkbox"
						name="patientsDetails2.increasedactivity" value="Hyperactivity"> Hyperactivity
						<input type="checkbox"
						name="patientsDetails2.increasedactivity" value="Akathisia"> Akathisia
						<input type="checkbox"
						name="patientsDetails2.increasedactivity" value="Restlessness"> Restlessness
						<input type="checkbox"
						name="patientsDetails2.increasedactivity" value="Impulsivity"> Impulsivity </br>

Decreased activity:
<input type="checkbox"
						name="patientsDetails2.decreasedactivity" value="Psychomotor retardation"> Psychomotor retardation
						<input type="checkbox"
						name="patientsDetails2.decreasedactivity" value="Stupor"> Stupor
						<input type="checkbox"
						name="patientsDetails2.decreasedactivity" value="Mutism"> Mutism
						<input type="checkbox"
						name="patientsDetails2.decreasedactivity" value="Inertia"> Inertia
						<input type="checkbox"
						name="patientsDetails2.decreasedactivity" value="Negativism"> Negativism <div/> </br>

Abnormal movements:
<input type="checkbox"
						name="patientsDetails2.abnormalmovements" value="Catatonia"> Catatonia
						<input type="checkbox"
						name="patientsDetails2.abnormalmovements" value="waxy flexibility"> waxy flexibility
						<input type="checkbox"
						name="patientsDetails2.abnormalmovements" value="posturing"> posturing
						<input type="checkbox"
						name="patientsDetails2.abnormalmovements" value="stereotypy"> stereotypy
						<input type="checkbox"
						name="patientsDetails2.abnormalmovements" value="Echopraxia"> Echopraxia
						<input type="checkbox"
						name="patientsDetails2.abnormalmovements" value="Tics"> Tics
						<input type="checkbox"
						name="patientsDetails2.abnormalmovements" value="Mannerisms"> Mannerisms
						<input type="checkbox"
						name="patientsDetails2.abnormalmovements" value="Stereotypies"> Stereotypies
						<input type="checkbox"
						name="patientsDetails2.abnormalmovements" value="Automatism"> Automatism
						<input type="checkbox"
						name="patientsDetails2.abnormalmovements" value="Compulsions"> Compulsions
						<input type="checkbox"
						name="patientsDetails2.abnormalmovements" value="Grimacing"> Grimacing
						<input type="checkbox"
						name="patientsDetails2.abnormalmovements" value="Gait disturbances"> Gait disturbances  </br>
<div/>
8.3 Speech – </br>
Quantity:
<input type="radio"
						name="patientsDetails2.quantity" value="Tempo (high/moderate/low)"> Tempo (high/moderate/low)
						<input type="radio"
						name="patientsDetails2.quantity" value="Volume (high/moderate/ low)"> Volume (high/moderate/ low)
						<input type="radio"
						name="patientsDetails2.quantity" value="Pressure of speech"> Pressure of speech
						<input type="radio"
						name="patientsDetails2.quantity" value="Poverty of speech"> Poverty of speech
						<input type="radio"
						name="patientsDetails2.quantity" value="Mutism"> Mutism
						<input type="radio"
						name="patientsDetails2.quantity" value="Monosyllabic replies"> Monosyllabic replies
						<input type="radio"
						name="patientsDetails2.quantity" value="Verbosity"> Verbosity  </br>

Rate and rhythm:
<input type="checkbox"
						name="patientsDetails2.rateandrhythm" value="Pressured speech"> Pressured speech
						<input type="checkbox"
						name="patientsDetails2.rateandrhythm" value="Retardation"> Retardation
						<input type="checkbox"
						name="patientsDetails2.rateandrhythm" value="Hesitant speech"> Hesitant speech
						<input type="checkbox"
						name="patientsDetails2.rateandrhythm" value="Stuttering / stammering"> Stuttering / stammering
						<input type="checkbox"
						name="patientsDetails2.rateandrhythm" value="Cluttering"> Cluttering  </br>

Form and structure:
<input type="checkbox"
						name="patientsDetails2.formandstructure" value="Neologisms"> Neologisms
						<input type="checkbox"
						name="patientsDetails2.formandstructure" value="Talking past the point (Vorbeireden)"> Talking past the point (Vorbeireden)
						<input type="checkbox"
						name="patientsDetails2.formandstructure" value="Aphasia (receptive/intermediate/expressive)"> Aphasia (receptive/intermediate/expressive)
						<input type="checkbox"
						name="patientsDetails2.formandstructure" value="Word salad"> Word salad
						<input type="checkbox"
						name="patientsDetails2.formandstructure" value="Clang associations"> Clang associations
						<input type="checkbox"
						name="patientsDetails2.formandstructure" value="Echolalia"> Echolalia
						<input type="checkbox"
						name="patientsDetails2.formandstructure" value="Perseveration"> Perseveration
						<input type="checkbox"
						name="patientsDetails2.formandstructure" value="Flight of ideas"> Flight of ideas
						<input type="checkbox"
						name="patientsDetails2.formandstructure" value="Incoherence"> Incoherence
						<input type="checkbox"
						name="patientsDetails2.formandstructure" value="Derailment"> Derailment
						<input type="checkbox"
						name="patientsDetails2.formandstructure" value="Cluttering"> Cluttering  </br>
 
8.4 Thought – </br>
Disorders of stream: </br>
<input type="checkbox"
						name="patientsDetails2.disorderofstream" value="Flight of ideas"> Flight of ideas
						<input type="checkbox"
						name="patientsDetails2.disorderofstream" value="Thought blocking"> Thought blocking
						<input type="checkbox"
						name="patientsDetails2.disorderofstream" value="Inhibited / Slowing of thinking"> Inhibited / Slowing of thinking
						<input type="checkbox"
						name="patientsDetails2.disorderofstream" value="Pressure of thought"> Pressure of thought
						<input type="checkbox"
						name="patientsDetails2.disorderofstream" value="perseveration"> perseveration<div/> </br>
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
						name="patientsDetails2.disorderofform" value="Thought fragmentation"> Thought fragmentation </br>
	Content of Thought:
	<input type="checkbox"
						name="patientsDetails2.contentofthought" value="Obsessions& compulsions"> Obsessions& compulsions
						<input type="text" id="contentofthought "
						name="contentofthought"> </br>
	<input type="checkbox"
						name="patientsDetails2.contentofthought" value="Thought alienation"> Thought alienation
						<input type="text" id="thoughtalienation "
						name="thoughtalienation"> </br>
	<input type="checkbox"
						name="patientsDetails2.contentofthought" value="Delusions (primary and secondary; persecutory, grandiose, referential, guilt, poverty, infidelity, love, illhealth, nihilisticetc.)"> Delusions (primary and secondary; persecutory, grandiose, referential, guilt, poverty, infidelity, love, illhealth, nihilisticetc.)
						<input type="text" id="delusionstext"
						name="delusionstext">  </br>
	<input type="checkbox"
						name="patientsDetails2.contentofthought" value="Overvalued ideas"> Overvalued ideas
						<input type="text" id="overvaluedideastext"
						name="overvaluedideastext">  </br>
	<input type="checkbox"
						name="patientsDetails2.contentofthought" value="Phobias"> Phobias
						<input type="text" id="phobiastext"
						name="phobiastext"> </br>
	<input type="checkbox"
						name="patientsDetails2.contentofthought" value="Overvalued ideas"> Overvalued ideas
						<input type="text" id="overvaluedideastext"
						name="overvaluedideastext"> </br>
	<input type="checkbox"
						name="patientsDetails2.contentofthought" value="Depressive Cognitions (hopelessness, helplessness, worthlessness):"> Depressive Cognitions (hopelessness, helplessness, worthlessness):
						<input type="text" id="deressivecongnitionstext"
						name="deressivecongnitionstext">		 </br>	
		<input type="checkbox"
						name="patientsDetails2.contentofthought" value="Guilt"> Guilt
						<input type="text" id="guilttext"
						name="guilttext"> </br>
		<input type="checkbox"
						name="patientsDetails2.contentofthought" value="Worries"> Worries
						<input type="text" id="worriestext"
						name="worriestext">	 </br>
			<input type="checkbox"
						name="patientsDetails2.contentofthought" value="Catastrophic"> Catastrophic
						<input type="text" id="catastrophictext"
						name="catastrophictext">	</br>
		<input type="checkbox"
						name="patientsDetails2.contentofthought" value="Suicidal"> Suicidal
						<input type="text" id="suicidaltext"
						name="suicidaltext">	 </br>
		<input type="checkbox"
						name="patientsDetails2.contentofthought" value="homicidal ideation"> homicidal ideation
						<input type="text" id="homicidalideationtext"
						name="homicidalideationtext">	 </br>
		<input type="checkbox"
						name="patientsDetails2.contentofthought" value="Magical thinking"> Magical thinking
						<input type="text" id="magicalthinkingtext"
						name="magicalthinkingtext">		</br>																																								
		<input type="checkbox"
						name="patientsDetails2.contentofthought" value="Ideas of reference"> Ideas of reference
						<input type="text" id="ideasofreferencetext"
						name="ideasofreferencetext">	</br>
		<input type="checkbox"
						name="patientsDetails2.contentofthought" value="Persecutory ideas"> Persecutory ideas
						<input type="text" id="persecutoryidastext"
						name="persecutoryidastext">	 </br>


Possession of Thought: </br>
<input type="checkbox"
						name="patientsDetails2.possessionofthought" value="Thought insertion"> Thought insertion </br>
						<input type="checkbox"
						name="patientsDetails2.possessionofthought" value="Thought withdrawal"> Thought withdrawal</br>
						<input type="checkbox"
						name="patientsDetails2.possessionofthought" value="Thought broadcasting"> Thought broadcasting </br>
						<input type="checkbox"
						name="patientsDetails2.possessionofthought" value="Thought echo"> Thought echo </br>

8.5	Mood and Affect – </br>
Mood (subjective): </br>
<input type="checkbox"
						name="patientsDetails2.mood" value="Depressive"> Depressive </br>
						<input type="checkbox"
						name="patientsDetails2.mood" value="Elated / euphoric"> Elated / euphoric </br>
						<input type="checkbox"
						name="patientsDetails2.mood" value="Anxious"> Thught echo </br>
						<input type="checkbox"
						name="patientsDetails2.mood" value="Irritable"> Irritable </br>
						<input type="checkbox"
						name="patientsDetails2.mood" value="Apathy"> Apathy </br>
						<input type="checkbox" 
						name="patientsDetails2.mood" value="Fearful"> Fearful </br>
						<input type="checkbox"
						name="patientsDetails2.mood" value="DysphoriaLability"> DysphoriaLability </br>

Affect (objective): </br>
<input type="checkbox"
						name="patientsDetails2.affect" value="Blunted"> Blunted </br>
						<input type="checkbox"
						name="patientsDetails2.affect" value="Flat"> Flat </br>
						<input type="checkbox"
						name="patientsDetails2.affect" value="Inappropriate"> Inappropriate </br>
						<input type="checkbox"
						name="patientsDetails2.affect" value="Restricted"> Restricted </br>
						<input type="checkbox"
						name="patientsDetails2.affect" value="Labile"> Labile </br>
						<input type="checkbox"
						name="patientsDetails2.affect" value="Congruent / incongruent with mood"> Congruent / incongruent with mood </br>

8.7	Perception – </br>
<input type="checkbox"
						name="patientsDetails2.perception" value="Auditory Hallucinations"> Auditory Hallucinations </br>
						<input type="checkbox"
						name="patientsDetails2.perception" value="Visual Hallucinations"> Visual Hallucinations </br>
						<input type="checkbox"
						name="patientsDetails2.perception" value="Olfactory Hallucinations"> Olfactory Hallucinations </br>
						<input type="checkbox"
						name="patientsDetails2.perception" value="Gustatory Hallucinations"> Gustatory Hallucinations </br>
						<input type="checkbox"
						name="patientsDetails2.perception" value="Tactile Hallucinations"> Tactile Hallucinations </br>
						<input type="checkbox"
						name="patientsDetails2.perception" value="Pseudo-hallucinations"> Pseudo-hallucinations </br>
						<input type="checkbox"
						name="patientsDetails2.perception" value="Illusions"> Illusions </br>
						<input type="checkbox"
						name="patientsDetails2.perception" value="Depersonalization"> Depersonalization </br>
						<input type="checkbox"
						name="patientsDetails2.perception" value="Derealization"> Derealization </br>
						<input type="checkbox"
						name="patientsDetails2.perception" value="Functional hallucinations/"> Functional hallucinations/ </br>
						<input type="checkbox"
						name="patientsDetails2.perceptionue="Reflex hallucinations"> Reflex hallucinations </br>
8.7	Cognition – </br>
Consciousness: </br>
<input type="checkbox"
						name="patientsDetails2.consciousness" value="Alert"> Alert </br>
						<input type="checkbox"
						name="patientsDetails2.consciousness" value="Drowsy"> Drowsy </br>
						<input type="checkbox"
						name="patientsDetails2.consciousness" value="Stuporous"> Stuporous </br>
						<input type="checkbox"
						name="patientsDetails2.consciousness" value="Conscious"> Conscious </br>
						<input type="checkbox"
						name="patientsDetails2.consciousness" value="Clouding"> Clouding </br>
						<input type="checkbox"
						name="patientsDetails2.consciousness" value="Confusion"> Confusion </br>
						<input type="checkbox"
						name="patientsDetails2.consciousness" value="Coma / stupor"> Coma / stupor </br>
						
	Orientation: </br>
Time:	<input type="checkbox"
						name="patientsDetails2.time" value="Intact">Intact 
						<input type="checkbox"
						name="patientsDetails2.time" value="Impaired">	Impaired	 </br>
Place:	<input type="checkbox"
						name="patientsDetails2.place" value="Intact">Intact
						<input type="checkbox"
						name="patientsDetails2.place" value="Impaired">	Impaired	 </br>
Person:	<input type="checkbox"
						name="patientsDetails2.person" value="Intact">Intact
						<input type="checkbox"
						name="patientsDetails2.person" value="Impaired">	Impaired	 </br>

Attention and concentration: </br>
<input type="checkbox"
						name="patientsDetails2.attentionconcentration" value="Adequate">Adequate </br>
						<input type="checkbox"
						name="patientsDetails2.attentionconcentration" value="Distractibility">Distractibility </br>
						<input type="checkbox"
						name="patientsDetails2.attentionconcentration" value="Impaired concentration">Impaired concentration </br>
						<input type="checkbox"
						name="patientsDetails2.attentionconcentration" value="Hypervigilance">Hypervigilance </br>

Memory:</br>
Immediate: 
<input type="checkbox"
						name="patientsDetails2.immediate" value="Intact">Intact 
						<input type="checkbox"
						name="patientsDetails2.immediate" value="Impaired">	Impaired </br>
Recent:		<input type="checkbox"
						name="patientsDetails2.recent" value="Intact">Intact 
						<input type="checkbox"
						name="patientsDetails2.recent" value="Impaired">	Impaired </br>
Remote:		<input type="checkbox"
						name="patientsDetails2.remote" value="Intact">Intact 
						<input type="checkbox"
						name="patientsDetails2.remote" value="Impaired">	Impaired </br>
Amnesia:	<input type="checkbox"
						name="patientsDetails2.amnesia" value="Anterograde">Anterograde 
						<input type="checkbox"
						name="patientsDetails2.amnesia" value="Retrograde">	Retrograde	    </br>
						
						<input type="checkbox"
						name="patientsDetails2.memory" value="Confabulation">Confabulation </br>
						<input type="checkbox"
						name="patientsDetails2.memory" value="Paramnesia (déjà vu, jamais vu)">Paramnesia (déjà vu, jamais vu) </br>
						<input type="checkbox"
						name="patientsDetails2.memory" value="Hypermnesia">Hypermnesia   </br>        
Thinking: </br>
<input type="checkbox"
						name="patientsDetails2.thinking" value="Abstract Level">Abstract Level </br>
						<input type="checkbox"
						name="patientsDetails2.thinking" value="Concrete thinking">Concrete thinking </br>
						<input type="checkbox"
						name="patientsDetails2.thinking" value="Impaired reasoning">Impaired reasoning </br>
Emotion: </br>
<input type="checkbox"
						name="patientsDetails2.emotion" value="Normal Emotional reactions">Normal Emotional reactions </br>
						<input type="checkbox"
						name="patientsDetails2.emotion" value="Abnormal emotional reactions">Abnormal emotional reactions </br>
						<input type="checkbox"
						name="patientsDetails2.emotion" value="Abnormal expressions of emotion">Abnormal expressions of emotion </br>
						<input type="checkbox"
						name="patientsDetails2.emotion" value="Morbid expressions of emotion">Morbid expressions of emotion </br>
Judgment: </br>
Personal:		<input type="checkbox"
						name="patientsDetails2.judgementpersonal" value="Intact">Intact	<input type="checkbox"
						name="patientsDetails2.judgementpersonal" value="Impaired">	Impaired  </br>
Social:		<input type="checkbox"
						name="patientsDetails2.judgementsocial" value="Intact">Intact
						<input type="checkbox"
						name="patientsDetails2.judgementsocial" value="Impaired">	Impaired </br>
Test:		<input type="checkbox"
						name="patientsDetails2.judgementtest" value="Intact">Intact	<input type="checkbox"
						name="patientsDetails2.judgementtest" value="Impaired">	Impaired </br>

8.8	Insight – </br>
<input type="checkbox"
						name="patientsDetails2.insight" value="Level 1. Complete denial of illness
The individual totally denies being ill, even when clear symptoms or dysfunction are present. Common in psychosis or anosognosia."> 
•	Level 1. Complete denial of illness
The individual totally denies being ill, even when clear symptoms or dysfunction are present. Common in psychosis or anosognosia. </br>
<input type="checkbox"
						name="patientsDetails2.insight" value="Level 2. Slight awareness of being sick and needing help, but denying it at the same time
The person may express minor doubts or complaints but immediately dismisses the idea of needing psychiatric help.">
•	Level 2. Slight awareness of being sick and needing help, but denying it at the same time
The person may express minor doubts or complaints but immediately dismisses the idea of needing psychiatric help. </br>

<input type="checkbox"
						name="patientsDetails2.insight" value="Level 3. Awareness of being sick but blaming it on external factors
The illness is acknowledged, but the cause is attributed to external stressors, people, or circumstances—e.g., “It’s because of my boss..">
•	Level 3. Awareness of being sick but blaming it on external factors
The illness is acknowledged, but the cause is attributed to external stressors, people, or circumstances—e.g., “It’s because of my boss.” </br>
<input type="checkbox"
						name="patientsDetails2.insight" value="Level 4. Awareness that illness is due to something unknown in oneself
The individual admits that the problem may be internal but cannot clearly define or understand what it is.">
•	Level 4. Awareness that illness is due to something unknown in oneself
The individual admits that the problem may be internal but cannot clearly define or understand what it is. </br>
<input type="checkbox"
						name="patientsDetails2.insight" value="Level 5. Intellectual insight
Recognizes the illness, its psychological nature, and causes, but this understanding is not integrated into emotional or behavioral change.">
•	Level 5. Intellectual insight
Recognizes the illness, its psychological nature, and causes, but this understanding is not integrated into emotional or behavioral change. </br>

<input type="checkbox"
						name="patientsDetails2.insight" value="Level 6. True emotional insight
Full recognition and emotional acceptance of the illness, leading to meaningful change in behavior, attitude, and coping mechanisms.">
•	Level 6. True emotional insight
Full recognition and emotional acceptance of the illness, leading to meaningful change in behavior, attitude, and coping mechanisms. </br>
Other Observations on MSE: </br>
<input type="text"
						class="form-control" id="patientsDetails2.otherobservations"
						name="patientsDetails2.otherobservations">  </br>

9.   Diagnosis:
<input type="text"
						class="form-control" id="patientsDetails2.provisionalDiagnosis"
						name="patientsDetails2.provisionalDiagnosis">  </br>
10. Psychological assessment Conducted:
<input type="text"
						class="form-control" id="patientsDetails2.psychologicalassessmentconducted"
						name="patientsDetails2.psychologicalassessmentconducted">  </br>
11. Psychological Report:
<input type="text"
						class="form-control" id="patientsDetails2.psychologicalreport"
						name="patientsDetails2.psychologicalreport"> </br>
11. Management Plan:
<input type="text"
						class="form-control" id="patientsDetails2.managementplan"
						name="patientsDetails2.managementplan">  </br>
					

					<!-- <div class="form-group">
						<select name="Gender">
							<option value="Male">Male</option>
							<option value="female">Female</option>
						</select>
					</div>
					<div class="form-group">
						<label for="Options"> Product Description: </label> 
						<input type="checkbox" name="selecteditems" value="3 months" title="3 months"> 3 Months
						<input type="checkbox" name="selecteditems" value="6 months"
							title="6 Months" > 6 Months
					</div> -->
					<div class="container text-center mb-4">
						<a href="homePage"
							class="btn btn-outline-danger"> HOME </a>
						<button type="submit" class="btn btn-primary">Add Patient</button>
					</div>

				</form>
			</div>
		</div>
	</div>

</body>
</html>