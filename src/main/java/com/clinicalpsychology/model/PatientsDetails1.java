package com.clinicalpsychology.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity()
@Table(name = "patientsdetails1" )
public class PatientsDetails1 {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer patientdetailid;
    private String presentingcomplaints;
    
    private String precipitatingfactors;
    private String dutaionofillness;
    private String onset;
    private String course;
    private String recenttreatmenthistory;
    private String negativehistory ;
    private String pasthistory;
    private String familyhistory;
    private String birthdevelopment ;
    private String scholastic ;
    private String occupational ;
    private String maritalsexual ;
    private String habits ;
    private String social  ;
    private String personalityadjustment ;
    private String reliabilityinfo ;
    private String adequacyinfo ;
    
    
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "patientid", referencedColumnName = "id")
    private Patients patientid ;
    
    

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public int getPatientdetailid() {
		return patientdetailid;
	}

	public void setPatientdetailid(int patientdetailid) {
		this.patientdetailid = patientdetailid;
	}

	public String getPresentingcomplaints() {
		return presentingcomplaints;
	}

	public void setPresentingcomplaints(String presentingcomplaints) {
		this.presentingcomplaints = presentingcomplaints;
	}

	public String getPrecipitatingfactors() {
		return precipitatingfactors;
	}

	public void setPrecipitatingfactors(String precipitatingfactors) {
		this.precipitatingfactors = precipitatingfactors;
	}

	public String getDutaionofillness() {
		return dutaionofillness;
	}

	public void setDutaionofillness(String dutaionofillness) {
		this.dutaionofillness = dutaionofillness;
	}

	public String getOnset() {
		return onset;
	}

	public void setOnset(String onset) {
		this.onset = onset;
	}

	public String getRecenttreatmenthistory() {
		return recenttreatmenthistory;
	}

	public void setRecenttreatmenthistory(String recenttreatmenthistory) {
		this.recenttreatmenthistory = recenttreatmenthistory;
	}

	public String getNegativehistory() {
		return negativehistory;
	}

	public void setNegativehistory(String negativehistory) {
		this.negativehistory = negativehistory;
	}

	public String getPasthistory() {
		return pasthistory;
	}

	public void setPasthistory(String pasthistory) {
		this.pasthistory = pasthistory;
	}

	public String getFamilyhistory() {
		return familyhistory;
	}

	public void setFamilyhistory(String familyhistory) {
		this.familyhistory = familyhistory;
	}

	public String getBirthdevelopment() {
		return birthdevelopment;
	}

	public void setBirthdevelopment(String birthdevelopment) {
		this.birthdevelopment = birthdevelopment;
	}

	public String getScholastic() {
		return scholastic;
	}

	public void setScholastic(String scholastic) {
		this.scholastic = scholastic;
	}

	public String getOccupational() {
		return occupational;
	}

	public void setOccupational(String occupational) {
		this.occupational = occupational;
	}

	public String getMaritalsexual() {
		return maritalsexual;
	}

	public void setMaritalsexual(String maritalsexual) {
		this.maritalsexual = maritalsexual;
	}

	public String getHabits() {
		return habits;
	}

	public void setHabits(String habits) {
		this.habits = habits;
	}

	public String getSocial() {
		return social;
	}

	public void setSocial(String social) {
		this.social = social;
	}

	public String getPersonalityadjustment() {
		return personalityadjustment;
	}

	public void setPersonalityadjustment(String personalityadjustment) {
		this.personalityadjustment = personalityadjustment;
	}

	public String getReliabilityinfo() {
		return reliabilityinfo;
	}

	public void setReliabilityinfo(String reliabilityinfo) {
		this.reliabilityinfo = reliabilityinfo;
	}

	public String getAdequacyinfo() {
		return adequacyinfo;
	}

	public void setAdequacyinfo(String adequacyinfo) {
		this.adequacyinfo = adequacyinfo;
	}

	public Patients getPatientid() {
		return patientid;
	}

	public void setPatientid(Patients patientid) {
		this.patientid = patientid;
	}
	
    
    
	
	
}
