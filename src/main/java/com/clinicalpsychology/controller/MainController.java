package com.clinicalpsychology.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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

	@Autowired
	private ServletContext servletContext;

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public ModelAndView search(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("search") Search search) {
		List<Patients> patients = null;
		ModelAndView mav = null;
		int page = 1;
		int pageSize = 1;
		long totalPatients = 1;
		Consultant user = (Consultant) request.getSession().getAttribute("userSession");

		if (user.getConsultantFirstName().equals("admin")) {
			totalPatients = patientDao.searchPatientsCount(search, null);
			patients = patientDao.searchPatients(search, null, page, pageSize);
			mav = new ModelAndView("adminHome");
		} else {
			totalPatients = patientDao.searchPatientsCount(search, user.getConsultantId());
			patients = patientDao.searchPatients(search, user.getConsultantId(), page, pageSize);
			mav = new ModelAndView("home");
		}
		int totalPages = (int) Math.ceil((double) totalPatients / pageSize);
		mav.addObject("patients", patients);
		mav.addObject("search", search);
		mav.addObject("currentPage", page);
		mav.addObject("totalPages", totalPages);
		mav.addObject("pageSize", pageSize);
		return mav;
	}

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

		return "addPatient";
	}

	@RequestMapping(value = "/handleUpdatePatient/{patientId}", method = RequestMethod.POST)
	public RedirectView handleUpdatePatient(@PathVariable("patientId") int patientId, @ModelAttribute Patients patient,
			HttpServletRequest request, RedirectAttributes redirectAttributes,
			@RequestParam("patientPic") MultipartFile patientPic, @RequestParam("historyPic") MultipartFile historyPic,
			@RequestParam("isProfileChanged") boolean isProfileChanged,
			@RequestParam("isfamilyPicChanged") boolean isfamilyPicChanged) throws IOException {

		Patients currentPatient = patientDao.getPatient(patientId);

		Consultant user = (Consultant) request.getSession().getAttribute("userSession");
		patient.setConsultantId(user.getConsultantId());
		patient.setId(patientId);
		if (isProfileChanged) {
			patient.setProfilePic(patientPic.getBytes());
		} else {
			patient.setProfilePic(currentPatient.getProfilePic());
		}

		if (isfamilyPicChanged) {
			patient.setFamilyHIstoryPic(historyPic.getBytes());
		} else {
			patient.setFamilyHIstoryPic(currentPatient.getFamilyHIstoryPic());
		}
		patientDao.createPatient(patient);
		redirectAttributes.addFlashAttribute("message", "Patient data updated successfully.");
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/updatePatient/" + patient.getId());
		return redirectView;

	}

	@RequestMapping(value = "/handleAddPatient", method = RequestMethod.POST)
	public RedirectView handleAddPatient(@ModelAttribute Patients patient, HttpServletRequest request,
			RedirectAttributes redirectAttributes, @RequestParam("patientPic") MultipartFile patientPic,
			@RequestParam("historyPic") MultipartFile historyPic,
			@RequestParam("isProfileChanged") boolean isProfileChanged,
			@RequestParam("isfamilyPicChanged") boolean isfamilyPicChanged) throws IOException {
		Consultant user = (Consultant) request.getSession().getAttribute("userSession");
		patient.setConsultantId(user.getConsultantId());
		if (isProfileChanged) {
			patient.setProfilePic(patientPic.getBytes());
		} 

		if (isfamilyPicChanged) {
			patient.setFamilyHIstoryPic(historyPic.getBytes());
		}

		boolean isDupliacte = patientDao.isDuplicatePatient(patient.getFirstName(), patient.getEmail1(),
				patient.getClientmobile());
		if (isDupliacte) {
			redirectAttributes.addFlashAttribute("errMessage", "Patient data already exists..");
		} else {

			Calendar calendar = Calendar.getInstance();
			calendar.setTime(patient.getCreatedDate()); // Set the calendar time to the Date object

			int year = calendar.get(Calendar.YEAR);

			Integer maxPNumber = patientDao.getMaxPatientNumberByCidYear(user.getConsultantId(), year);
			if (maxPNumber == null || maxPNumber == 0) {
				maxPNumber = Integer.valueOf(year + "00001");
			} else {
				maxPNumber++;
			}
			patient.setPatientNumber(maxPNumber);
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
	public String updatePatient(@PathVariable("patientId") int pid, Model model, HttpServletRequest request)
			throws IOException {
		model.addAttribute("title", "Update Product");
		Patients patient = patientDao.getPatient(pid);

		if (patient.getProfilePic() != null) {
			byte[] encodeBase64 = Base64.encodeBase64(patient.getProfilePic());
			String base64Encoded = new String(encodeBase64, "UTF-8");
			patient.setBase64imageFile(base64Encoded);
		} else {
			InputStream inputStream = servletContext.getResourceAsStream("WEB-INF/resources/images/patient.png");
			byte[] bytes = FileCopyUtils.copyToByteArray(inputStream);
			byte[] encodeBase64 = Base64.encodeBase64(bytes);
			String base64Encoded = new String(encodeBase64, "UTF-8");
			patient.setBase64imageFile(base64Encoded);
		}

		if (patient.getFamilyHIstoryPic() != null) {
			byte[] encodeBase64 = Base64.encodeBase64(patient.getFamilyHIstoryPic());
			String base64Encoded = new String(encodeBase64, "UTF-8");
			patient.setBase64FamilyFile(base64Encoded);
		} else {
			InputStream inputStream = servletContext.getResourceAsStream("WEB-INF/resources/images/noImage.png");
			byte[] bytes = FileCopyUtils.copyToByteArray(inputStream);
			byte[] encodeBase64 = Base64.encodeBase64(bytes);
			String base64Encoded = new String(encodeBase64, "UTF-8");
			patient.setBase64FamilyFile(base64Encoded);
		}
		model.addAttribute("patient", patient);

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

		List<String> facialexpressionlist = Arrays.asList("Calm", "Anxious", "Sad", "Blunted", "Suspicious",
				"Smiling inappropriately");
		model.addAttribute("facialexpressionlist", facialexpressionlist);

		List<String> eycontactlist = Arrays.asList("Good", "fleeting", "avoidant", "piercing");
		model.addAttribute("eycontactlist", eycontactlist);

		List<String> notablephysicalfeatureslist = Arrays.asList("Nil", "Scars", "tattoos", "signs of self-harm",
				"tremors");
		model.addAttribute("notablephysicalfeatureslist", notablephysicalfeatureslist);

		List<String> posturelist = Arrays.asList("Upright", "slouched", "tense", "rigid");
		model.addAttribute("posturelist", posturelist);

		List<String> increasedactivitylist = Arrays.asList("Nil", "Psychomotor agitation", "Hyperactivity", "Akathisia",
				"Restlessness", "Impulsivity");
		model.addAttribute("increasedactivitylist", increasedactivitylist);
		List<String> decreasedactivitylist = Arrays.asList("Nil", "Psychomotor retardation", "Stupor", "Mutism",
				"Inertia", "Negativism");
		model.addAttribute("decreasedactivitylist", decreasedactivitylist);

		List<String> abnormalmovementslist = Arrays.asList("Nil", "Catatonia", "waxy flexibility", "posturing",
				"stereotypy", "Echopraxia", "Tics", "Mannerisms", "Stereotypies", "Automatism", "Compulsions",
				"Grimacing", "Gait disturbances");
		model.addAttribute("abnormalmovementslist", abnormalmovementslist);

		List<String> quantitylist = Arrays.asList("Tempo (high/moderate/low)", "Volume (high/moderate/ low)",
				"Pressure of speech", "Poverty of speech", "Mutism", "Monosyllabic replies", "Verbosity");
		model.addAttribute("quantitylist", quantitylist);

		List<String> rateandrhythmlist = Arrays.asList("Nil", "Pressured speech", "Retardation", "Hesitant speech",
				"Stuttering / stammering", "Cluttering");
		model.addAttribute("rateandrhythmlist", rateandrhythmlist);

		List<String> formandstructurelist = Arrays.asList("Nil", "Neologisms", "Talking past the point (Vorbeireden)",
				"Aphasia (receptive/intermediate/expressive)", "Word salad", "Clang associations", "Echolalia",
				"Perseveration", "Flight of ideas", "Incoherence", "Derailment", "Cluttering");
		model.addAttribute("formandstructurelist", formandstructurelist);

		List<String> disorderofstreamlist = Arrays.asList("Nil", "Flight of ideas", "Thought blocking",
				"Inhibited / Slowing of thinking", "Pressure of thought", "perseveration");
		model.addAttribute("disorderofstreamlist", disorderofstreamlist);

		List<String> disorderofformlist = Arrays.asList("Nil", "Loosening of associations", "Incoherence", "Derailment",
				"Circumstantiality", "Tangentiality", "Perseveration", "Verbigeration", "Thought fragmentation");
		model.addAttribute("disorderofformlist", disorderofformlist);

		List<String> possessionofthoughtlist = Arrays.asList("Nil", "Thought insertion", "Thought withdrawal",
				"Thought broadcasting", "Thought echo");
		model.addAttribute("possessionofthoughtlist", possessionofthoughtlist);

		List<String> moodlist = Arrays.asList("Depressive", "Elated / euphoric", "Anxious", "Irritable", "Apathy",
				"Fearful", "Dysphoria", "Lability", "euthymic");
		model.addAttribute("moodlist", moodlist);

		List<String> affectlist = Arrays.asList("Blunted", "Flat", "Inappropriate", "Restricted", "Labile",
				"Congruent / incongruent with mood");
		model.addAttribute("affectlist", affectlist);

		List<String> perceptionlist = Arrays.asList("Auditory Hallucinations", "Visual Hallucinations",
				"Olfactory Hallucinations", "Gustatory Hallucinations", "Tactile Hallucinations",
				"Pseudo-hallucinations", "Illusions", "Depersonalization", "Derealization",
				"Functional hallucinations/", "Reflex hallucinations", "Nil");
		model.addAttribute("perceptionlist", perceptionlist);

		List<String> consciousnesslist = Arrays.asList("Alert", "Drowsy", "Stuporous", "Conscious", "Clouding",
				"Confusion", "Coma / stupor");
		model.addAttribute("consciousnesslist", consciousnesslist);

		List<String> timelist = Arrays.asList("Intact", "Impaired");
		model.addAttribute("timelist", timelist);

		List<String> placelist = Arrays.asList("Intact", "Impaired");
		model.addAttribute("placelist", placelist);

		List<String> personlist = Arrays.asList("Intact", "Impaired");
		model.addAttribute("personlist", personlist);

		List<String> attentionconcentrationlist = Arrays.asList("Adequate", "Distractibility", "Impaired concentration",
				"Hypervigilance");
		model.addAttribute("attentionconcentrationlist", attentionconcentrationlist);

		List<String> immediatelist = Arrays.asList("Intact", "Impaired");
		model.addAttribute("immediatelist", immediatelist);

		List<String> recentlist = Arrays.asList("Intact", "Impaired");
		model.addAttribute("recentlist", recentlist);

		List<String> remotelist = Arrays.asList("Intact", "Impaired");
		model.addAttribute("remotelist", remotelist);

		List<String> amnesialist = Arrays.asList("Anterograde", "Retrograde");
		model.addAttribute("amnesialist", amnesialist);

		List<String> memorylist = Arrays.asList("Confabulation", "Paramnesia (deja vu, jamais vu)", "Hypermnesia");
		model.addAttribute("memorylist", memorylist);

		List<String> thinkinglist = Arrays.asList("Abstract Level", "Concrete thinking", "Impaired reasoning");
		model.addAttribute("thinkinglist", thinkinglist);

		List<String> emotionlist = Arrays.asList("Normal Emotional reactions", "Abnormal emotional reactions",
				"Abnormal expressions of emotion", "Morbid expressions of emotion");
		model.addAttribute("emotionlist", emotionlist);

		List<String> judgementpersonallist = Arrays.asList("Intact", "Impaired");
		model.addAttribute("judgementpersonallist", judgementpersonallist);

		List<String> judgementsociallist = Arrays.asList("Intact", "Impaired");
		model.addAttribute("judgementsociallist", judgementsociallist);

		List<String> judgementtestlist = Arrays.asList("Intact", "Impaired");
		model.addAttribute("judgementtestlist", judgementtestlist);

		List<String> insightlist = Arrays.asList("Level 1. Complete denial of illness\r\n"
				+ "								The individual totally denies being ill, even when clear symptoms or dysfunction are present. Common in psychosis or anosognosia.",
				"Level 2. Slight awareness of being sick and needing help, but denying it at the same time\r\n"
						+ "							The person may express minor doubts or complaints but immediately dismisses the idea of needing psychiatric help.",
				"Level 3. Awareness of being sick but blaming it on external factors The illness is acknowledged, but the cause is attributed to external stressors, people, or circumstances—e.g., “It’s because of my boss.”",
				"Level 4. Awareness that illness is due to something unknown in oneself The individual admits that the problem may be internal but cannot clearly define or understand what it is.",
				"Level 5. Intellectual insight Recognizes the illness, its psychological nature, and causes, but this understanding is not integrated into emotional or behavioral change.",
				"Level 6. True emotional insight Full recognition and emotional acceptance of the illness, leading to meaningful change in behavior, attitude, and coping mechanisms.");

		model.addAttribute("insightlist", insightlist);
		return "updatePatient";
	}

	private String returntoHome(HttpServletRequest request) {
		Consultant user = (Consultant) request.getSession().getAttribute("userSession");
		if (user.getConsultantFirstName().equals("admin")) {
			return "adminHome";
		} else {
			return "home";
		}
	}

	@RequestMapping("/viewPatient/{patientId}")
	public String viewPatient(@PathVariable("patientId") int pid, Model model, HttpServletRequest request)
			throws IOException {
		Patients patient = patientDao.getPatient(pid);
		List<SessionNotes> sessions = sessionNotesDao.getAllSessionNotesByPatientId(pid);

		if (patient.getProfilePic() != null) {
			byte[] encodeBase64 = Base64.encodeBase64(patient.getProfilePic());
			String base64Encoded = new String(encodeBase64, "UTF-8");
			patient.setBase64imageFile(base64Encoded);
		} else {
			InputStream inputStream = servletContext.getResourceAsStream("WEB-INF/resources/images/patient.png");
			byte[] bytes = FileCopyUtils.copyToByteArray(inputStream);
			byte[] encodeBase64 = Base64.encodeBase64(bytes);
			String base64Encoded = new String(encodeBase64, "UTF-8");
			patient.setBase64imageFile(base64Encoded);
		}

		if (patient.getFamilyHIstoryPic() != null) {
			byte[] encodeBase64 = Base64.encodeBase64(patient.getFamilyHIstoryPic());
			String base64Encoded = new String(encodeBase64, "UTF-8");
			patient.setBase64FamilyFile(base64Encoded);
		} else {
			InputStream inputStream = servletContext.getResourceAsStream("WEB-INF/resources/images/noImage.png");
			byte[] bytes = FileCopyUtils.copyToByteArray(inputStream);
			byte[] encodeBase64 = Base64.encodeBase64(bytes);
			String base64Encoded = new String(encodeBase64, "UTF-8");
			patient.setBase64FamilyFile(base64Encoded);
		}
		model.addAttribute("patient", patient);
		model.addAttribute("sessions", sessions);
		return "viewPatient";
	}

	@RequestMapping(value = "/getPhoto/{id}")
	public void getPatientPhoto(HttpServletResponse response, @PathVariable("id") int id) throws Exception {
		response.setContentType("image/jpeg");

		Patients ph = patientDao.getPatient(id);
		if (ph.getProfilePic() != null) {
			byte[] bytes = ph.getProfilePic();
			InputStream inputStream = new ByteArrayInputStream(bytes);
			IOUtils.copy(inputStream, response.getOutputStream());
		}
	}
}
