package com.clinicalpsychology.dao;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.clinicalpsychology.model.Gender;
import com.clinicalpsychology.model.Occupation;



@Component
public class OccupationDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	
	// Create Product 
	@Transactional
	public void createOccupation(Occupation gender) {
		this.hibernateTemplate.saveOrUpdate(gender);
	}
	
	// Getting all Product
	public java.util.List<Occupation> getOccupations() {
		java.util.List<Occupation> genders = this.hibernateTemplate.loadAll(Occupation.class);
		return genders;
	}
	
	// Delete single Product
	@Transactional
	public void deleteOccupation(int pid) {
		Occupation p = this.hibernateTemplate.load(Occupation.class, pid);
		this.hibernateTemplate.delete(p);
	}
	
	// Get single Product
	public Occupation getOccupation(int pid) {
		return this.hibernateTemplate.get(Occupation.class, pid);
	}
	
}
