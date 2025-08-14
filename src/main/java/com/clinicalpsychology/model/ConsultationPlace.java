package com.clinicalpsychology.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity()
@Table(name = "ConsultationPlace" )
public class ConsultationPlace {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
    private String consPlace;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getConsPlace() {
		return consPlace;
	}
	public void setConsPlace(String consPlace) {
		this.consPlace = consPlace;
	}
	
    
	
}
