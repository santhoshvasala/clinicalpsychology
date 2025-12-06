package com.clinicalpsychology.dao;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.clinicalpsychology.model.SessionNotes;




@Component
public class SessionNotesDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	
	// Create Product 
	@Transactional
	public void createSessionNotes(SessionNotes sessionNotes) {
		this.hibernateTemplate.saveOrUpdate(sessionNotes);
	}
	
	// Getting all Product
	public java.util.List<SessionNotes> getSessionNotes() {
		java.util.List<SessionNotes> sessionNotes = this.hibernateTemplate.loadAll(SessionNotes.class);
		return sessionNotes;
	}
	
	// Delete single Product
	@Transactional
	public void deleteSessionNotes(int pid) {
		SessionNotes p = this.hibernateTemplate.load(SessionNotes.class, pid);
		this.hibernateTemplate.delete(p);
	}
	
	// Get single Product
	public SessionNotes getSessionNotes(int pid) {
		return this.hibernateTemplate.get(SessionNotes.class, pid);
	}
	
	public List<SessionNotes> getAllSessionNotesByPatientId(int patientid) {
		List<SessionNotes> list = (ArrayList<SessionNotes>) hibernateTemplate
				.find("FROM SessionNotes WHERE patientid = '" + patientid + "'");
		return list;
	}
	
}
