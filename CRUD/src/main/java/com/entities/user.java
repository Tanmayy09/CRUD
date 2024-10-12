package com.entities;

import javax.persistence.*;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="student")
public class user 
{
	@Id
	private int s_ID;
	private String s_name;
	@Column(unique = true)
	private String s_mobile;
	
	private String s_password;
	@Column(unique = true)
	private String s_adm;
	@Column(unique = true)
	private String s_univer;
	@Column(unique = true)
	private String s_email;
	private String dob;
	private String year_sem;
	private String batch;
	
	@ManyToOne
	private courses c;
	@ManyToOne(cascade = CascadeType.ALL)
	private s_personal p;
	
	
	public user() {
		super();
		// TODO Auto-generated constructor stub
	}


	public user(int s_ID, String s_name, String s_mobile, String s_password, String s_adm, String s_univer,
			String s_email, String dob, String year_sem, String batch, courses c, s_personal p) {
		super();
		this.s_ID = s_ID;
		this.s_name = s_name;
		this.s_mobile = s_mobile;
		this.s_password = s_password;
		this.s_adm = s_adm;
		this.s_univer = s_univer;
		this.s_email = s_email;
		this.dob = dob;
		this.year_sem = year_sem;
		this.batch = batch;
		this.c = c;
		this.p = p;
	}


	public int getS_ID() {
		return s_ID;
	}


	public void setS_ID(int s_ID) {
		this.s_ID = s_ID;
	}


	public String getS_name() {
		return s_name;
	}


	public void setS_name(String s_name) {
		this.s_name = s_name;
	}


	public String getS_mobile() {
		return s_mobile;
	}


	public void setS_mobile(String s_mobile) {
		this.s_mobile = s_mobile;
	}


	public String getS_password() {
		return s_password;
	}


	public void setS_password(String s_password) {
		this.s_password = s_password;
	}


	public String getS_adm() {
		return s_adm;
	}


	public void setS_adm(String s_adm) {
		this.s_adm = s_adm;
	}


	public String getS_univer() {
		return s_univer;
	}


	public void setS_univer(String s_univer) {
		this.s_univer = s_univer;
	}


	public String getS_email() {
		return s_email;
	}


	public void setS_email(String s_email) {
		this.s_email = s_email;
	}


	public courses getC() {
		return c;
	}


	public void setC(courses c) {
		this.c = c;
	}


	public s_personal getP() {
		return p;
	}


	public void setP(s_personal p) {
		this.p = p;
	}


	public String getDob() {
		return dob;
	}


	public void setDob(String dob) {
		this.dob = dob;
	}


	public String getYear_sem() {
		return year_sem;
	}


	public void setYear_sem(String year_sem) {
		this.year_sem = year_sem;
	}


	public String getBatch() {
		return batch;
	}


	public void setBatch(String batch) {
		this.batch = batch;
	}

		
	
	
}
