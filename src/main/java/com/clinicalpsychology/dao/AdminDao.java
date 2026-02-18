package com.clinicalpsychology.dao;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.clinicalpsychology.model.Admin;

@Component
public class AdminDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;

	@Transactional
	public void saveOrUpdateAdmin(Admin admin) {
		this.hibernateTemplate.saveOrUpdate(admin);
	}

	public Admin getAdminDetails(String name) {
		List<Admin> list = (ArrayList<Admin>) hibernateTemplate
				.find("FROM Admin WHERE name = '" + name + "' ");
		if (list.isEmpty()) {
			return null;
		} else {
			return list.get(0);
		}

	}


}
