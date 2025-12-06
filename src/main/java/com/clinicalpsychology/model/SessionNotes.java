package com.clinicalpsychology.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;


@Entity()
@Table(name = "sessionnotes" )
public class SessionNotes {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String sessionnote;
	 @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    private Date sessionoccuredon;
	
	
	@ManyToOne(optional = false)
	@JoinColumn(name = "patientid")
	private Patients patientid;
	
	
	public Date getSessionoccuredon() {
		return sessionoccuredon;
	}
	public void setSessionoccuredon(Date sessionoccuredon) {
		this.sessionoccuredon = sessionoccuredon;
	}
	
	
	public String getSessionnote() {
		return sessionnote;
	}
	public void setSessionnote(String sessionnote) {
		this.sessionnote = sessionnote;
	}
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Patients getPatientid() {
		return patientid;
	}
	public void setPatientid(Patients patientid) {
		this.patientid = patientid;
	}
	
	
}
