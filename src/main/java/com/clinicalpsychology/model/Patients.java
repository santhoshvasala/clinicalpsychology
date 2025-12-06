package com.clinicalpsychology.model;

import java.util.Date;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.springframework.format.annotation.DateTimeFormat;

@Entity()
public class Patients {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String firstName;

	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private Date createdDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dob;

	private String age;
	private String clientmobile;
	private String relativemobile;
	private String relationtype;
	private String email1;
	private String email2;
	private String gender;
	private String religion;
	private String maritalstatus;
	private String eduqualification;
	private String occupation;
	private String informants;
	private String address;
	private String referalsource;
	private String puposeofreferral;
	private String placeofconsultation;
	private String consultantId;
	
	
	public String getConsultantId() {
		return consultantId;
	}

	public void setConsultantId(String consultantId) {
		this.consultantId = consultantId;
	}

	@OneToOne(mappedBy = "patientid")
	private PatientsDetails1 patientsDetails1;

	@OneToOne(mappedBy = "patientid")
	private PatientsDetails2 patientsDetails2;

	@OneToMany(mappedBy = "patientid")
	private Set<Attachment> files;

	@OneToMany(mappedBy = "patientid")
	private Set<SessionNotes> sessions;

	public PatientsDetails2 getPatientsDetails2() {
		return patientsDetails2;
	}

	public void setPatientsDetails2(PatientsDetails2 patientsDetails2) {
		this.patientsDetails2 = patientsDetails2;
	}

	public PatientsDetails1 getPatientsDetails1() {
		return patientsDetails1;
	}

	public void setPatientsDetails1(PatientsDetails1 patientsDetails1) {
		this.patientsDetails1 = patientsDetails1;
	}

	public Set<Attachment> getFiles() {
		return files;
	}

	public void setFiles(Set<Attachment> files) {
		this.files = files;
	}

	public Set<SessionNotes> getSessions() {
		return sessions;
	}

	public void setSessions(Set<SessionNotes> sessions) {
		this.sessions = sessions;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getClientmobile() {
		return clientmobile;
	}

	public void setClientmobile(String clientmobile) {
		this.clientmobile = clientmobile;
	}

	public String getRelativemobile() {
		return relativemobile;
	}

	public void setRelativemobile(String relativemobile) {
		this.relativemobile = relativemobile;
	}

	public String getRelationtype() {
		return relationtype;
	}

	public void setRelationtype(String relationtype) {
		this.relationtype = relationtype;
	}

	public String getEmail1() {
		return email1;
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getReligion() {
		return religion;
	}

	public void setReligion(String religion) {
		this.religion = religion;
	}

	public String getMaritalstatus() {
		return maritalstatus;
	}

	public void setMaritalstatus(String maritalstatus) {
		this.maritalstatus = maritalstatus;
	}

	public String getEduqualification() {
		return eduqualification;
	}

	public void setEduqualification(String eduqualification) {
		this.eduqualification = eduqualification;
	}

	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	public String getInformants() {
		return informants;
	}

	public void setInformants(String informants) {
		this.informants = informants;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getReferalsource() {
		return referalsource;
	}

	public void setReferalsource(String referalsource) {
		this.referalsource = referalsource;
	}

	public String getPuposeofreferral() {
		return puposeofreferral;
	}

	public void setPuposeofreferral(String puposeofreferral) {
		this.puposeofreferral = puposeofreferral;
	}

	public String getPlaceofconsultation() {
		return placeofconsultation;
	}

	public void setPlaceofconsultation(String placeofconsultation) {
		this.placeofconsultation = placeofconsultation;
	}

}
