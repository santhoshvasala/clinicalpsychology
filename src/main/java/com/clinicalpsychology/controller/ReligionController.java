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

import com.clinicalpsychology.dao.ReligionDao;
import com.clinicalpsychology.model.Religion;

@Controller
public class ReligionController {

	@Autowired
	private ReligionDao ReligionDao;
	
	@RequestMapping("/addReligion")
	public String addPatient(Model model) {
		List<Religion> religions = ReligionDao.getReligions();
		model.addAttribute("title","Add Patient");
		model.addAttribute("religions",religions);
		return "addReligion";	
	}
	
	@RequestMapping(value = "/handleReligion", method = RequestMethod.POST)
	public RedirectView handleReligion(@ModelAttribute Religion religion, HttpServletRequest request, Model model) {
		System.out.println(religion);
		ReligionDao.createReligion(religion);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/addReligion");
		return redirectView;
	}
	
	
	@RequestMapping("/deleteReligion/{id}")
	public RedirectView deleteReligion(@PathVariable("id") int id, HttpServletRequest request) {
		this.ReligionDao.deleteReligion(id);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/");
		return redirectView;
	}
	
	@RequestMapping("/updateReligion/{id}")
	public String updateReligion(@PathVariable("id")int pid, Model model) {
		Religion religion = this.ReligionDao.getReligion(pid);
		model.addAttribute("religion", religion);
		return "updateReligion";
	}
}
