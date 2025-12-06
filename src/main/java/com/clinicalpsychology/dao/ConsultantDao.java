package com.clinicalpsychology.dao;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.clinicalpsychology.model.Consultant;

@Component
public class ConsultantDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;

	@Transactional
	public void saveOrUpdateConsultant(Consultant consultant) {
		this.hibernateTemplate.saveOrUpdate(consultant);
	}

	public java.util.List<Consultant> getConsultants() {
		java.util.List<Consultant> consultants = this.hibernateTemplate.loadAll(Consultant.class);
		return consultants;
	}

	// Delete single Product
	@Transactional
	public void deleteConsultant(String pid) {
		Consultant p = this.hibernateTemplate.load(Consultant.class, pid);
		this.hibernateTemplate.delete(p);
	}

	// Get single Product
	public Consultant getConsultant(String pid) {
		return this.hibernateTemplate.get(Consultant.class, pid);
	}

	public Consultant getConsultantByLogin(String id, String pwd) {
		List<Consultant> list = (ArrayList<Consultant>) hibernateTemplate
				.find("FROM Consultant WHERE consultantId = '" + id + "' and consultantPassword = '" + pwd + "'");
		if(list.isEmpty())
		{
			return null;
		}
		else
		{
			return list.get(0);
		}
		
	}

}
