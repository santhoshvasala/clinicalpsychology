package com.clinicalpsychology.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.clinicalpsychology.dao.PatientDao;
import com.clinicalpsychology.dao.SessionNotesDao;
import com.clinicalpsychology.model.Consultant;
import com.clinicalpsychology.model.Patients;
import com.clinicalpsychology.model.Search;
import com.clinicalpsychology.model.SessionNotes;

@Controller
public class MainController {

	@Autowired
	private PatientDao patientDao;
	
	@Autowired
	private SessionNotesDao sessionNotesDao;

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public ModelAndView search(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("search") Search search) {
		String searchText = search.getSearchString();
		List<Patients> patients = null;
		ModelAndView mav = null;
		System.out.println(" search - " + searchText);
		String[] strArray = searchText.split("");
		System.out.println(" search Array - " + strArray);

		Consultant user = (Consultant) request.getSession().getAttribute("userSession");
		System.out.println(" user from session " + user.getConsultantId());
		patients = patientDao.searchPatients(strArray, user.getConsultantId());
		if (user.getConsultantFirstName().equals("admin")) {
			mav = new ModelAndView("adminHome");
		} else {
			mav = new ModelAndView("home");
		}
		mav.addObject("patients", patients);
		return mav;
	}

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

	/*
	 * @RequestMapping("/addproduct") public String addProduct(Model model) {
	 * model.addAttribute("title", "Add Your Product"); List<String> framework =
	 * Arrays.asList("Apache Struts", "Spring", "Hibernate", "Grails",
	 * "Java Server Faces"); model.addAttribute("javaFramworks", framework); return
	 * "add_product"; }
	 */

	@RequestMapping("/addPatient")
	public String addPatient(Model model, HttpServletRequest request) {
		model.addAttribute("genders", request.getSession().getAttribute("genders"));
		model.addAttribute("religions", request.getSession().getAttribute("religions"));
		model.addAttribute("maritalStatuslist", request.getSession().getAttribute("maritalStatuslist"));
		model.addAttribute("educations", request.getSession().getAttribute("educations"));
		model.addAttribute("occupations", request.getSession().getAttribute("occupations"));
		model.addAttribute("referrels", request.getSession().getAttribute("referrels"));
		model.addAttribute("purposelist", request.getSession().getAttribute("purposelist"));
		model.addAttribute("places", request.getSession().getAttribute("places"));

		return "add_patient";
	}

	@RequestMapping(value = "/handleUpdatePatient/{patientId}", method = RequestMethod.POST)
	public RedirectView handleUpdatePatient(@PathVariable("patientId") int patientId, @ModelAttribute Patients patient,
			HttpServletRequest request, RedirectAttributes redirectAttributes) {
		System.out.println("pid=" + patientId);
		System.out.println("pid1=" + patient.getPatientsDetails1().getPatientdetailid());
		System.out.println("pid2=" + patient.getPatientsDetails2().getPatientdetailid2());
		Consultant user = (Consultant) request.getSession().getAttribute("userSession");
		patient.setConsultantId(user.getConsultantId());
		patient.setId(patientId);
		patientDao.createPatient(patient);
		redirectAttributes.addFlashAttribute("message", "Patient data updated successfully.");
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/updatePatient/" + patient.getId());
		return redirectView;

	}

	@RequestMapping(value = "/handleAddPatient", method = RequestMethod.POST)
	public RedirectView handleAddPatient(@ModelAttribute Patients patient, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		System.out.println(patient);
		Consultant user = (Consultant) request.getSession().getAttribute("userSession");
		patient.setConsultantId(user.getConsultantId());

		boolean isDupliacte = patientDao.isDuplicatePatient(patient.getFirstName(), patient.getEmail1(),
				patient.getClientmobile());
		if(isDupliacte)
		{
			redirectAttributes.addFlashAttribute("errMessage", "Patient data already exists..");
		}
		else
		{
			patientDao.createPatient(patient);
			redirectAttributes.addFlashAttribute("message", "Patient data added successfully.");
		}
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/addPatient");
		return redirectView;

	}

	@RequestMapping("/deletePatient/{patientId}")
	public RedirectView deletePatient(@PathVariable("patientId") int patientId, HttpServletRequest request) {
		// this.productDao.deleteProduct(productId);
		patientDao.deletePatient(patientId);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/" + returntoHome(request));
		return redirectView;
	}

