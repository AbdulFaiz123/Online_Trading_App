package com.shop.models;

import javax.persistence.Entity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.Immutable;

@Entity 
@Immutable  //cannot insert,update and delete only select
public class ProductView {
	
	@Id	
	private int Id;
	private String ProductName;
	private String ProductDescription;
	private int CategoryId;
	private String CategoryName;
	private String CategoryImage;
	private double ProductCost;
	private int ProductQty;
	private String ProductImage;	
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getProductName() {
		return ProductName;
	}
	public void setProductName(String productName) {
		ProductName = productName;
	}
	public String getProductDescription() {
		return ProductDescription;
	}
	public void setProductDescription(String productDescription) {
		ProductDescription = productDescription;
	}
	public int getCategoryId() {
		return CategoryId;
	}
	public void setCategoryId(int categoryId) {
		CategoryId = categoryId;
	}
	public String getCategoryName() {
		return CategoryName;
	}
	public void setCategoryName(String categoryName) {
		CategoryName = categoryName;
	}
	public String getCategoryImage() {
		return CategoryImage;
	}
	public void setCategoryImage(String categoryImage) {
		CategoryImage = categoryImage;
	}
	public double getProductCost() {
		return ProductCost;
	}
	public void setProductCost(double productCost) {
		ProductCost = productCost;
	}
	public int getProductQty() {
		return ProductQty;
	}
	public void setProductQty(int productQty) {
		ProductQty = productQty;
	}
	public String getProductImage() {
		return ProductImage;
	}
	public void setProductImage(String productImage) {
		ProductImage = productImage;
	}
	

}
