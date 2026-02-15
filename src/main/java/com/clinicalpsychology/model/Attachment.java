package com.clinicalpsychology.model;

import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity()
@Table(name = "uploaded_files")
public class Attachment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String fileName;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private Date createdDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private Date modifiedDate;

	@Column(name = "type", length = 100, nullable = false)
	private String type;

	@ManyToOne(optional = false)
	@JoinColumn(name = "patientid", referencedColumnName = "id")
    private Patients patientid ;

	@Lob
	@Basic(fetch = FetchType.LAZY)
	@Column(name = "content", nullable = false)
	private byte[] content;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	

	public Patients getPatientid() {
		return patientid;
	}

	public void setPatientid(Patients patientid) {
		this.patientid = patientid;
	}

	public byte[] getContent() {
		return content;
	}

	public void setContent(byte[] content) {
		this.content = content;
	}

}
