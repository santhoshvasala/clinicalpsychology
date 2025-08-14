package com.clinicalpsychology.dao;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.clinicalpsychology.model.Gender;
import com.clinicalpsychology.model.Religion;



@Component
public class ReligionDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	
	// Create Product 
	@Transactional
	public void createReligion(Religion gender) {
		this.hibernateTemplate.saveOrUpdate(gender);
	}
	
	// Getting all Product
	public java.util.List<Religion> getReligions() {
		java.util.List<Religion> genders = this.hibernateTemplate.loadAll(Religion.class);
		return genders;
	}
	
	// Delete single Product
	@Transactional
	public void deleteReligion(int pid) {
		Religion p = this.hibernateTemplate.load(Religion.class, pid);
		this.hibernateTemplate.delete(p);
	}
	
	// Get single Product
	public Religion getReligion(int pid) {
		return this.hibernateTemplate.get(Religion.class, pid);
	}
	
}
