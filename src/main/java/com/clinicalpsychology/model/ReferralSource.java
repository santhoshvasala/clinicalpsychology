package com.clinicalpsychology.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity()
@Table(name = "ReferralSource" )
public class ReferralSource {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
    private String referralSourceVal;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getReferralSourceVal() {
		return referralSourceVal;
	}
	public void setReferralSourceVal(String referralSourceVal) {
		this.referralSourceVal = referralSourceVal;
	}
	
	
    
	
}
