package com.entities;

import javax.persistence.*;

@Entity
@Table(name="courses")
public class courses {
	@Id
	private int id;
	@Column(unique = true)
	private String c_name;
	
	
	public courses() {
		// TODO Auto-generated constructor stub
	}
	public courses(int id, String c_name) {
		super();
		this.id = id;
		this.c_name = c_name;
	}
	public int getC_id() {
		return id;
	}
	public void setC_id(int id) {
		this.id = id;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	
	
}
