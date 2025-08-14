package com.clinicalpsychology.dao;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.clinicalpsychology.model.Patients;
import com.clinicalpsychology.model.PatientsDetails1;
import com.clinicalpsychology.model.PatientsDetails2;


@Component
public class PatientDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	
	// Create Product 
	@Transactional
	public void createPatient(Patients patient) {
		this.hibernateTemplate.saveOrUpdate(patient);
		System.out.println(patient.getId());
		PatientsDetails1 details = patient.getPatientsDetails1();
		details.setPatientid(patient);
		this.hibernateTemplate.saveOrUpdate(details);
		PatientsDetails2 details2 = patient.getPatientsDetails2();
		details2.setPatientid(patient);
		this.hibernateTemplate.saveOrUpdate(details2);
		
		
	}
	
	// Getting all Product
	public java.util.List<Patients> getPatient() {
		java.util.List<Patients> products = this.hibernateTemplate.loadAll(Patients.class);
		return products;
	}
	
	// Delete single Product
	@Transactional
	public void deletePatient(int pid) {
		Patients p = this.hibernateTemplate.load(Patients.class, pid);
		this.hibernateTemplate.delete(p);
	}
	
	// Get single Product
	public Patients getPatient(int pid) {
		return this.hibernateTemplate.get(Patients.class, pid);
	}
	
}
 