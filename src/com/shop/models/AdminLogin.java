package com.shop.models;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class AdminLogin {
	@Id
	private String userid;
	private String password;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	

}