	@RequestMapping("/updatePatient/{patientId}")
	public String updateProduct(@PathVariable("patientId") int pid, Model model, HttpServletRequest request) {
		model.addAttribute("title", "Update Product");
		Patients patient = patientDao.getPatient(pid);
		model.addAttribute("patient", patient);

		/*
		 * model.addAttribute("genders", request.getSession().getAttribute("genders"));
		 * model.addAttribute("religions",
		 * request.getSession().getAttribute("religions"));
		 * model.addAttribute("maritalStatuslist",
		 * request.getSession().getAttribute("maritalStatuslist"));
		 * model.addAttribute("educations",
		 * request.getSession().getAttribute("educations"));
		 * model.addAttribute("occupations",
		 * request.getSession().getAttribute("occupations"));
		 * model.addAttribute("referrels",
		 * request.getSession().getAttribute("referrels"));
		 * model.addAttribute("purposelist",
		 * request.getSession().getAttribute("purposelist"));
		 * model.addAttribute("places", request.getSession().getAttribute("places"));
		 */

		List<String> onsetlist = Arrays.asList("Acute", "Insidious");
		model.addAttribute("onsetlist", onsetlist);
		List<String> courselist = Arrays.asList("Continuous", "Episodic");
		model.addAttribute("courselist", courselist);

		List<String> reliabilityinfolist = Arrays.asList("Reliable", "Partially Reliable", "Unreliable");
		model.addAttribute("reliabilityinfolist", reliabilityinfolist);

		List<String> adequacyinfolist = Arrays.asList("Adequate", "Inadequate", "Unreliable");
		model.addAttribute("adequacyinfolist", adequacyinfolist);

		List<String> generalbuildlist = Arrays.asList("Thin", "Obese", "well-nourished", "frail");
		model.addAttribute("generalbuildlist", generalbuildlist);

		List<String> groominglist = Arrays.asList("Clean", "well-groomed", "disheveled", "neglected");
		model.addAttribute("groominglist", groominglist);

		List<String> dresslist = Arrays.asList("Appropriate", "Inappropriate");
		model.addAttribute("dresslist", dresslist);

		List<String> facialexpressionlist = Arrays.asList("Calm","Anxious", "Sad", "Blunted", "Suspicious",
				"Smiling inappropriately");
		model.addAttribute("facialexpressionlist", facialexpressionlist);

		List<String> eycontactlist = Arrays.asList("Good", "fleeting", "avoidant", "piercing");
		model.addAttribute("eycontactlist", eycontactlist);

		List<String> notablephysicalfeatureslist = Arrays.asList("Nil","Scars", "tattoos", "signs of self-harm", "tremors");
		model.addAttribute("notablephysicalfeatureslist", notablephysicalfeatureslist);

		List<String> posturelist = Arrays.asList("Upright", "slouched", "tense", "rigid");
		model.addAttribute("posturelist", posturelist);

		List<String> increasedactivitylist = Arrays.asList("Nil","Psychomotor agitation", "Hyperactivity", "Akathisia",
				"Restlessness", "Impulsivity");
		model.addAttribute("increasedactivitylist", increasedactivitylist);
		List<String> decreasedactivitylist = Arrays.asList("Nil","Psychomotor retardation", "Stupor", "Mutism", "Inertia",
				"Negativism");
		model.addAttribute("decreasedactivitylist", decreasedactivitylist);

		List<String> abnormalmovementslist = Arrays.asList("Nil","Catatonia", "waxy flexibility", "posturing", "stereotypy",
				"Echopraxia", "Tics", "Mannerisms", "Stereotypies", "Automatism", "Compulsions", "Grimacing",
				"Gait disturbances");
		model.addAttribute("abnormalmovementslist", abnormalmovementslist);

		List<String> quantitylist = Arrays.asList("Tempo (high/moderate/low)", "Volume (high/moderate/ low)",
				"Pressure of speech", "Poverty of speech", "Mutism", "Monosyllabic replies", "Verbosity");
		model.addAttribute("quantitylist", quantitylist);

		List<String> rateandrhythmlist = Arrays.asList("Nil","Pressured speech", "Retardation", "Hesitant speech",
				"Stuttering / stammering", "Cluttering");
		model.addAttribute("rateandrhythmlist", rateandrhythmlist);

		List<String> formandstructurelist = Arrays.asList("Nil","Neologisms", "Talking past the point (Vorbeireden)",
				"Aphasia (receptive/intermediate/expressive)", "Word salad", "Clang associations", "Echolalia",
				"Perseveration", "Flight of ideas", "Incoherence", "Derailment", "Cluttering");
		model.addAttribute("formandstructurelist", formandstructurelist);

		return "updatePatient";
	}

	private String returntoHome(HttpServletRequest request) {
		Consultant user = (Consultant) request.getSession().getAttribute("userSession");
		System.out.println(" user from session " + user.getConsultantId());
		if (user.getConsultantFirstName().equals("admin")) {
			return "adminHome";
		} else {
			return "home";
		}

	}

	@RequestMapping("/viewPatient/{patientId}")
	public String viewPatient(@PathVariable("patientId") int pid, Model model) {
		Patients patient = patientDao.getPatient(pid);
		List<SessionNotes> sessions = sessionNotesDao.getAllSessionNotesByPatientId(pid);
		System.out.println("sessions "+ sessions);
		model.addAttribute("patient", patient);
		model.addAttribute("sessions", sessions);
		return "viewPatient";
	}
}
