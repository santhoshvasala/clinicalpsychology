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

import com.clinicalpsychology.dao.MaritalStatusDao;
import com.clinicalpsychology.model.MaritalStatus;


@Controller
public class MaritalStatusController {

	@Autowired
	private MaritalStatusDao maritalStatusDao;
	
	@RequestMapping("/addMaritalStatus")
	public String addMaritalStatus(Model model) {
		List<MaritalStatus> maritalStatusList = maritalStatusDao.getMaritalStatuslist();
		model.addAttribute("maritalStatusList",maritalStatusList);
		return "addMaritalStatus";	
	}
	
	@RequestMapping(value = "/handleMaritalStatus", method = RequestMethod.POST)
	public RedirectView handleMaritalStatus(@ModelAttribute MaritalStatus maritalStatus, HttpServletRequest request, Model model) {
		maritalStatusDao.createmaritalStatus(maritalStatus);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/addMaritalStatus");
		return redirectView;
	}
	
	
	@RequestMapping("/deleteMaritalStatus/{id}")
	public RedirectView deleteMaritalStatus(@PathVariable("id") int id, HttpServletRequest request) {
		this.maritalStatusDao.deleteMaritalStatus(id);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/");
		return redirectView;
	}
	
	@RequestMapping("/updateMaritalStatus/{id}")
	public String updateMaritalStatus(@PathVariable("id")int pid, Model model) {
		MaritalStatus maritalStatus = this.maritalStatusDao.getMaritalStatus(pid);
		model.addAttribute("maritalStatus", maritalStatus);
		return "updateMaritalStatus";
	}
}
