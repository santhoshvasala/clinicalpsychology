package com.clinicalpsychology.model;

public class Search {
	
	private String searchName;
	private String searchMobile;
	private String searchEmail;
	private String searchAge;
	private String searchDiagnosis;
	
	
	
	
	
	public Search(String searchName, String searchMobile, String searchEmail, String searchAge,
			String searchDiagnosis) {
		super();
		this.searchName = searchName;
		this.searchMobile = searchMobile;
		this.searchEmail = searchEmail;
		this.searchAge = searchAge;
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
	public String getSearchAge() {
		return searchAge;
	}
	public void setSearchAge(String searchAge) {
		this.searchAge = searchAge;
	}
	public String getSearchDiagnosis() {
		return searchDiagnosis;
	}
	public void setSearchDiagnosis(String searchDiagnosis) {
		this.searchDiagnosis = searchDiagnosis;
	}

	
	

	
	
	

}
