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

import com.clinicalpsychology.dao.OccupationDao;
import com.clinicalpsychology.model.Occupation;

@Controller
public class OccupationController {

	@Autowired
	private OccupationDao occupationDao;

	@RequestMapping("/addOccupation")
	public String addOccupation(Model model) {
		List<Occupation> occupations = occupationDao.getOccupations();
		model.addAttribute("occupations", occupations);
		return "addOccupation";
	}

	@RequestMapping(value = "/handleOccupation", method = RequestMethod.POST)
	public RedirectView handleOccupation(@ModelAttribute Occupation gender, HttpServletRequest request, Model model) {
		occupationDao.createOccupation(gender);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/addOccupation");
		return redirectView;
	}

	@RequestMapping("/deleteOccupation/{id}")
	public RedirectView deleteOccupation(@PathVariable("id") int id, HttpServletRequest request) {
		this.occupationDao.deleteOccupation(id);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/");
		return redirectView;
	}

	@RequestMapping("/updateOccupation/{id}")
	public String updateOccupation(@PathVariable("id") int pid, Model model) {
		Occupation occupation = this.occupationDao.getOccupation(pid);
		model.addAttribute("occupation", occupation);
		return "updateOccupation";
	}
}
