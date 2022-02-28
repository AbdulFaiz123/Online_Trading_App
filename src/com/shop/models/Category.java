package com.shop.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

@Entity
public class Category {
	@javax.persistence.Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Id;
	private String CategoryName;
	private String CategoryDescription;
	private String CategoryImage;
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getCategoryName() {
		return CategoryName;
	}
	public void setCategoryName(String categoryName) {
		CategoryName = categoryName;
	}
	public String getCategoryDescription() {
		return CategoryDescription;
	}
	public void setCategoryDescription(String categoryDescription) {
		CategoryDescription = categoryDescription;
	}
	public String getCategoryImage() {
		return CategoryImage;
	}
	public void setCategoryImage(String categoryImage) {
		CategoryImage = categoryImage;
	}
	
	

}
