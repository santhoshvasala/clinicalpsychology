package com.clinicalpsychology.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.clinicalpsychology.model.Attachment;
import com.clinicalpsychology.model.Consultant;
import com.clinicalpsychology.model.Patients;
import com.clinicalpsychology.model.PatientsDetails1;
import com.clinicalpsychology.model.PatientsDetails2;
import com.clinicalpsychology.model.SessionNotes;

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

	public boolean isDuplicatePatient(String name, String email, String phno) {
		String query = " select count(1) FROM Patients where firstName='" + name + "' and email1 = '" + email
				+ "' and clientmobile = '" + phno + "' ";
		return ((List<Long>) this.hibernateTemplate.find(query)).get(0) > 0 ? true : false;
	}

	@Transactional
	public List<Patients> searchPatients(String[] searchString, String consultantId) {
		StringBuffer sb = new StringBuffer();
		boolean and = false;
		sb.append("FROM Patients  ");
		if (searchString != null || consultantId != null) {
			sb.append("  WHERE ");
		}
		if (consultantId != null && !consultantId.equalsIgnoreCase("admin")) {
			sb.append(" consultantId = '" + consultantId + "' ");
			and = true;
		}
		if (!StringUtils.isEmpty(searchString)) {
			if (and) {
				sb.append(" and ");
			}
			sb.append(" firstName in '%" + searchString + "%' OR  clientmobile like '%" + searchString + "%' ");
		}
		Query<Patients> query = this.hibernateTemplate.getSessionFactory().getCurrentSession()
				.createQuery(sb.toString(), Patients.class);
		return query.list();
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
		PatientsDetails1 p1 = p.getPatientsDetails1();
		PatientsDetails2 p2 = p.getPatientsDetails2();
		for (SessionNotes s : p.getSessions()) {
			s.setPatientid(null);
			this.hibernateTemplate.delete(s);
		}
		for (Attachment s : p.getFiles()) {
			s.setPatientid(null);
			this.hibernateTemplate.delete(s);
		}
		if (p2 != null) {
			p2.setPatientid(null);
			this.hibernateTemplate.delete(p2);
		}
		if (p1 != null) {
			p1.setPatientid(null);
			this.hibernateTemplate.delete(p1);
		}
		p.setFiles(null);
		p.setSessions(null);
		p.setPatientsDetails1(null);
		p.setPatientsDetails2(null);
		this.hibernateTemplate.delete(p);
	}

	// Get single Product
	public Patients getPatient(int pid) {
		Patients patient = this.hibernateTemplate.get(Patients.class, pid);
		return patient;
	}

	public List<Patients> getPatientsByConsultant(String consultantId) {
		String hql = "FROM Patients u WHERE u.consultantId = '" + consultantId + "' ";
		return (List<Patients>) hibernateTemplate.find(hql);
	}

}
