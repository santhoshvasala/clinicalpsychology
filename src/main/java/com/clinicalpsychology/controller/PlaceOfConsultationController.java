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

import com.clinicalpsychology.dao.PlaceOfConsulationDao;
import com.clinicalpsychology.model.ConsultationPlace;


@Controller
public class PlaceOfConsultationController {

	@Autowired
	private PlaceOfConsulationDao placeOfConsulationDao;
	
	@RequestMapping("/addConsultationPlace")
	public String addConsultationPlace(Model model) {
		List<ConsultationPlace> ConsultationPlaces = placeOfConsulationDao.getConsultationPlaces();
		model.addAttribute("consultationPlaces",ConsultationPlaces);
		return "addConsultationPlace";	
	}
	
	@RequestMapping(value = "/handlePlaceOfConsulation", method = RequestMethod.POST)
	public RedirectView handlePlaceOfConsulation(@ModelAttribute ConsultationPlace consultationPlace, HttpServletRequest request, Model model) {
		System.out.println(consultationPlace);
		placeOfConsulationDao.createConsultationPlace(consultationPlace);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/addConsultationPlace");
		return redirectView;
	}
	
	
	@RequestMapping("/deletePlaceOfConsulation/{id}")
	public RedirectView deletePlaceOfConsulation(@PathVariable("id") int id, HttpServletRequest request) {
		this.placeOfConsulationDao.deleteConsultationPlace(id);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/");
		return redirectView;
	}
	
	@RequestMapping("/updatePlaceOfConsulation/{id}")
	public String updatePlaceOfConsulation(@PathVariable("id")int pid, Model model) {
		ConsultationPlace gender = this.placeOfConsulationDao.getConsultationPlace(pid);
		model.addAttribute("consultationPlace", gender);
		return "updatePlaceOfConsulation";
	}
}
