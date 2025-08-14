package com.clinicalpsychology.dao;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.clinicalpsychology.model.Education;




@Component
public class EducationDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	
	// Create Product 
	@Transactional
	public void createEducation(Education education) {
		this.hibernateTemplate.saveOrUpdate(education);
	}
	
	// Getting all Product
	public java.util.List<Education> getEducations() {
		java.util.List<Education> educations = this.hibernateTemplate.loadAll(Education.class);
		return educations;
	}
	
	// Delete single Product
	@Transactional
	public void deleteEducation(int pid) {
		Education p = this.hibernateTemplate.load(Education.class, pid);
		this.hibernateTemplate.delete(p);
	}
	
	// Get single Product
	public Education getEducation(int pid) {
		return this.hibernateTemplate.get(Education.class, pid);
	}
	
}
