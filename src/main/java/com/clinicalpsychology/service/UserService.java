package com.clinicalpsychology.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.clinicalpsychology.dao.AdminDao;
import com.clinicalpsychology.dao.ConsultantDao;
import com.clinicalpsychology.model.Admin;
import com.clinicalpsychology.model.Consultant;
import com.clinicalpsychology.model.Login;

@Service
public class UserService {

	@Autowired
	private ConsultantDao consultantDao;

	@Autowired
	private AdminDao adminDao;

	public Consultant validateUser(Login login) {

		Consultant user = null;
		if (login.getUsername().equals("admin")) {
			Admin admin = adminDao.getAdminDetails(login.getUsername());
			if (admin != null) {
				if (admin.getPassword().equalsIgnoreCase(login.getPassword())) {
					user = new Consultant();
					user.setConsultantFirstName(admin.getName());
					user.setConsultantPassword(admin.getPassword());
				}
			} else {
				admin  = new Admin();
				admin.setName("admin");
				admin.setPassword("admin");
				adminDao.saveOrUpdateAdmin(admin);
			}
		} else {
			user = consultantDao.getConsultantByLogin(login.getUsername(), login.getPassword());
		}
		return user;
	}

}
