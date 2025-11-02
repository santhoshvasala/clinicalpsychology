package com.clinicalpsychology.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;


@Entity()
@Table(name = "Consultant" )
public class Consultant {

	@Id
	private String consultantId;
    private String consultantPassword;
    private String consultantTitle;
    private String consultantFirstName;
    private String consultantLastName;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date consultantDob;
    private String consultantEducation;
    private String consultantDesignation;
    private String consultantlicense;
    private String consultantOrganization;
    private String consultantContact;
    private String consultantEmail;
    private String consultantAddress;
    private String consultantEmergencyContact;
	public String getConsultantId() {
		return consultantId;
	}
	public void setConsultantId(String consultantId) {
		this.consultantId = consultantId;
	}
	public String getConsultantPassword() {
		return consultantPassword;
	}
	public void setConsultantPassword(String consultantPassword) {
		this.consultantPassword = consultantPassword;
	}
	public String getConsultantTitle() {
		return consultantTitle;
	}
	public void setConsultantTitle(String consultantTitle) {
		this.consultantTitle = consultantTitle;
	}
	
	public String getConsultantFirstName() {
		return consultantFirstName;
	}
	public void setConsultantFirstName(String consultantFirstName) {
		this.consultantFirstName = consultantFirstName;
	}
	public String getConsultantLastName() {
		return consultantLastName;
	}
	public void setConsultantLastName(String consultantLastName) {
		this.consultantLastName = consultantLastName;
	}
	public Date getConsultantDob() {
		return consultantDob;
	}
	public void setConsultantDob(Date consultantDob) {
		this.consultantDob = consultantDob;
	}
	public String getConsultantEducation() {
		return consultantEducation;
	}
	public void setConsultantEducation(String consultantEducation) {
		this.consultantEducation = consultantEducation;
	}
	public String getConsultantDesignation() {
		return consultantDesignation;
	}
	public void setConsultantDesignation(String consultantDesignation) {
		this.consultantDesignation = consultantDesignation;
	}
	public String getConsultantlicense() {
		return consultantlicense;
	}
	public void setConsultantlicense(String consultantlicense) {
		this.consultantlicense = consultantlicense;
	}
	public String getConsultantOrganization() {
		return consultantOrganization;
	}
	public void setConsultantOrganization(String consultantOrganization) {
		this.consultantOrganization = consultantOrganization;
	}
	public String getConsultantContact() {
		return consultantContact;
	}
	public void setConsultantContact(String consultantContact) {
		this.consultantContact = consultantContact;
	}
	public String getConsultantEmail() {
		return consultantEmail;
	}
	public void setConsultantEmail(String consultantEmail) {
		this.consultantEmail = consultantEmail;
	}
	public String getConsultantAddress() {
		return consultantAddress;
	}
	public void setConsultantAddress(String consultantAddress) {
		this.consultantAddress = consultantAddress;
	}
	public String getConsultantEmergencyContact() {
		return consultantEmergencyContact;
	}
	public void setConsultantEmergencyContact(String consultantEmergencyContact) {
		this.consultantEmergencyContact = consultantEmergencyContact;
	}
    
    
    
    
    
    
	
}
