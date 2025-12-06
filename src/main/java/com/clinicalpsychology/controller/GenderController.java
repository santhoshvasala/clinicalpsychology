package com.clinicalpsychology.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.RedirectView;

import com.clinicalpsychology.dao.GenderDao;
import com.clinicalpsychology.dao.PatientDao;
import com.clinicalpsychology.dao.ProductDao;
import com.clinicalpsychology.model.Gender;
import com.clinicalpsychology.model.Patients;
import com.clinicalpsychology.model.Product;

@Controller
public class GenderController {

	@Autowired
	private GenderDao genderDao;
	
	@RequestMapping("/addGender")
	public String addPatient(Model model) {
		List<Gender> genders = genderDao.getGenders();
		model.addAttribute("title","Add Patient");
		model.addAttribute("genders",genders);
		return "addGender";	
	}
	
	@RequestMapping(value = "/handleGender", method = RequestMethod.POST)
	public RedirectView handleGender(@ModelAttribute Gender gender, HttpServletRequest request, Model model) {
		System.out.println(gender);
		genderDao.createGender(gender);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/addGender");
		return redirectView;
	}
	
	
	@RequestMapping("/deleteGender/{id}")
	public RedirectView deleteGender(@PathVariable("id") int id, HttpServletRequest request) {
		this.genderDao.deleteGender(id);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/addGender");
		return redirectView;
	}
	
	@RequestMapping("/updateGender/{id}")
	public String updateGender(@PathVariable("id")int pid, Model model) {
		Gender gender = this.genderDao.getGender(pid);
		model.addAttribute("gender", gender);
		return "updateGender";
	}
}
