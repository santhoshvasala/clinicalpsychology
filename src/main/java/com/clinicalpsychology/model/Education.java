package com.clinicalpsychology.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity()
@Table(name = "Education" )
public class Education {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String educationDet;
	
    
	public String getEducationDet() {
		return educationDet;
	}
	public void setEducationDet(String educationDet) {
		this.educationDet = educationDet;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

    
	
}
