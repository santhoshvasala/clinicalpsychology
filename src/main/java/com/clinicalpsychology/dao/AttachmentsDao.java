package com.clinicalpsychology.dao;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.clinicalpsychology.model.Attachment;

@Component
public class AttachmentsDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;

	// Create Product
	@Transactional
	public void saveAttachement(Attachment file) {
		this.hibernateTemplate.saveOrUpdate(file);
	}

	// Getting all Product
	public java.util.List<Attachment> getAttachments() {
		java.util.List<Attachment> sessionNotes = this.hibernateTemplate.loadAll(Attachment.class);
		return sessionNotes;
	}

	// Getting all Product
	public java.util.List<Attachment> getAttachmentsForPatient(int patientId) {
		java.util.List<Attachment> sessionNotes = this.hibernateTemplate.loadAll(Attachment.class);
		return sessionNotes;
	}

	// Delete single Product
	@Transactional
	public void deleteAttachment(int pid) {
		Attachment p = this.hibernateTemplate.load(Attachment.class, pid);
		this.hibernateTemplate.delete(p);
	}

	// Get single Product
	public Attachment getAttachment(int pid) {
		return this.hibernateTemplate.get(Attachment.class, pid);
	}
	public List<Attachment> getAllAttachmentsForPatient(int patientid) {
		List<Attachment> list = (ArrayList<Attachment>) hibernateTemplate
				.find("FROM Attachment WHERE patientid = '" + patientid + "'");
		return list;
	}

}
