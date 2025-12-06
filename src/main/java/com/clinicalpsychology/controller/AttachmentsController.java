package com.clinicalpsychology.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.clinicalpsychology.dao.AttachmentsDao;
import com.clinicalpsychology.dao.PatientDao;
import com.clinicalpsychology.model.Attachment;
import com.clinicalpsychology.model.Patients;

@Controller
public class AttachmentsController {
	
	
	@Autowired
	private PatientDao patientDao;
	
	@Autowired
	private AttachmentsDao attachmentsDao;

	@RequestMapping(value = { "/add-document-{userId}" }, method = RequestMethod.GET)
    public String addAttachment(@PathVariable int userId, ModelMap model) {
        Patients user = patientDao.getPatient(userId);
        model.addAttribute("user", user);
 
        FileBucket fileModel = new FileBucket();
        model.addAttribute("fileBucket", fileModel);
        List<Attachment> list = attachmentsDao.getAllAttachmentsForPatient(userId);
        model.addAttribute("documents", list);
         
        return "attachments";
    }
	
	@RequestMapping("/viewAttachment/{id}")
	    @ResponseBody
	    public ResponseEntity<byte[]> viewFile(@PathVariable int id) {
	        Attachment file = attachmentsDao.getAttachment(id);
	        if (file != null) {
	            return ResponseEntity.ok()
	                    .header(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"" + file.getFileName() + "\"")
	                    .contentType(MediaType.parseMediaType(file.getType()))
	                    .body(file.getContent());
	        }
	        return ResponseEntity.notFound().build();
	    }
     
 
    @RequestMapping(value = { "/download-document-{userId}-{docId}" }, method = RequestMethod.GET)
    public String downloadDocument(@PathVariable int userId, @PathVariable int docId, HttpServletResponse response) throws IOException {
    	Attachment document = attachmentsDao.getAttachment(docId);
        response.setContentType(document.getType());
        response.setContentLength(document.getContent().length);
        response.setHeader("Content-Disposition","attachment; filename=\"" + document.getFileName() +"\"");
  
        FileCopyUtils.copy(document.getContent(), response.getOutputStream());
  
        return "redirect:/add-document-"+userId;
    }
 
    @RequestMapping(value = { "/delete-document-{userId}-{docId}" }, method = RequestMethod.GET)
    public String deleteDocument(@PathVariable int userId, @PathVariable int docId) {
    	attachmentsDao.deleteAttachment(docId);
        return "redirect:/add-document-"+userId;
    }
 
    @RequestMapping(value = { "/add-document-{userId}" }, method = RequestMethod.POST)
    public String uploadDocument(@Valid FileBucket fileBucket, BindingResult result, ModelMap model, @PathVariable int userId) throws IOException{
         
        if (result.hasErrors()) {
            System.out.println("validation errors");
            Patients user = patientDao.getPatient(userId);
            model.addAttribute("user", user);
 
            List<Attachment> documents = attachmentsDao.getAttachments();
            model.addAttribute("documents", documents);
             
            return "attachments";
        } else {
             
            System.out.println("Fetching file");
             
            Patients user = patientDao.getPatient(userId);
            model.addAttribute("user", user);
 
            saveDocument(fileBucket, user);
 
            return "redirect:/add-document-"+userId;
        }
    }
     
    private void saveDocument(FileBucket fileBucket, Patients user) throws IOException{
         
        Attachment document = new Attachment();
         
        MultipartFile multipartFile = fileBucket.getFile();
         
        document.setFileName(multipartFile.getOriginalFilename());
        document.setType(multipartFile.getContentType());
        document.setContent(multipartFile.getBytes());
        document.setPatientid(user);
        attachmentsDao.saveAttachement(document);
    }
     
}
