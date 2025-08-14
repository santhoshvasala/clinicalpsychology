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

import com.clinicalpsychology.dao.ReferralSouceDao;
import com.clinicalpsychology.model.ReferralSource;

@Controller
public class ReferralSourceController {

	@Autowired
	private ReferralSouceDao referralSourceDao;
	
	@RequestMapping("/addReferralSource")
	public String addReferralSource(Model model) {
		List<ReferralSource> referrelSources = referralSourceDao.getReferralSources();
		model.addAttribute("referralSources",referrelSources);
		return "addReferralSource";	
	}
	
	@RequestMapping(value = "/handleReferralSource", method = RequestMethod.POST)
	public RedirectView handleReferralSource(@ModelAttribute ReferralSource referrelSource, HttpServletRequest request, Model model) {
		referralSourceDao.createReferralSource(referrelSource);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/addReferralSource");
		return redirectView;
	}
	
	
	@RequestMapping("/deleteReferralSource/{id}")
	public RedirectView deleteReferralSource(@PathVariable("id") int id, HttpServletRequest request) {
		this.referralSourceDao.deleteReferralSource(id);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/");
		return redirectView;
	}
	
	@RequestMapping("/updateReferralSource/{id}")
	public String updateReferralSource(@PathVariable("id")int pid, Model model) {
		ReferralSource referrelSource = this.referralSourceDao.getReferralSource(pid);
		model.addAttribute("referrelSource", referrelSource);
		return "updateReferrelSource";
	}
}
