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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.RedirectView;

import com.clinicalpsychology.dao.EducationDao;
import com.clinicalpsychology.model.Education;
import com.clinicalpsychology.model.SessionNotes;

@Controller
public class SessionNotesController {

//	@Autowired
//	private EducationDao educationDao;

	@RequestMapping("/addSessionNotes")
	public String addSessionNotes(Model model) {
		return "addSessionNotes";
	}

	@RequestMapping(value = "/handleSessionNotes", method = RequestMethod.POST)
	public RedirectView handleEducation(@ModelAttribute SessionNotes sessionNotes, HttpServletRequest request,
			Model model) {
		System.out.println("sesson notes:" + sessionNotes);
		System.out.println("file:" + sessionNotes.getFile().getName());
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/addSessionNotes");
		return redirectView;
	}
	
	@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    public String uploadFile(@RequestParam("file") MultipartFile file) {
		if (!file.isEmpty())
		{
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

	/*
	 * @RequestMapping("/deleteEducation/{id}") public RedirectView
	 * deleteEducation(@PathVariable("id") int id, HttpServletRequest request) {
	 * this.educationDao.deleteEducation(id); RedirectView redirectView = new
	 * RedirectView(); redirectView.setUrl(request.getContextPath() + "/"); return
	 * redirectView; }
	 * 
	 * @RequestMapping("/updateEducation/{id}") public String
	 * updateEducation(@PathVariable("id") int pid, Model model) { Education gender
	 * = this.educationDao.getEducation(pid); model.addAttribute("education",
	 * gender); return "updateEducation"; }
	 */
}
