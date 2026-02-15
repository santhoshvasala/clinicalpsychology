package com.clinicalpsychology.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
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
import com.clinicalpsychology.model.Search;
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

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String displayLogin(Model model) {
		model.addAttribute("login", new Login());
		return "login";
	}

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
	public ModelAndView loginProcess(@RequestParam(required = false) String searchName,
			@RequestParam(required = false) String searchMobile, @RequestParam(required = false) String searchEmail,
			@RequestParam(required = false) String searchPlace, @RequestParam(required = false) String searchDiagnosis,
			@RequestParam(required = false) String page, @RequestParam(required = false) String pageSize,
			@SessionAttribute(name = "userSession") Object userSession) {
		ModelAndView mav = null;
		List<Patients> patients = null;
		Consultant user = (Consultant) userSession;
		int page1 = 1;
		int pageSize1 = 1;
		long totalPatients = 1;
		boolean isSearch = false;

		if (!StringUtils.isEmpty(searchName) || !StringUtils.isEmpty(searchPlace) || !StringUtils.isEmpty(searchDiagnosis)
				|| !StringUtils.isEmpty(searchEmail) || !StringUtils.isEmpty(searchMobile)) {
			isSearch = true;
			System.out.println(" search name : " + searchName);
			System.out.println(" search mobile : " + searchMobile);
		}
		if (page != null) {
			page1 = Integer.valueOf(page);
		}
		if (pageSize != null) {
			System.out.println(" -- " + pageSize);
			pageSize1 = Integer.valueOf(pageSize);
			
		}
		Search search = new Search(searchName, searchMobile, searchEmail,   searchPlace  , searchDiagnosis);
		System.out.println(" page: " + page1 + "pageSize: " + pageSize1);
		if (user == null) {
			mav = new ModelAndView("login");
			mav.addObject("login", new Login());
			mav.addObject("message", "User session expired. please re login  ");
			return mav;
		}
		if (user.getConsultantFirstName().equals("admin")) {
			if (isSearch) {
				totalPatients = patientDao.searchPatientsCount(search, null);
				patients = patientDao.searchPatients(search, null, page1, pageSize1);
			} else {
				totalPatients = patientDao.getAllPatientsCount();
				patients = patientDao.getAllPatients(page1, pageSize1);
			}
			mav = new ModelAndView("adminHome");
		} else {
			if (isSearch) {
				totalPatients = patientDao.searchPatientsCount(search, user.getConsultantId());
				patients = patientDao.searchPatients(search, user.getConsultantId(), page1, pageSize1);
			} else {
				totalPatients = patientDao.getPatientsCountByConsultant(user.getConsultantId());
				patients = patientDao.getPatientsByConsultant(user.getConsultantId(), page1, pageSize1);
			}
			mav = new ModelAndView("home");
		}
		int totalPages = (int) Math.ceil((double) totalPatients / pageSize1);

		mav.addObject("patients", patients);
		mav.addObject("currentPage", page);
		mav.addObject("totalPages", totalPages);
		mav.addObject("pageSize", pageSize);
		mav.addObject("user", user);
		mav.addObject("searchName", searchName);
		mav.addObject("searchPlace", searchPlace);
		mav.addObject("searchDiagnosis", searchDiagnosis);
		mav.addObject("searchEmail", searchEmail);
		mav.addObject("searchMobile", searchMobile);
		return mav;
	}

	@RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
	public ModelAndView loginProcess(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("login") Login login, @ModelAttribute("search") Search search) {
		ModelAndView mav = null;
		List<Patients> patients = null;

		Consultant user = userService.validateUser(login);

		int page = 1;
		int pageSize = 1;
		long totalPatients = 1;

		if (null != user) {
			if (user.getConsultantFirstName().equals("admin")) {
				totalPatients = patientDao.getAllPatientsCount();
				patients = patientDao.getAllPatients(page, pageSize);
				mav = new ModelAndView("adminHome");
			} else {
				totalPatients = patientDao.getPatientsCountByConsultant(user.getConsultantId());
				patients = patientDao.getPatientsByConsultant(user.getConsultantId(), page, pageSize);
				mav = new ModelAndView("home");
			}
			int totalPages = (int) Math.ceil((double) totalPatients / pageSize);
			mav.addObject("patients", patients);
			mav.addObject("user", user);
			mav.addObject("currentPage", page);
			mav.addObject("totalPages", totalPages);
			mav.addObject("pageSize", pageSize);
			request.getSession(true).setAttribute("userSession", user);
			request.getSession(true).setAttribute("genders", genderDao.getGenders());
			request.getSession(true).setAttribute("religions", religionDao.getReligions());
			request.getSession(true).setAttribute("maritalStatuslist", maritalStatusDao.getMaritalStatuslist());
			request.getSession(true).setAttribute("educations", educationDao.getEducations());
			request.getSession(true).setAttribute("occupations", occupationDao.getOccupations());
			request.getSession(true).setAttribute("referrels", referralSouceDao.getReferralSources());
			request.getSession(true).setAttribute("purposelist", purposeDao.getPurposes());
			request.getSession(true).setAttribute("places", placeOfConsulationDao.getConsultationPlaces());
		} else {
			mav = new ModelAndView("login");
			mav.addObject("errMessage", "Username or Password is wrong!!");
		}
		

		return mav;
	}

}
