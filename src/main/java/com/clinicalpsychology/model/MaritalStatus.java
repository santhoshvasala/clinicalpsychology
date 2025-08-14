package com.clinicalpsychology.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity()
@Table(name = "MaritalStatus" )
public class MaritalStatus {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
    private String maritalStatusVal;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getMaritalStatusVal() {
		return maritalStatusVal;
	}
	public void setMaritalStatusVal(String maritalStatusVal) {
		this.maritalStatusVal = maritalStatusVal;
	}
	
    
	
}
