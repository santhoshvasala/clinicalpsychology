package com.clinicalpsychology.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.clinicalpsychology.model.Attachment;
import com.clinicalpsychology.model.Patients;
import com.clinicalpsychology.model.PatientsDetails1;
import com.clinicalpsychology.model.PatientsDetails2;
import com.clinicalpsychology.model.Search;
import com.clinicalpsychology.model.SessionNotes;

@Component
public class PatientDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;

	// Create Product
	@Transactional
	public void createPatient(Patients patient) {
		this.hibernateTemplate.saveOrUpdate(patient);

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

	public Integer getMaxPatientNumberByCidYear(String consultantId, int year) {
		String query = " select max(patientNumber) FROM Patients where consultantId = '" + consultantId
				+ "' and Year(createdDate)=" + year;
		return ((List<Integer>) this.hibernateTemplate.find(query)).get(0);
	}

	@Transactional
	public List<Patients> searchPatients(Search search, String consultantId, int page, int pageSize) {
		StringBuffer sb = new StringBuffer();
		boolean and = false;
		sb.append("FROM Patients p ");
		if (search != null || consultantId != null) {
			sb.append("  WHERE 1=1 ");
		}
		if (consultantId != null && !consultantId.equalsIgnoreCase("admin")) {
			sb.append(" and p.consultantId = '" + consultantId + "' ");
			and = true;
		}
		if (!StringUtils.isEmpty(search.getSearchName()) || !StringUtils.isEmpty(search.getSearchMobile())
				|| !StringUtils.isEmpty(search.getSearchEmail()) || !StringUtils.isEmpty(search.getSearchPlace())
				|| !StringUtils.isEmpty(search.getSearchDiagnosis())) {

			if (!StringUtils.isEmpty(search.getSearchName())) {
				sb.append(" and p.firstName like '%" + search.getSearchName() + "%'");
			}
			if (!StringUtils.isEmpty(search.getSearchEmail())) {
				sb.append(" and p.email1 like '%" + search.getSearchEmail() + "%'");
			}
			if (!StringUtils.isEmpty(search.getSearchMobile())) {
				sb.append(" and p.clientmobile like '%" + search.getSearchMobile() + "%'");
			}
			if (!StringUtils.isEmpty(search.getSearchPlace())) {
				sb.append(" and p.placeofconsultation like '%" + search.getSearchPlace() + "%'");
			}
			if (!StringUtils.isEmpty(search.getSearchDiagnosis())) {
				sb.append(" and p.patientsDetails2.provisionalDiagnosis like '%" + search.getSearchDiagnosis() + "%'");
			}
		}
		int firstResultIndex = (page - 1) * pageSize;
		sb.append(" order by p.patientNumber ");
		Query query = hibernateTemplate.getSessionFactory().getCurrentSession().createQuery(sb.toString());
		query.setFirstResult(firstResultIndex);
		query.setMaxResults(pageSize);
		return (List<Patients>) query.list();
	}

	@Transactional
	public long searchPatientsCount(Search search, String consultantId) {
		StringBuffer sb = new StringBuffer();
		sb.append("select count(1) FROM Patients p ");
		if (search != null || consultantId != null) {
			sb.append("  WHERE 1=1 ");
		}
		if (consultantId != null && !consultantId.equalsIgnoreCase("admin")) {
			sb.append(" and p.consultantId = '" + consultantId + "' ");
		}
		if (!StringUtils.isEmpty(search.getSearchName()) || !StringUtils.isEmpty(search.getSearchMobile())
				|| !StringUtils.isEmpty(search.getSearchEmail()) || !StringUtils.isEmpty(search.getSearchPlace())
				|| !StringUtils.isEmpty(search.getSearchDiagnosis())) {

			if (!StringUtils.isEmpty(search.getSearchName())) {
				sb.append(" and p.firstName like '%" + search.getSearchName() + "%'");
			}
			if (!StringUtils.isEmpty(search.getSearchEmail())) {
				sb.append(" and p.email1 like '%" + search.getSearchEmail() + "%'");
			}
			if (!StringUtils.isEmpty(search.getSearchMobile())) {
				sb.append(" and p.clientmobile like '%" + search.getSearchMobile() + "%'");
			}
			if (!StringUtils.isEmpty(search.getSearchPlace())) {
				sb.append(" and p.placeofconsultation like '%" + search.getSearchPlace() + "%'");
			}
			if (!StringUtils.isEmpty(search.getSearchDiagnosis())) {
				sb.append(" and p.patientsDetails2.provisionalDiagnosis like '%" + search.getSearchDiagnosis() + "%'");
			}
		}
		return ((List<Long>) this.hibernateTemplate.find(sb.toString())).get(0);
	}

	public long getAllPatientsCount() {
		String hql = "select count(1) FROM Patients ";
		return ((List<Long>) this.hibernateTemplate.find(hql)).get(0);
	}

	@Transactional
	public java.util.List<Patients> getAllPatients(int page, int pageSize) {
		int firstResultIndex = (page - 1) * pageSize;
		String hql = "FROM Patients u order by patientNumber desc  ";
		Query query = hibernateTemplate.getSessionFactory().getCurrentSession().createQuery(hql);
		query.setFirstResult(firstResultIndex);
		query.setMaxResults(pageSize);
		return (List<Patients>) query.list();
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

	public long getPatientsCountByConsultant(String consultantId) {
		String hql = "select count(1) FROM Patients u WHERE u.consultantId = '" + consultantId + "'";
		return ((List<Long>) this.hibernateTemplate.find(hql)).get(0);
	}

	@Transactional
	public List<Patients> getPatientsByConsultant(String consultantId, int page, int pageSize) {
		int firstResultIndex = (page - 1) * pageSize;
		String hql = "FROM Patients u WHERE u.consultantId = '" + consultantId + "' order by patientNumber desc ";
		Query query = hibernateTemplate.getSessionFactory().getCurrentSession().createQuery(hql);
		query.setFirstResult(firstResultIndex);
		query.setMaxResults(pageSize);
		return (List<Patients>) query.list();
	}

}
