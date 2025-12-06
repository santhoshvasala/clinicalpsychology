package com.clinicalpsychology.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.clinicalpsychology.dao.ConsultantDao;
import com.clinicalpsychology.model.Consultant;
import com.clinicalpsychology.model.Login;

@Service
public class UserService{

	@Autowired
	private ConsultantDao consultantDao;

	public Consultant validateUser(Login login) {

		Consultant user = null;
		if (login.getUsername().equals("admin") && login.getPassword().equals("admin")) {
			user = new Consultant();
			user.setConsultantFirstName("admin");
			user.setConsultantPassword("admin");
		} else {
			user = consultantDao.getConsultantByLogin(login.getUsername(), login.getPassword());
		}
		return user;
	}

}
