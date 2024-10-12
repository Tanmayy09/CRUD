package com.entities;

import javax.persistence.*;

@Entity
@Table(name="s_personal")
public class s_personal 
{
	@Id
	private int id;
	private String gender;
	private String f_name;
	@Column(unique = true)
	private String f_numb;
	private String address;
	
	
	
	public s_personal() {
		// TODO Auto-generated constructor stub
	}
	public s_personal(int id, String gender, String f_name, String f_numb, String address) {
		super();
		this.id = id;
		this.gender =gender;
		this.f_name = f_name;
		this.f_numb = f_numb;
		this.address = address;
	}
	public int getP_id() {
		return id;
	}
	public void setP_id(int id) {
		this.id = id;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getF_name() {
		return f_name;
	}
	public void setF_name(String f_name) {
		this.f_name = f_name;
	}
	public String getF_numb() {
		return f_numb;
	}
	public void setF_numb(String f_numb) {
		this.f_numb = f_numb;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
}
