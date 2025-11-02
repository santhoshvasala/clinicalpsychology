package com.clinicalpsychology.model;

import java.io.File;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;


//@Entity()
//@Table(name = "Education" )
public class SessionNotes {

//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String sessionNotes;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date sessionOccuredOn;
	private String patientId;
	private File file;
	
	
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getSessionNotes() {
		return sessionNotes;
	}
	public void setSessionNotes(String sessionNotes) {
		this.sessionNotes = sessionNotes;
	}
	public Date getSessionOccuredOn() {
		return sessionOccuredOn;
	}
	public void setSessionOccuredOn(Date sessionOccuredOn) {
		this.sessionOccuredOn = sessionOccuredOn;
	}
	public String getPatientId() {
		return patientId;
	}
	public void setPatientId(String patientId) {
		this.patientId = patientId;
	}
	
}
