package com.clinicalpsychology.controller;

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

import com.clinicalpsychology.dao.EducationDao;
import com.clinicalpsychology.model.Education;

@Controller
public class EducationController {

	@Autowired
	private EducationDao educationDao;
	
	@RequestMapping("/addEducation")
	public String addEducation(Model model) {
		List<Education> educations = educationDao.getEducations();
		model.addAttribute("title","Add Patient");
		model.addAttribute("educations",educations);
		return "addEducation";	
	}
	
	@RequestMapping(value = "/handleEducation", method = RequestMethod.POST)
	public RedirectView handleEducation(@ModelAttribute Education education, HttpServletRequest request, Model model) {
		educationDao.createEducation(education);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/addEducation");
		return redirectView;
	}
	
	
	@RequestMapping("/deleteEducation/{id}")
	public RedirectView deleteEducation(@PathVariable("id") int id, HttpServletRequest request) {
		this.educationDao.deleteEducation(id);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/addEducation");
		return redirectView;
	}
	
	@RequestMapping("/updateEducation/{id}")
	public String updateEducation(@PathVariable("id")int pid, Model model) {
		Education gender = this.educationDao.getEducation(pid);
		model.addAttribute("education", gender);
		return "addEducation";
	}
}
