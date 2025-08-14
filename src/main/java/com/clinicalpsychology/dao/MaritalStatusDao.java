package com.clinicalpsychology.dao;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.clinicalpsychology.model.MaritalStatus;



@Component
public class MaritalStatusDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	
	// Create Product 
	@Transactional
	public void createmaritalStatus(MaritalStatus gender) {
		this.hibernateTemplate.saveOrUpdate(gender);
	}
	
	// Getting all Product
	public java.util.List<MaritalStatus> getMaritalStatuslist() {
		java.util.List<MaritalStatus> genders = this.hibernateTemplate.loadAll(MaritalStatus.class);
		return genders;
	}
	
	// Delete single Product
	@Transactional
	public void deleteMaritalStatus(int pid) {
		MaritalStatus p = this.hibernateTemplate.load(MaritalStatus.class, pid);
		this.hibernateTemplate.delete(p);
	}
	
	// Get single Product
	public MaritalStatus getMaritalStatus(int pid) {
		return this.hibernateTemplate.get(MaritalStatus.class, pid);
	}
	
}
