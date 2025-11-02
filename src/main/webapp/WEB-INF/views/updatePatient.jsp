<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
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
				<input type="hidden" value="${patient.id}" name="id"class="form-control" >

					<b>Name:</b>&nbsp;&nbsp;${patient.firstName}
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>Date</b> &nbsp;&nbsp;<input type="date"
						name="createdDate" id="createdDate" value="${patient.createdDate}"/>
					<div></div>
					<b>Date of Birth:</b>&nbsp; <input type="date" id="dob" name="dob" value="${patient.dob}">&nbsp;&nbsp;&nbsp;<b>Age:</b> &nbsp;
					<input type="text" id="age" name="age" value="${patient.age}">
					<div></div>
					<b>Mobile Number:</b> &nbsp;
					<div></div>
					Client <input type="text" id="clientmobile" name="clientmobile" value="${patient.clientmobile}">
					<div></div>
					Relative: <input type="text" id="relativemobile" name="relativemobile" value="${patient.relativemobile}">
					<div></div>
					Relationship Type<input type="text" id="relationtype" name="relationtype" value="${patient.relationtype}">
					<div></div>
					<b>Email ID: 1.</b>&nbsp; <input type="text" id="email1" name="email1" value=""${patient.email1}">&nbsp; <b>2.</b>&nbsp;<input type="text" 
						id="email2" name="email2" value="{patient.email2}">
						<div/>
						<b> Gender: </b>&nbsp; <select name="gender" >
						<option value="Male">Male</option>
						<option value="female">Female</option>
					</select> &nbsp;<b>, Religion:</b> &nbsp;<select name="religion">
						<option value="Hindu">Hindu</option>
						<option value="Muslim">Muslim</option>
					</select>&nbsp;<b>,Marital Status: </b> &nbsp;<select name="maritalstatus">
						<option value="Married">Married</option>
						<option value="UnMarried">UnMarried</option>
						<option value="Widow">Widow</option>
					</select>&nbsp;<b> Educational Qualification: </b>&nbsp; <select name="eduqualification">
						<option value="10th">10th</option>
						<option value="Graduate">Graduate</option>
						<option value="Post Graduate">Post Graduate</option>
					</select>
					<div/>
					<b> Occupation: </b> &nbsp;<select name="occupation">
						<option value="self employed">self employed</option>
						<option value="govt job">govt job</option>
					</select>
					&nbsp;<b> 
					<div/>Informants: </b> &nbsp;<input type="text" class="form-control"
						id="informants" name="informants">
						<b>Address:</b>   &nbsp;<input
						type="text" class="form-control" id="address" name="address">
					<b>Referral Source: </b> &nbsp;<select name="referalsource">
						<option value="online">online</option>
						<option value="doctor">doctor</option>
					</select>&nbsp; <b>Purpose of Referral: </b>  &nbsp;<select name="puposeofreferral">
						<option value="consultation">consultation</option>
						<option value="sessions">sessions</option>
					</select> &nbsp; <div/><b>Place of Consultation: </b> &nbsp;<select name="placeofconsultation">
						<option value="Hyderabad">Hyderabad</option>
						<option value="Karimnagar">Karimnagar</option>
						<option value="Warangal">Warangal</option>
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
						value="Episodic">Episodic 2. Recent Treatment History: <input
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
						name="patientsDetails1.social"> 7.Personality/Adjustment
					Prior to Illness: <input type="text" class="form-control"
						id="patientsDetails1.personalityadjustment"
						name="patientsDetails1.personalityadjustment"> Reliability
					of Information: <input type="checkbox"
						name="patientsDetails1.reliabilityinfo" value="Reliable">Reliable
					<input type="checkbox" name="patientsDetails1.reliabilityinfo"
						value="Partially Reliable" >Partially Reliable <input
						type="checkbox" name="patientsDetails1.reliabilityinfo"
						value="Unreliable">Unreliable
					<div />
					Adequacy of Information: <input type="checkbox"
						name="patientsDetails1.adequacyinfo" value="Adequate">
					Adequate <input type="checkbox"
						name="patientsDetails1.adequacyinfo" value="Inadequate">Inadequate
8. Mental Status:
8.1 Appearance –
General build:
<input type="checkbox"
						name="patientsDetails2.generalbuild" value="Thin"> Thin 
						<input type="checkbox"
						name="patientsDetails2.generalbuild" value="Obese"> Obese
						<input type="checkbox"
						name="patientsDetails2.generalbuild" value="well-nourished"> well-nourished
						<input type="checkbox"
						name="patientsDetails2.generalbuild" value="frail"> frail
