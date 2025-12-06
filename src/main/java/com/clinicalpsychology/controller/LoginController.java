package com.clinicalpsychology.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.clinicalpsychology.dao.EducationDao;
import com.clinicalpsychology.dao.GenderDao;
import com.clinicalpsychology.dao.MaritalStatusDao;
import com.clinicalpsychology.dao.OccupationDao;
import com.clinicalpsychology.dao.PatientDao;
import com.clinicalpsychology.dao.PlaceOfConsulationDao;
import com.clinicalpsychology.dao.PurposeDao;
import com.clinicalpsychology.dao.ReferralSouceDao;
import com.clinicalpsychology.dao.ReligionDao;
import com.clinicalpsychology.model.Consultant;
import com.clinicalpsychology.model.Login;
import com.clinicalpsychology.model.Patients;
import com.clinicalpsychology.service.UserService;

@Controller
public class LoginController {

	@Autowired
	UserService userService;

	@Autowired
	GenderDao genderDao;

	@Autowired
	ReligionDao religionDao;

	@Autowired
	MaritalStatusDao maritalStatusDao;

	@Autowired
	EducationDao educationDao;

	@Autowired
	OccupationDao occupationDao;
	@Autowired
	ReferralSouceDao referralSouceDao;
	@Autowired
	PurposeDao purposeDao;
	@Autowired
	PlaceOfConsulationDao placeOfConsulationDao;

	@Autowired
	private PatientDao patientDao;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView showLogin(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("login");
		mav.addObject("login", new Login());

		return mav;
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().invalidate();
		ModelAndView mav = new ModelAndView("login");
		mav.addObject("login", new Login());
		return mav;
	}
	
	@RequestMapping(value = "/homePage")
	public ModelAndView loginProcess(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = null;
		List<Patients> patients = null;
		Consultant user = (Consultant) request.getSession().getAttribute("userSession");
		System.out.println(" user from session " + user);
		if(user == null)
		{
			mav = new ModelAndView("login");
			mav.addObject("login", new Login());
			mav.addObject("message", "User session expired. please re login  ");
			return mav;
		}
		System.out.println(" user from session " + user.getConsultantId());
			if (user.getConsultantFirstName().equals("admin")) {
				patients = patientDao.getPatient();
				mav = new ModelAndView("adminHome");
			} else {
				patients = patientDao.getPatientsByConsultant(user.getConsultantId());
				mav = new ModelAndView("home");
			}
			mav.addObject("patients", patients);
			mav.addObject("user", user);
			return mav;
	}

	@RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
	public ModelAndView loginProcess(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("login") Login login) {
		ModelAndView mav = null;
		List<Patients> patients = null;

		Consultant user = userService.validateUser(login);

		if (null != user) {
			if (user.getConsultantFirstName().equals("admin")) {
				patients = patientDao.getPatient();
				mav = new ModelAndView("adminHome");
			} else {
				patients = patientDao.getPatientsByConsultant(user.getConsultantId());
				mav = new ModelAndView("home");
			}
			mav.addObject("patients", patients);
			mav.addObject("user", user);
		} else {
			mav = new ModelAndView("login");
			mav.addObject("message", "Username or Password is wrong!!");
		}
		request.getSession(true).setAttribute("userSession", user);
		request.getSession(true).setAttribute("genders", genderDao.getGenders());
		request.getSession(true).setAttribute("religions", religionDao.getReligions());
		request.getSession(true).setAttribute("maritalStatuslist", maritalStatusDao.getMaritalStatuslist());
		request.getSession(true).setAttribute("educations", educationDao.getEducations());
		request.getSession(true).setAttribute("occupations", occupationDao.getOccupations());
		request.getSession(true).setAttribute("referrels", referralSouceDao.getReferralSources());
		request.getSession(true).setAttribute("purposelist", purposeDao.getPurposes());
		request.getSession(true).setAttribute("places", placeOfConsulationDao.getConsultationPlaces());

		return mav;
	}

}
