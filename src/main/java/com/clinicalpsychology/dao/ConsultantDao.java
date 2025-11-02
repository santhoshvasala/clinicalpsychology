package com.clinicalpsychology.dao;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.clinicalpsychology.model.Consultant;

@Component
public class ConsultantDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	
	@Transactional
	public void createConsultant(Consultant consultant) {
		this.hibernateTemplate.saveOrUpdate(consultant);
	}
	
	public java.util.List<Consultant> getConsultants() {
		java.util.List<Consultant> consultants = this.hibernateTemplate.loadAll(Consultant.class);
		return consultants;
	}
	
	// Delete single Product
	@Transactional
	public void deleteConsultant(int pid) {
		Consultant p = this.hibernateTemplate.load(Consultant.class, pid);
		this.hibernateTemplate.delete(p);
	}
	
	// Get single Product
	public Consultant getConsultant(int pid) {
		return this.hibernateTemplate.get(Consultant.class, pid);
	}
	
}
