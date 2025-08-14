package com.clinicalpsychology.dao;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.clinicalpsychology.model.Gender;



@Component
public class GenderDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	
	// Create Product 
	@Transactional
	public void createGender(Gender gender) {
		this.hibernateTemplate.saveOrUpdate(gender);
	}
	
	// Getting all Product
	public java.util.List<Gender> getGenders() {
		java.util.List<Gender> genders = this.hibernateTemplate.loadAll(Gender.class);
		return genders;
	}
	
	// Delete single Product
	@Transactional
	public void deleteGender(int pid) {
		Gender p = this.hibernateTemplate.load(Gender.class, pid);
		this.hibernateTemplate.delete(p);
	}
	
	// Get single Product
	public Gender getGender(int pid) {
		return this.hibernateTemplate.get(Gender.class, pid);
	}
	
}
