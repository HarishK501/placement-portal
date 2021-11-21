package com.apms.obj;

public class PlacementObj {
	
	public int jobId;
	public String jobTitle, company;
	public int numApplicants, numPlaced;
	
	public PlacementObj(int jobId, String jobTitle, String company, int numApplicants, int numPlaced) {
		
		this.jobId = jobId;
		this.jobTitle = jobTitle;
		this.company = company;
		this.numApplicants = numApplicants;
		this.numPlaced = numPlaced;
	}


}