<div/>
Grooming & hygiene:
<input type="checkbox"
						name="patientsDetails2.grooming" value="Clean"> Clean 
						<input type="checkbox"
						name="patientsDetails2.grooming" value="well-groomed"> well-groomed 
						<input type="checkbox"
						name="patientsDetails2.grooming" value="disheveled"> disheveled 
						<input type="checkbox"
						name="patientsDetails2.grooming" value="neglected"> neglected 
						<div/>
						Dress: 
						<input type="checkbox"
						name="patientsDetails2.dress" value="Appropriate"> Appropriate 
						<input type="checkbox"
						name="patientsDetails2.dress" value="Inappropriate"> Inappropriate 
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
						name="patientsDetails2.facialexpression" value="Smiling inappropriately"> Smiling inappropriately
						
<div/>Eye contact: 
<input type="checkbox"
						name="patientsDetails2.eycontact" value="Good"> Good
						<input type="checkbox"
						name="patientsDetails2.eycontact" value="fleeting"> fleeting
						<input type="checkbox"
						name="patientsDetails2.eycontact" value="avoidant"> avoidant
						<input type="checkbox"
						name="patientsDetails2.eycontact" value="piercing"> piercing
<div/>
Age-appropriateness: piercingAppears stated age or not
Notable physical features: 
<input type="checkbox"
						name="patientsDetails2.notablephysicalfeatures" value="Scars"> Scars
						<input type="checkbox"
						name="patientsDetails2.notablephysicalfeatures" value="tattoos"> tattoos
						<input type="checkbox"
						name="patientsDetails2.notablephysicalfeatures" value="signs of self-harm"> signs of self-harm
						<input type="checkbox"
						name="patientsDetails2.notablephysicalfeatures" value="tremors"> tremors <div/>
						 
Posture:
<input type="checkbox"
						name="patientsDetails2.posture" value="Upright"> Upright
						<input type="checkbox"
						name="patientsDetails2.posture" value="slouched"> slouched
						<input type="checkbox"
						name="patientsDetails2.posture" value="tense"> tense
						<input type="checkbox"
						name="patientsDetails2.posture" value="rigid"> rigid<div/>

	8.2 Movement and Behavior–
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
						name="patientsDetails2.increasedactivity" value="Impulsivity"> Impulsivity

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
						name="patientsDetails2.decreasedactivity" value="Negativism"> Negativism <div/>

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
						name="patientsDetails2.abnormalmovements" value="Gait disturbances"> Gait disturbances
<div/>
8.3 Speech –
Quantity:
<input type="checkbox"
						name="patientsDetails2.quantity" value="Tempo (high/moderate/low)"> Tempo (high/moderate/low)
						<input type="checkbox"
						name="patientsDetails2.quantity" value="Volume (high/moderate/ low)"> Volume (high/moderate/ low)
						<input type="checkbox"
						name="patientsDetails2.quantity" value="Pressure of speech"> Pressure of speech
						<input type="checkbox"
						name="patientsDetails2.quantity" value="Poverty of speech"> Poverty of speech
						<input type="checkbox"
						name="patientsDetails2.quantity" value="Mutism"> Mutism
						<input type="checkbox"
						name="patientsDetails2.quantity" value="Monosyllabic replies"> Monosyllabic replies
						<input type="checkbox"
						name="patientsDetails2.quantity" value="Verbosity"> Verbosity

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
						name="patientsDetails2.rateandrhythm" value="Cluttering"> Cluttering

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
						name="patientsDetails2.formandstructure" value="Cluttering"> Cluttering

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
						name="patientsDetails2.otherobservations"> 

9.   Provisional Diagnosis:
<input type="text"
						class="form-control" id="patientsDetails2.provisionalDiagnosis"
						name="patientsDetails2.provisionalDiagnosis"> 
10. Psychological assessment Conducted:
<input type="text"
						class="form-control" id="patientsDetails2.psychologicalassessmentconducted"
						name="patientsDetails2.psychologicalassessmentconducted"> 
11. Psychological Report:
<input type="text"
						class="form-control" id="patientsDetails2.psychologicalreport"
						name="patientsDetails2.psychologicalreport"> 
11. Management Plan:
<input type="text"
						class="form-control" id="patientsDetails2.managementplan"
						name="patientsDetails2.managementplan"> 
					

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
						<a href="${pageContext.request.contextPath}/"
							class="btn btn-outline-danger"> Back </a>
						<button type="submit" class="btn btn-primary">Add Patient</button>
					</div>

				</form>
			</div>
		</div>
	</div>

</body>
</html>