package com.clinicalpsychology.controller;

import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.RedirectView;

import com.clinicalpsychology.dao.PatientDao;
import com.clinicalpsychology.dao.SessionNotesDao;
import com.clinicalpsychology.model.Patients;
import com.clinicalpsychology.model.SessionNotes;

@Controller
public class SessionNotesController {

	@Autowired
	private PatientDao patientDao;

	@Autowired
	private SessionNotesDao sessionNotesDao;

	@RequestMapping("/addSessionNotes/{patientId}")
	public String addSessionNotes(@PathVariable("patientId") int pid, Model model) {
		model.addAttribute("pid", pid);
		System.out.println(" in session");
		List<SessionNotes> sessions = sessionNotesDao.getAllSessionNotesByPatientId(pid);
		model.addAttribute("sessions", sessions);
		return "addSessionNotes";
	}

	@RequestMapping(value = "/handleSessionNotes/{patientId}", method = RequestMethod.POST)
	public RedirectView handleSessionNotes(@PathVariable("patientId") int pid,
			@ModelAttribute SessionNotes sessionNotes, HttpServletRequest request, Model model) {
		System.out.println("sesson notes:" + sessionNotes.getSessionnote());
		System.out.println("sesson date:" + sessionNotes.getSessionoccuredon());
		Patients patient = patientDao.getPatient(pid);
		sessionNotes.setPatientid(patient);
		System.out.println("patient name :" + patient.getFirstName());
		sessionNotesDao.createSessionNotes(sessionNotes);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/addSessionNotes/" + patient.getId());
		return redirectView;
	}
	
	@RequestMapping(value = "/handleUpdateSessionNotes/{sessionId}", method = RequestMethod.POST)
	public RedirectView handleUpdateSessionNotes(@PathVariable("sessionId") int sessionId,
			@ModelAttribute SessionNotes sessionNotes, HttpServletRequest request, Model model) {
		System.out.println("sesson notes:" + sessionNotes.getSessionnote());
		System.out.println("sesson date:" + sessionNotes.getSessionoccuredon());
		SessionNotes notes = sessionNotesDao.getSessionNotes(sessionId);
		sessionNotes.setId(sessionId);
		sessionNotes.setPatientid(notes.getPatientid());
		sessionNotes.setSessionoccuredon(notes.getSessionoccuredon());
		sessionNotesDao.createSessionNotes(sessionNotes);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/addSessionNotes/" + notes.getPatientid().getId());
		return redirectView;
	}


	@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
	public String uploadFile(@RequestParam("file") MultipartFile file) {
		if (!file.isEmpty()) {
			System.out.println(" file name:" + file.getName());
		}
		return "addSessionNotes";
		/*
		 * if (!file.isEmpty()) { try { // Save the file to a specific location String
		 * uploadDir = "/path/to/upload/directory/"; // Specify your upload directory
		 * File uploadedFile = new File(uploadDir + file.getOriginalFilename());
		 * file.transferTo(uploadedFile); return "uploadSuccess"; // Redirect to a
		 * success page } catch (IOException e) { e.printStackTrace(); return
		 * "uploadFailure"; // Redirect to a failure page } } else { return
		 * "uploadFailure"; // Redirect if no file was selected }
		 */
	}
	@RequestMapping("/deleteSessionNotes/{id}")
	public RedirectView deleteSessionNotes(@PathVariable("id") int sessionId, HttpServletRequest request) {
		SessionNotes sessionNote = this.sessionNotesDao.getSessionNotes(sessionId);	
		int patientid = sessionNote.getPatientid().getId();
		this.sessionNotesDao.deleteSessionNotes(sessionId);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/addSessionNotes/"+patientid);
		return redirectView;
	}
	
	@RequestMapping("/updateSessionNotes/{id}")
	public String updateSessionNotes(@PathVariable("id")int pid, Model model) {
		SessionNotes sessionNote = this.sessionNotesDao.getSessionNotes(pid);
		model.addAttribute("sessionNoteVal", sessionNote);
		return "updateSessionNotes";
	}
}
