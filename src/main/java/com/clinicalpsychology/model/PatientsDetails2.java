package com.clinicalpsychology.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity()
@Table(name = "patientsdetails2" )
public class PatientsDetails2 {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer patientdetailid2;
 
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "patientid", referencedColumnName = "id")
    private Patients patientid ;
    
     
    private String generalbuild ;
    private String grooming  ;
    private String dress  ;
    private String facialexpression  ;
    private String eycontact  ;
    private String ageappropriateness  ;
    private String notablephysicalfeatures  ;
    private String posture;
    private String increasedactivity  ;
    private String decreasedactivity  ;
    private String abnormalmovements  ;
    private String quantity  ; 
    private String quantityTempo;
    private String quantityValume;
    private String rateandrhythm  ;
    private String formandstructure  ;
    private String disorderofstream  ;
    private String disorderofform  ;
    private String contentofthought ;
    private String obsessioncompulsionstext  ;
    private String thoughtalienation  ;
    private String delusionstext  ;
    private String overvaluedideastext  ;
    private String phobiastext  ;
    private String deressivecongnitionstext  ;
    private String guilttext  ;
    private String worriestext  ;
    private String catastrophictext  ;
    private String suicidaltext  ;
    private String homicidalideationtext  ;
    private String magicalthinkingtext  ;
    private String ideasofreferencetext  ;
    private String persecutoryidastext  ;
    private String othersText;
    private String possessionofthought  ;
    private String mood  ;
    private String affect  ;
    private String perception  ;
    private String Consciousness  ;
    private String  time  ;
    private String place  ;
    private String person  ;
    private String attentionconcentration  ;
    private String immediate  ;
    private String recent  ;
    private String  remote  ;
    private String amnesia  ;
    private String  memory  ;
    private String  thinking  ;
    private String  emotion  ;
    private String  judgementpersonal  ;
    private String  judgementsocial  ;
    private String  judgementtest  ;
    private String aphasiaText;
    
    @Lob
    @Column(columnDefinition = "TEXT")
    private String  insight ;
    
    @Lob
    @Column(columnDefinition = "TEXT")
    private String  psychologicalassessmentconducted  ;
    @Lob
    @Column(columnDefinition = "TEXT")
    private String  psychologicalreport  ;
    @Lob
    @Column(columnDefinition = "TEXT")
    private String  managementplan  ;
    
    @Lob
    @Column(columnDefinition = "TEXT")
    private String  otherobservations  ;
    @Lob
    @Column(columnDefinition = "TEXT")
    private String  provisionalDiagnosis  ;
    
    
    
    
    public String getAphasiaText() {
		return aphasiaText;
	}
	public void setAphasiaText(String aphasiaText) {
		this.aphasiaText = aphasiaText;
	}
	public String getPosture() {
		return posture;
	}
	public void setPosture(String posture) {
		this.posture = posture;
	}
	public Integer getPatientdetailid2() {
		return patientdetailid2;
	}
	public void setPatientdetailid2(Integer patientdetailid2) {
		this.patientdetailid2 = patientdetailid2;
	}
	public Patients getPatientid() {
		return patientid;
	}
	public void setPatientid(Patients patientid) {
		this.patientid = patientid;
	}
	public String getGeneralbuild() {
		return generalbuild;
	}
	public String getOthersText() {
		return othersText;
	}
	public void setOthersText(String othersText) {
		this.othersText = othersText;
	}
	public void setGeneralbuild(String generalbuild) {
		this.generalbuild = generalbuild;
	}
	public String getGrooming() {
		return grooming;
	}
	public void setGrooming(String grooming) {
		this.grooming = grooming;
	}
	public String getDress() {
		return dress;
	}
	public void setDress(String dress) {
		this.dress = dress;
	}
	public String getFacialexpression() {
		return facialexpression;
	}
	public void setFacialexpression(String facialexpression) {
		this.facialexpression = facialexpression;
	}
	public String getEycontact() {
		return eycontact;
	}
	public void setEycontact(String eycontact) {
		this.eycontact = eycontact;
	}
	public String getAgeappropriateness() {
		return ageappropriateness;
	}
	public void setAgeappropriateness(String ageappropriateness) {
		this.ageappropriateness = ageappropriateness;
	}
	public String getNotablephysicalfeatures() {
		return notablephysicalfeatures;
	}
	public void setNotablephysicalfeatures(String notablephysicalfeatures) {
		this.notablephysicalfeatures = notablephysicalfeatures;
	}
	public String getIncreasedactivity() {
		return increasedactivity;
	}
	public void setIncreasedactivity(String increasedactivity) {
		this.increasedactivity = increasedactivity;
	}
	public String getDecreasedactivity() {
		return decreasedactivity;
	}
	public void setDecreasedactivity(String decreasedactivity) {
		this.decreasedactivity = decreasedactivity;
	}
	public String getAbnormalmovements() {
		return abnormalmovements;
	}
	public void setAbnormalmovements(String abnormalmovements) {
		this.abnormalmovements = abnormalmovements;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getRateandrhythm() {
		return rateandrhythm;
	}
	public void setRateandrhythm(String rateandrhythm) {
		this.rateandrhythm = rateandrhythm;
	}
	public String getFormandstructure() {
		return formandstructure;
	}
	public void setFormandstructure(String formandstructure) {
		this.formandstructure = formandstructure;
	}
	public String getDisorderofstream() {
		return disorderofstream;
	}
	public void setDisorderofstream(String disorderofstream) {
		this.disorderofstream = disorderofstream;
	}
	public String getDisorderofform() {
		return disorderofform;
	}
	public void setDisorderofform(String disorderofform) {
		this.disorderofform = disorderofform;
	}
	public String getContentofthought() {
		return contentofthought;
	}
	public void setContentofthought(String contentofthought) {
		this.contentofthought = contentofthought;
	}
	public String getObsessioncompulsionstext() {
		return obsessioncompulsionstext;
	}
	public void setObsessioncompulsionstext(String obsessioncompulsionstext) {
		this.obsessioncompulsionstext = obsessioncompulsionstext;
	}
	public String getThoughtalienation() {
		return thoughtalienation;
	}
	public void setThoughtalienation(String thoughtalienation) {
		this.thoughtalienation = thoughtalienation;
	}
	public String getDelusionstext() {
		return delusionstext;
	}
	public void setDelusionstext(String delusionstext) {
		this.delusionstext = delusionstext;
	}
	public String getOvervaluedideastext() {
		return overvaluedideastext;
	}
	public void setOvervaluedideastext(String overvaluedideastext) {
		this.overvaluedideastext = overvaluedideastext;
	}
	public String getPhobiastext() {
		return phobiastext;
	}
	public void setPhobiastext(String phobiastext) {
		this.phobiastext = phobiastext;
	}
	public String getDeressivecongnitionstext() {
		return deressivecongnitionstext;
	}
	public void setDeressivecongnitionstext(String deressivecongnitionstext) {
		this.deressivecongnitionstext = deressivecongnitionstext;
	}
	public String getGuilttext() {
		return guilttext;
	}
	public void setGuilttext(String guilttext) {
		this.guilttext = guilttext;
	}
	public String getWorriestext() {
		return worriestext;
	}
	public void setWorriestext(String worriestext) {
		this.worriestext = worriestext;
	}
	public String getCatastrophictext() {
		return catastrophictext;
	}
	public void setCatastrophictext(String catastrophictext) {
		this.catastrophictext = catastrophictext;
	}
	public String getSuicidaltext() {
		return suicidaltext;
	}
	public void setSuicidaltext(String suicidaltext) {
		this.suicidaltext = suicidaltext;
	}
	public String getHomicidalideationtext() {
		return homicidalideationtext;
	}
	public void setHomicidalideationtext(String homicidalideationtext) {
		this.homicidalideationtext = homicidalideationtext;
	}
	public String getMagicalthinkingtext() {
		return magicalthinkingtext;
	}
	public void setMagicalthinkingtext(String magicalthinkingtext) {
		this.magicalthinkingtext = magicalthinkingtext;
	}
	public String getIdeasofreferencetext() {
		return ideasofreferencetext;
	}
	public void setIdeasofreferencetext(String ideasofreferencetext) {
		this.ideasofreferencetext = ideasofreferencetext;
	}
	public String getPersecutoryidastext() {
		return persecutoryidastext;
	}
	public void setPersecutoryidastext(String persecutoryidastext) {
		this.persecutoryidastext = persecutoryidastext;
	}
	public String getPossessionofthought() {
		return possessionofthought;
	}
	public void setPossessionofthought(String possessionofthought) {
		this.possessionofthought = possessionofthought;
	}
	public String getMood() {
		return mood;
	}
	public void setMood(String mood) {
		this.mood = mood;
	}
	public String getAffect() {
		return affect;
	}
	public void setAffect(String affect) {
		this.affect = affect;
	}
	public String getPerception() {
		return perception;
	}
	public void setPerception(String perception) {
		this.perception = perception;
	}
	public String getConsciousness() {
		return Consciousness;
	}
	public void setConsciousness(String consciousness) {
		Consciousness = consciousness;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getPerson() {
		return person;
	}
	public void setPerson(String person) {
		this.person = person;
	}
	public String getAttentionconcentration() {
		return attentionconcentration;
	}
	public void setAttentionconcentration(String attentionconcentration) {
		this.attentionconcentration = attentionconcentration;
	}
	public String getImmediate() {
		return immediate;
	}
	public void setImmediate(String immediate) {
		this.immediate = immediate;
	}
	public String getRecent() {
		return recent;
	}
	public void setRecent(String recent) {
		this.recent = recent;
	}
	public String getRemote() {
		return remote;
	}
	public void setRemote(String remote) {
		this.remote = remote;
	}
	public String getAmnesia() {
		return amnesia;
	}
	public void setAmnesia(String amnesia) {
		this.amnesia = amnesia;
	}
	public String getMemory() {
		return memory;
	}
	public void setMemory(String memory) {
		this.memory = memory;
	}
	public String getThinking() {
		return thinking;
	}
	public void setThinking(String thinking) {
		this.thinking = thinking;
	}
	public String getEmotion() {
		return emotion;
	}
	public void setEmotion(String emotion) {
		this.emotion = emotion;
	}
	public String getJudgementpersonal() {
		return judgementpersonal;
	}
	public void setJudgementpersonal(String judgementpersonal) {
		this.judgementpersonal = judgementpersonal;
	}
	public String getJudgementsocial() {
		return judgementsocial;
	}
	public void setJudgementsocial(String judgementsocial) {
		this.judgementsocial = judgementsocial;
	}
	public String getJudgementtest() {
		return judgementtest;
	}
	public void setJudgementtest(String judgementtest) {
		this.judgementtest = judgementtest;
	}
	public String getInsight() {
		return insight;
	}
	public void setInsight(String insight) {
		this.insight = insight;
	}
	public String getOtherobservations() {
		return otherobservations;
	}
	public void setOtherobservations(String otherobservations) {
		this.otherobservations = otherobservations;
	}
	public String getProvisionalDiagnosis() {
		return provisionalDiagnosis;
	}
	public void setProvisionalDiagnosis(String provisionalDiagnosis) {
		this.provisionalDiagnosis = provisionalDiagnosis;
	}
	public String getPsychologicalassessmentconducted() {
		return psychologicalassessmentconducted;
	}
	public void setPsychologicalassessmentconducted(String psychologicalassessmentconducted) {
		this.psychologicalassessmentconducted = psychologicalassessmentconducted;
	}
	public String getPsychologicalreport() {
		return psychologicalreport;
	}
	public void setPsychologicalreport(String psychologicalreport) {
		this.psychologicalreport = psychologicalreport;
	}
	public String getManagementplan() {
		return managementplan;
	}
	public void setManagementplan(String managementplan) {
		this.managementplan = managementplan;
	}
	public String getQuantityTempo() {
		return quantityTempo;
	}
	public void setQuantityTempo(String quantityTempo) {
		this.quantityTempo = quantityTempo;
	}
	public String getQuantityValume() {
		return quantityValume;
	}
	public void setQuantityValume(String quantityValume) {
		this.quantityValume = quantityValume;
	}
	
	
    
	
    
    
	
	
}
