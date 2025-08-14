package com.clinicalpsychology.dao;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.clinicalpsychology.model.Gender;
import com.clinicalpsychology.model.ReferralSource;



@Component
public class ReferralSouceDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	
	// Create Product 
	@Transactional
	public void createReferralSource(ReferralSource gender) {
		this.hibernateTemplate.saveOrUpdate(gender);
	}
	
	// Getting all Product
	public java.util.List<ReferralSource> getReferralSources() {
		java.util.List<ReferralSource> genders = this.hibernateTemplate.loadAll(ReferralSource.class);
		return genders;
	}
	
	// Delete single Product
	@Transactional
	public void deleteReferralSource(int pid) {
		ReferralSource p = this.hibernateTemplate.load(ReferralSource.class, pid);
		this.hibernateTemplate.delete(p);
	}
	
	// Get single Product
	public ReferralSource getReferralSource(int pid) {
		return this.hibernateTemplate.get(ReferralSource.class, pid);
	}
	
}
