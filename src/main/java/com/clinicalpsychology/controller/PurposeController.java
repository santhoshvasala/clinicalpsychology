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

import com.clinicalpsychology.dao.PurposeDao;
import com.clinicalpsychology.model.Purpose;

@Controller
public class PurposeController {

	@Autowired
	private PurposeDao PurposeDao;
	
	@RequestMapping("/addPurpose")
	public String addPurpose(Model model) {
		List<Purpose> purposes = PurposeDao.getPurposes();
		model.addAttribute("purposes",purposes);
		return "addPurpose";	
	}
	
	@RequestMapping(value = "/handlePurpose", method = RequestMethod.POST)
	public RedirectView handlePurpose(@ModelAttribute Purpose Purpose, HttpServletRequest request, Model model) {
		PurposeDao.createPurpose(Purpose);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/addPurpose");
		return redirectView;
	}
	
	
	@RequestMapping("/deletePurpose/{id}")
	public RedirectView deletePurpose(@PathVariable("id") int id, HttpServletRequest request) {
		this.PurposeDao.deletePurpose(id);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/");
		return redirectView;
	}
	
	@RequestMapping("/updatePurpose/{id}")
	public String updatePurpose(@PathVariable("id")int pid, Model model) {
		Purpose purpose = this.PurposeDao.getPurpose(pid);
		model.addAttribute("purpose", purpose);
		return "updatePurpose";
	}
}
