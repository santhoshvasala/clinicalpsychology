package com.clinicalpsychology.model;

public class Search {
	
	private String searchName;
	private String searchMobile;
	private String searchEmail;
	private String searchPlace;
	private String searchDiagnosis;
	
	
	
	
	
	public Search(String searchName, String searchMobile, String searchEmail, String searchPlace,
			String searchDiagnosis) {
		super();
		this.searchName = searchName;
		this.searchMobile = searchMobile;
		this.searchEmail = searchEmail;
		this.searchPlace = searchPlace;
		this.searchDiagnosis = searchDiagnosis;
	}
	public String getSearchName() {
		return searchName;
	}
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	public String getSearchMobile() {
		return searchMobile;
	}
	public void setSearchMobile(String searchMobile) {
		this.searchMobile = searchMobile;
	}
	public String getSearchEmail() {
		return searchEmail;
	}
	public void setSearchEmail(String searchEmail) {
		this.searchEmail = searchEmail;
	}
	
	public String getSearchPlace() {
		return searchPlace;
	}
	public void setSearchPlace(String searchPlace) {
		this.searchPlace = searchPlace;
	}
	public String getSearchDiagnosis() {
		return searchDiagnosis;
	}
	public void setSearchDiagnosis(String searchDiagnosis) {
		this.searchDiagnosis = searchDiagnosis;
	}

	
	

	
	
	

}
