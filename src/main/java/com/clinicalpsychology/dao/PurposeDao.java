package com.clinicalpsychology.dao;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.clinicalpsychology.model.Gender;
import com.clinicalpsychology.model.Purpose;



@Component
public class PurposeDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	
	// Create Product 
	@Transactional
	public void createPurpose(Purpose gender) {
		this.hibernateTemplate.saveOrUpdate(gender);
	}
	
	// Getting all Product
	public java.util.List<Purpose> getPurposes() {
		java.util.List<Purpose> genders = this.hibernateTemplate.loadAll(Purpose.class);
		return genders;
	}
	
	// Delete single Product
	@Transactional
	public void deletePurpose(int pid) {
		Purpose p = this.hibernateTemplate.load(Purpose.class, pid);
		this.hibernateTemplate.delete(p);
	}
	
	// Get single Product
	public Purpose getPurpose(int pid) {
		return this.hibernateTemplate.get(Purpose.class, pid);
	}
	
}
