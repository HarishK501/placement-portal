package com.apms.obj;

public class JobProfileObj {
	public int id,YOG,postedby,attached_doc;
	public Double  CTC,minimun_cgpa;
	public String title, descriptions, type_int_fte,organizations,location,end_date,posted_on,depts,gender;
	
	public JobProfileObj(int id, String title, String descriptions, String type_int_fte,Double CTC ,String organizations,String location,String end_date,String posted_on,String depts,int YOG ,Double minimun_cgpa , String gender,int postedby,int attached_doc) {
		this.id = id;
		this.title = title;
		this.descriptions = descriptions ;
		this.type_int_fte = type_int_fte;
		this.CTC = CTC;
		this.organizations = organizations;
		this.location = location;
		this.end_date = end_date;
		this.posted_on = posted_on;
		this.depts = depts;
		this.YOG = YOG;
		this.minimun_cgpa = minimun_cgpa;
		this.gender = gender;
		this.postedby = postedby ;
		this.attached_doc = attached_doc;
		
	}
	
	// constructor overloading
	public JobProfileObj(int id, String title, String organizations, String location, String end_date) {
		this.id = id;
		this.title = title;
		this.location = location;
		this.organizations = organizations;
		this.end_date = end_date;
		
	}
}
