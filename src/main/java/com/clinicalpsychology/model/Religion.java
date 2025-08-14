package com.clinicalpsychology.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity()
@Table(name = "religion" )
public class Religion {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
    private String religionval;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getReligionval() {
		return religionval;
	}
	public void setReligionval(String religionval) {
		this.religionval = religionval;
	}
	
    
    
    
    
	
}
