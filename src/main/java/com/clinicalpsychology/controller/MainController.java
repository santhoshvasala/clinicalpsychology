package com.clinicalpsychology.controller;

import java.util.Arrays;
import java.util.Date;
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

import com.clinicalpsychology.dao.PatientDao;
import com.clinicalpsychology.dao.ProductDao;
import com.clinicalpsychology.model.Patients;
import com.clinicalpsychology.model.Product;

@Controller
public class MainController {

	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private PatientDao patientDao;
	
	@RequestMapping("/home")
	public String viewHome(Model model) {
		List<Patients> patients = patientDao.getPatient();
		model.addAttribute("patients", patients);
		/*
		 * List<Product> product=productDao.getProducts(); model.addAttribute("product",
		 * product);
		 */	
		return "home";
	}
	
	@RequestMapping("/addproduct")
	public String addProduct(Model model) {
		model.addAttribute("title","Add Your Product");
		List<String> framework = Arrays.asList(
	            "Apache Struts", "Spring", "Hibernate",
	            "Grails", "Java Server Faces");
		model.addAttribute("javaFramworks", framework);
		return "add_product";	
	}
	
	@RequestMapping("/addPatient")
	public String addPatient(Model model) {
		return "add_patient";	
	}
	
	@RequestMapping(value = "/handle-product", method = RequestMethod.POST)
	public RedirectView handleProduct(@ModelAttribute Product product, HttpServletRequest request) {
		System.out.println(product);
		productDao.createProduct(product);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/");
		return redirectView;
		
	}
	@RequestMapping(value = "/handle-patient", method = RequestMethod.POST)
	public RedirectView handlePatient(@ModelAttribute Patients patient, HttpServletRequest request) {
		System.out.println(patient);
		patientDao.createPatient(patient);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/");
		return redirectView;
		
	}
	
	/*
	 * @RequestMapping("/delete/{productId}") public RedirectView
	 * deleteProduct(@PathVariable("productId") int productId, HttpServletRequest
	 * request) { this.productDao.deleteProduct(productId); RedirectView
	 * redirectView = new RedirectView();
	 * redirectView.setUrl(request.getContextPath() + "/"); return redirectView; }
	 */
	
	@RequestMapping("/delete/{productId}")
	public RedirectView deleteProduct(@PathVariable("productId") int productId, HttpServletRequest request) {
	//	this.productDao.deleteProduct(productId);
		patientDao.deletePatient(productId);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/");
		return redirectView;
	}
	
	@RequestMapping("/update/{productId}")
	public String updateProduct(@PathVariable("productId")int pid, Model model) {
		model.addAttribute("title","Update Product");
		Product product = this.productDao.getProduct(pid);
		model.addAttribute("product", product);
		return "update_product";
	}
}
