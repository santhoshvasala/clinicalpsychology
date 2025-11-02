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

import com.clinicalpsychology.dao.ConsultantDao;
import com.clinicalpsychology.model.Consultant;

@Controller
public class ConsultantController {

	@Autowired
	private ConsultantDao consultantDao;
	
	@RequestMapping("/addConsultant")
	public String addConsultant(Model model) {
		List<Consultant> consultants = consultantDao.getConsultants();
		model.addAttribute("consultants",consultants);
		return "addConsultant";	
	}
	
	@RequestMapping(value = "/handleConsultant", method = RequestMethod.POST)
	public RedirectView handleConsultant(@ModelAttribute Consultant consultant, HttpServletRequest request, Model model) {
		consultantDao.createConsultant(consultant);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/addConsultant");
		return redirectView;
	}
	
	
	@RequestMapping("/deleteConsultant/{id}")
	public RedirectView deleteConsultant(@PathVariable("id") int id, HttpServletRequest request) {
		this.consultantDao.deleteConsultant(id);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/");
		return redirectView;
	}
	
	@RequestMapping("/updateConsultant/{id}")
	public String updateConsultant(@PathVariable("id")int pid, Model model) {
		Consultant consultant = this.consultantDao.getConsultant(pid);
		model.addAttribute("consultant", consultant);
		return "updateConsultant";
	}
}
