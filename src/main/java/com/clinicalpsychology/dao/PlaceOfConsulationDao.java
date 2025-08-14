package com.clinicalpsychology.dao;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.clinicalpsychology.model.ConsultationPlace;
import com.clinicalpsychology.model.Gender;



@Component
public class PlaceOfConsulationDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	
	// Create Product 
	@Transactional
	public void createConsultationPlace(ConsultationPlace gender) {
		this.hibernateTemplate.saveOrUpdate(gender);
	}
	
	// Getting all Product
	public java.util.List<ConsultationPlace> getConsultationPlaces() {
		java.util.List<ConsultationPlace> genders = this.hibernateTemplate.loadAll(ConsultationPlace.class);
		return genders;
	}
	
	// Delete single Product
	@Transactional
	public void deleteConsultationPlace(int pid) {
		ConsultationPlace p = this.hibernateTemplate.load(ConsultationPlace.class, pid);
		this.hibernateTemplate.delete(p);
	}
	
	// Get single Product
	public ConsultationPlace getConsultationPlace(int pid) {
		return this.hibernateTemplate.get(ConsultationPlace.class, pid);
	}
	
}
